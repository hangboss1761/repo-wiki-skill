# repo-wiki Skill

## 这个 skill 是做什么的

`repo-wiki` 用于让项目文档持续与代码变更保持同步。
它会把代码事实沉淀为可导航、可追溯、可维护的项目文档，统一放在 `repo-wiki/wiki/` 下。

类似 **DeepWiki**，但由你的 Agent 构建并维护。

## 适用场景

当你需要以下工作时使用：

- 初始化项目文档、架构总览或知识库
- 在实现变更后更新模块文档
- 基于代码证据补充实现细节或调用链说明
- 当路由、状态、依赖、跨模块调用变更时，同步更新文档

如果只是纯文案/样式修改且不影响架构认知，不建议触发此 skill。

## 核心产出要求

此 skill 应始终满足：

1. 在 `repo-wiki/wiki/` 下更新文档
2. 每个页面都能从 `repo-wiki/wiki/_sidebar.md` 访问到
3. 架构/流程页至少包含一个 Mermaid 图
4. 每页必须包含 `Purpose & Scope` 与 `Sources`
5. 证据不足时不猜测，结论必须可追溯

## 响应中的变更报告格式

```markdown
## Project Documentation Changes
- Scope:
- Change type: Content change / Structure change
- Files touched:
- Updated `wiki/_sidebar.md`: Yes / No
- Sources:
```

## 本地预览

执行：

```bash
bash repo-wiki/scripts/serve-wiki.sh
```

可选：在 `package.json` 中添加：

```json
{
  "scripts": {
    "wiki": "bash repo-wiki/scripts/serve-wiki.sh"
  }
}
```

然后运行：

```bash
pnpm run wiki
```
