# Ghostty セットアップ

## 概要

高速でネイティブなターミナルエミュレーター [Ghostty](https://ghostty.org/) のインストールと設定手順をまとめる。
設定ファイル（`config`）はウィンドウのパディング、背景の透過・ぼかし、ペイン分割のキーバインドを定義している。

## 対象OS

- macOS

## 1. インストール

### Homebrew（推奨）

```bash
brew install --cask ghostty
```

インストール後、アプリケーションフォルダに Ghostty が追加される。

### 公式サイト

[https://ghostty.org/download](https://ghostty.org/download) からDMGをダウンロードしてインストールすることもできる。

## 2. 設定ファイルの配置

Ghostty の設定ファイルは `~/.config/ghostty/config` に配置する。

```bash
mkdir -p ~/.config/ghostty
cp config ~/.config/ghostty/config
```

既に設定ファイルが存在する場合は、内容をマージして使用すること。

## 3. 設定内容

### ウィンドウ

| 設定キー                | 値     | 説明                                       |
| ----------------------- | ------ | ------------------------------------------ |
| `window-padding-x`      | `10`   | 左右のパディング（px）                     |
| `window-padding-y`      | `10`   | 上下のパディング（px）                     |
| `window-padding-balance`| `true` | パディングをウィンドウ全体で均等に適用する |

### 背景

| 設定キー                 | 値     | 説明                       |
| ------------------------ | ------ | -------------------------- |
| `background-opacity`     | `0.65` | 背景の不透明度（0.0〜1.0） |
| `background-blur-radius` | `15`   | 背景ぼかしの強度           |

背景の透過・ぼかしはmacOSのシステム設定で「透明度を下げる」が有効になっている場合、効果が制限されることがある。

### キーバインド

| キー                  | アクション          | 説明                       |
| --------------------- | ------------------- | -------------------------- |
| `cmd+shift+enter`     | `new_split:right`   | 右に縦分割でペインを追加   |
| `cmd+enter`           | `new_split:down`    | 下に横分割でペインを追加   |
| `cmd+w`               | `close_surface`     | 現在のペイン／タブを閉じる |

## 4. 動作確認

Ghostty を起動し、以下を確認する。

- ウィンドウに適切なパディングがある
- 背景が半透明でぼかし効果が適用されている
- `cmd+shift+enter` で右にペインが分割される
- `cmd+enter` で下にペインが分割される
- `cmd+w` でペインが閉じる
