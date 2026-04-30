# Vue 3 ベストプラクティスガイド

Vue 3（TypeScript + Composition API）プロジェクトでコードを書く際は以下のルールに従うこと。

## コンポーネント

- SFCでは `<script setup>` を使う（Options APIは使わない）
- propsは `defineProps<{ ... }>()` でTypeScriptの型として定義する
- emitsは `defineEmits<{ ... }>()` で定義する

```vue
<script setup lang="ts">
const props = defineProps<{ title: string }>()
const emit = defineEmits<{ close: [] }>()
</script>
```

## リアクティビティ

- プリミティブ値には `ref()`、オブジェクト・配列には `reactive()` を使う
- `computed()` を積極的に使い、テンプレート内のロジックを最小限にする

## ロジック共有・状態管理

- 複数コンポーネントで共有するロジックは `use〇〇()` composableに切り出す（`composables/` ディレクトリに配置）
- グローバル状態管理にはPiniaを使う。`defineStore()` でストアを定義する
