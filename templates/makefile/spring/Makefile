.PHONY: run watch dev build test clean help

# デフォルトでhelpを表示
.DEFAULT_GOAL := help

run: ## アプリを起動
	./gradlew bootRun

watch: ## ファイル変更を監視して自動コンパイル
	./gradlew -t classes

dev: ## 開発モード（runとwatchを並列実行）
	@make -j 2 run watch

build: ## ビルド
	./gradlew build

test: ## テスト実行
	./gradlew test

clean: ## ビルド成果物を削除
	./gradlew clean

help: ## このヘルプを表示
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2}'
