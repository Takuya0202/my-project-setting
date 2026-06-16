# Claude Code向け汎用ルール・スキル・設定のインストールスクリプト（PowerShell版）
#
# 使い方:
#   iwr -useb https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent/install-claude.ps1 | iex
#   & ([scriptblock]::Create((iwr -useb https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent/install-claude.ps1).Content)) -Force
#
# 概要:
#   プロジェクトの .claude/rules/ に汎用ルールファイル（.md）を配置する。
#   プロジェクトの .claude/skills/ に汎用スキルファイル（SKILL.md）を配置する。
#   プロジェクトの .claude/settings.json に権限設定を配置する。
#   既に同名ファイルが存在する場合はスキップする（-Force で上書き）。

param(
    [switch]$Force
)

$ErrorActionPreference = 'Stop'

$BaseUrl = 'https://raw.githubusercontent.com/Takuya0202/my-project-setting/main/templates/agent'
$RulesDir = '.claude/rules'

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

foreach ($file in 'coding.md', 'git.md', 'security.md', 'commands.md') {
    Install-File "$BaseUrl/.claude/rules/$file" "$RulesDir/$file"
}

foreach ($skill in 'commit', 'pr') {
    Install-File "$BaseUrl/.claude/skills/$skill/SKILL.md" ".claude/skills/$skill/SKILL.md"
}

Install-File "$BaseUrl/.claude/settings.json" '.claude/settings.json'

Write-Host ''
Write-Host "Done: $($script:installed) installed, $($script:skipped) skipped"
