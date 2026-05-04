# Java テンプレート

Java（Spring Boot）プロジェクト向けの汎用設定テンプレート。

## 含まれるファイル

| ファイル | 説明 |
|---|---|
| `.vscode/settings.json` | Java フォーマッター・インポート整列・保存時自動適用設定 |
| `.vscode/extensions.json` | 推奨 VSCode 拡張機能（Java Pack、Spring Boot、Lombok 等） |
| `.claude/skills/java/SKILL.md` | Claude Code 向け Java ベストプラクティス スキル |
| `.cursor/skills/java/SKILL.md` | Cursor 向け Java ベストプラクティス スキル |
| `codex/AGENTS.md` | Codex 向け Java ベストプラクティス ガイド |

## 要件

- VSCode または Cursor
- [Extension Pack for Java](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-pack)（`vscjava.vscode-java-pack`）

## インストールスクリプト

| スクリプト | 内容 |
|---|---|
| `install.sh` | 全ファイル（VSCode 設定 + 全ツールのスキル） |
| `install-claude.sh` | VSCode 設定 + Claude Code スキル |
| `install-cursor.sh` | VSCode 設定 + Cursor スキル |
| `install-codex.sh` | VSCode 設定 + Codex ガイド |
