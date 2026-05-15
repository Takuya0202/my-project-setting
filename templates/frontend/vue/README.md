# Vue テンプレート

Vue 3（TypeScript + Composition API）プロジェクト向けの linter・フォーマット・AIエージェント設定テンプレート。

## 要件

- Node.js 18.18.0 以上
- ESLint 9.0.0 以上

## Claude Code

Claude Code向けの linter・フォーマット・VSCode 設定と Vue 3 ベストプラクティス スキルをプロジェクトに配置する。

### 使い方

プロジェクトのルートで以下を実行する:

```sh
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/frontend/vue/install-claude.sh | sh
```

### 配置されるファイル

| 配置先 | 内容 |
| --- | --- |
| `eslint.config.js` | ESLint 9 フラット形式（`eslint-plugin-vue` + TypeScript + Prettier） |
| `.prettierrc` | Prettier フォーマット設定 |
| `.vscode/settings.json` | 保存時フォーマット・ESLint 自動修正（`.vue` 対応） |
| `.claude/skills/vue/SKILL.md` | Vue 3 ベストプラクティス スキル |

## Cursor

Cursor向けの linter・フォーマット・VSCode 設定と Vue 3 ベストプラクティス スキルをプロジェクトに配置する。

### 使い方

プロジェクトのルートで以下を実行する:

```sh
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/frontend/vue/install-cursor.sh | sh
```

### 配置されるファイル

| 配置先 | 内容 |
| --- | --- |
| `eslint.config.js` | ESLint 9 フラット形式（`eslint-plugin-vue` + TypeScript + Prettier） |
| `.prettierrc` | Prettier フォーマット設定 |
| `.vscode/settings.json` | 保存時フォーマット・ESLint 自動修正（`.vue` 対応） |
| `.cursor/skills/vue/SKILL.md` | Vue 3 ベストプラクティス スキル |

## Codex

Codex向けの linter・フォーマット・VSCode 設定と Vue 3 ベストプラクティス ガイドをプロジェクトに配置する。

### 使い方

プロジェクトのルートで以下を実行する:

```sh
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/frontend/vue/install-codex.sh | sh
```

### 配置されるファイル

| 配置先 | 内容 |
| --- | --- |
| `eslint.config.js` | ESLint 9 フラット形式（`eslint-plugin-vue` + TypeScript + Prettier） |
| `.prettierrc` | Prettier フォーマット設定 |
| `.vscode/settings.json` | 保存時フォーマット・ESLint 自動修正（`.vue` 対応） |
| `codex/AGENTS.md` | Vue 3 ベストプラクティス ガイド |

## 全ツール

全ツール分の設定をまとめてインストールする。

### 使い方

プロジェクトのルートで以下を実行する:

```sh
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/frontend/vue/install.sh | sh
```

### 配置されるファイル

| 配置先 | 内容 |
| --- | --- |
| `eslint.config.js` | ESLint 9 フラット形式（`eslint-plugin-vue` + TypeScript + Prettier） |
| `.prettierrc` | Prettier フォーマット設定 |
| `.vscode/settings.json` | 保存時フォーマット・ESLint 自動修正（`.vue` 対応） |
| `.claude/skills/vue/SKILL.md` | Claude Code 向け Vue 3 ベストプラクティス スキル |
| `.cursor/skills/vue/SKILL.md` | Cursor 向け Vue 3 ベストプラクティス スキル |
| `codex/AGENTS.md` | Codex 向け Vue 3 ベストプラクティス ガイド |

## 依存パッケージのインストール

設定ファイルを配置した後、以下のパッケージをインストールする。

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

---

## 共通の動作

- 同名ファイルが既にある場合はスキップ（上書きしない）
- 結果は `[created]` / `[skip]` で表示される
