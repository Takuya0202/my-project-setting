# Next.js ベストプラクティスガイド

Next.js（App Router + TypeScript）プロジェクトでコードを書く際は以下のルールに従うこと。

## Server Component / Client Component

- `app/` 内のコンポーネントはデフォルトでServer Component
- 状態管理・イベントハンドラ・ブラウザAPIが必要な場合のみ `'use client'` を追加する

## データフェッチ

- Server Component内で `async/await` を使って直接フェッチする
- クライアントサイドのフェッチが必要な場合はSWRまたはTanStack Queryを使う
- ミューテーションはServer Actionsで実装する（`'use server'` ディレクティブ）

## ルーティング・レイアウト

- `layout.tsx` で共通レイアウトを定義する
- `loading.tsx` / `error.tsx` でローディング・エラー状態を管理する
- 画像は `next/image`、リンクは `next/link` を使う

## メタデータ・環境変数

- ページのメタデータは `generateMetadata` 関数でエクスポートする
- 環境変数はサーバー側は `process.env.HOGE`、クライアント側は `NEXT_PUBLIC_` プレフィックスを付ける
