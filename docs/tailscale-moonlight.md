# Tailscale 下的 Moonlight

局域网连接跑通后，两端加入同一个 Tailscale 网络即可尝试跨网络访问。Moonlight 中手动添加电脑的 Tailscale 地址，地址用你自己的设备信息替换，例如 `100.x.y.z`。

检查顺序：

1. 电脑和 vivo Pad 都显示 Tailscale 在线。
2. 电脑上的 Sunshine 服务仍在运行，电脑没有休眠。
3. 平板可以通过 Tailscale 地址访问 Sunshine，再在 Moonlight 中完成配对或进入 Desktop。
4. 用实际画面和输入回传验证串流，而不是只看 ping 是否成功。

Tailscale 能连通不等于端到端画面延迟固定。网络路径、码率、编码器、分辨率和设备温度都会影响结果；不要把一次探测延迟当成串流延迟。
