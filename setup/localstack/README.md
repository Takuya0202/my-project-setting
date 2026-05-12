# LocalStack セットアップ

## 概要

AWS のクラウドサービス（S3、DynamoDB、Lambda 等）をローカルで再現するために [LocalStack](https://github.com/localstack/localstack-cli) を使用する。
AWS CLI をローカルの LocalStack エンドポイントに向けることで、実際の AWS アカウントを使わずに開発・テストが行える。

## 対象OS

- macOS
- Linux (WSL2)

## 前提条件

LocalStack の実行には Docker が必要。以下のいずれかがインストール済みであること。

- macOS: [Docker Desktop](https://docs.docker.com/desktop/install/mac-install/)
- Linux (WSL2): [Docker Engine](https://docs.docker.com/engine/install/)

## 1. AWS CLI のインストール

公式ドキュメント: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

### macOS

```bash
brew install awscli
```

### Linux (WSL2)

アーキテクチャを確認する。

```bash
uname -m
# x86_64 または aarch64
```

任意のディレクトリで実行できるが、`/tmp` で行うとホームディレクトリを汚さずに済む。

```bash
cd /tmp
```

#### x86_64 の場合

```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf awscliv2.zip aws/
```

#### arm64 (aarch64) の場合

```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf awscliv2.zip aws/
```

確認:

```bash
aws --version
```

## 2. LocalStack CLI のインストール

GitHub Releases: https://github.com/localstack/localstack-cli/releases

### macOS

```bash
brew install localstack/tap/localstack-cli
```

### Linux (WSL2)

アーキテクチャを確認する（AWS CLI インストール時に確認済みであればスキップ）。

```bash
uname -m
# x86_64 または aarch64
```

GitHub Releases から最新バージョンを確認し、`VERSION` を置き換えて実行する。

#### x86_64 の場合

```bash
VERSION=2026.4.0
curl --location --output localstack-cli.tar.gz \
  "https://github.com/localstack/localstack-cli/releases/download/v${VERSION}/localstack-cli-${VERSION}-linux-amd64-onefile.tar.gz"
sudo tar xvzf localstack-cli.tar.gz -C /usr/local/bin
rm localstack-cli.tar.gz
```

#### arm64 (aarch64) の場合

```bash
VERSION=2026.4.0
curl --location --output localstack-cli.tar.gz \
  "https://github.com/localstack/localstack-cli/releases/download/v${VERSION}/localstack-cli-${VERSION}-linux-arm64-onefile.tar.gz"
sudo tar xvzf localstack-cli-2026.4.0-linux-*-onefile.tar.gz -C /usr/local/bin
rm localstack-cli.tar.gz
```

確認:

```bash
localstack --version
```

## 3. LocalStack の起動・停止

### 認証について

LocalStack はアカウント認証が必要。[app.localstack.cloud](https://app.localstack.cloud) で無料アカウントを作成し、Auth Token を取得する。

取得した Token を `.bashrc` または `.zshrc` に追記する。

```bash
export LOCALSTACK_AUTH_TOKEN=<AUTH_TOKEN>
```

追記後、ターミナルを再起動するか `source` で反映させる。

### 起動

```bash
localstack start
```

バックグラウンドで起動する場合:

```bash
localstack start -d
```

### 停止

```bash
localstack stop
```

起動後、`http://localhost:4566` が LocalStack のエンドポイントとなる。

## 4. AWS CLI の設定（LocalStack用プロファイル）

実際の AWS 環境と分離するため、LocalStack 専用のプロファイルを作成する。

### 認証情報の設定

`~/.aws/credentials` に以下を追記する（LocalStack はダミー値で動作する）。

```ini
[localstack]
aws_access_key_id = test
aws_secret_access_key = test
```

### エンドポイントの設定

`~/.aws/config` に以下を追記する。

```ini
[profile localstack]
region = ap-northeast-1
output = json
endpoint_url = http://localhost:4566
```

これにより `--profile localstack` を指定するだけで LocalStack に向けたリクエストが送れる。

## 5. awslocal のインストール（省力化ラッパー）

`awslocal` は `aws --endpoint-url=http://localhost:4566 --profile localstack` の省略形として動作するラッパーコマンド。

### macOS

```bash
brew install awscli-local
```

### Linux (WSL2)

```bash
brew install awscli-local
```

> Homebrew が未インストールの場合は [Homebrew on Linux](https://docs.brew.sh/Homebrew-on-Linux) を参照。

確認:

```bash
awslocal --version
```

## 動作確認

LocalStack が起動している状態で以下を実行する。

```bash
# S3 バケットを作成
awslocal s3 mb s3://test-bucket

# バケット一覧を確認
awslocal s3 ls
```

`test-bucket` が一覧に表示されれば成功。

`awslocal` を使わない場合は `--profile` を明示する。

```bash
aws --profile localstack s3 mb s3://test-bucket
aws --profile localstack s3 ls
```
