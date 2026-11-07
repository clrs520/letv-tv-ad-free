package com.clrs520.puresource;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

/** 纯净信号源 v6 — 广播切源版 (LeTV EUI).
 *
 * 切换走 eui.intent.action.NEXT_SOURCE 广播（SignalGlobalReceiver 以系统权限
 * 执行真实切源，这是用户实测唯一可靠的机制；Mstar SetInputSource 对普通应用
 * 静默无效）。落点为无广告面板的极简源画面（带面板的 MainActivity 已被
 * 组件级禁用）。HOME 键回 Aerial。
 */
public class MainActivity extends Activity {

    /** 轮播序（实测：模拟电视 → 视频 → HDMI1 → HDMI2 → 数字电视 → 模拟电视…） */
    private static final String[] CYCLE = {"HDMI 1", "HDMI 2", "数字电视", "模拟电视", "视频 (AV)"};

    private SharedPreferences prefs;
    private TextView status;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        prefs = getSharedPreferences("puresource", MODE_PRIVATE);
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
        status.setTextSize(16);
        status.setPadding(0, 0, 0, dp(14));
        root.addView(status);

        addButton(root, "下一个信号源", -1);
        for (int i = 0; i < CYCLE.length; i++) addButton(root, CYCLE[i], i);
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

    /** 焦点态高对比: 聚焦=亮蓝底+白描边+▶前缀 */
    private android.graphics.drawable.StateListDrawable btnBg() {
        android.graphics.drawable.GradientDrawable normal = new android.graphics.drawable.GradientDrawable();
        normal.setColor(0xFF232830);
        normal.setCornerRadius(dp(8));
        android.graphics.drawable.GradientDrawable focused = new android.graphics.drawable.GradientDrawable();
        focused.setColor(0xFF2E7DFF);
        focused.setCornerRadius(dp(8));
        focused.setStroke(dp(3), 0xFFFFFFFF);
        android.graphics.drawable.GradientDrawable pressed = new android.graphics.drawable.GradientDrawable();
        pressed.setColor(0xFF1B5EDB);
        pressed.setCornerRadius(dp(8));
        android.graphics.drawable.StateListDrawable sld = new android.graphics.drawable.StateListDrawable();
        sld.addState(new int[]{android.R.attr.state_focused}, focused);
        sld.addState(new int[]{android.R.attr.state_pressed}, pressed);
        sld.addState(new int[]{}, normal);
        return sld;
    }

    private void addButton(LinearLayout root, final String label, final int target) {
        Button b = new Button(this);
        b.setText(label);
        b.setTextSize(20);
        b.setAllCaps(false);
        b.setTextColor(0xFFCFCFCF);
        b.setBackground(btnBg());
        b.setPadding(dp(16), dp(12), dp(16), dp(12));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, dp(64));
        lp.topMargin = dp(10);
        b.setLayoutParams(lp);
        b.setOnFocusChangeListener(new android.view.View.OnFocusChangeListener() {
            public void onFocusChange(View v, boolean hasFocus) {
                b.setText(hasFocus ? "▶  " + label : label);
                b.setTextColor(hasFocus ? 0xFFFFFFFF : 0xFFCFCFCF);
                b.setTextSize(hasFocus ? 22 : 20);
            }
        });
        b.setOnClickListener(new android.view.View.OnClickListener() {
            public void onClick(View v) { go(label, target); }
        });
        root.addView(b);
    }

    private void go(final String label, final int target) {
        int cur = curIdx();
        if (target < 0) {
            cycle();
            if (cur >= 0) setCurIdx((cur + 1) % CYCLE.length);
            toast("已切换");
            return;
        }
        if (cur < 0) {
            setCurIdx(target);
            toast("已校准当前源为 " + CYCLE[target] + " — 以后点我直达");
            return;
        }
        if (cur == target) { toast("已经在 " + CYCLE[target]); return; }
        final int steps = (target - cur + CYCLE.length) % CYCLE.length;
        new Thread(new Runnable() {
            public void run() {
                for (int i = 0; i < steps; i++) {
                    cycle();
                    try { Thread.sleep(1800); } catch (InterruptedException ignored) {}
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
