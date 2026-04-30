---
description: "Next.js App Routerのベストプラクティスに沿ったコードを書く"
---

Next.js（App Router + TypeScript）のベストプラクティスに従ってコードを書く。

1. `app/` 内のコンポーネントはデフォルトでServer Component。クライアント側の処理（状態管理・イベントハンドラ・ブラウザAPIなど）が必要な場合のみ `'use client'` を追加する
2. データフェッチはServer Component内で `async/await` を使って直接行う。クライアントサイドのフェッチが必要な場合はSWRまたはTanStack Queryを使う
3. ミューテーションはServer Actionsで実装する（`'use server'` ディレクティブ）
4. ページのメタデータは `generateMetadata` 関数でエクスポートする
5. 画像は `next/image`、リンクは `next/link` を使う
6. `layout.tsx` で共通レイアウトを定義し、`loading.tsx` / `error.tsx` でローディング・エラー状態を管理する
7. 環境変数はサーバー側は `process.env.HOGE`、クライアント側は `NEXT_PUBLIC_` プレフィックスを付ける
