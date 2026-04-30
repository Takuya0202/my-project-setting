import js from '@eslint/js'
import globals from 'globals'
import react from 'eslint-plugin-react'
import reactHooks from 'eslint-plugin-react-hooks'
import tseslint from 'typescript-eslint'
import prettierConfig from 'eslint-config-prettier'

export default tseslint.config(
  { ignores: ['dist', 'build'] },
  js.configs.recommended,
  ...tseslint.configs.recommended,
  {
    files: ['**/*.{ts,tsx,jsx}'],
    ...react.configs.flat.recommended,
  },
  {
    files: ['**/*.{ts,tsx,jsx}'],
    ...react.configs.flat['jsx-runtime'],
  },
  reactHooks.configs['recommended-latest'],
  {
    languageOptions: {
      ecmaVersion: 'latest',
      globals: { ...globals.browser },
    },
    settings: { react: { version: 'detect' } },
  },
  prettierConfig,
)
