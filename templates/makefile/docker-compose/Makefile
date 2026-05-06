.PHONY: up down build bash logs logs-f run ps restart rebuild help

.DEFAULT_GOAL := help

SERVICE ?= app

up: ## コンテナをバックグラウンドで起動
	@docker compose up -d

down: ## コンテナを停止・削除
	@docker compose down

build: ## イメージをビルド
	@docker compose build

bash: ## コンテナに bash で接続（SERVICE=app）
	@docker compose exec $(SERVICE) bash

logs: ## ログを表示
	@docker compose logs

logs-f: ## ログをリアルタイムで追跡
	@docker compose logs -f

run: ## 新しいコンテナで bash を起動（SERVICE=app）
	@docker compose run $(SERVICE) bash

ps: ## コンテナの状態を表示
	@docker compose ps

restart: ## コンテナを再起動
	@docker compose restart

rebuild: ## コンテナを停止→ビルド→起動
	@docker compose down && docker compose build && docker compose up -d

help: ## このヘルプを表示
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2}'
