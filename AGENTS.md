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
├── setup/                         # セットアップ系（手順ドキュメント）
│   ├── node/
│   │   └── README.md              # nvm + direnvのインストール・設定手順
│   └── ...
└── templates/                     # プロジェクト系（テンプレート + 配布スクリプト）
    ├── react/
    │   ├── AGENTS.md              # React テンプレートのアーキテクチャ説明
    │   ├── CLAUDE.md              # AGENTS.mdと同期
    │   ├── install.sh             # curl経由で実行する配布スクリプト
    │   ├── .eslintrc.js
    │   ├── .prettierrc
    │   └── .vscode/settings.json
    ├── vue/
    ├── next/
    ├── nuxt/
    └── ...
```

## カテゴリ

本プロジェクトには2つのカテゴリが存在する。

### 1. セットアップ系（`setup/`）

- 環境構築の手順をドキュメントとして記載する（自動化スクリプトではない）
- 自分の環境の再現性を保つための備忘録としての位置づけ
- 「目的」単位でディレクトリを分ける（ツール単位ではない）
  - 例: `setup/node/` にnvm + direnvの手順をまとめる（`setup/nvm/` と `setup/direnv/` には分けない）
- 基本的に各ディレクトリの`README.md`で完結させ、コマンドベースで再現可能にする
- 対応OS: macOS, Linux(WSL2)

### 2. プロジェクト系（`templates/`）

- frontend用の設定など汎用的なテンプレートを提供する
- `curl`経由の`install.sh`でどこからでも取得・配置できるようにする
- テンプレートはフレームワーク別（React, Vue, Next, Nuxt等）にディレクトリを分ける
  - 各フレームワークに適したeslint plugin等の設定を含める
- `install.sh`実行時、ユーザー側にはフラットにファイルが生成される（内部構造は意識させない）
- 複数ファイルで構成されるテンプレートには、個別の`AGENTS.md`と`CLAUDE.md`を置いてアーキテクチャを説明できる

## 方針

- 個人環境に依存する設定は含めない（`settings.json`, `zshrc`, `bashrc`等）
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
