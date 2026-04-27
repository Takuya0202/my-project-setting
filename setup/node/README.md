# Node.js 環境セットアップ

## 概要

Node.js のバージョン管理に `nvm` を、ディレクトリ単位での自動切り替えに `direnv` を使用する。
`.nvmrc` と `.envrc` をプロジェクトに配置することで、`cd` するだけで適切な Node.js バージョンに切り替わる環境を構築する。

## 対象OS

- macOS
- Linux (WSL2)

## 1. nvm のインストール

nvm の公式インストールスクリプトを使用する（macOS / Linux 共通）。

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
```

インストール後、ターミナルを再起動するか以下を実行して nvm を読み込む。

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
```

確認:

```bash
nvm --version
```

## 2. direnv のインストール

### macOS

```bash
brew install direnv
```

### Linux (WSL2)

```bash
sudo apt update && sudo apt install -y direnv
```

## 3. direnv のシェルフック設定

使用しているシェルに応じて以下を実行し、フック設定を追記する。

### bash

```bash
echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
```

### zsh

```bash
echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc
```

追記後、ターミナルを再起動するか `source` で反映させる。

確認:

```bash
direnv --version
```

## 4. プロジェクトでの使い方

### .nvmrc の作成

プロジェクトルートで使用する Node.js バージョンを指定する。

```bash
node -v > .nvmrc
```

### .envrc の作成

プロジェクトルートに `.envrc` を作成し、以下を記述する。

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

if [ -f .nvmrc ]; then
  nvm install
  nvm use
fi
```

direnv は独自のサブシェルで `.envrc` を実行するため、シェル関数である `nvm` はそのままでは使えない。
先頭で nvm を明示的にロードする必要がある。

`nvm install` により、`.nvmrc` に指定されたバージョンが未インストールの場合は自動的にインストールされる。
既にインストール済みの場合は何もせず、`nvm use` で切り替える。

### direnv の許可

`.envrc` を作成・変更した後は、direnv に許可を与える必要がある。

```bash
direnv allow
```

これにより、当該ディレクトリに `cd` した際に `.envrc` が自動実行され、Node.js バージョンが切り替わる。

## 5. 動作確認

セットアップが正しく機能しているかを確認する。

### 確認用ディレクトリの作成

```bash
mkdir /tmp/nvm-test && cd /tmp/nvm-test
```

### .nvmrc と .envrc を配置

```bash
echo "20" > .nvmrc
cat <<'EOF' > .envrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

if [ -f .nvmrc ]; then
  nvm install
  nvm use
fi
EOF
direnv allow
```

### 動作確認

ディレクトリに入り直して、自動切り替えが動作するか確認する。

```bash
cd /tmp/nvm-test
node -v
```

`.nvmrc` に指定したバージョンが表示されれば成功。

### 確認後の後片付け

```bash
rm -rf /tmp/nvm-test
```
