---
description: "Nuxt 3のベストプラクティスに沿ったコードを書く"
---

Nuxt 3（TypeScript）のベストプラクティスに従ってコードを書く。

1. コンポーネント・composables・utilsはauto-importされるため、明示的なimport文は不要
2. データフェッチには `useFetch()` または `useAsyncData()` を使う。クライアントサイドのみのフェッチには `$fetch()` を使う
3. サーバー処理は `server/api/` または `server/routes/` に配置する（Nitroで動作）
4. ページのメタデータは `useSeoMeta()` または `useHead()` で設定する
5. プラグインは `plugins/` に配置し、`.client.ts` / `.server.ts` サフィックスで実行環境を指定する
6. ミドルウェアは `middleware/` に配置し、`defineNuxtRouteMiddleware()` で定義する
7. 環境変数はサーバー側は `useRuntimeConfig().secret`、クライアント側は `useRuntimeConfig().public.key` でアクセスする
