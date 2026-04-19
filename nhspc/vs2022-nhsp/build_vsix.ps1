# Build nhsp-language.vsix with a fully-valid manifest.json + catalog.json.
#
# VS 2022's /admin install path validates that every file in the VSIX zip is
# listed in the manifest.json `files` array with a SHA-256 hash. VsixUtil only
# auto-lists the sourceManifest input, so we generate manifest.json + catalog.json
# ourselves from the full file set.

$ErrorActionPreference = 'Stop'
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$repo = Split-Path -Parent $here
$out  = Join-Path $here 'nhsp-language.vsix'
$vsclient = Join-Path $repo 'NhspVsLanguageClient\bin\Release\net472'
$lsp      = Join-Path $repo 'NhspLanguageServer\bin\Release\net48'

# Files that go into the vsix zip. `Dst` is the entry path (forward slashes),
# `Src` is the local source. `extension.vsixmanifest` and `[Content_Types].xml`
# are OPC metadata; everything else is payload.
$payload = @(
    @{ Src = (Join-Path $here 'nhsp.pkgdef');                       Dst = 'nhsp.pkgdef' }
    @{ Src = (Join-Path $here 'language-configuration.json');       Dst = 'language-configuration.json' }
    @{ Src = (Join-Path $here 'Grammars\nhsp.tmLanguage.json');     Dst = 'Grammars/nhsp.tmLanguage.json' }
    @{ Src = (Join-Path $vsclient 'NhspVsLanguageClient.dll');      Dst = 'NhspVsLanguageClient.dll' }
    @{ Src = (Join-Path $lsp 'nhspls.exe');                         Dst = 'nhspls.exe' }
    @{ Src = (Join-Path $lsp 'NhspCompiler.Core.dll');              Dst = 'NhspCompiler.Core.dll' }
    @{ Src = (Join-Path $lsp 'Newtonsoft.Json.dll');                Dst = 'Newtonsoft.Json.dll' }
    @{ Src = (Join-Path $lsp 'nhspls.exe.config');                  Dst = 'nhspls.exe.config' }
)

# Drop optional files that don't exist (e.g. .config when the compiler didn't emit one).
$payload = $payload | Where-Object { Test-Path -LiteralPath $_.Src }

# Extract identity from extension.vsixmanifest.
[xml]$manifest = Get-Content -LiteralPath (Join-Path $here 'extension.vsixmanifest') -Encoding UTF8
$ns = @{v='http://schemas.microsoft.com/developer/vsx-schema/2011'}
$identity = $manifest.PackageManifest.Metadata.Identity
$extId    = $identity.Id
$version  = $identity.Version
$dispName = $manifest.PackageManifest.Metadata.DisplayName
$descText = $manifest.PackageManifest.Metadata.Description.'#text'
if (-not $descText) { $descText = $manifest.PackageManifest.Metadata.Description }

# Random per-machine install folder name (same pattern as VsixUtil).
$installFolder = -join ((1..8) | ForEach-Object { 'abcdefghijklmnopqrstuvwxyz0123456789'[(Get-Random -Max 36)] })
$installFolder += '.' + -join ((1..3) | ForEach-Object { 'abcdefghijklmnopqrstuvwxyz0123456789'[(Get-Random -Max 36)] })

# Stage files to compute SHA-256 and install-size.
$stage = Join-Path $env:TEMP ('nhspvsix_' + [Guid]::NewGuid())
New-Item -ItemType Directory -Path $stage -Force | Out-Null
try {
    # Copy extension.vsixmanifest + [Content_Types].xml.
    Copy-Item -LiteralPath (Join-Path $here 'extension.vsixmanifest') -Destination $stage -Force
    Copy-Item -LiteralPath (Join-Path $here '[Content_Types].xml')    -Destination $stage -Force
    foreach ($p in $payload) {
        $dst = Join-Path $stage $p.Dst
        $dir = Split-Path -Parent $dst
        if (-not (Test-Path -LiteralPath $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
        Copy-Item -LiteralPath $p.Src -Destination $dst -Force
    }

    # Build files[] for manifest.json. Each entry needs fileName (leading /) and sha256.
    $manifestFiles = [System.Collections.ArrayList]::new()
    $totalBytes = 0
    $filesForManifest = @('extension.vsixmanifest') + ($payload | ForEach-Object { $_.Dst })
    foreach ($rel in $filesForManifest) {
        $abs = Join-Path $stage $rel
        $sha = (Get-FileHash -LiteralPath $abs -Algorithm SHA256).Hash.ToLowerInvariant()
        $totalBytes += (Get-Item -LiteralPath $abs).Length
        [void]$manifestFiles.Add([ordered]@{ fileName = '/' + $rel; sha256 = $sha })
    }

    # manifest.json — VS consumes this during /admin validation.
    $manifestJson = [ordered]@{
        id            = $extId
        version       = $version
        type          = 'Vsix'
        vsixId        = $extId
        extensionDir  = '[installdir]\Common7\IDE\Extensions\' + $installFolder
        files         = $manifestFiles.ToArray()
        installSizes  = [ordered]@{ targetDrive = [int]($totalBytes / 1) }
        dependencies  = [ordered]@{ 'Microsoft.VisualStudio.Component.CoreEditor' = '[17.0,18.0)' }
    }
    $manifestText = ConvertTo-Json $manifestJson -Depth 10 -Compress
    Set-Content -LiteralPath (Join-Path $stage 'manifest.json') -Value $manifestText -Encoding UTF8 -NoNewline

    # catalog.json — higher-level catalog VsixUtil normally generates.
    $catalogJson = [ordered]@{
        manifestVersion = '1.1'
        info = [ordered]@{
            id           = $extId + ',version=' + $version
            manifestType = 'Extension'
        }
        packages = @(
            [ordered]@{
                id           = 'Component.' + $extId
                version      = $version
                type         = 'Component'
                extension    = $true
                automaticallyAddedByExtensionPack = $false
                dependencies = [ordered]@{
                    $extId = $version
                    'Microsoft.VisualStudio.Component.CoreEditor' = '[17.0,18.0)'
                }
                localizedResources = @(
                    [ordered]@{
                        language    = 'en-US'
                        title       = $dispName
                        description = $descText
                    }
                )
            },
            [ordered]@{
                id          = $extId
                version     = $version
                type        = 'Vsix'
                payloads    = @(
                    [ordered]@{ fileName = 'nhsp-language.vsix'; size = 0 }
                )
                vsixId       = $extId
                extensionDir = '[installdir]\Common7\IDE\Extensions\' + $installFolder
                installSizes = [ordered]@{ targetDrive = [int]($totalBytes / 1) }
            }
        )
    }
    $catalogText = ConvertTo-Json $catalogJson -Depth 10 -Compress
    Set-Content -LiteralPath (Join-Path $stage 'catalog.json') -Value $catalogText -Encoding UTF8 -NoNewline

    # Package with 7-Zip — preserves forward-slash entries and lets us control the layout.
    $sevenZip = 'C:\Program Files\7-Zip\7z.exe'
    if (-not (Test-Path $sevenZip)) { throw "7z.exe not found" }
    if (Test-Path -LiteralPath $out) { Remove-Item -LiteralPath $out -Force }

    $pwd = Get-Location
    Set-Location -LiteralPath $stage
    try {
        & $sevenZip a -tzip -y -bso0 -bsp0 $out '*' | Out-Null
        if ($LASTEXITCODE -ne 0) { throw "7z failed ($LASTEXITCODE)" }
    } finally { Set-Location -LiteralPath $pwd }
} finally { Remove-Item -LiteralPath $stage -Recurse -Force -ErrorAction SilentlyContinue }

$len = (Get-Item -LiteralPath $out).Length
Write-Host "built: $out ($len bytes)"
Write-Host "files in manifest.json: $($filesForManifest.Count)"
