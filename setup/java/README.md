# Java 環境セットアップ

## 概要

Java のバージョン管理に `jenv` を使用する。
複数バージョンの OpenJDK をインストールし、グローバルまたはプロジェクト単位で切り替えられる環境を構築する。

## 対象OS

- macOS
- Linux (WSL2)

## 1. jenv のインストール

### macOS

```bash
brew install jenv
```

### Linux (WSL2)

```bash
git clone https://github.com/jenv/jenv.git ~/.jenv
```

## 2. シェルへの jenv 設定

使用しているシェルに応じて以下を実行し、設定を追記する。

### bash

```bash
echo '' >> ~/.bashrc
echo '# jenv の設定' >> ~/.bashrc
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(jenv init -)"' >> ~/.bashrc
```

### zsh

```bash
echo '' >> ~/.zshrc
echo '# jenv の設定' >> ~/.zshrc
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(jenv init -)"' >> ~/.zshrc
```

追記後、ターミナルを再起動するか `source` で反映させる。

確認:

```bash
jenv --version
```

## 3. OpenJDK のインストール

対象バージョン: Java 21（LTS）、Java 25（最新）

### macOS

```bash
brew install openjdk@21
brew install openjdk@25
```

### Linux (WSL2)

```bash
sudo apt update
sudo apt install -y openjdk-21-jdk openjdk-25-jdk
```

## 4. jenv へ JDK を登録する

インストールした JDK を jenv に登録する。

### macOS (Apple Silicon)

```bash
jenv add /opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home
jenv add /opt/homebrew/opt/openjdk@25/libexec/openjdk.jdk/Contents/Home
```

### macOS (Intel)

```bash
jenv add /usr/local/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home
jenv add /usr/local/opt/openjdk@25/libexec/openjdk.jdk/Contents/Home
```

### Linux (WSL2)

```bash
jenv add /usr/lib/jvm/java-21-openjdk-amd64
jenv add /usr/lib/jvm/java-25-openjdk-amd64
```

登録確認:

```bash
jenv versions
```

## 5. デフォルトバージョンの設定

グローバルで使用するバージョンを指定する。

```bash
jenv global 21
```

プロジェクト単位で切り替える場合はプロジェクトルートで以下を実行する。`.java-version` ファイルが生成され、そのディレクトリ配下で指定バージョンが使われる。

```bash
jenv local 25
```

## 6. JAVA_HOME の自動設定

Maven や Gradle など `JAVA_HOME` を参照するツールのために、export プラグインを有効にする。
これにより `jenv global/local` でバージョンを切り替えると `JAVA_HOME` も自動で更新される。

```bash
jenv enable-plugin export
```

## 7. 動作確認

```bash
java -version
jenv versions
echo $JAVA_HOME
```

`java -version` に設定したバージョンが表示され、`$JAVA_HOME` が対応するパスを指していれば成功。
