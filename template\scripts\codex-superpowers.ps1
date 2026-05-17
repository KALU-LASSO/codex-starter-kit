param(
  [Parameter(Mandatory = $true, Position = 0)]
  [ValidateSet('list', 'route', 'checklist')]
  [string]$Command,

  [Parameter(Position = 1)]
  [string]$Query
)

$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$skillsDir = Join-Path $root 'docs/superpowers/skills'
$routingPath = Join-Path $root 'docs/superpowers/routing.md'

function Show-List {
  Get-ChildItem -Path $skillsDir -File -Filter *.md |
    Sort-Object BaseName |
    ForEach-Object {
      $title = (Get-Content $_.FullName -TotalCount 1) -replace '^#\s*', ''
      [PSCustomObject]@{ Skill = $_.BaseName; Title = $title; Path = $_.FullName }
    } |
    Format-Table -AutoSize
}

function Show-Checklist([string]$name) {
  if ([string]::IsNullOrWhiteSpace($name)) {
    throw 'Provide a checklist name, for example: verification'
  }
  $matches = Get-ChildItem -Path $skillsDir -File -Filter *.md |
    Where-Object { $_.BaseName -like "*$name*" }
  if (-not $matches) {
    throw "No checklist found for '$name'. Run: .\scripts\codex-superpowers.ps1 list"
  }
  foreach ($match in $matches) {
    Get-Content -Path $match.FullName
  }
}

function Get-Route([string]$query) {
  if ([string]::IsNullOrWhiteSpace($query)) {
    Get-Content -Path $routingPath
    return
  }

  $q = $query.ToLowerInvariant()
  $routes = New-Object System.Collections.Generic.List[object]

  if ($q -match 'bug|fallo|error|test fail|falla|roto|debug|unexpected|inesperado') {
    $routes.Add([PSCustomObject]@{ Kind = 'flow'; Name = 'systematic-debugging-lite'; Why = 'Hay fallo o comportamiento inesperado.' })
    $routes.Add([PSCustomObject]@{ Kind = 'flow'; Name = 'verification'; Why = 'Hay que demostrar que el fallo original queda resuelto.' })
  }
  if ($q -match 'feature|funcion|implementar|cambio de comportamiento|logica|refactor') {
    $routes.Add([PSCustomObject]@{ Kind = 'flow'; Name = 'test-driven-development-lite'; Why = 'Cambio de comportamiento o logica.' })
  }
  if ($q -match 'plan|grande|varios pasos|arquitectura|migracion|roadmap') {
    $routes.Add([PSCustomObject]@{ Kind = 'flow'; Name = 'writing-plans-lite'; Why = 'Trabajo multi-paso o con riesgo.' })
    $routes.Add([PSCustomObject]@{ Kind = 'profile'; Name = 'planner'; Why = 'Planificacion tecnica por fases.' })
  }
  if ($q -match 'diseño|diseno|idea|brainstorm|nuevo producto|landing|\bux\b|\bui\b') {
    $routes.Add([PSCustomObject]@{ Kind = 'flow'; Name = 'brainstorming-lite'; Why = 'Hay decisiones de diseno o alcance.' })
  }
  if ($q -match 'paralelo|subagente|agentes|varias areas|independiente') {
    $routes.Add([PSCustomObject]@{ Kind = 'flow'; Name = 'parallel-agents-lite'; Why = 'Posible division por dominios independientes.' })
  }
  if ($q -match 'terminado|listo|verifica|comprueba|qa|revision|review') {
    $routes.Add([PSCustomObject]@{ Kind = 'flow'; Name = 'verification'; Why = 'Se necesita evidencia fresca.' })
    $routes.Add([PSCustomObject]@{ Kind = 'flow'; Name = 'code-review-lite'; Why = 'Revision antes de cierre o merge.' })
  }
  if ($q -match 'wordpress|cms|woocommerce|drupal|plugin|tema|theme') {
    $routes.Add([PSCustomObject]@{ Kind = 'profile'; Name = 'cms-developer'; Why = 'Trabajo de CMS o WordPress.' })
  }
  if ($q -match 'arquitectura|architecture|sistema|escalabilidad|api|integracion|integración|modelo de datos') {
    $routes.Add([PSCustomObject]@{ Kind = 'profile'; Name = 'architect'; Why = 'Decision estructural o de integracion.' })
  }
  if ($q -match 'tdd|prueba primero|test primero|regresion|regresión|comportamiento') {
    $routes.Add([PSCustomObject]@{ Kind = 'profile'; Name = 'tdd-guide'; Why = 'Cambio de comportamiento con pruebas.' })
  }
  if ($q -match 'review|revision|revisión|\bpr\b|merge|diff|calidad') {
    $routes.Add([PSCustomObject]@{ Kind = 'profile'; Name = 'code-reviewer'; Why = 'Revision de calidad y regresiones.' })
  }
  if ($q -match 'seguridad|security|secreto|secret|token|permiso|inyeccion|inyección|vulnerabilidad|mcp|hook') {
    $routes.Add([PSCustomObject]@{ Kind = 'profile'; Name = 'security-reviewer'; Why = 'Riesgo de seguridad o permisos.' })
  }
  if ($q -match '\bbuild\b|compila|compilacion|compilación|\bci\b|\btypescript\b|\btsc\b|\blint\b|dependencia|\bpytest\b|\bcargo\b') {
    $routes.Add([PSCustomObject]@{ Kind = 'profile'; Name = 'build-error-resolver'; Why = 'Errores de build, tipos o CI.' })
  }
  if ($q -match 'e2e|playwright|navegador|flujo critico|flujo crítico|login|checkout|formulario') {
    $routes.Add([PSCustomObject]@{ Kind = 'profile'; Name = 'e2e-runner'; Why = 'Validacion de flujo de usuario.' })
  }
  if ($q -match 'refactor|limpiar|deuda|codigo muerto|código muerto|duplicacion|duplicación') {
    $routes.Add([PSCustomObject]@{ Kind = 'profile'; Name = 'refactor-cleaner'; Why = 'Simplificacion sin cambiar comportamiento.' })
  }
  if ($q -match 'documenta|documentacion|documentación|readme|runbook|memoria') {
    $routes.Add([PSCustomObject]@{ Kind = 'profile'; Name = 'doc-updater'; Why = 'Documentacion o memoria sincronizada.' })
  }
  if ($q -match 'codex|agente|agentes|harness|contexto|coste|costo|herramientas|skills') {
    $routes.Add([PSCustomObject]@{ Kind = 'profile'; Name = 'harness-optimizer'; Why = 'Optimizar flujo agentico, contexto o coste.' })
  }
  if ($q -match '\bn8n\b|workflow|automatizacion|automatización|mcp.*n8n|webhook') {
    $routes.Add([PSCustomObject]@{ Kind = 'profile'; Name = 'n8n-workflow-builder'; Why = 'Diseno, validacion o gestion de workflows n8n.' })
    $routes.Add([PSCustomObject]@{ Kind = 'profile'; Name = 'security-reviewer'; Why = 'Workflows suelen tocar credenciales, webhooks o produccion.' })
  }
  if ($q -match 'prompt|prompts|prompting|instruccion|instrucción|mejora este prompt|adapta.*prompt') {
    $routes.Add([PSCustomObject]@{ Kind = 'profile'; Name = 'prompt-engineer'; Why = 'Creacion, mejora o adaptacion de prompts.' })
  }
  if ($q -match 'landing|diseño|diseno|\bui\b|interfaz|maqueta|frontend') {
    $routes.Add([PSCustomObject]@{ Kind = 'profile'; Name = 'ui-designer'; Why = 'Decision visual o de interfaz.' })
    $routes.Add([PSCustomObject]@{ Kind = 'profile'; Name = 'frontend-developer'; Why = 'Implementacion de interfaz.' })
  }
  if ($q -match 'ux|conversion|funnel|flujo|onboarding') {
    $routes.Add([PSCustomObject]@{ Kind = 'profile'; Name = 'ux-architect'; Why = 'Flujo, conversion o experiencia.' })
  }
  if ($q -match 'marca|brand|copy|tono|claim|mensaje') {
    $routes.Add([PSCustomObject]@{ Kind = 'profile'; Name = 'brand-guardian'; Why = 'Coherencia de marca y mensaje.' })
  }
  if ($q -match 'seo|organico|schema|indexacion|canonical') {
    $routes.Add([PSCustomObject]@{ Kind = 'profile'; Name = 'seo-specialist'; Why = 'SEO tecnico o contenido organico.' })
  }
  if ($q -match 'ads|ppc|google ads|meta ads|paid|campaña|campana|roas|cpa') {
    $routes.Add([PSCustomObject]@{ Kind = 'profile'; Name = 'ppc-campaign-strategist'; Why = 'Estrategia o estructura paid media.' })
    $routes.Add([PSCustomObject]@{ Kind = 'profile'; Name = 'paid-media-auditor'; Why = 'Auditoria de gasto y rendimiento.' })
  }
  if ($q -match 'tracking|gtm|ga4|pixel|conversion|conversiones|capi|utm|medicion|medición') {
    $routes.Add([PSCustomObject]@{ Kind = 'profile'; Name = 'tracking-measurement-specialist'; Why = 'Medicion, eventos o conversiones.' })
  }
  if ($q -match 'qa|test|verifica|comprueba|evidencia|go/no-go') {
    $routes.Add([PSCustomObject]@{ Kind = 'profile'; Name = 'evidence-collector'; Why = 'Validacion y evidencias.' })
  }

  if ($routes.Count -eq 0) {
    $routes.Add([PSCustomObject]@{ Kind = 'flow'; Name = 'verification'; Why = 'Ruta minima: ejecutar, comprobar y reportar evidencia.' })
  }

  $seen = @{}
  $deduped = @()
  foreach ($route in $routes) {
    $key = "$($route.Kind)|$($route.Name)"
    if (-not $seen.ContainsKey($key)) {
      $seen[$key] = $true
      $deduped += $route
    }
  }

  $deduped | Format-Table -AutoSize
}

switch ($Command) {
  'list' { Show-List }
  'route' { Get-Route $Query }
  'checklist' { Show-Checklist $Query }
}
