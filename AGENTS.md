# Project Guidelines

## 概要

このリポジトリは開発環境の設定・セットアップをまとめたものである。
個人の環境に依存しない、汎用的な開発環境構築のためのテンプレートやスクリプトを管理する。

## ディレクトリ構成

```
my-project-setting/
├── README.md                      # 全体概要・方針・ディレクトリ構成
├── AGENTS.md                      # AI向けガイドライン
├── CLAUDE.md                      # AI向けガイドライン（AGENTS.mdと同期）
├── setup/                         # セットアップ系
│   ├── ide/
│   │   ├── README.md              # IDE設定の方針・対象IDE・含める設定の説明
│   │   └── settings.json          # VSCode/Cursor用の汎用設定
│   ├── node/
│   │   └── README.md              # nvm + direnvのインストール・設定手順
│   └── ...
└── templates/                     # プロジェクト系（テンプレート + 配布スクリプト）
    ├── frontend/                  # フロントエンド系テンプレート
    │   ├── react/
    │   │   ├── AGENTS.md          # React テンプレートのアーキテクチャ説明
    │   │   ├── CLAUDE.md          # AGENTS.mdと同期
    │   │   ├── install.sh         # curl経由で実行する配布スクリプト
    │   │   ├── .eslintrc.js
    │   │   ├── .prettierrc
    │   │   └── .vscode/settings.json
    │   ├── vue/
    │   ├── next/
    │   ├── nuxt/
    │   └── ...
    └── agent/                     # AIエージェント設定テンプレート
        ├── README.md              # 使い方・配置されるファイルの説明
        ├── AGENTS.md              # AI向けアーキテクチャ説明
        ├── CLAUDE.md              # AGENTS.mdと同期
        ├── .cursor/               # Cursor向け設定（ミラー配置）
        │   └── rules/
        │       ├── coding.mdc
        │       ├── git.mdc
        │       └── security.mdc
        ├── .claude/               # Claude Code向け設定（ミラー配置）
        │   └── rules/
        │       ├── coding.md
        │       ├── git.md
        │       └── security.md
        ├── codex/                 # Codex向け設定（AGENTS.md競合回避）
        │   └── AGENTS.md
        ├── install-cursor.sh
        ├── install-claude.sh
        └── install-codex.sh
```

## カテゴリ

本プロジェクトには2つのカテゴリが存在する。

### 1. セットアップ系（`setup/`）

- 自分の環境の再現性を保つための情報を管理する
- 「目的」単位でディレクトリを分ける（ツール単位ではない）
  - 例: `setup/node/` にnvm + direnvの手順をまとめる（`setup/nvm/` と `setup/direnv/` には分けない）
- 手順ドキュメント（備忘録）と、汎用的な設定ファイルの2種類が含まれる
  - `setup/node/` — ドキュメント。各ディレクトリの`README.md`にコマンドベースで再現可能な手順を記載
  - `setup/ide/` — 設定ファイル。汎用的なIDE設定（`settings.json`等）を直接管理
- 対応OS: macOS, Linux(WSL2)

#### IDE設定（`setup/ide/`）

- VSCode / Cursor 向けの汎用設定を `settings.json` として管理する（IntelliJは将来対応）
- 含めるもの: エンコーディング、改行コード、末尾空白除去、保存時フォーマット、ファイルネスティング、JS/TSインポート設定等
- 含めないもの: テーマ、フォント、キーバインド、UIレイアウト、言語別フォーマッター（テンプレート側で設定）、特定拡張機能に依存する設定

### 2. プロジェクト系（`templates/`）

- 汎用的なテンプレートを提供する
- テンプレートは用途別（`frontend/`, `agent/`等）にグループ化し、さらにフレームワーク別・用途別にディレクトリを分ける
  - 例: `templates/frontend/react/`, `templates/frontend/vue/`
  - 各フレームワークに適したeslint plugin等の設定を含める
- `curl`経由の`install.sh`でどこからでも取得・配置できるようにする
- `install.sh`実行時、ユーザー側にはフラットにファイルが生成される（内部構造は意識させない）
- 複数ファイルで構成されるテンプレートには、個別の`AGENTS.md`と`CLAUDE.md`を置いてアーキテクチャを説明できる

#### AIエージェント設定（`templates/agent/`）

- AIエージェント（Cursor, Claude Code, Codex）向けの汎用設定テンプレートを管理する
- ミラー方式で各ツールの設定を保持し（`.cursor/`, `.claude/`）、`install-<tool>.sh`で展開する
- Codexのみ `AGENTS.md` がテンプレートドキュメントと競合するため `codex/` サブディレクトリに格納する
- 既存ファイルはスキップする
- 詳細は `templates/agent/AGENTS.md` を参照

## 方針

- 個人環境に依存する設定は含めない（`zshrc`, `bashrc`, テーマ, フォント等）
- ただし汎用的なIDE設定（エンコーディング、改行コード、保存時フォーマット等）は`setup/ide/`で管理する
- フォーマッター等はプロジェクトごとに`.vscode/settings.json`, `.prettierrc`で定義
- nodeのバージョン管理は`nvm` + `direnv`（`.nvmrc` + `.envrc`）

## コーディング規約

- シェルスクリプトはzshとbash両対応を意識する
- セットアップ手順はREADME.mdに記載し、コマンドベースで再現可能にする
- テンプレート類は`curl`で取得可能な形式で提供する

## ドキュメント規約

- ドキュメントは日本語で記述する
- コメント・コミットメッセージは日本語可
- `AGENTS.md`と`CLAUDE.md`は常に同一内容を保つ（同期必須）
- `AGENTS.md` / `CLAUDE.md`は`README.md`に記載されている情報を網羅し、AIが適切に文脈を理解できるようにする
- サブディレクトリに固有のアーキテクチャがある場合、そのディレクトリにも`AGENTS.md` + `CLAUDE.md`を配置できる
