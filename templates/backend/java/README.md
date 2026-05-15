# Java テンプレート

Java（Spring Boot）プロジェクト向けの VSCode 設定・AIエージェント スキルテンプレート。

## 含まれる設定

| ファイル | 説明 |
| --- | --- |
| `.vscode/settings.json` | Java フォーマッター・インポート整列・保存時自動適用設定 |
| `.vscode/extensions.json` | 推奨 VSCode 拡張機能（Java Pack、Spring Boot、Lombok 等） |
| `.claude/skills/java/SKILL.md` | Claude Code 向け Java ベストプラクティス スキル |
| `.cursor/skills/java/SKILL.md` | Cursor 向け Java ベストプラクティス スキル |
| `codex/AGENTS.md` | Codex 向け Java ベストプラクティス ガイド |

## 要件

- VSCode または Cursor
- [Extension Pack for Java](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-pack)（`vscjava.vscode-java-pack`）

## インストール

使用するエディタ・AIツールに合わせてスクリプトを選択する。

```sh
# Claude Code を使う場合
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/backend/java/install-claude.sh | sh

# Cursor を使う場合
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/backend/java/install-cursor.sh | sh

# Codex を使う場合
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/backend/java/install-codex.sh | sh

# すべてまとめてインストールする場合
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/backend/java/install.sh | sh
```
