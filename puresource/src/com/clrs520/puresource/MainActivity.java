package com.clrs520.puresource;

import android.app.Activity;
import android.os.Bundle;
import android.view.KeyEvent;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

/** 纯净信号源 v3 — 直连 Mstar API 的信号源切换器 (LeTV EUI).
 *  移植信号源应用自带的 com.stv.signalcommon 客户端类(classes2.dex),
 *  经 CommonDesk.SetInputSource 直接切换, 绕开乐视桌面管理器与广告面板. */
public class MainActivity extends Activity {

    private static final String[] PORTS = {
        "HDMI 1", "HDMI 2", "HDMI 3", "Digital TV", "Analog TV", "Composite", "VGA", "YPBPR"
    };
    private static final String[] LABELS = {
        "HDMI 1", "HDMI 2", "HDMI 3", "数字电视", "模拟电视", "视频 (AV)", "VGA", "YPBPR"
    };

    private TextView status;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setRequestedOrientation(0);
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(0xFF12161D);
        int pad = dp(28);
        root.setPadding(pad, pad * 2, pad, pad);

        TextView title = new TextView(this);
        title.setText("纯净信号源");
        title.setTextColor(0xFFE8EAED);
        title.setTextSize(30);
        title.setPadding(0, 0, 0, dp(14));
        root.addView(title);

        status = new TextView(this);
        status.setTextColor(0xFF9AA0A6);
        status.setTextSize(15);
        status.setPadding(0, 0, 0, dp(14));
        root.addView(status);

        for (int i = 0; i < PORTS.length; i++) addButton(root, LABELS[i], PORTS[i]);
        setContentView(root);
        refreshStatus();
    }

    private int dp(int v) {
        return (int) (getResources().getDisplayMetrics().density * v);
    }

    private void addButton(LinearLayout root, final String label, final String port) {
        Button b = new Button(this);
        b.setText(label);
        b.setTextSize(20);
        b.setAllCaps(false);
        b.setTextColor(0xFFCFCFCF);
        b.setBackgroundResource(android.R.drawable.screen_background_dark_transparent);
        b.setPadding(dp(16), dp(12), dp(16), dp(12));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, dp(56));
        lp.topMargin = dp(8);
        b.setLayoutParams(lp);
        b.setOnFocusChangeListener(new android.view.View.OnFocusChangeListener() {
            public void onFocusChange(android.view.View v, boolean hasFocus) {
                b.setText(hasFocus ? "▶  " + label : label);
                b.setTextColor(hasFocus ? 0xFFFFFFFF : 0xFFCFCFCF);
                b.setTextSize(hasFocus ? 22 : 20);
            }
        });
        b.setOnClickListener(new android.view.View.OnClickListener() {
            public void onClick(android.view.View v) { switchTo(port, label); }
        });
        root.addView(b);
    }

    private void switchTo(final String port, final String label) {
        new Thread(new Runnable() {
            public void run() {
                android.os.Looper.prepare();
                ui("正在切换到 " + label + "…");
                String r = doSwitch(port);
                ui((r.equals("OK") ? "已切换到 " + label : "失败 " + r));
            }
        }).start();
    }

    private String doSwitch(String port) {
        try {
            Class<?> sm = Class.forName("com.stv.signalcommon.SignalManager");
            Object mgr = sm.getMethod("getInstance", android.content.Context.class)
                           .invoke(null, this);
            sm.getMethod("switchPort", String.class).invoke(mgr, port);
            refreshStatusAsync();
            return "OK";
        } catch (Throwable t) {
            return chain(t);
        }
    }

    private String queryPort() {
        try {
            Class<?> sm = Class.forName("com.stv.signalcommon.SignalManager");
            Object mgr = sm.getMethod("getInstance", android.content.Context.class)
                           .invoke(null, this);
            return (String) sm.getMethod("getCurrentPortString").invoke(mgr);
        } catch (Throwable t) {
            return chain(t);
        }
    }

    private void refreshStatusAsync() {
        runOnUiThread(new Runnable() {
            public void run() { refreshStatus(); }
        });
    }

    private void ui(final String msg) {
        runOnUiThread(new Runnable() {
            public void run() {
                Toast.makeText(MainActivity.this, msg, Toast.LENGTH_SHORT).show();
                status.setText(msg);
            }
        });
    }

    private static String chain(Throwable t) {
        StringBuilder sb = new StringBuilder();
        Throwable c = t;
        int n = 0;
        while (c != null && n < 4) {
            sb.append("[").append(n).append("] ").append(c.getClass().getSimpleName())
              .append("(").append(c.getMessage()).append(")");
            if (n == 0 && c.getStackTrace().length > 0)
                sb.append("@").append(c.getStackTrace()[0].toString());
            c = c.getCause();
            n++;
            if (c != null) sb.append(" → ");
        }
        return sb.toString();
    }

    private void refreshStatus() {
        status.setText("当前源: " + queryPort());
    }

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_MENU) { switchTo("HDMI 1", "HDMI 1"); return true; }
        return super.onKeyDown(keyCode, event);
    }
}
