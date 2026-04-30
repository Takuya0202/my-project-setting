# AIエージェント設定テンプレート

## 概要

AIエージェント向けの汎用設定テンプレートを管理するディレクトリである。
ターゲットプロジェクトに展開される設定ファイルを、展開先と同じディレクトリ構造（ミラー方式）で保持する。

## ディレクトリ構成

```
templates/agent/
├── README.md                  # 使い方・配置されるファイルの説明
├── AGENTS.md                  # AI向けアーキテクチャ説明
├── CLAUDE.md                  # AGENTS.mdと同期
├── .cursor/                   # Cursor向け設定（ミラー配置）
│   ├── rules/
│   │   ├── coding.mdc
│   │   ├── git.mdc
│   │   ├── security.mdc
│   │   └── commands.mdc
│   └── skills/
│       ├── commit/
│       │   └── SKILL.md
│       └── pr/
│           └── SKILL.md
├── .claude/                   # Claude Code向け設定（ミラー配置）
│   ├── rules/
│   │   ├── coding.md
│   │   ├── git.md
│   │   ├── security.md
│   │   └── commands.md
│   └── skills/
│       ├── commit/
│       │   └── SKILL.md
│       └── pr/
│           └── SKILL.md
├── codex/                     # Codex向け設定（AGENTS.md競合回避のためサブディレクトリ）
│   └── AGENTS.md
├── install-cursor.sh          # Cursor用インストールスクリプト
├── install-claude.sh          # Claude Code用インストールスクリプト
└── install-codex.sh           # Codex用インストールスクリプト
```

## 設計方針

### ミラー方式

テンプレート内のディレクトリ構造は、ターゲットプロジェクトに展開される構造と一致させる。
例えば `.cursor/rules/coding.mdc` は、ターゲットの `.cursor/rules/coding.mdc` に配置される。
`.claude/rules/coding.md` は、ターゲットの `.claude/rules/coding.md` に配置される。
Codexのみ `AGENTS.md` がテンプレートドキュメントと競合するため `codex/` サブディレクトリに格納する。

### install-<tool>.sh

- ツールごとにインストールスクリプトを分ける（`install-cursor.sh`, `install-claude.sh`, `install-codex.sh`）
- POSIX sh互換で記述し、bash / zsh / sh いずれでも実行可能にする
- `curl`経由でパイプ実行される想定（`curl ... | sh`）
- 既存ファイルがある場合はスキップし、上書きしない

## 対応ツール

### Cursor

- `.cursor/rules/` に汎用ルール（`.mdc`）を配置する
- YAML frontmatter 付きで、`alwaysApply: true` により全ファイルに適用される
- ルールは複数の `.mdc` ファイルに分割して管理する
- `.cursor/skills/` に汎用スキル（`<name>/SKILL.md`）を配置する

### Claude Code

- `.claude/rules/` に汎用ルール（`.md`）を配置する
- Cursorと同様に複数ファイルに分割して管理する
- frontmatter なしで全セッションに常時適用される
- `.claude/skills/` に汎用スキル（`<name>/SKILL.md`）を配置する

### Codex

- プロジェクトルートに `AGENTS.md` を配置する
- 全ルールと汎用ワークフローを1つの Markdown ファイルに統合する

## ルール一覧

3ツール共通で以下のルールを持つ。内容は同一で、ファイル形式とCo-authored-byトレーラーのみ異なる。

| カテゴリ | 内容 |
|---|---|
| セキュリティ | `.env`読み込み禁止、シークレット・認証情報の扱い |
| Git | push制御、コミットメッセージ英語、Co-authored-by付与、破壊的操作の禁止 |
| コーディング | 既存規約への追従、変更スコープの制限、自明コメントの禁止 |
| コマンド | 破壊的シェルコマンド・特権昇格・グローバルインストール・システム操作の禁止 |

## スキル一覧

Cursor・Claude Codeで共通のスキルを持つ。内容は同一。Codexは `AGENTS.md` にワークフローとして統合する。

| スキル | 内容 |
|---|---|
| commit | ステージされた変更をconventional commits形式でコミットする |
| pr | 現在のブランチの変更をもとにPRの説明文を作成する |

### Co-authored-by トレーラー

| ツール | トレーラー |
|---|---|
| Cursor | `Co-authored-by: cursor <noreply@cursor.com>` |
| Claude Code | `Co-authored-by: claude <noreply@anthropic.com>` |
| Codex | `Co-authored-by: codex <noreply@openai.com>` |
