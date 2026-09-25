# better_todesk

把旧电脑、平板和一条稳定的网络连接，组合成一套可复用的远程控制实践：Windows 上运行 Sunshine，vivo Pad 上使用 Moonlight，必要时用 Tailscale 跨网络连接；Termux/OpenSSH 则用于检查和维护平板端环境。

这不是 Sunshine 的重新打包，也不是一个新的远程桌面协议。仓库保存的是我的安装排障、配置边界、脚本和使用复盘，方便以后重装或迁移时复用。

## 已验证的部分

- Windows Sunshine 与 Android Moonlight 已完成配对。
- vivo Pad 可以查看并操作电脑画面，电脑双屏可以一次切换查看一个屏幕。
- 平板端 Termux/OpenSSH 曾完成局域网连接，并验证过息屏和一次重启后的启动流程。
- Tailscale 网络下可以从平板添加电脑并进入 Moonlight Desktop。
- 本地网络里我把 Moonlight 调到 2K 后，主观使用感受是画面清晰、操作流畅，几乎感觉不到延迟。

“几乎无延迟”是个人体验，不是端到端延迟测量；仓库没有把它写成 0 ms 或稳定帧率结论。

## 目录

- [`docs/setup-windows.md`](docs/setup-windows.md)：Windows Sunshine 安装与检查
- [`docs/setup-vivopad-ssh.md`](docs/setup-vivopad-ssh.md)：vivo Pad Termux/OpenSSH 经验
- [`docs/tailscale-moonlight.md`](docs/tailscale-moonlight.md)：Tailscale 下的 Moonlight 连接
- [`docs/troubleshooting.md`](docs/troubleshooting.md)：常见问题与边界
- [`docs/experience-log.md`](docs/experience-log.md)：这次折腾的第一人称复盘
- [`scripts/windows/`](scripts/windows/)：Windows 检查脚本
- [`scripts/android/`](scripts/android/)：Termux 示例脚本
- [`examples/`](examples/)：脱敏配置示例

## 安全边界

不要提交 Sunshine 证书、`sunshine_state.json`、真实 `sunshine.conf`、日志、SSH 私钥、公钥认证文件、真实 IP、设备序列号、密码或 Token。仓库里的地址和用户名都是占位符。

## 许可

仓库中的文档和自写脚本使用 MIT License。Sunshine、Moonlight、Tailscale、Termux 和 OpenSSH 均属于各自项目。
