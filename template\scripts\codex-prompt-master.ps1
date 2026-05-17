param(
  [Parameter(Mandatory = $true, Position = 0)]
  [ValidateSet('route', 'checklist', 'policy')]
  [string]$Command,

  [Parameter(Position = 1)]
  [string]$Query
)

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$workspace = Split-Path -Parent $root

function Add-Route($kind, $name, $why) {
  [PSCustomObject]@{ Kind = $kind; Name = $name; Why = $why }
}

function Route-Prompt([string]$query) {
  if ([string]::IsNullOrWhiteSpace($query)) {
    Get-Content (Join-Path $workspace 'docs/prompt-master/routing.md')
    return
  }

  $q = $query.ToLowerInvariant()
  $routes = @()
  $routes += Add-Route 'profile' 'prompt-engineer' 'La tarea trata de crear o mejorar un prompt.'

  if ($q -match 'codex|claude code|devin|cline|agent|agente') {
    $routes += Add-Route 'template' 'agentic-codex' 'Herramienta agentica: requiere scope, stop conditions y verificacion.'
  }
  if ($q -match 'cursor|windsurf|copilot') {
    $routes += Add-Route 'template' 'file-scope' 'IA de edicion de codigo: necesita path, funcion y do-not-touch.'
  }
  if ($q -match '\bn8n\b|zapier|make|workflow|automatizacion|automatización') {
    $routes += Add-Route 'template' 'workflow-automation' 'Automatizacion: trigger, acciones, field mapping y auth assumptions.'
  }
  if ($q -match 'midjourney|dall-e|stable diffusion|comfyui|sora|runway|imagen|video') {
    $routes += Add-Route 'template' 'visual-descriptor' 'Generacion visual: descriptors, parametros y negativos.'
  }
  if ($q -match 'arregla|corrige|mejora|fix|rewrite|decompile|adapta') {
    $routes += Add-Route 'template' 'prompt-repair' 'Prompt existente: diagnosticar patrones que desperdician tokens.'
  }
  if ($routes.Count -eq 1) {
    $routes += Add-Route 'template' 'simple' 'Ruta minima: role, task, format, constraints.'
  }

  $routes | Format-Table -AutoSize
}

function Show-Checklist {
  Get-Content (Join-Path $workspace 'docs/prompt-master/patterns-lite.md')
}

function Show-Policy {
  Get-Content (Join-Path $workspace 'prompt-master/codex/PROMPT_MASTER_POLICY.md')
}

switch ($Command) {
  'route' { Route-Prompt $Query }
  'checklist' { Show-Checklist }
  'policy' { Show-Policy }
}
