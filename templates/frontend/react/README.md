# React テンプレート

React（TypeScript）プロジェクト向けの linter・フォーマット・AIエージェント設定テンプレート。

## 要件

- Node.js 18.18.0 以上
- ESLint 9.0.0 以上

## Claude Code

Claude Code向けの linter・フォーマット・VSCode 設定と React ベストプラクティス スキルをプロジェクトに配置する。

### 使い方

プロジェクトのルートで以下を実行する:

```sh
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/frontend/react/install-claude.sh | sh
```

### 配置されるファイル

| 配置先 | 内容 |
| --- | --- |
| `eslint.config.js` | ESLint 9 フラット形式（TypeScript + React 対応） |
| `.prettierrc` | Prettier フォーマット設定 |
| `.vscode/settings.json` | 保存時フォーマット・ESLint 自動修正 |
| `.claude/skills/react/SKILL.md` | React ベストプラクティス スキル |

## Cursor

Cursor向けの linter・フォーマット・VSCode 設定と React ベストプラクティス スキルをプロジェクトに配置する。

### 使い方

プロジェクトのルートで以下を実行する:

```sh
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/frontend/react/install-cursor.sh | sh
```

### 配置されるファイル

| 配置先 | 内容 |
| --- | --- |
| `eslint.config.js` | ESLint 9 フラット形式（TypeScript + React 対応） |
| `.prettierrc` | Prettier フォーマット設定 |
| `.vscode/settings.json` | 保存時フォーマット・ESLint 自動修正 |
| `.cursor/skills/react/SKILL.md` | React ベストプラクティス スキル |

## Codex

Codex向けの linter・フォーマット・VSCode 設定と React ベストプラクティス ガイドをプロジェクトに配置する。

### 使い方

プロジェクトのルートで以下を実行する:

```sh
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/frontend/react/install-codex.sh | sh
```

### 配置されるファイル

| 配置先 | 内容 |
| --- | --- |
| `eslint.config.js` | ESLint 9 フラット形式（TypeScript + React 対応） |
| `.prettierrc` | Prettier フォーマット設定 |
| `.vscode/settings.json` | 保存時フォーマット・ESLint 自動修正 |
| `codex/AGENTS.md` | React ベストプラクティス ガイド |

## 全ツール

全ツール分の設定をまとめてインストールする。

### 使い方

プロジェクトのルートで以下を実行する:

```sh
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/frontend/react/install.sh | sh
```

### 配置されるファイル

| 配置先 | 内容 |
| --- | --- |
| `eslint.config.js` | ESLint 9 フラット形式（TypeScript + React 対応） |
| `.prettierrc` | Prettier フォーマット設定 |
| `.vscode/settings.json` | 保存時フォーマット・ESLint 自動修正 |
| `.claude/skills/react/SKILL.md` | Claude Code 向け React ベストプラクティス スキル |
| `.cursor/skills/react/SKILL.md` | Cursor 向け React ベストプラクティス スキル |
| `codex/AGENTS.md` | Codex 向け React ベストプラクティス ガイド |

## 依存パッケージのインストール

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

---

## 共通の動作

- 同名ファイルが既にある場合はスキップ（上書きしない）
- 結果は `[created]` / `[skip]` で表示される
