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

用户名应在平板运行 `whoami` 获取，地址应在平板运行 `ip addr` 或 `ifconfig` 查看。示例中的用户名和地址不能直接照抄。

## 常开和重启

安装 Termux:Boot 后，把 [`scripts/android/start-sshd`](../scripts/android/start-sshd) 放到 `~/.termux/boot/`，并执行：

```sh
chmod +x ~/.termux/boot/start-sshd
termux-wake-lock
```

还需要把 Termux 和 Termux:Boot 加入 vivo 系统的后台运行/电池优化白名单。Android 厂商的后台策略可能在系统升级后变化。重启后首次启动通常仍可能需要解锁一次，不能承诺完全无用户操作自启。

## 公钥登录

优先在电脑生成密钥，把公钥内容追加到平板的 `~/.ssh/authorized_keys`，并设置合适权限。私钥、`authorized_keys` 的真实内容和设备地址不进入仓库。
