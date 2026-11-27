# C# 学习站 · 协作部署说明

这个目录就是**网站本体**，可以直接发布。任何人把这里的 `.md` 改掉，网站内容就变了，不需要改代码。

## 目录说明

| 文件 | 对应网站页面 |
|---|---|
| `index.html` | 网站外壳（导航、搜索、解析渲染） |
| `plan.md` | 学习规划 |
| `daily.md` | 每日总结 |
| `errors.md` | 错误记录本 |
| `review.md` | 学习复盘 |
| `translate.md` | 代码翻译 |
| `qa.md` | 答疑记录 |
| `words.js` | 单词本数据（`const WORDS = [...]`） |

页面标题由 `## ` 二级标题切分，因此：
- 新增复盘：在 `review.md` 末尾追加 `## Day 02 · 小节名`
- 新增答疑：在 `qa.md` 末尾追加 `## 问题标题`
- 错误本保持表格格式（`| E00X | ... |`）

## 发布方式（已配置好）

- 仓库：`https://github.com/MYBQ1113/csharp-study-site`（Public）
- 站点：`https://mybq1113.github.io/csharp-study-site/`
- 自动部署：`.github/workflows/pages.yml`，推送到 `main` 后约 30 秒自动上线

## 多人协作

1. 仓库 → Settings → Collaborators → Add people，邀请其他 GitHub 账号
2. 对方接受邀请后，在网页上直接编辑 `.md` 文件并提交，网站自动更新
3. 需要本地编辑时：`git clone` 到本地，改完 `git push`

## 本地更新流程（主账号）

```powershell
# 1. 把工作区的源文件同步到本目录
.\sync.ps1

# 2. 提交并推送
git add .
git commit -m "更新 Day 02"
git push
```

## 重要说明

- **不要**再依赖 `traesite` 站点发布：那个站点绑定创建它的 Trae 账号，其他账号无法发布（`SERVICE_` 报错）。
- 内容与发布分离后，改内容只需要文件权限，不再需要 Trae 账号权限。
- `index.html` 里没有任何外部 CDN 依赖，离线也能打开。
