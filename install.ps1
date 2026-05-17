param(
  [string]$TargetPath = (Get-Location).Path,
  [switch]$DryRun,
  [switch]$Force
)

$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$templateRoot = Join-Path $repoRoot 'template'

if (-not (Test-Path $templateRoot)) {
  throw "Template folder not found: $templateRoot"
}

$resolvedTarget = [System.IO.Path]::GetFullPath($TargetPath)
$resolvedTemplate = [System.IO.Path]::GetFullPath($templateRoot)

Write-Output "Codex Starter Kit installer"
Write-Output "Template: $resolvedTemplate"
Write-Output "Target:   $resolvedTarget"
if ($DryRun) { Write-Output "Mode:     dry-run" }

if (-not (Test-Path $resolvedTarget)) {
  if ($DryRun) {
    Write-Output "Would create target directory: $resolvedTarget"
  } else {
    New-Item -ItemType Directory -Force -Path $resolvedTarget | Out-Null
  }
}

$timestamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$installed = @()
$backedUp = @()
$skipped = @()

function Get-RelativePathCompat {
  param(
    [string]$BasePath,
    [string]$FullPath
  )
  $base = [System.IO.Path]::GetFullPath($BasePath).TrimEnd([System.IO.Path]::DirectorySeparatorChar, [System.IO.Path]::AltDirectorySeparatorChar)
  $full = [System.IO.Path]::GetFullPath($FullPath)
  if (-not $full.StartsWith($base, [System.StringComparison]::OrdinalIgnoreCase)) {
    throw "Path is outside template root: $FullPath"
  }
  return $full.Substring($base.Length).TrimStart([System.IO.Path]::DirectorySeparatorChar, [System.IO.Path]::AltDirectorySeparatorChar)
}

Get-ChildItem -Path $templateRoot -Recurse -File | ForEach-Object {
  $relative = Get-RelativePathCompat -BasePath $templateRoot -FullPath $_.FullName
  $destination = Join-Path $resolvedTarget $relative
  $destinationDir = Split-Path -Parent $destination

  if (Test-Path $destination) {
    if (-not $Force) {
      $backup = "$destination.bak-$timestamp"
      if ($DryRun) {
        Write-Output "Would backup: $destination -> $backup"
        Write-Output "Would copy:   $relative"
      } else {
        New-Item -ItemType Directory -Force -Path $destinationDir | Out-Null
        Copy-Item -Path $destination -Destination $backup -Force
        Copy-Item -Path $_.FullName -Destination $destination -Force
      }
      $backedUp += $relative
      $installed += $relative
    } else {
      if ($DryRun) {
        Write-Output "Would overwrite: $relative"
      } else {
        New-Item -ItemType Directory -Force -Path $destinationDir | Out-Null
        Copy-Item -Path $_.FullName -Destination $destination -Force
      }
      $installed += $relative
    }
  } else {
    if ($DryRun) {
      Write-Output "Would copy:   $relative"
    } else {
      New-Item -ItemType Directory -Force -Path $destinationDir | Out-Null
      Copy-Item -Path $_.FullName -Destination $destination -Force
    }
    $installed += $relative
  }
}

Write-Output ""
Write-Output "Installed files: $($installed.Count)"
if ($backedUp.Count -gt 0) { Write-Output "Backups created: $($backedUp.Count)" }
if ($skipped.Count -gt 0) { Write-Output "Skipped files:   $($skipped.Count)" }

Write-Output ""
Write-Output "Next steps:"
Write-Output "1. Review AGENTS.md in your target project."
Write-Output "2. Copy .env.example to your secret manager or local environment setup, not to git."
Write-Output "3. Run .\scripts\codex-superpowers.ps1 route `"your task`" to test routing."
