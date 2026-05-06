# Spring Boot Makefile テンプレート

Spring Boot（Gradle）プロジェクト向けの Makefile テンプレート。

## 含まれるファイル

| ファイル | 説明 |
|---|---|
| `Makefile` | Spring Boot プロジェクト用タスク定義 |

## 要件

- Java 17 以上
- Gradle Wrapper（`./gradlew`）

## インストール

```sh
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/makefile/spring/install.sh | sh
```

## 使い方

| コマンド | 説明 |
|---|---|
| `make run` | アプリを起動 |
| `make watch` | ファイル変更を監視して自動コンパイル |
| `make dev` | 開発モード（`run` と `watch` を並列実行） |
| `make build` | ビルド |
| `make test` | テスト実行 |
| `make clean` | ビルド成果物を削除 |
| `make help` | ヘルプを表示 |
