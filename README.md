# letv-tv-ad-free

让乐视超级电视（及同类 Mstar 方案安卓电视）彻底告别开机广告、信号源推荐、
关机/屏保/开屏广告和应用安装锁——**不刷机、不变砖、全程可逆**。

> 本项目是一次针对**自己拥有的设备**的系统性逆向与改造记录，沉淀成了可复用的
> ZCode skill。目标机型：乐视超3/超4 系列（EUI、Android 4.3–6.0、Mstar 芯片、
> 内核 ≤4.8 未修复 Dirty Cow），局域网内开启 ADB 即可，**无需 root**。

## 成果（在超4 X4-50 上全链路验证）

| 项目 | 之前 | 之后 |
|---|---|---|
| 开机广告 | 15 秒（按日轮播） | 0.44 秒静态 logo 片 |
| 信号源页 | 霸屏榜单 + 热门推荐占位 | 原生信号源正常切换，面板内容断供（骨架为硬编码 UI 无法移除） |
| 开机推广页 | 客厅杂志，需按一次 OK | 出厂调试开关自灭（debug.screen.state=0，零风险） |
| 乐头条 / 多屏看看 | 随系统预装 | 前者整体禁用，后者仅禁图标（保留手机投屏） |
| 关机/屏保/开屏广告 | 有 | 全部清理 + 自愈 |
| 遥测上报 | MMA/秒针/Nielsen 等 14 域名 | 全部拦截 |
| 第三方安装锁 | "存在安全隐患已禁止安装" | 正常安装流程 |
| 桌面 | 乐视自带桌面（广告位） | Aerial 第三方桌面（app.orchard.tv，航拍壁纸+屏保） |
| 预装精简 | 商店/游戏/卡拉OK等后台常驻 | 14+ 包禁用（可逆） |

## 它是怎么工作的（一句话版）

旧内核有 Dirty Cow（CVE-2016-5195），而乐视自己留了一个 root 身份执行脚本的
init 触发器。用 Cow 改写那个脚本 → 以 root 完成"替换广告视频 / 清理广告配置 /
净化安装黑名单库" → 再把脚本按字节还原。所有持久化都落在 `/data` 分区和
乐视自带的开机钩子里，`/system` 一个字节都没动（动了会立刻触发保护重启）。

## 目录

```
SKILL.md                  agent 可执行的完整作业手册（核心）
scripts/dirtycow.c        freestanding aarch64 Dirty Cow（两线程，带校验循环）
scripts/build_exploit.sh  NDK 编译 + 推送（-nostdlib，见 SKILL.md 坑 8）
scripts/make_short_clip.sh  用电视自带 logo+开机音乐合成替换片（ffmpeg）
scripts/sanitize_tvmaster.py  安装黑名单库净化（token-safe，防 11:1 误伤）
scripts/setup_launcher.sh   Aerial 第三方桌面备份/安装/HOME 触发
puresource/                 纯净信号源 app（存档：广播切源可用，但用户最终选择回归原生信号源页）
scripts/tvfix.template.sh 开机钩子模板（八段式，见文件内注释）
docs/NOTES.md             逆向笔记：广告架构 / 判决链 / 关键路径 / 工具链
```

## 快速开始

```bash
# 0) 前提：电视已开 ADB，电脑装好 adb 与 NDK
adb connect <TV_IP>:5555

# 1) 编译提权工具并推送
scripts/build_exploit.sh <TV_IP>:5555

# 2) 之后按 SKILL.md 的 Phase 1–7 走
#    （定位广告机制 → Cow 提权 → 替换开机视频 → 部署开机钩子 → 清理与解锁）
```

详细步骤、每一步的验证方法和全部已知陷阱都在 [SKILL.md](SKILL.md)。

## ⚠️ 免责与边界

- 仅用于**你自己拥有**的设备；操作有变砖风险，后果自负。
- 会去掉厂商的广告与远程管控能力，属个性化改装；请遵守当地法律，勿用于
  盗版内容分发。
- `/system` 分区全程只读。任何试图重挂载 /system 的操作在这类电视上会触发
  保护性重启——这是特性不是 bug，别试。
- 各型号init 服务名、脚本路径、属性名可能不同：SKILL.md 教的是**定位方法**，
  不保证同名照抄可用于所有型号。

## License

[MIT](LICENSE)
