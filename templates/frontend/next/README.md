# Next.js テンプレート

Next.js（App Router + TypeScript）プロジェクト向けの linter・フォーマット・AIエージェント設定テンプレート。

## 要件

- Node.js 18.18.0 以上
- ESLint 9.0.0 以上

## 事前準備

`create-next-app` で生成された `eslint.config.mjs` と競合するため、インストール前に削除する。

```sh
rm eslint.config.mjs
```

## Claude Code

Claude Code向けの linter・フォーマット・VSCode 設定と Next.js ベストプラクティス スキルをプロジェクトに配置する。

### 使い方

プロジェクトのルートで以下を実行する:

```sh
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/frontend/next/install-claude.sh | sh
```

### 配置されるファイル

| 配置先 | 内容 |
| --- | --- |
| `eslint.config.js` | ESLint 9 フラット形式（`next/core-web-vitals` + `next/typescript` + Prettier） |
| `.prettierrc` | Prettier フォーマット設定 |
| `.vscode/settings.json` | 保存時フォーマット・ESLint 自動修正 |
| `.claude/skills/next/SKILL.md` | Next.js ベストプラクティス スキル |

## Cursor

Cursor向けの linter・フォーマット・VSCode 設定と Next.js ベストプラクティス スキルをプロジェクトに配置する。

### 使い方

プロジェクトのルートで以下を実行する:

```sh
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/frontend/next/install-cursor.sh | sh
```

### 配置されるファイル

| 配置先 | 内容 |
| --- | --- |
| `eslint.config.js` | ESLint 9 フラット形式（`next/core-web-vitals` + `next/typescript` + Prettier） |
| `.prettierrc` | Prettier フォーマット設定 |
| `.vscode/settings.json` | 保存時フォーマット・ESLint 自動修正 |
| `.cursor/skills/next/SKILL.md` | Next.js ベストプラクティス スキル |

## Codex

Codex向けの linter・フォーマット・VSCode 設定と Next.js ベストプラクティス ガイドをプロジェクトに配置する。

### 使い方

プロジェクトのルートで以下を実行する:

```sh
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/frontend/next/install-codex.sh | sh
```

### 配置されるファイル

| 配置先 | 内容 |
| --- | --- |
| `eslint.config.js` | ESLint 9 フラット形式（`next/core-web-vitals` + `next/typescript` + Prettier） |
| `.prettierrc` | Prettier フォーマット設定 |
| `.vscode/settings.json` | 保存時フォーマット・ESLint 自動修正 |
| `codex/AGENTS.md` | Next.js ベストプラクティス ガイド |

## 全ツール

全ツール分の設定をまとめてインストールする。

### 使い方

プロジェクトのルートで以下を実行する:

```sh
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/frontend/next/install.sh | sh
```

### 配置されるファイル

| 配置先 | 内容 |
| --- | --- |
| `eslint.config.js` | ESLint 9 フラット形式（`next/core-web-vitals` + `next/typescript` + Prettier） |
| `.prettierrc` | Prettier フォーマット設定 |
| `.vscode/settings.json` | 保存時フォーマット・ESLint 自動修正 |
| `.claude/skills/next/SKILL.md` | Claude Code 向け Next.js ベストプラクティス スキル |
| `.cursor/skills/next/SKILL.md` | Cursor 向け Next.js ベストプラクティス スキル |
| `codex/AGENTS.md` | Codex 向け Next.js ベストプラクティス ガイド |

## 依存パッケージのインストール

`create-next-app` で生成したプロジェクトには `eslint-config-next` が既に含まれている。追加で以下をインストールする。

```sh
# npm
npm install -D @eslint/eslintrc eslint-config-prettier prettier

# pnpm
pnpm add -D @eslint/eslintrc eslint-config-prettier prettier

# yarn
yarn add -D @eslint/eslintrc eslint-config-prettier prettier

# deno
deno add -D npm:@eslint/eslintrc npm:eslint-config-prettier npm:prettier

# bun
bun add -D @eslint/eslintrc eslint-config-prettier prettier
```

---

## 共通の動作

- 同名ファイルが既にある場合はスキップ（上書きしない）
- 結果は `[created]` / `[skip]` で表示される
