# Windows Sunshine

## 安装时先确认目录是不是程序

一个名为 `sunshine` 的文件夹不代表 Sunshine 已经安装。应检查是否存在 `sunshine.exe`、Windows 服务或本机管理页面。我的排查过程里曾遇到只剩虚拟手柄驱动和辅助文件的目录，不能把它当作完整安装。

安装完成后，按 Sunshine 官方文档完成管理页面初始化，再在 Windows 防火墙中允许 Sunshine 使用的网络配置。不要直接复制另一台机器的证书和配置文件。

## 建议检查

```powershell
./scripts/windows/check-sunshine-host.ps1
```

脚本只读取程序路径、服务状态和本机管理页响应，不会打印密码或上传数据。默认检查路径可以通过参数覆盖：

需要 PowerShell 7（`pwsh`）。管理页使用本机自签名证书，检查脚本只对回环地址跳过证书验证。此检查不代表 Moonlight 配对或串流已经成功。

```powershell
./scripts/windows/check-sunshine-host.ps1 -InstallRoot 'C:\Program Files\Sunshine'
```

## 双屏

Moonlight 默认可能只显示主屏。我的目标是一次查看一个屏幕，通过实体键盘使用 Sunshine 的切屏快捷键：`Ctrl + Alt + Shift + F1` 和 `Ctrl + Alt + Shift + F2`。快捷键要避开浏览器自身常用组合；尝试过额外映射后，最后保留 Sunshine 原生组合。

这次主屏接 NVIDIA，副屏接 Intel 核显。NVENC 会话切到核显屏幕后出现 `NV_ENC_ERR_NO_ENCODE_DEVICE`；最后备份配置后改用 H.264 软件编码，日志显示 `libx264`，两屏切换才验证通过。示例为：

```ini
encoder = software
hevc_mode = 1
av1_mode = 1
```

此版本里后两项的 `1` 表示不向客户端提供 HEVC/AV1。这里只记录这台电脑的解决方式，不建议所有用户直接替换现有配置。软件编码会增加 CPU 负担；此次未测量温度、功耗和延迟差异。显示器枚举顺序变化后，F1/F2 对应关系也需重新确认。
