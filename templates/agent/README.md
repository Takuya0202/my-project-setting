# AIエージェント設定テンプレート

## 概要

AIエージェント（Cursor, Claude Code, Codex）向けの汎用設定テンプレートを管理する。
テンプレートはターゲットプロジェクトのディレクトリ構造をそのままミラーしており、`install-<tool>.sh`で展開する。

## Cursor

Cursor向けの汎用ルール（`.mdc`）をプロジェクトの`.cursor/rules/`に配置する。

### 使い方

プロジェクトのルートで以下を実行する:

bash:

```bash
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent/install-cursor.sh | bash
```

zsh:

```zsh
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent/install-cursor.sh | zsh
```

### 配置されるファイル

| 配置先 | 内容 |
|---|---|
| `.cursor/rules/security.mdc` | `.env`読み込み禁止、シークレット・認証情報の扱い |
| `.cursor/rules/git.mdc` | push制御、コミットメッセージ英語、Co-authored-by付与、破壊的操作の禁止 |
| `.cursor/rules/coding.mdc` | 既存規約への追従、変更スコープの制限、自明コメントの禁止 |

## Claude Code

Claude Code向けの汎用ルール（`.md`）をプロジェクトの`.claude/rules/`に配置する。

### 使い方

プロジェクトのルートで以下を実行する:

bash:

```bash
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent/install-claude.sh | bash
```

zsh:

```zsh
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent/install-claude.sh | zsh
```

### 配置されるファイル

| 配置先 | 内容 |
|---|---|
| `.claude/rules/security.md` | `.env`読み込み禁止、シークレット・認証情報の扱い |
| `.claude/rules/git.md` | push制御、コミットメッセージ英語、Co-authored-by付与、破壊的操作の禁止 |
| `.claude/rules/coding.md` | 既存規約への追従、変更スコープの制限、自明コメントの禁止 |

## Codex

Codex向けの汎用ルールをプロジェクトルートの`AGENTS.md`に配置する。

### 使い方

プロジェクトのルートで以下を実行する:

bash:

```bash
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent/install-codex.sh | bash
```

zsh:

```zsh
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent/install-codex.sh | zsh
```

### 配置されるファイル

| 配置先 | 内容 |
|---|---|
| `AGENTS.md` | コーディング・セキュリティ・Gitルールを統合した1ファイル |

## 共通の動作

- 同名ファイルが既にある場合はスキップ（上書きしない）
- 結果は `[created]` / `[skip]` で表示される
