# React テンプレート

React（TypeScript）プロジェクト向けの linter・フォーマット・AIエージェント設定テンプレート。

## 含まれる設定

| ファイル | 説明 |
|---|---|
| `eslint.config.js` | ESLint 9 フラット形式（TypeScript + React 対応） |
| `.prettierrc` | Prettier フォーマット設定 |
| `.vscode/settings.json` | 保存時フォーマット・ESLint 自動修正 |
| `.claude/skills/react/SKILL.md` | Claude Code 向け React ベストプラクティス スキル |
| `.cursor/skills/react/SKILL.md` | Cursor 向け React ベストプラクティス スキル |
| `codex/AGENTS.md` | Codex 向け React ベストプラクティス ガイド |

## 要件

- Node.js 18.18.0 以上
- ESLint 9.0.0 以上

## インストール

### 設定ファイルの配置

使用するエディタ・AIツールに合わせてスクリプトを選択する。

```sh
# Claude Code を使う場合
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/frontend/react/install-claude.sh | sh

# Cursor を使う場合
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/frontend/react/install-cursor.sh | sh

# Codex を使う場合
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/frontend/react/install-codex.sh | sh

# すべてまとめてインストールする場合
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/frontend/react/install.sh | sh
```

### 依存パッケージのインストール

設定ファイルを配置した後、以下のパッケージをインストールする。

```sh
# npm
npm install -D eslint @eslint/js globals typescript-eslint eslint-plugin-react eslint-plugin-react-hooks eslint-config-prettier prettier

# pnpm
pnpm add -D eslint @eslint/js globals typescript-eslint eslint-plugin-react eslint-plugin-react-hooks eslint-config-prettier prettier

# yarn
yarn add -D eslint @eslint/js globals typescript-eslint eslint-plugin-react eslint-plugin-react-hooks eslint-config-prettier prettier

# deno
deno add -D npm:eslint npm:@eslint/js npm:globals npm:typescript-eslint npm:eslint-plugin-react npm:eslint-plugin-react-hooks npm:eslint-config-prettier npm:prettier

# bun
bun add -D eslint @eslint/js globals typescript-eslint eslint-plugin-react eslint-plugin-react-hooks eslint-config-prettier prettier
```
