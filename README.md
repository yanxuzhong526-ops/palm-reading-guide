# Palm Reading Guide Skill

一个用于 Codex 的中文手相解读 Skill。它会先检查手掌照片，再把“可见掌纹事实”和“传统手相象征”分开分析，并生成简洁的黑白掌纹线稿。

## 一键启动（Windows）

### 准备工作

1. 安装并登录 [Codex CLI](https://learn.chatgpt.com/docs/codex/cli)。
2. 下载本仓库 ZIP 并解压，或者使用 Git 克隆仓库。
3. 双击仓库根目录的 `start-palm-reading.cmd`。

启动器会自动完成以下步骤：

1. 弹出图片选择框，选择一张或两张手掌照片。
2. 询问性别资料：男性、女性、非二元或其他、不透露。
3. 询问惯用手：左手、右手、双手均衡或不确定。
4. 选择现代模式或传统“男左女右”模式。
5. 启动 Codex、附加照片，并自动调用 `$palm-reading-guide`。

## 手掌照片怎么拍

- 最好同时提供左手和右手。
- 手掌正对镜头，从手腕纹拍到全部指尖。
- 使用自然光或柔和的室内光，避免闪光反射和重阴影。
- 手指自然分开，不要用力绷紧手掌。
- 不使用美颜、滤镜或严重压缩的图片。

只有一张照片也可以使用，但请明确它是左手还是右手，以及是否为惯用手。

## 两种阅读模式

### 现代模式（默认）

所有性别资料都以惯用手为主，另一只手用于比较。惯用手代表较多后天形成和当前发展的模式，非惯用手作为基线参考。

### 传统模式

使用传统“男左女右”的选手约定：男性以左手为主，女性以右手为主。非二元、其他或不透露性别时，仍以惯用手为主。

性别只影响传统选手规则，不会被用于推断能力、性格、关系角色或人生方向。

## 手动启动

在 PowerShell 中进入仓库目录后运行：

```powershell
codex -C . -i .\left-hand.jpg -i .\right-hand.jpg '$palm-reading-guide 请分析这两张手掌照片，并生成完整中文手相报告。'
```

也可以先运行 `codex`，然后输入 `$palm-reading-guide`，再粘贴或添加手掌照片。

Codex 会从仓库的 `.agents/skills/palm-reading-guide` 自动加载这个 Skill。根据 [OpenAI 官方说明](https://learn.chatgpt.com/docs/build-skills)，Codex 会扫描仓库内的 `.agents/skills`，并可通过 `$skill-name` 显式调用 Skill。

## 报告包含什么

- 照片质量和分析边界
- 主读手、比较手与选手规则
- 感情线、智慧线、生命线和命运线
- 手型、拇指、指形与掌丘
- 左右手差异和综合主题
- 每个部分的高 / 中 / 低置信度
- 三个可用于自我反思的问题
- 黑白掌纹轮廓 SVG 或 PNG

## 重要说明

手相属于文化与娱乐性解读，不是科学预测。这个 Skill 不会判断寿命、疾病、婚育、财富、犯罪倾向或必然发生的事件，也不能替代医疗、法律或财务建议。

## 仓库结构

```text
.
|-- start-palm-reading.cmd       Windows 一键启动入口
|-- scripts/
|   `-- launch.ps1               图片选择、资料采集和 Codex 启动逻辑
`-- .agents/skills/
    `-- palm-reading-guide/      Skill 本体
```
