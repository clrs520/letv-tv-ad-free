package com.clrs520.puresource;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.KeyEvent;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

/**
 * 纯净信号源 v2 — 无广告的电视信号源切换器 (LeTV EUI / Mstar).
 *
 * 切换机制: EUI 导出的 eui.intent.action.NEXT_SOURCE 广播(由信号源应用的
 * SignalGlobalReceiver 处理, 无权限门槛, 每次切到下一个输入源, 仅极简源名提示)。
 *
 * 当前源由本 app 自行跟踪(SharedPreferences): 首次使用点一次"我在看XX"校准,
 * 之后所有切换都经过本 app, 状态永不漂移。
 */
public class MainActivity extends Activity {

    /** 轮播序(实测: 模拟电视 → 视频 → HDMI1 → HDMI2 → 数字电视 → 模拟电视…) */
    private static final String[] CYCLE = {"HDMI 1", "HDMI 2", "数字电视", "模拟电视", "视频 (AV)"};

    private SharedPreferences prefs;
    private TextView status;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setRequestedOrientation(0); // landscape
        prefs = getSharedPreferences("puresource", MODE_PRIVATE);

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
        status.setTextSize(16);
        status.setPadding(0, 0, 0, dp(14));
        root.addView(status);

        addButton(root, "下一个信号源", -1);
        for (int i = 0; i < CYCLE.length; i++) {
            addButton(root, CYCLE[i], i);
        }
        setContentView(root);
        refreshStatus();
    }

    private int dp(int v) {
        return (int) (getResources().getDisplayMetrics().density * v);
    }

    private int curIdx() {
        return prefs.getInt("curIdx", -1);
    }

    private void setCurIdx(int i) {
        prefs.edit().putInt("curIdx", i).apply();
        refreshStatus();
    }

    private void refreshStatus() {
        int i = curIdx();
        status.setText(i < 0 ? "当前源: 未知 — 点一次你正在看的源完成校准"
                             : "当前源: " + CYCLE[i]);
    }

    private void addButton(LinearLayout root, final String label, final int target) {
        Button b = new Button(this);
        b.setText(label);
        b.setTextSize(20);
        b.setAllCaps(false);
        b.setTextColor(0xFFE8EAED);
        b.setBackgroundColor(0xFF232830);
        b.setPadding(dp(12), dp(12), dp(12), dp(12));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, dp(58));
        lp.topMargin = dp(10);
        b.setLayoutParams(lp);
        b.setOnClickListener(new android.view.View.OnClickListener() {
            public void onClick(android.view.View v) { go(label, target); }
        });
        root.addView(b);
    }

    private void go(final String label, final int target) {
        int cur = curIdx();
        if (target < 0) {                       // 下一个
            cycle();
            if (cur >= 0) setCurIdx((cur + 1) % CYCLE.length);
            toast("已切换");
            return;
        }
        if (cur < 0) {                          // 校准
            setCurIdx(target);
            toast("已校准当前源为 " + CYCLE[target]);
            return;
        }
        if (cur == target) { toast("已经在 " + CYCLE[target]); return; }
        final int steps = (target - cur + CYCLE.length) % CYCLE.length;
        new Thread(new Runnable() {
            public void run() {
                for (int i = 0; i < steps; i++) {
                    cycle();
                    try { Thread.sleep(1600); } catch (InterruptedException ignored) {}
                }
                runOnUiThread(new Runnable() {
                    public void run() {
                        setCurIdx(target);
                        toast("已切换到 " + CYCLE[target]);
                    }
                });
            }
        }).start();
    }

    private void cycle() {
        sendBroadcast(new Intent("eui.intent.action.NEXT_SOURCE"));
    }

    private void toast(String msg) {
        Toast.makeText(this, msg, Toast.LENGTH_SHORT).show();
    }

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_MENU) { go("next", -1); return true; }
        return super.onKeyDown(keyCode, event);
    }
}
