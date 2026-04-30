---
description: "現在のブランチの変更をもとにPull Requestの説明文を作成する"
---

現在のブランチの変更をもとにPull Requestの説明文を作成する。

1. `git log main..HEAD --oneline` でコミット一覧を確認する
2. `git diff main...HEAD` で差分全体を把握する
3. 以下の形式でPR説明文を出力する:

## Summary
- （変更の概要を箇条書き）

## Changes
- （具体的な変更点を箇条書き）

## Test plan
- （確認すべきことを箇条書き）
