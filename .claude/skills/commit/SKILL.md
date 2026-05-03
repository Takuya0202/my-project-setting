---
description: "ステージされた変更をconventional commits形式でコミットする"
---

ステージされた変更を確認し、conventional commits形式でコミットを作成する。

1. `git diff --staged` で変更内容を確認する
2. 変更の種別（feat / fix / refactor / docs / chore 等）を判断する
3. コミットメッセージを英語で1行（最長72文字）で作成する
4. `git commit -m "..."` を実行する
