# AIエージェント設定テンプレート

## 概要

AIエージェント（Cursor, Claude Code, Codex）向けの汎用設定テンプレートを管理する。
テンプレートはターゲットプロジェクトのディレクトリ構造をそのままミラーしており、`install-<tool>.sh`で展開する。

## Cursor

Cursor向けの汎用ルール（`.mdc`）・スキル・権限設定をプロジェクトに配置する。

### 使い方

プロジェクトのルートで以下を実行する:

```sh
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent/install-cursor.sh | sh
```

既存ファイルを上書きする場合:

```sh
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent/install-cursor.sh | sh -s -- --force
```

### 配置されるファイル

| 配置先 | 内容 |
| --- | --- |
| `.cursor/cli.json` | 権限設定（allow / deny、未記載はデフォルト prompt） |
| `.cursor/rules/security.mdc` | `.env`読み込み禁止、シークレット・認証情報の扱い |
| `.cursor/rules/git.mdc` | push制御、コミットメッセージ日本語、破壊的操作の禁止 |
| `.cursor/rules/coding.mdc` | 既存規約への追従、変更スコープの制限、自明コメントの禁止 |
| `.cursor/rules/commands.mdc` | 破壊的シェルコマンド・特権昇格・グローバルインストール・システム操作の禁止 |
| `.cursor/skills/commit/SKILL.md` | ステージされた変更をconventional commits形式でコミットする |
| `.cursor/skills/pr/SKILL.md` | 現在のブランチの変更をもとにPRの説明文を作成する |

## Claude Code

Claude Code向けの汎用ルール（`.md`）とスキルをプロジェクトに配置する。

### 使い方

プロジェクトのルートで以下を実行する:

```sh
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent/install-claude.sh | sh
```

既存ファイルを上書きする場合:

```sh
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent/install-claude.sh | sh -s -- --force
```

### 配置されるファイル

| 配置先 | 内容 |
| --- | --- |
| `.claude/settings.json` | 権限設定（allow / ask / deny） |
| `.claude/rules/security.md` | `.env`読み込み禁止、シークレット・認証情報の扱い |
| `.claude/rules/git.md` | push制御、コミットメッセージ日本語、破壊的操作の禁止 |
| `.claude/rules/coding.md` | 既存規約への追従、変更スコープの制限、自明コメントの禁止 |
| `.claude/rules/commands.md` | 破壊的シェルコマンド・特権昇格・グローバルインストール・システム操作の禁止 |
| `.claude/skills/commit/SKILL.md` | ステージされた変更をconventional commits形式でコミットする |
| `.claude/skills/pr/SKILL.md` | 現在のブランチの変更をもとにPRの説明文を作成する |

## Codex

Codex向けの汎用ルールをプロジェクトルートの`AGENTS.md`に、スキルを`.agents/skills/`に、実行権限ルールを`.codex/rules/`に配置する。

### 使い方

プロジェクトのルートで以下を実行する:

```sh
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent/install-codex.sh | sh
```

既存ファイルを上書きする場合:

```sh
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent/install-codex.sh | sh -s -- --force
```

### 配置されるファイル

| 配置先 | 内容 |
| --- | --- |
| `AGENTS.md` | コーディング・セキュリティ・Gitルールを統合した1ファイル |
| `.agents/skills/commit/SKILL.md` | ステージされた変更をconventional commits形式でコミットする |
| `.agents/skills/pr/SKILL.md` | 現在のブランチの変更をもとにPRの説明文を作成する |
| `.codex/rules/default.rules` | 実行権限ルール（Starlark形式、allow / prompt / forbidden） |

## 共通の動作

- 同名ファイルが既にある場合はスキップ（上書きしない）
- `--force` を指定すると既存ファイルを上書きする
- 結果は `[created]` / `[skip]` で表示される
