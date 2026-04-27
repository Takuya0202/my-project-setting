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
        ├── skills/
        │   ├── common/            # 汎用スキル（.env制御、push制御、コミット規約等）
        │   ├── react/             # React専用スキル
        │   └── ...
        ├── rules/
        │   ├── common/            # 汎用ルール
        │   └── ...
        └── install.sh             # curl経由で実行する配布スクリプト
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

- AIエージェント（Claude Code, Cursor等）向けのskillsとrulesのテンプレートを管理する
- `install.sh`でプロジェクトの`.claude/`や`.cursor/`に展開する
- skills
  - フレームワーク専用スキル（React等）など、特定の技術領域に特化した知識・手順を定義する
- rules
  - プロジェクト共通の行動規約・制約を定義する
  - 汎用ルールの例: `.env`ファイルを読み込まない、明示的な指示がない限りGitHubへpushしない、コミットメッセージは英語で記述する、エージェントからのコミットには`Co-authored-by`トレーラーを付与する

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
