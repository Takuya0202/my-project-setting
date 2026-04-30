# Vue テンプレート

Vue 3（TypeScript + Composition API）プロジェクト向けの linter・フォーマット・AIエージェント設定テンプレート。

## 含まれる設定

| ファイル | 説明 |
|---|---|
| `eslint.config.js` | ESLint 9 フラット形式（`eslint-plugin-vue` + TypeScript + Prettier） |
| `.prettierrc` | Prettier フォーマット設定 |
| `.vscode/settings.json` | 保存時フォーマット・ESLint 自動修正（`.vue` 対応） |
| `.claude/skills/vue/SKILL.md` | Claude Code 向け Vue 3 ベストプラクティス スキル |
| `.cursor/skills/vue/SKILL.md` | Cursor 向け Vue 3 ベストプラクティス スキル |
| `codex/AGENTS.md` | Codex 向け Vue 3 ベストプラクティス ガイド |

## 要件

- Node.js 18.18.0 以上
- ESLint 9.0.0 以上

## インストール

### 設定ファイルの配置

```sh
# Claude Code を使う場合
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/frontend/vue/install-claude.sh | sh

# Cursor を使う場合
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/frontend/vue/install-cursor.sh | sh

# Codex を使う場合
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/frontend/vue/install-codex.sh | sh

# すべてまとめてインストールする場合
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/frontend/vue/install.sh | sh
```

### 依存パッケージのインストール

```sh
# npm
npm install -D eslint @eslint/js globals typescript-eslint eslint-plugin-vue eslint-config-prettier prettier

# pnpm
pnpm add -D eslint @eslint/js globals typescript-eslint eslint-plugin-vue eslint-config-prettier prettier

# yarn
yarn add -D eslint @eslint/js globals typescript-eslint eslint-plugin-vue eslint-config-prettier prettier

# deno
deno add -D npm:eslint npm:@eslint/js npm:globals npm:typescript-eslint npm:eslint-plugin-vue npm:eslint-config-prettier npm:prettier

# bun
bun add -D eslint @eslint/js globals typescript-eslint eslint-plugin-vue eslint-config-prettier prettier
```
