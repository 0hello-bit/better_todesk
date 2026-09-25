# vivo Pad 上的 Termux/OpenSSH

这次使用 Termux 作为平板端的维护入口。Termux 默认 SSH 端口是 `8022`，它提供的是 Termux 用户环境，不是 root，也不会自动获得 Android 屏幕控制权限。

## 首次配置

在平板 Termux 中安装并启动 SSH 服务：

```sh
pkg update
pkg install openssh
passwd
sshd
```

然后从电脑使用平板当前局域网地址连接：

```sh
ssh -p 8022 u0_aXXX@192.168.x.x
```

用户名应在平板运行 `whoami` 获取，地址优先在 Android Wi-Fi 设置查看；部分 Android 版本限制 `ip addr` 或 `ifconfig`。示例中的用户名和地址不能直接照抄。首次连接要核对平板端 SSH 主机密钥指纹。

## 常开和重启

从同一来源安装 Termux 和 Termux:Boot，避免签名不兼容；安装后先手动打开 Termux:Boot 一次。创建 `~/.termux/boot/`，把 [`scripts/android/start-sshd`](../scripts/android/start-sshd) 放进去，再执行：

```sh
chmod +x ~/.termux/boot/start-sshd
termux-wake-lock
```

还需要把 Termux 和 Termux:Boot 加入 vivo 系统的后台运行/电池优化白名单。Android 厂商的后台策略可能在系统升级后变化。重启后首次启动通常仍可能需要解锁一次，不能承诺完全无用户操作自启。

唤醒锁用于后台运行，不是屏幕常亮，会增加耗电。脚本只在开机时检查并启动 SSH，不是进程守护服务。用 `uptime`、`~/.termux/ssh-boot.log` 的新增时间和实际 SSH 登录共同验证重启；息屏测试不能替代重启测试。此次只验证过一次真实重启，没有验证首次解锁前的连接或整夜待机稳定性。

## 公钥登录

优先在电脑生成密钥，把公钥内容追加到平板的 `~/.ssh/authorized_keys`，并设置合适权限。私钥、`authorized_keys` 的真实内容和设备地址不进入仓库。

```sh
mkdir -p ~/.ssh
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

先从第二个终端验证公钥能独立登录，再在 Termux 的 `$PREFIX/etc/ssh/sshd_config` 中设置 `PubkeyAuthentication yes`、`PasswordAuthentication no`、`KbdInteractiveAuthentication no`。运行 `sshd -t` 检查配置，然后通过平板本地终端重启 sshd 并重新验证。上面的 `passwd` 是通用首次连接方式；这次实际配置最终使用公钥、关闭密码认证。

官方入口：[Termux](https://github.com/termux/termux-app/releases)、[Termux:Boot](https://github.com/termux/termux-boot#how-to-use)。USB 调试安装时仍要在平板确认安装许可；`User rejected permissions` 不能当作已安装。
