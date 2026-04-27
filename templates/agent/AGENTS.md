# AIエージェント設定テンプレート

## 概要

AIエージェント向けの汎用設定テンプレートを管理するディレクトリである。
ターゲットプロジェクトに展開される設定ファイルを、展開先と同じディレクトリ構造（ミラー方式）で保持する。

## ディレクトリ構成

```
templates/agent/
├── README.md              # 使い方・配置されるファイルの説明
├── AGENTS.md              # AI向けアーキテクチャ説明
├── CLAUDE.md              # AGENTS.mdと同期
├── .cursor/               # Cursor向け設定（ターゲットの .cursor/ にミラー配置）
│   └── rules/
│       ├── coding.mdc
│       ├── git.mdc
│       └── security.mdc
└── install.sh             # curl経由で実行する配布スクリプト
```

## 設計方針

### ミラー方式

テンプレート内のディレクトリ構造は、ターゲットプロジェクトに展開される構造と一致させる。
例えば `templates/agent/.cursor/rules/coding.mdc` は、ターゲットの `.cursor/rules/coding.mdc` に配置される。
これにより、テンプレートを見ればそのまま展開結果が把握できる。

### install.sh

- POSIX sh互換で記述し、bash / zsh / sh いずれでも実行可能にする
- `curl`経由でパイプ実行される想定（`curl ... | sh`）
- 既存ファイルがある場合はスキップし、上書きしない

## 対応ツール

### Cursor（対応済み）

- `.cursor/rules/` に汎用ルール（`.mdc`）を配置する
- ルールは `alwaysApply: true` で全ファイルに適用される

### Codex（将来対応）

- 将来的に `.codex/` 等の構造でCodex向け設定を追加する想定

### Claude Code（将来対応）

- 将来的に `.claude/` 等の構造でClaude Code向け設定を追加する想定

## ルール一覧

| ファイル | 内容 |
|---|---|
| `security.mdc` | `.env`読み込み禁止、シークレット・認証情報の扱い |
| `git.mdc` | push制御、コミットメッセージ英語、Co-authored-by付与、破壊的操作の禁止 |
| `coding.mdc` | 既存規約への追従、変更スコープの制限、自明コメントの禁止 |
