# my-project-setting

開発環境についてのメモ

## 概要

開発環境について統合できるようにしたり、自分自身がどうしているかをまとめる。

## 方針

基本的に個人の環境に依存するような設定はしないようにする。
e.g. : `settings.json`や`zshrc`,`bashrc`などの設定。

## frontend

### linter,eslint系

フォーマッター等に関しては`.vscode/settings.json`などプロジェクトごとに定義する。
別途prettierライブラリはインストールし、ciは実行する。

### node

nodeのバージョン管理には`nvm`と`direnv`を使用する。
各プロジェクトごとに`.nvmrc`と`envrc`を設定し、チームの開発環境を統合させる。
