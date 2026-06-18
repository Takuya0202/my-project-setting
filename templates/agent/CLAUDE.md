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
│   ├── cli.json
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
│   ├── settings.json
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
├── .agents/                   # Codex向けスキル（ミラー配置）
│   └── skills/
│       ├── commit/
│       │   └── SKILL.md
│       └── pr/
│           └── SKILL.md
├── .codex/                    # Codex向け実行権限ルール（ミラー配置）
│   └── rules/
│       └── default.rules
├── codex/                     # Codex向けルール（AGENTS.md競合回避のためサブディレクトリ）
│   └── AGENTS.md
├── install-cursor.sh          # Cursor用インストールスクリプト（POSIX sh）
├── install-cursor.ps1         # Cursor用インストールスクリプト（PowerShell）
├── install-claude.sh          # Claude Code用インストールスクリプト（POSIX sh）
├── install-claude.ps1         # Claude Code用インストールスクリプト（PowerShell）
├── install-codex.sh           # Codex用インストールスクリプト（POSIX sh）
└── install-codex.ps1          # Codex用インストールスクリプト（PowerShell）
```

## 設計方針

### ミラー方式

テンプレート内のディレクトリ構造は、ターゲットプロジェクトに展開される構造と一致させる。
例えば `.cursor/rules/coding.mdc` は、ターゲットの `.cursor/rules/coding.mdc` に配置される。
`.claude/rules/coding.md` は、ターゲットの `.claude/rules/coding.md` に配置される。
Codexのみ `AGENTS.md` がテンプレートドキュメントと競合するため `codex/` サブディレクトリに格納する。

### install-<tool>.sh / install-<tool>.ps1

- ツールごとにインストールスクリプトを分ける（`install-cursor`, `install-claude`, `install-codex`）
- 各ツールごとに POSIX sh 版（`.sh`）と PowerShell 版（`.ps1`）を併設する。両者は同一の責務・同一の挙動を持つ
- `.sh` は POSIX sh互換で記述し、bash / zsh / sh いずれでも実行可能にする。`curl`経由でパイプ実行される想定（`curl ... | sh`）
- `.ps1` は Windows PowerShell から `iwr ... | iex` で実行される想定。`-Force` で既存ファイルを上書きする
- 既存ファイルがある場合はスキップし、上書きしない（`.sh` は `--force`、`.ps1` は `-Force` で上書き）

## 対応ツール

### Cursor

- `.cursor/cli.json` に権限設定（allow / deny）を配置する。未記載はデフォルトの prompt（確認）
- `.cursor/rules/` に汎用ルール（`.mdc`）を配置する（YAML frontmatter 付き、`alwaysApply: true`）
- `.cursor/skills/` に汎用スキル（`<name>/SKILL.md`）を配置する
- rules との多層防御: cli.json は harness 強制、rules は AI 自制

### Claude Code

- `.claude/settings.json` に権限設定（allow / ask / deny）を配置する
- `.claude/rules/` に汎用ルール（`.md`）を配置する（frontmatterなし、全セッション常時適用）
- `.claude/skills/` に汎用スキル（`<name>/SKILL.md`）を配置する
- settings.json の permissions は rules の多層防御として機能する（rules = AI自制、permissions = ハーネス強制）

### Codex

- プロジェクトルートに `AGENTS.md` を配置し、ルールを統合する
- `.agents/skills/` に汎用スキル（`<name>/SKILL.md`）を配置する
- `.codex/rules/default.rules` に実行権限ルール（Starlark形式）を配置する
- SKILL.md のフロントマターには `name` と `description` の両方が必要（Claude/Cursor は `description` のみ）
- `.rules` はコマンド実行制御のみ。ファイルの Read/Write 制御はなく、`.env` 等は AGENTS.md のルールで補完する
- プロジェクトローカルルールは「信頼済み」状態でないとロードされない点に注意

## ルール一覧

3ツール共通で以下のルールを持つ。内容は同一で、ファイル形式のみ異なる。

| カテゴリ | 内容 |
|---|---|
| セキュリティ | `.env`読み込み禁止、シークレット・認証情報の扱い |
| Git | push制御、コミットメッセージ日本語、破壊的操作の禁止 |
| コーディング | 既存規約への追従、変更スコープの制限、自明コメントの禁止 |
| コマンド | 破壊的シェルコマンド・特権昇格・グローバルインストール・システム操作の禁止 |

## スキル一覧

3ツール共通でスキルを持つ。内容は同一で、配置先のみ異なる。

| スキル | 内容 |
|---|---|
| commit | 未ステージも含めた変更を関心ごとに分割コミット案として提示し、承認後に順にコミットする |
| pr | 現在のブランチをレビュー観点で評価し、適切なら説明文を生成、過大なら分割方針を先に提示する |
