$ErrorActionPreference = 'Stop'
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$out  = Join-Path $here 'nhsp-minimal.vsix'

$payload = @(
    @{ Src = (Join-Path $here 'test.pkgdef');         Dst = 'test.pkgdef' }
    @{ Src = (Join-Path $here 'test.tmLanguage.json'); Dst = 'test.tmLanguage.json' }
)

[xml]$manifest = Get-Content -LiteralPath (Join-Path $here 'extension.vsixmanifest') -Encoding UTF8
$extId    = $manifest.PackageManifest.Metadata.Identity.Id
$version  = $manifest.PackageManifest.Metadata.Identity.Version
$dispName = $manifest.PackageManifest.Metadata.DisplayName
$descText = $manifest.PackageManifest.Metadata.Description
$installFolder = -join ((1..8) | ForEach-Object { 'abcdefghijklmnopqrstuvwxyz0123456789'[(Get-Random -Max 36)] })

$stage = Join-Path $env:TEMP ('nhspmin_' + [Guid]::NewGuid())
New-Item -ItemType Directory -Path $stage -Force | Out-Null
try {
    Copy-Item -LiteralPath (Join-Path $here 'extension.vsixmanifest') -Destination $stage
    Copy-Item -LiteralPath (Join-Path $here '[Content_Types].xml')    -Destination $stage
    foreach ($p in $payload) { Copy-Item -LiteralPath $p.Src -Destination (Join-Path $stage $p.Dst) }

    $files = [System.Collections.ArrayList]::new()
    $total = 0
    foreach ($rel in @('extension.vsixmanifest') + ($payload | ForEach-Object { $_.Dst })) {
        $abs = Join-Path $stage $rel
        $sha = (Get-FileHash -LiteralPath $abs -Algorithm SHA256).Hash.ToLowerInvariant()
        $total += (Get-Item -LiteralPath $abs).Length
        [void]$files.Add([ordered]@{ fileName = '/' + $rel; sha256 = $sha })
    }

    $mj = [ordered]@{
        id=$extId; version=$version; type='Vsix'; vsixId=$extId
        extensionDir='[installdir]\Common7\IDE\Extensions\' + $installFolder
        files=$files.ToArray()
        installSizes=[ordered]@{targetDrive=$total}
        dependencies=[ordered]@{'Microsoft.VisualStudio.Component.CoreEditor'='[17.0,18.0)'}
    }
    Set-Content -LiteralPath (Join-Path $stage 'manifest.json') -Value (ConvertTo-Json $mj -Depth 10 -Compress) -Encoding UTF8 -NoNewline

    $cj = [ordered]@{
        manifestVersion='1.1'
        info=[ordered]@{ id=($extId+',version='+$version); manifestType='Extension' }
        packages=@(
            [ordered]@{
                id=('Component.' + $extId); version=$version; type='Component'; extension=$true
                automaticallyAddedByExtensionPack=$false
                dependencies=[ordered]@{
                    $extId=$version
                    'Microsoft.VisualStudio.Component.CoreEditor'='[17.0,18.0)'
                }
                localizedResources=@([ordered]@{language='en-US'; title=$dispName; description=$descText})
            },
            [ordered]@{
                id=$extId; version=$version; type='Vsix'
                payloads=@([ordered]@{fileName='nhsp-minimal.vsix'; size=0})
                vsixId=$extId; extensionDir='[installdir]\Common7\IDE\Extensions\' + $installFolder
                installSizes=[ordered]@{targetDrive=$total}
            }
        )
    }
    Set-Content -LiteralPath (Join-Path $stage 'catalog.json') -Value (ConvertTo-Json $cj -Depth 10 -Compress) -Encoding UTF8 -NoNewline

    $sevenZip = 'C:\Program Files\7-Zip\7z.exe'
    if (Test-Path -LiteralPath $out) { Remove-Item -LiteralPath $out -Force }
    $pwd = Get-Location
    Set-Location -LiteralPath $stage
    try { & $sevenZip a -tzip -y -bso0 -bsp0 $out '*' | Out-Null } finally { Set-Location -LiteralPath $pwd }
} finally { Remove-Item -LiteralPath $stage -Recurse -Force -ErrorAction SilentlyContinue }

Write-Host "built: $out ($((Get-Item $out).Length) bytes)"
