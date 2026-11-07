package com.clrs520.puresource;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

/** 纯净信号源 v5 — 全屏播放器式信号源切换器 (LeTV EUI / Mstar).
 *
 * EUI 机制: 切了输入源后, 必须有前台应用把视频面绑定到自己的 Surface 才能看到画面
 * (原版由带广告面板的 MainActivity 内嵌预览实现). 本 app:
 *   全屏 SurfaceView + setDisplayHolder 绑定视频面 + 按钮直切源,
 *   看电视就在本 app 里看, 不经过任何乐视 UI.
 * OK 键 = 显示/隐藏源选择面板.
 */
public class MainActivity extends Activity implements SurfaceHolder.Callback {

    private static final String[] PORTS = {
        "HDMI 1", "HDMI 2", "HDMI 3", "Digital TV", "Analog TV", "Composite", "VGA", "YPBPR"
    };
    private static final String[] LABELS = {
        "HDMI 1", "HDMI 2", "HDMI 3", "数字电视", "模拟电视", "视频 (AV)", "VGA", "YPBPR"
    };

    private Object signalManager;
    private LinearLayout picker;
    private TextView status;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setRequestedOrientation(0);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(0xFF000000);

        SurfaceView surface = new SurfaceView(this);
        surface.getHolder().addCallback(this);
        root.addView(surface, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, 0, 1f));

        picker = new LinearLayout(this);
        picker.setOrientation(LinearLayout.VERTICAL);
        picker.setBackgroundColor(0xCC12161D);
        int pad = dp(20);
        picker.setPadding(pad, pad, pad, pad);

        TextView title = new TextView(this);
        title.setText("纯净信号源");
        title.setTextColor(0xFFE8EAED);
        title.setTextSize(26);
        title.setPadding(0, 0, 0, dp(12));
        picker.addView(title);

        status = new TextView(this);
        status.setTextColor(0xFF9AA0A6);
        status.setTextSize(15);
        status.setPadding(0, 0, 0, dp(12));
        picker.addView(status);

        for (int i = 0; i < PORTS.length; i++) addButton(picker, LABELS[i], PORTS[i]);
        root.addView(picker, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));

        setContentView(root);
    }

    private int dp(int v) {
        return (int) (getResources().getDisplayMetrics().density * v);
    }

    private boolean initSignalManager() {
        if (signalManager != null) return true;
        try {
            Class<?> sm = Class.forName("com.stv.signalcommon.SignalManager");
            signalManager = sm.getMethod("getInstance", android.content.Context.class)
                              .invoke(null, this);
            return signalManager != null;
        } catch (Throwable t) {
            runOnUiThread(new Runnable() {
                public void run() { status.setText("初始化失败: " + chain(t)); }
            });
            return false;
        }
    }

    private void addButton(LinearLayout picker, final String label, final String port) {
        Button b = new Button(this);
        b.setText(label);
        b.setTextSize(18);
        b.setAllCaps(false);
        b.setTextColor(0xFFCFCFCF);
        b.setBackgroundResource(android.R.drawable.screen_background_dark_transparent);
        b.setPadding(dp(14), dp(10), dp(14), dp(10));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, dp(52));
        lp.topMargin = dp(8);
        b.setLayoutParams(lp);
        b.setOnFocusChangeListener(new android.view.View.OnFocusChangeListener() {
            public void onFocusChange(View v, boolean hasFocus) {
                b.setText(hasFocus ? "▶  " + label : label);
                b.setTextColor(hasFocus ? 0xFFFFFFFF : 0xFFCFCFCF);
                b.setTextSize(hasFocus ? 20 : 18);
            }
        });
        b.setOnClickListener(new android.view.View.OnClickListener() {
            public void onClick(View v) { switchTo(port, label); }
        });
        picker.addView(b);
    }

    private void switchTo(final String port, final String label) {
        if (!initSignalManager()) { status.setText("初始化失败"); return; }
        try {
            // 必须在有 Looper 的线程调用(SignalManager 内部要建 Handler), 原版即主线程调用
            Class<?> sm = signalManager.getClass();
            sm.getMethod("switchPort", String.class).invoke(signalManager, port);
            status.setText("正在播放: " + label);
        } catch (Throwable t) {
            status.setText("切换失败: " + chain(t));
        }
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
        while (c != null && n < 3) {
            sb.append("[").append(n).append("] ").append(c.getClass().getSimpleName())
              .append("(").append(c.getMessage()).append(")");
            c = c.getCause(); n++;
            if (c != null) sb.append(" → ");
        }
        return sb.toString();
    }

    // ---- SurfaceHolder.Callback: 视频面绑定 ----
    public void surfaceCreated(SurfaceHolder holder) {
        if (!initSignalManager()) return;
        try {
            signalManager.getClass().getMethod("setDisplayHolder", SurfaceHolder.class)
                         .invoke(signalManager, holder);
            runOnUiThread(new Runnable() {
                public void run() { switchTo("HDMI 1", "HDMI 1"); }
            });
        } catch (Throwable t) {
            runOnUiThread(new Runnable() {
                public void run() { status.setText("视频绑定失败: " + chain(t)); }
            });
        }
    }

    public void surfaceChanged(SurfaceHolder holder, int format, int w, int h) {}

    public void surfaceDestroyed(SurfaceHolder holder) {
        if (signalManager != null) {
            try {
                signalManager.getClass().getMethod("unsetDisplayHolder").invoke(signalManager);
            } catch (Throwable ignored) {}
        }
    }

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_DPAD_CENTER || keyCode == KeyEvent.KEYCODE_ENTER) {
            picker.setVisibility(picker.getVisibility() == View.VISIBLE ? View.GONE : View.VISIBLE);
            return true;
        }
        if (keyCode == KeyEvent.KEYCODE_MENU) {
            picker.setVisibility(View.VISIBLE);
            return true;
        }
        return super.onKeyDown(keyCode, event);
    }
}
