# 🎙️ 直播逐字稿录制器

浏览器标签页音频捕获 + StepFun ASR 实时语音转文字，Mini Plan 可用。

## 功能

- 🎧 捕获浏览器标签页音频（小鹅通、腾讯会议、飞书等）
- 📝 实时语音转文字（StepFun `stepaudio-2.5-asr`，HTTP + SSE）
- 🔤 支持中文/英文，可添加热词提升识别准确率
- 📋 一键复制或导出 Markdown 格式逐字稿
- ⏱️ 自动时间戳 + 段落统计

## 快速开始

### 1. 获取 API Key

前往 [StepFun 开放平台](https://platform.stepfun.com) 注册并订阅 **Mini Plan**（含 ASR 额度），获取 API Key。

### 2. 启动本地服务器

> ⚠️ 不能直接双击 HTML 文件打开（`file://` 协议下 fetch 请求会被浏览器拦截）

**方式一：双击 `启动逐字稿服务器.bat`**（Windows）

**方式二：手动启动**
```bash
python -m http.server 8765
```
然后访问 http://localhost:8765

### 3. 使用

1. 在另一个标签页打开直播/会议页面
2. 回到录制器页面，填入 API Key
3. 点击 **▶ 开始录制** → 选择目标标签页 → 勾选「分享标签页音频」
4. 实时逐字稿显示
5. 结束后点 **⏹ 停止**，然后 **📋 复制** 或 **💾 导出**

## 技术方案

| 组件 | 技术 |
|------|------|
| 音频捕获 | `getDisplayMedia` + Web Audio API |
| 语音识别 | StepFun `stepaudio-2.5-asr` (HTTP + SSE) |
| 音频格式 | 48kHz → 16kHz 重采样，Mono PCM s16le |
| 分片策略 | 每 2 秒发送一次识别请求 |

## 系统要求

- Chrome 或 Edge（需要 `getDisplayMedia` 支持）
- Python 3（用于启动本地服务器）
- StepFun API Key（Mini Plan 即可）

## License

MIT
