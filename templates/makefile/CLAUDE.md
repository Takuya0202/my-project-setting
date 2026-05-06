# Makefile テンプレート

フレームワーク・言語別の Makefile テンプレートを管理するカテゴリ。

## 方針

- 各フレームワーク向けの開発タスク（run / build / test / clean 等）を `make` コマンドで統一する
- `install.sh` を curl 経由で実行し、プロジェクトルートに `Makefile` を配置する
- 既存の `Makefile` はスキップする（上書きしない）

## テンプレート一覧

| ディレクトリ | 対象 |
|---|---|
| `spring/` | Spring Boot（Gradle）プロジェクト |

## 構成

各テンプレートディレクトリには以下のファイルが含まれる。

| ファイル | 説明 |
|---|---|
| `Makefile` | タスク定義本体 |
| `README.md` | 使い方・コマンド一覧 |
| `install.sh` | curl 経由で Makefile を配置するスクリプト |
