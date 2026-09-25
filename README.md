# better_todesk

把旧电脑、平板和一条稳定的网络连接，组合成一套可复用的远程控制实践：Windows 上运行 Sunshine，vivo Pad 上使用 Moonlight，必要时用 Tailscale 跨网络连接；Termux/OpenSSH 则用于检查和维护平板端环境。

这不是 Sunshine 的重新打包，也不是一个新的远程桌面协议。仓库保存的是我的安装排障、配置边界、脚本和使用复盘，方便以后重装或迁移时复用。

## 我看中的优势

- **访问范围自己掌握。** 跨网络时使用 Tailscale 的加密私网连接，无需在路由器上开放公网端口。结合设备授权、访问规则与防火墙，可以把访问范围限制在自己的设备内，减少服务直接暴露到公网的机会。它仍依赖正确配置、账号保护和及时更新；这里没有与 ToDesk 做安全审计对比。
- **画质和流畅度可以自己取舍。** Moonlight 可调整分辨率、帧率和码率，并结合 Sunshine 的编码设置，在清晰度、带宽占用和延迟之间选择适合自己的组合。可用档位、编码格式和最终效果受客户端版本、源显示器、编码器与平板解码能力限制，并不是所有参数都能无限自定义。
- **同一套方式覆盖家里和外出。** 局域网内直接串流，跨网络通过 Tailscale 访问同一台电脑；两端在线、电脑不休眠且访问规则允许时即可使用，网络质量仍会影响体验。
- **日常操作和维护都能留下可复用方案。** 平板实体键盘可切换电脑显示器，Termux SSH 则提供平板终端维护入口；配置经验与脚本公开保存，方便重装和迁移。

对我最直观的好处，是本地调到 2K 档位后画面清晰、操作跟手。代价是需要自己维护连接、后台权限和编码设置，尤其这次双显卡切屏使用了软件编码。

## 已验证的部分

- Windows Sunshine 与 Android Moonlight 已完成配对。
- vivo Pad 可以查看并操作电脑画面，电脑双屏可以一次切换查看一个屏幕。
- 平板端 Termux/OpenSSH 曾完成局域网连接，并验证过息屏和一次重启后的启动流程。
- Tailscale 网络下可以从平板添加电脑并进入 Moonlight Desktop。
- 本地网络里我把 Moonlight 调到 2K 后，主观使用感受是画面清晰、操作流畅，几乎感觉不到延迟。

“几乎无延迟”是个人体验，不是端到端延迟测量；仓库没有把它写成 0 ms 或稳定帧率结论。

2K 指 Moonlight 中选择的档位。此前源显示器采集为 1920 × 1080，尚未独立核实源桌面是否也切到原生 2K。项目名表达个人使用目标，没有与 ToDesk 做性能对照测试。

## 脚本验证范围

开机脚本根据这次实际使用方式整理；Windows 检查脚本是为公开仓库新增的辅助工具。整理版本进行了静态检查，尚未在其他电脑或另一台平板上做完整部署测试。

## 目录

- [`docs/setup-windows.md`](docs/setup-windows.md)：Windows Sunshine 安装与检查
- [`docs/setup-vivopad-ssh.md`](docs/setup-vivopad-ssh.md)：vivo Pad Termux/OpenSSH 经验
- [`docs/tailscale-moonlight.md`](docs/tailscale-moonlight.md)：Tailscale 下的 Moonlight 连接
- [`docs/troubleshooting.md`](docs/troubleshooting.md)：常见问题与边界
- [`docs/experience-log.md`](docs/experience-log.md)：这次折腾的第一人称复盘
- [`docs/full-retrospective.md`](docs/full-retrospective.md)：网站完整记录，包含安装、双显卡排障、重启证据与快捷键取舍
- [`scripts/windows/`](scripts/windows/)：Windows 检查脚本
- [`scripts/android/`](scripts/android/)：Termux 示例脚本
- [`examples/`](examples/)：脱敏配置示例

## 安全边界

不要提交 Sunshine 证书、`sunshine_state.json`、真实 `sunshine.conf`、日志、SSH 私钥、公钥认证文件、真实 IP、设备序列号、密码或 Token。仓库里的地址和用户名都是占位符。

## 许可

仓库中的文档和自写脚本使用 MIT License。Sunshine、Moonlight、Tailscale、Termux 和 OpenSSH 均属于各自项目。
