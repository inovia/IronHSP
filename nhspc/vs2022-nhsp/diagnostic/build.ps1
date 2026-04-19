$ErrorActionPreference = 'Stop'
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$out  = Join-Path $here 'nhsp-diagnostic.vsix'

# Step 1: VsixUtil produces the shell vsix with manifest.json + catalog.json.
$vswhere = 'C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe'
$vsRoot  = & $vswhere -latest -property installationPath
$vsixUtil = Join-Path $vsRoot 'VSSDK\VisualStudioIntegration\Tools\Bin\VsixUtil.exe'

if (Test-Path -LiteralPath $out) { Remove-Item -LiteralPath $out -Force }
& $vsixUtil package -sourceManifest (Join-Path $here 'extension.vsixmanifest') -outputPath $out -noValidate | Out-Null
if ($LASTEXITCODE -ne 0) { throw "VsixUtil failed ($LASTEXITCODE)" }

# Step 2: augment with the pkgdef (7-Zip keeps MS's manifest.json/catalog.json).
$sevenZip = 'C:\Program Files\7-Zip\7z.exe'
$stage = Join-Path $env:TEMP ('nhspdiag_' + [Guid]::NewGuid())
New-Item -ItemType Directory -Path $stage -Force | Out-Null
try {
    Copy-Item -LiteralPath (Join-Path $here 'diagnostic.pkgdef') -Destination $stage -Force
    # Overwrite VsixUtil's minimal [Content_Types].xml with ours that includes .pkgdef.
    Copy-Item -LiteralPath (Join-Path $here '[Content_Types].xml') -Destination $stage -Force

    $pwd = Get-Location
    Set-Location -LiteralPath $stage
    try {
        & $sevenZip a -tzip -y -bso0 -bsp0 $out * | Out-Null
        if ($LASTEXITCODE -ne 0) { throw "7z failed ($LASTEXITCODE)" }
    } finally { Set-Location -LiteralPath $pwd }
} finally { Remove-Item -LiteralPath $stage -Recurse -Force -ErrorAction SilentlyContinue }

Write-Host "built: $out  ($((Get-Item -LiteralPath $out).Length) bytes)"
