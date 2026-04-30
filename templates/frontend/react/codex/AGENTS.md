# React ベストプラクティスガイド

React（TypeScript）プロジェクトでコードを書く際は以下のルールに従うこと。

## コンポーネント

- 関数コンポーネントを使用する
- `FC`型は使わず、propsの型を直接引数に定義する

```tsx
// Good
type Props = { name: string }
function Greeting({ name }: Props) { ... }

// Bad
const Greeting: FC<{ name: string }> = ({ name }) => { ... }
```

## Hooks

- hooksはループ・条件分岐・ネストした関数の中で呼ばない
- カスタムフックは必ず`use`で始める名前にする
- `useEffect`の依存配列は省略しない
- 依存が不要なロジックはイベントハンドラやコールバックに移す

## パフォーマンス

- `useCallback`・`useMemo`は計算コストが高い場合や子コンポーネントへの参照渡しが必要な場合にのみ使う
- 不要な最適化は行わない

## State 管理

- stateは最小限に保つ。他の値から導出できるものはstateにしない
- 複数コンポーネントで共有するロジックはカスタムフック（`use〇〇.ts`）に切り出す
- コンポーネントのpropsは必要最小限にし、データの流れを一方向に保つ
