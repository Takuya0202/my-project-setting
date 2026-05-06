# Docker Compose Makefile テンプレート

Docker Compose プロジェクト向けの Makefile テンプレート。

## 含まれるファイル

| ファイル | 説明 |
|---|---|
| `Makefile` | Docker Compose プロジェクト用タスク定義 |

## 要件

- Docker Compose V2（`docker compose` コマンド）

## インストール

```sh
curl -fsSL https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/makefile/docker-compose/install.sh | sh
```

## 使い方

| コマンド | 説明 |
|---|---|
| `make up` | コンテナをバックグラウンドで起動 |
| `make down` | コンテナを停止・削除 |
| `make build` | イメージをビルド |
| `make bash` | コンテナに bash で接続 |
| `make logs` | ログを表示 |
| `make logs-f` | ログをリアルタイムで追跡 |
| `make run` | 新しいコンテナで bash を起動 |
| `make ps` | コンテナの状態を表示 |
| `make restart` | コンテナを再起動 |
| `make rebuild` | コンテナを停止→ビルド→起動 |
| `make help` | ヘルプを表示 |

## SERVICE 変数

`bash` / `run` のデフォルトサービスは `app`。別のサービスを指定する場合:

```sh
make bash SERVICE=api
make run SERVICE=worker
```
