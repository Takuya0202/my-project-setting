# Nuxt 3 ベストプラクティスガイド

Nuxt 3（TypeScript）プロジェクトでコードを書く際は以下のルールに従うこと。

## Auto-import

- コンポーネント・composables・utilsはauto-importされるため、明示的なimport文は不要

## データフェッチ

- `useFetch()` または `useAsyncData()` でSSRに対応したデータフェッチを行う
- クライアントサイドのみのフェッチには `$fetch()` を使う

## サーバー処理

- サーバー処理は `server/api/` または `server/routes/` に配置する（Nitroで動作）

## ページ設定・環境変数

- ページのメタデータは `useSeoMeta()` または `useHead()` で設定する
- 環境変数はサーバー側は `useRuntimeConfig().secret`、クライアント側は `useRuntimeConfig().public.key` でアクセスする

## プラグイン・ミドルウェア

- プラグインは `plugins/` に配置し、`.client.ts` / `.server.ts` で実行環境を指定する
- ミドルウェアは `middleware/` に配置し、`defineNuxtRouteMiddleware()` で定義する
