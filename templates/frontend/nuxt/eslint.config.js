// @nuxt/eslint モジュール（nuxi module add eslint）のインストールと
// nuxi prepare の実行後に有効になります
import withNuxt from './.nuxt/eslint.config.mjs'
import prettierConfig from 'eslint-config-prettier'

export default withNuxt(prettierConfig)
