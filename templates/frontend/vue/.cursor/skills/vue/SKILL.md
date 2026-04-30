---
description: "Vue 3 Composition APIのベストプラクティスに沿ったコードを書く"
---

Vue 3（TypeScript + Composition API）のベストプラクティスに従ってコードを書く。

1. SFCでは `<script setup>` を使う（Options APIは使わない）
2. プリミティブ値には `ref()`、オブジェクト・配列には `reactive()` を使う。テンプレート内では `.value` は不要
3. propsは `defineProps<{ ... }>()` でTypeScriptの型として定義する
4. emitsは `defineEmits<{ ... }>()` で定義する
5. 複数コンポーネントで共有するロジックは `use〇〇()` composableに切り出す（`composables/` ディレクトリに配置）
6. グローバル状態管理にはPiniaを使う。`defineStore()` でストアを定義する
7. `computed()` を積極的に使い、テンプレート内のロジックを最小限にする
