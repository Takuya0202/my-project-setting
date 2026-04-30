import { FlatCompat } from '@eslint/eslintrc'
import prettierConfig from 'eslint-config-prettier'

const compat = new FlatCompat({ baseDirectory: import.meta.dirname })

export default [
  { ignores: ['dist', '.next'] },
  ...compat.extends('next/core-web-vitals', 'next/typescript'),
  prettierConfig,
]
