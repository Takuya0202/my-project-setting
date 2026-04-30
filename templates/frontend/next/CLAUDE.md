# Next.js テンプレート

Next.js（App Router + TypeScript）プロジェクト向けの汎用設定テンプレート。

## 含まれるファイル

| ファイル | 説明 |
|---|---|
| `eslint.config.js` | ESLint 9 フラット形式（`next/core-web-vitals` + `next/typescript` + Prettier） |
| `.prettierrc` | Prettier フォーマット設定 |
| `.vscode/settings.json` | VSCode 保存時フォーマット・ESLint 自動修正設定 |
| `.claude/skills/next/SKILL.md` | Claude Code 向け Next.js ベストプラクティス スキル |
| `.cursor/skills/next/SKILL.md` | Cursor 向け（内容は Claude 版と同一） |
| `codex/AGENTS.md` | Codex 向け Next.js ベストプラクティス ガイド |

## 要件

- ESLint 9.0.0 以上
- Node.js 18.18.0 以上

## 注意事項

`create-next-app` で生成された `eslint.config.mjs` と競合するため、インストール前に削除すること。

## インストールスクリプト

| スクリプト | 内容 |
|---|---|
| `install.sh` | 全ファイル（lint + format + VSCode + 全ツールのスキル） |
| `install-claude.sh` | lint + format + VSCode + Claude Code スキル |
| `install-cursor.sh` | lint + format + VSCode + Cursor スキル |
| `install-codex.sh` | lint + format + VSCode + Codex ガイド |
