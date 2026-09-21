[CmdletBinding()]
param(
    [string[]]$Images,
    [string]$Gender,
    [string]$DominantHand,
    [string]$ReadingMode,
    [switch]$DryRun
)

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
$skillFile = Join-Path $repoRoot '.agents\skills\palm-reading-guide\SKILL.md'

if (-not (Test-Path -LiteralPath $skillFile)) {
    throw "Skill file not found: $skillFile"
}

function Select-PalmImages {
    Add-Type -AssemblyName System.Windows.Forms

    $dialog = New-Object System.Windows.Forms.OpenFileDialog
    $dialog.Title = 'Select one or two palm photos'
    $dialog.Filter = 'Image files|*.jpg;*.jpeg;*.png;*.webp;*.bmp|All files|*.*'
    $dialog.Multiselect = $true
    $dialog.CheckFileExists = $true

    if ($dialog.ShowDialog() -ne [System.Windows.Forms.DialogResult]::OK) {
        return @()
    }

    return @($dialog.FileNames)
}

function Read-Choice {
    param(
        [Parameter(Mandatory = $true)][string]$Title,
        [Parameter(Mandatory = $true)][hashtable]$Options,
        [Parameter(Mandatory = $true)][string]$DefaultKey
    )

    Write-Host ''
    Write-Host $Title -ForegroundColor Cyan
    foreach ($key in ($Options.Keys | Sort-Object)) {
        Write-Host "  [$key] $($Options[$key])"
    }

    $answer = Read-Host "Enter a choice (default: $DefaultKey)"
    if ([string]::IsNullOrWhiteSpace($answer)) {
        $answer = $DefaultKey
    }

    if (-not $Options.ContainsKey($answer)) {
        Write-Warning "Unknown choice. Using default: $($Options[$DefaultKey])"
        return $Options[$DefaultKey]
    }

    return $Options[$answer]
}

if (-not $Images -or $Images.Count -eq 0) {
    if ($DryRun) {
        throw 'DryRun requires at least one image passed through -Images.'
    }
    $Images = Select-PalmImages
}

if (-not $Images -or $Images.Count -eq 0) {
    Write-Host 'Cancelled. No image was selected.'
    exit 0
}

foreach ($image in $Images) {
    if (-not (Test-Path -LiteralPath $image -PathType Leaf)) {
        throw "Image not found: $image"
    }
}

if ([string]::IsNullOrWhiteSpace($Gender)) {
    $Gender = Read-Choice -Title 'Gender profile' -DefaultKey '4' -Options @{
        '1' = 'male'
        '2' = 'female'
        '3' = 'non-binary or another identity'
        '4' = 'prefer not to say'
    }
}

if ([string]::IsNullOrWhiteSpace($DominantHand)) {
    $DominantHand = Read-Choice -Title 'Dominant hand' -DefaultKey '2' -Options @{
        '1' = 'left'
        '2' = 'right'
        '3' = 'ambidextrous'
        '4' = 'unsure'
    }
}

if ([string]::IsNullOrWhiteSpace($ReadingMode)) {
    $ReadingMode = Read-Choice -Title 'Reading mode' -DefaultKey '1' -Options @{
        '1' = 'modern (dominant-hand first)'
        '2' = 'traditional-gendered (male-left / female-right)'
    }
}

$promptTemplate = @'
Use $palm-reading-guide to create a complete palm-reading guide in Simplified Chinese.

User profile:
- Gender profile: {0}
- Dominant hand: {1}
- Reading mode: {2}
- Attached photo count: {3}

First check photo quality and identify left versus right hand. If the hand cannot be identified reliably, ask instead of guessing.
Then follow the Skill requirements:
1. Separate visible observations from traditional symbolic interpretations.
2. Analyze the heart, head, life, and fate lines only where clearly visible.
3. Compare both hands, hand shape, fingers, and mounts when the photos support it.
4. Mark each section with high, medium, or low confidence.
5. Generate a minimal black-on-white contour artwork of the main palm lines.
6. End with an integrated theme and three reflection questions.
7. Keep the cultural-entertainment disclaimer and do not predict lifespan, disease, marriage, fertility, wealth, or inevitable events.
'@

$prompt = $promptTemplate -f $Gender, $DominantHand, $ReadingMode, $Images.Count
$codexArgs = @('-C', $repoRoot)
foreach ($image in $Images) {
    $codexArgs += @('-i', (Resolve-Path -LiteralPath $image).Path)
}
$codexArgs += $prompt

if ($DryRun) {
    [PSCustomObject]@{
        RepoRoot = $repoRoot
        SkillFile = $skillFile
        Images = @($Images)
        Gender = $Gender
        DominantHand = $DominantHand
        ReadingMode = $ReadingMode
        PromptContainsSkillInvocation = $prompt.Contains('$palm-reading-guide')
        CodexArguments = @($codexArgs)
    } | ConvertTo-Json -Depth 5
    exit 0
}

$codexCommand = Get-Command codex -ErrorAction SilentlyContinue
if (-not $codexCommand) {
    Write-Host 'The codex command was not found. Install and sign in to Codex CLI first.' -ForegroundColor Yellow
    Write-Host 'Official docs: https://learn.chatgpt.com/docs/codex/cli'
    exit 1
}

Write-Host ''
Write-Host 'Launching the Codex palm-reading guide...' -ForegroundColor Cyan
& $codexCommand.Source @codexArgs
exit $LASTEXITCODE
