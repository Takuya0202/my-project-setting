# Codex向け汎用ルール・スキルのインストールスクリプト（PowerShell版）
#
# 使い方:
#   iwr -useb https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent/install-codex.ps1 | iex
#   & ([scriptblock]::Create((iwr -useb https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent/install-codex.ps1).Content)) -Force
#
# 概要:
#   プロジェクトルートに AGENTS.md を、.agents/skills/ 以下にスキルを配置する。
#   .codex/rules/ に実行権限ルール（Starlark形式）を配置する。
#   既にファイルが存在する場合はスキップする（-Force で上書き）。

param(
    [switch]$Force
)

$ErrorActionPreference = 'Stop'

$BaseUrl = 'https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent'

$script:installed = 0
$script:skipped = 0

function Install-File {
    param(
        [Parameter(Mandatory = $true)][string]$Src,
        [Parameter(Mandatory = $true)][string]$Dest
    )
    if ((Test-Path -LiteralPath $Dest) -and -not $Force) {
        Write-Host "[skip] $Dest (already exists)"
        $script:skipped++
    }
    else {
        $dir = Split-Path -Parent $Dest
        if ($dir) {
            New-Item -ItemType Directory -Path $dir -Force | Out-Null
        }
        Invoke-WebRequest -Uri "$BaseUrl/$Src" -OutFile $Dest -UseBasicParsing
        Write-Host "[created] $Dest"
        $script:installed++
    }
}

Install-File 'codex/AGENTS.md'                'AGENTS.md'
Install-File '.agents/skills/commit/SKILL.md' '.agents/skills/commit/SKILL.md'
Install-File '.agents/skills/pr/SKILL.md'     '.agents/skills/pr/SKILL.md'
Install-File '.codex/rules/default.rules'     '.codex/rules/default.rules'

Write-Host ''
Write-Host "Done: $($script:installed) installed, $($script:skipped) skipped"
