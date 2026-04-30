# Nuxt テンプレート

Nuxt 3（TypeScript）プロジェクト向けの汎用設定テンプレート。

## 含まれるファイル

| ファイル | 説明 |
|---|---|
| `eslint.config.js` | ESLint 9 フラット形式（`@nuxt/eslint` モジュール連携 + Prettier） |
| `.prettierrc` | Prettier フォーマット設定 |
| `.vscode/settings.json` | VSCode 保存時フォーマット・ESLint 自動修正設定（`.vue` 対応） |
| `.claude/skills/nuxt/SKILL.md` | Claude Code 向け Nuxt 3 ベストプラクティス スキル |
| `.cursor/skills/nuxt/SKILL.md` | Cursor 向け（内容は Claude 版と同一） |
| `codex/AGENTS.md` | Codex 向け Nuxt 3 ベストプラクティス ガイド |

## 要件

- ESLint 9.0.0 以上
- Node.js 18.18.0 以上
- `@nuxt/eslint` モジュール（`nuxi module add eslint` で追加）
- `nuxi prepare` の実行（`.nuxt/eslint.config.mjs` を生成するため）

## インストールスクリプト

| スクリプト | 内容 |
|---|---|
| `install.sh` | 全ファイル（lint + format + VSCode + 全ツールのスキル） |
| `install-claude.sh` | lint + format + VSCode + Claude Code スキル |
| `install-cursor.sh` | lint + format + VSCode + Cursor スキル |
| `install-codex.sh` | lint + format + VSCode + Codex ガイド |
