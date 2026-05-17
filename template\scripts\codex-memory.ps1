param(
  [Parameter(Mandatory = $true, Position = 0)]
  [ValidateSet('search', 'recent', 'new', 'index')]
  [string]$Command,

  [Parameter(Position = 1)]
  [string]$Query,

  [string]$Title,
  [ValidateSet('decision', 'preference', 'procedure', 'integration', 'agent', 'finding')]
  [string]$Type = 'decision',
  [string]$Tags = '',
  [string]$Summary = '',
  [string]$Details = ''
)

$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$memoryDir = Join-Path $root 'docs/memory'
$obsDir = Join-Path $memoryDir 'observations'
$indexPath = Join-Path $memoryDir 'index.md'

function Assert-MemoryDirs {
  New-Item -ItemType Directory -Force -Path $obsDir | Out-Null
}

function Convert-ToSlug([string]$text) {
  $slug = $text.ToLowerInvariant()
  $slug = $slug -replace '[^a-z0-9]+', '-'
  $slug = $slug.Trim('-')
  if ([string]::IsNullOrWhiteSpace($slug)) { return 'untitled' }
  return $slug
}

function Test-Sensitive([string]$text) {
  if ([string]::IsNullOrEmpty($text)) { return $false }
  return $text -match '(sk-[a-zA-Z0-9_-]{20,}|ghp_[a-zA-Z0-9]{20,}|AIza[0-9A-Za-z_-]{20,}|[a-f0-9]{64}|api[_-]?key\s*[:=]\s*\S+|token\s*[:=]\s*\S+|secret\s*[:=]\s*\S+|password\s*[:=]\s*\S+)'
}

function Search-Memory([string]$query) {
  if ([string]::IsNullOrWhiteSpace($query)) {
    throw 'Provide a search query.'
  }
  Get-ChildItem -Path $memoryDir -Recurse -File -Include *.md |
    Select-String -Pattern $query -SimpleMatch |
    Select-Object Path, LineNumber, Line |
    Format-Table -AutoSize
}

function Show-Recent {
  Get-ChildItem -Path $obsDir -File -Filter *.md |
    Sort-Object LastWriteTime -Descending |
    Select-Object -First 10 FullName, LastWriteTime |
    Format-Table -AutoSize
}

function Show-Index {
  Get-Content -Path $indexPath
}

function New-Observation {
  Assert-MemoryDirs

  if ([string]::IsNullOrWhiteSpace($Title)) {
    throw 'Provide -Title for a new observation.'
  }
  foreach ($field in @($Title, $Tags, $Summary, $Details)) {
    if (Test-Sensitive $field) {
      throw 'Possible secret detected. Refusing to write memory note.'
    }
  }

  $date = Get-Date -Format 'yyyy-MM-dd'
  $slug = Convert-ToSlug $Title
  $id = "$date-$slug"
  $file = Join-Path $obsDir "$id.md"
  if (Test-Path $file) {
    throw "Observation already exists: $file"
  }

  $safeSummary = if ($Summary) { $Summary } else { 'Resumen pendiente.' }
  $safeDetails = if ($Details) { "- $Details" } else { '- Detalles pendientes.' }

  $content = @"
# $Title

## Metadata

- ID: $id
- Date: $date
- Type: $Type
- Tags: $Tags
- Status: active

## Summary

$safeSummary

## Details

$safeDetails

## Related Files

- 

## Risks And Limits

- Revisar antes de reutilizar si cambia el proyecto.

## Review

- Review after:
"@

  Set-Content -Path $file -Value $content -Encoding UTF8

  $relative = "observations/$id.md"
  $row = "| $id | $date | $Type | $Tags | $Title | $relative |"
  Add-Content -Path $indexPath -Value $row -Encoding UTF8
  Write-Output "Created $file"
}

switch ($Command) {
  'search' { Search-Memory $Query }
  'recent' { Show-Recent }
  'index' { Show-Index }
  'new' { New-Observation }
}
