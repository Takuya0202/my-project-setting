# my-project-setting

開発環境についてのメモ

## 概要

開発環境について統合できるようにしたり、自分自身がどうしているかをまとめる。
本プロジェクトでは2つのパターンが存在する。

1. セットアップ系
   nvmのインストールやdirenvのインストール方法など初回のセットアップに関するものを記載する。
   基本的に`README.md`で完結させ、内容として、インストールに使うコマンド等を記載する。
   想定osとしてはmacOS,linux(WSL2)である。
2. プロジェクト系
   汎用的なテンプレート等を記載する。
   テンプレートは用途別（`frontend/`等）にグループ化し、さらにフレームワーク別にディレクトリを分ける。
   ここで定義したものは`curl`を通じてどこでも作成できるよう、シェルスクリプトを定義しておく。
   1同様に、ここでもzsh,bashの2つのシェルに対応できるようにする。

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

## agent

AIエージェント（Claude Code, Cursor等）向けのskillsやrulesを管理する。
`templates/agent/`配下に配置し、`install.sh`でプロジェクトの`.claude/`や`.cursor/`に展開する。

### skills

フレームワーク専用のスキル（React等）など、特定の技術領域に特化した知識・手順を定義する。

### rules

プロジェクト共通の行動規約・制約を定義する。

汎用ルールの例:
- `.env`ファイルを読み込まない
- 明示的な指示がない限りGitHubへpushしない
- コミットメッセージは英語で記述する
- エージェントからのコミットには`Co-authored-by`トレーラーを付与する

## 方針

基本的に個人の環境に依存するような設定はしないようにする。
e.g. : `zshrc`,`bashrc`、テーマ、フォント等の設定。
ただし、汎用的なIDE設定（エンコーディング、改行コード、保存時フォーマット等）は`setup/ide/`で管理する。

## frontend

### linter,eslint系

フォーマッター等に関しては`.vscode/settings.json,.prettierrc`などプロジェクトごとに定義する。
これらの汎用的なセットアップは`curl`を通じてプロジェクトに配置できるように設定する。
テンプレートは`templates/frontend/`配下にフレームワーク別（React, Vue, Next, Nuxt等）に用意し、各フレームワークに適したeslint pluginや設定を含める。

### node

nodeのバージョン管理には`nvm`と`direnv`を使用する。
各プロジェクトごとに`.nvmrc`と`.envrc`を設定し、チームの開発環境を統合させる。
