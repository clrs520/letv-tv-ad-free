#!/usr/bin/env python3
"""Sanitize the LeTV TvMaster install-blacklist database (tvmaster.db).

The PackageInstaller asks com.stv.helper.service's TvMasterService whether a
package may be installed. The verdict lives in the `applevel` table as a
comma-separated map of "authorityId:flag" tokens, where authority id 1 is
"禁止安装" (deny sideload). LeTV blacklists whole competitor families there
(Dangbei / Shafa / third-party launchers & stores...).

This script rewrites every exact "1:1" token to "1:0" — token-safe: a blind
string REPLACE would corrupt "11:1" (authority 11) into "11:0".

Usage: python sanitize_tvmaster.py tvmaster.db [tvmaster_clean.db]

After deploying the sanitized db, lock it so the cloud cannot re-push:

    chown root:root tvmaster.db && chmod 400 tvmaster.db
    kill -9 $(grep -l com.stv.helper.service /proc/[0-9]*/cmdline | sed "s|[^0-9]||g")

The helper service runs fine without a readable db; an unreadable db makes
checkPermission throw, and the installer's catch-all treats that as "not
blacklisted" — i.e. all installs allowed, permanently.
"""
import sqlite3
import sys
import shutil


def sanitize(path: str) -> int:
    con = sqlite3.connect(path)
    rows = con.execute("SELECT rowid, package_name, value FROM applevel").fetchall()
    changed = 0
    for rowid, pkg, val in rows:
        if not val:
            continue
        toks = [t.strip() for t in val.split(",")]
        if "1:1" not in toks:
            continue
        new = ",".join("1:0" if t == "1:1" else t for t in toks)
        con.execute("UPDATE applevel SET value=? WHERE rowid=?", (new, rowid))
        changed += 1
        print(f"  unblocked: {pkg}  ({val} -> {new})")
    con.commit()
    con.close()
    return changed


if __name__ == "__main__":
    if len(sys.argv) < 2:
        sys.exit(__doc__)
    src = sys.argv[1]
    dst = sys.argv[2] if len(sys.argv) > 2 else src
    if dst != src:
        shutil.copy(src, dst)
    n = sanitize(dst)
    print(f"done: {n} app(s) unblocked -> {dst}")
