# Java テンプレート

Java（Spring Boot）プロジェクト向けの VSCode 設定・AIエージェント スキルテンプレート。

## 要件

- VSCode または Cursor
- [Extension Pack for Java](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-pack)（`vscjava.vscode-java-pack`）

## Claude Code

Claude Code向けの VSCode 設定と Java ベストプラクティス スキルをプロジェクトに配置する。

### 使い方

プロジェクトのルートで以下を実行する:

```sh
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/backend/java/install-claude.sh | sh
```

### 配置されるファイル

| 配置先 | 内容 |
| --- | --- |
| `.vscode/settings.json` | Java フォーマッター・インポート整列・保存時自動適用設定 |
| `.vscode/extensions.json` | 推奨 VSCode 拡張機能（Java Pack、Spring Boot、Lombok 等） |
| `.claude/skills/java/SKILL.md` | Java ベストプラクティス スキル |

## Cursor

Cursor向けの VSCode 設定と Java ベストプラクティス スキルをプロジェクトに配置する。

### 使い方

プロジェクトのルートで以下を実行する:

```sh
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/backend/java/install-cursor.sh | sh
```

### 配置されるファイル

| 配置先 | 内容 |
| --- | --- |
| `.vscode/settings.json` | Java フォーマッター・インポート整列・保存時自動適用設定 |
| `.vscode/extensions.json` | 推奨 VSCode 拡張機能（Java Pack、Spring Boot、Lombok 等） |
| `.cursor/skills/java/SKILL.md` | Java ベストプラクティス スキル |

## Codex

Codex向けの VSCode 設定と Java ベストプラクティス ガイドをプロジェクトに配置する。

### 使い方

プロジェクトのルートで以下を実行する:

```sh
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/backend/java/install-codex.sh | sh
```

### 配置されるファイル

| 配置先 | 内容 |
| --- | --- |
| `.vscode/settings.json` | Java フォーマッター・インポート整列・保存時自動適用設定 |
| `.vscode/extensions.json` | 推奨 VSCode 拡張機能（Java Pack、Spring Boot、Lombok 等） |
| `codex/AGENTS.md` | Java ベストプラクティス ガイド |

## 全ツール

全ツール分の設定をまとめてインストールする。

### 使い方

プロジェクトのルートで以下を実行する:

```sh
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/backend/java/install.sh | sh
```

### 配置されるファイル

| 配置先 | 内容 |
| --- | --- |
| `.vscode/settings.json` | Java フォーマッター・インポート整列・保存時自動適用設定 |
| `.vscode/extensions.json` | 推奨 VSCode 拡張機能（Java Pack、Spring Boot、Lombok 等） |
| `.claude/skills/java/SKILL.md` | Claude Code 向け Java ベストプラクティス スキル |
| `.cursor/skills/java/SKILL.md` | Cursor 向け Java ベストプラクティス スキル |
| `codex/AGENTS.md` | Codex 向け Java ベストプラクティス ガイド |

---

## 共通の動作

- 同名ファイルが既にある場合はスキップ（上書きしない）
- 結果は `[created]` / `[skip]` で表示される
