# Cursor向け汎用ルール・スキルのインストールスクリプト（PowerShell版）
#
# 使い方:
#   iwr -useb https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent/install-cursor.ps1 | iex
#   & ([scriptblock]::Create((iwr -useb https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent/install-cursor.ps1).Content)) -Force
#
# 概要:
#   プロジェクトの .cursor/rules/ に汎用ルールファイル（.mdc）を配置する。
#   プロジェクトの .cursor/skills/ に汎用スキルファイル（SKILL.md）を配置する。
#   プロジェクトの .cursor/cli.json に権限設定を配置する。
#   既に同名ファイルが存在する場合はスキップする（-Force で上書き）。

param(
    [switch]$Force
)

$ErrorActionPreference = 'Stop'

$BaseUrl = 'https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent'
$RulesDir = '.cursor/rules'

New-Item -ItemType Directory -Path $RulesDir -Force | Out-Null

$script:installed = 0
$script:skipped = 0

function Install-File {
    param(
        [Parameter(Mandatory = $true)][string]$Src,
        [Parameter(Mandatory = $true)][string]$Dest
    )
    $dir = Split-Path -Parent $Dest
    if ($dir) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }
    if ((Test-Path -LiteralPath $Dest) -and -not $Force) {
        Write-Host "[skip] $Dest (already exists)"
        $script:skipped++
    }
    else {
        Invoke-WebRequest -Uri $Src -OutFile $Dest -UseBasicParsing
        Write-Host "[created] $Dest"
        $script:installed++
    }
}

foreach ($file in 'coding.mdc', 'git.mdc', 'security.mdc', 'commands.mdc') {
    Install-File "$BaseUrl/.cursor/rules/$file" "$RulesDir/$file"
}

foreach ($skill in 'commit', 'pr') {
    Install-File "$BaseUrl/.cursor/skills/$skill/SKILL.md" ".cursor/skills/$skill/SKILL.md"
}

Install-File "$BaseUrl/.cursor/cli.json" '.cursor/cli.json'

Write-Host ''
Write-Host "Done: $($script:installed) installed, $($script:skipped) skipped"
