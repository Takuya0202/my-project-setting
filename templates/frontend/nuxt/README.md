# Nuxt テンプレート

Nuxt 3（TypeScript）プロジェクト向けの linter・フォーマット・AIエージェント設定テンプレート。

## 要件

- Node.js 18.18.0 以上
- ESLint 9.0.0 以上
- `@nuxt/eslint` モジュール（下記参照）

## 事前準備

`eslint.config.js` は `@nuxt/eslint` モジュールが生成する `.nuxt/eslint.config.mjs` に依存する。

```sh
# @nuxt/eslint モジュールを追加
npx nuxi module add eslint

# .nuxt/eslint.config.mjs を生成
npx nuxi prepare
```

## Claude Code

Claude Code向けの linter・フォーマット・VSCode 設定と Nuxt 3 ベストプラクティス スキルをプロジェクトに配置する。

### 使い方

プロジェクトのルートで以下を実行する:

```sh
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/frontend/nuxt/install-claude.sh | sh
```

### 配置されるファイル

| 配置先 | 内容 |
| --- | --- |
| `eslint.config.js` | ESLint 9 フラット形式（`@nuxt/eslint` モジュール連携 + Prettier） |
| `.prettierrc` | Prettier フォーマット設定 |
| `.vscode/settings.json` | 保存時フォーマット・ESLint 自動修正（`.vue` 対応） |
| `.claude/skills/nuxt/SKILL.md` | Nuxt 3 ベストプラクティス スキル |

## Cursor

Cursor向けの linter・フォーマット・VSCode 設定と Nuxt 3 ベストプラクティス スキルをプロジェクトに配置する。

### 使い方

プロジェクトのルートで以下を実行する:

```sh
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/frontend/nuxt/install-cursor.sh | sh
```

### 配置されるファイル

| 配置先 | 内容 |
| --- | --- |
| `eslint.config.js` | ESLint 9 フラット形式（`@nuxt/eslint` モジュール連携 + Prettier） |
| `.prettierrc` | Prettier フォーマット設定 |
| `.vscode/settings.json` | 保存時フォーマット・ESLint 自動修正（`.vue` 対応） |
| `.cursor/skills/nuxt/SKILL.md` | Nuxt 3 ベストプラクティス スキル |

## Codex

Codex向けの linter・フォーマット・VSCode 設定と Nuxt 3 ベストプラクティス ガイドをプロジェクトに配置する。

### 使い方

プロジェクトのルートで以下を実行する:

```sh
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/frontend/nuxt/install-codex.sh | sh
```

### 配置されるファイル

| 配置先 | 内容 |
| --- | --- |
| `eslint.config.js` | ESLint 9 フラット形式（`@nuxt/eslint` モジュール連携 + Prettier） |
| `.prettierrc` | Prettier フォーマット設定 |
| `.vscode/settings.json` | 保存時フォーマット・ESLint 自動修正（`.vue` 対応） |
| `codex/AGENTS.md` | Nuxt 3 ベストプラクティス ガイド |

## 全ツール

全ツール分の設定をまとめてインストールする。

### 使い方

プロジェクトのルートで以下を実行する:

```sh
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/frontend/nuxt/install.sh | sh
```

### 配置されるファイル

| 配置先 | 内容 |
| --- | --- |
| `eslint.config.js` | ESLint 9 フラット形式（`@nuxt/eslint` モジュール連携 + Prettier） |
| `.prettierrc` | Prettier フォーマット設定 |
| `.vscode/settings.json` | 保存時フォーマット・ESLint 自動修正（`.vue` 対応） |
| `.claude/skills/nuxt/SKILL.md` | Claude Code 向け Nuxt 3 ベストプラクティス スキル |
| `.cursor/skills/nuxt/SKILL.md` | Cursor 向け Nuxt 3 ベストプラクティス スキル |
| `codex/AGENTS.md` | Codex 向け Nuxt 3 ベストプラクティス ガイド |

## 依存パッケージのインストール

設定ファイルを配置した後、以下のパッケージをインストールする。

```sh
# npm
npm install -D eslint-config-prettier prettier

# pnpm
pnpm add -D eslint-config-prettier prettier

# yarn
yarn add -D eslint-config-prettier prettier

# deno
deno add -D npm:eslint-config-prettier npm:prettier

# bun
bun add -D eslint-config-prettier prettier
```

---

## 共通の動作

- 同名ファイルが既にある場合はスキップ（上書きしない）
- 結果は `[created]` / `[skip]` で表示される
