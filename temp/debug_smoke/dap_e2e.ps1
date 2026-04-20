# End-to-end DAP simulator.
#
# Speaks the Debug Adapter Protocol over stdio to nhspdap.exe (the same way
# VS Code does). Verifies: initialize → launch → setBreakpoints →
# configurationDone → BP hit → stackTrace → variables → setVariable →
# evaluate → continue → terminated.

param(
    [string]$Nhspdap = "J:\HNWorks\IronHSP_2026\nhspc\nhspdap\bin\Release\net48\nhspdap.exe",
    [string]$Program = "J:\HNWorks\IronHSP_2026\temp\debug_smoke\test_setvar.ax",
    [string]$SourceFile = "J:\HNWorks\IronHSP_2026\temp\debug_smoke\test_setvar.hsp",
    [int]$BpLine = 32
)

# Launch nhspdap.exe with stdin/stdout redirected
$psi = New-Object System.Diagnostics.ProcessStartInfo
$psi.FileName = $Nhspdap
$psi.UseShellExecute = $false
$psi.RedirectStandardInput = $true
$psi.RedirectStandardOutput = $true
$psi.RedirectStandardError = $true
$psi.CreateNoWindow = $true
$psi.StandardOutputEncoding = [System.Text.Encoding]::UTF8
$psi.StandardErrorEncoding  = [System.Text.Encoding]::UTF8
$proc = [System.Diagnostics.Process]::Start($psi)

# The DAP framing uses Content-Length headers + raw byte body.
$inStream  = $proc.StandardInput.BaseStream
$outStream = $proc.StandardOutput.BaseStream
$seq = 1

function Write-Dap([hashtable]$obj) {
    $body = ($obj | ConvertTo-Json -Compress -Depth 8)
    $payload = [System.Text.Encoding]::UTF8.GetBytes($body)
    $hdr = [System.Text.Encoding]::ASCII.GetBytes("Content-Length: $($payload.Length)`r`n`r`n")
    $inStream.Write($hdr, 0, $hdr.Length)
    $inStream.Write($payload, 0, $payload.Length)
    $inStream.Flush()
}

function Read-DapHeaderLine {
    $sb = New-Object System.Text.StringBuilder
    $prev = -1
    while ($true) {
        $c = $outStream.ReadByte()
        if ($c -lt 0) { return $null }
        if ($prev -eq 0x0D -and $c -eq 0x0A) {
            $null = $sb.Remove($sb.Length - 1, 1)
            return $sb.ToString()
        }
        $null = $sb.Append([char]$c)
        $prev = $c
    }
}

function Read-Dap {
    $contentLength = -1
    while ($true) {
        $h = Read-DapHeaderLine
        if ($h -eq $null) { return $null }
        if ($h.Length -eq 0) { break }
        $colon = $h.IndexOf(':')
        if ($colon -gt 0) {
            $name = $h.Substring(0, $colon).Trim()
            $val  = $h.Substring($colon + 1).Trim()
            if ($name -ieq 'Content-Length') { $contentLength = [int]$val }
        }
    }
    if ($contentLength -le 0) { return $null }
    $buf = New-Object byte[] $contentLength
    $read = 0
    while ($read -lt $contentLength) {
        $n = $outStream.Read($buf, $read, $contentLength - $read)
        if ($n -le 0) { return $null }
        $read += $n
    }
    $json = [System.Text.Encoding]::UTF8.GetString($buf)
    return ($json | ConvertFrom-Json)
}

function Send-Request([string]$command, [hashtable]$reqArgs = $null) {
    $req = @{
        seq = $script:seq; type = "request"; command = $command
    }
    if ($reqArgs -ne $null) { $req.arguments = $reqArgs }
    $script:seq++
    Write-Dap $req
}

# Read messages until we see a response to our most recent request OR a
# specific event we're interested in. Events get printed as a side effect.
function Wait-For([string]$expectedKind, [string]$expectedName = $null) {
    while ($true) {
        $msg = Read-Dap
        if ($msg -eq $null) { return $null }
        if ($msg.type -eq 'event') {
            Write-Host ("  << EVENT {0} {1}" -f $msg.event, ($msg.body | ConvertTo-Json -Compress -Depth 4))
            if ($expectedKind -eq 'event' -and $msg.event -eq $expectedName) { return $msg }
        } elseif ($msg.type -eq 'response') {
            Write-Host ("  << RESP  {0} ok={1} body={2}" -f $msg.command, $msg.success, ($msg.body | ConvertTo-Json -Compress -Depth 4))
            if ($expectedKind -eq 'response' -and ($expectedName -eq $null -or $msg.command -eq $expectedName)) { return $msg }
        }
    }
}

# ---------------- Test sequence ----------------

Write-Host "=== initialize ==="
Send-Request 'initialize' @{ adapterID = 'hsp3net'; locale = 'en-US'; linesStartAt1 = $true; columnsStartAt1 = $true }
$null = Wait-For 'response' 'initialize'

Write-Host ""
Write-Host "=== launch ==="
Send-Request 'launch' @{
    program = $Program
    cwd = (Split-Path $Program -Parent)
    stopOnEntry = $true
}
$null = Wait-For 'response' 'launch'
$null = Wait-For 'event' 'initialized'

Write-Host ""
Write-Host "=== setBreakpoints ==="
Send-Request 'setBreakpoints' @{
    source = @{ path = $SourceFile; name = (Split-Path $SourceFile -Leaf) }
    breakpoints = @(@{ line = $BpLine })
    lines = @($BpLine)
}
$null = Wait-For 'response' 'setBreakpoints'

Write-Host ""
Write-Host "=== configurationDone ==="
Send-Request 'configurationDone' @{}
$null = Wait-For 'response' 'configurationDone'

Write-Host ""
Write-Host "=== wait for BP hit ==="
$stopped = Wait-For 'event' 'stopped'
Write-Host ("BP hit: reason={0}" -f $stopped.body.reason)

Write-Host ""
Write-Host "=== threads / stackTrace / scopes / variables ==="
Send-Request 'threads' @{}
$null = Wait-For 'response' 'threads'
Send-Request 'stackTrace' @{ threadId = 1; startFrame = 0; levels = 20 }
$null = Wait-For 'response' 'stackTrace'
Send-Request 'scopes' @{ frameId = 1 }
$null = Wait-For 'response' 'scopes'
Send-Request 'variables' @{ variablesReference = 1 }
$vars = Wait-For 'response' 'variables'

Write-Host ""
Write-Host "=== setVariable: x = 42 ==="
Send-Request 'setVariable' @{ variablesReference = 1; name = 'x'; value = '42' }
$null = Wait-For 'response' 'setVariable'

Write-Host ""
Write-Host "=== evaluate: iarr(1,1) = 77 ==="
Send-Request 'evaluate' @{ expression = 'iarr(1,1) = 77'; context = 'repl' }
$null = Wait-For 'response' 'evaluate'

Write-Host ""
Write-Host "=== evaluate: m_val@mymod = 555 ==="
Send-Request 'evaluate' @{ expression = 'm_val@mymod = 555'; context = 'repl' }
$null = Wait-For 'response' 'evaluate'

Write-Host ""
Write-Host "=== continue (expect terminated after script runs to end) ==="
Send-Request 'continue' @{ threadId = 1 }
$null = Wait-For 'response' 'continue'
$null = Wait-For 'event' 'terminated'

Write-Host ""
Write-Host "=== disconnect ==="
Send-Request 'disconnect' @{}
$null = Wait-For 'response' 'disconnect'

$inStream.Close()
Start-Sleep -Milliseconds 500
if (-not $proc.HasExited) { $proc.Kill() }
Write-Host ""
Write-Host "DONE. nhspdap exit code = $($proc.ExitCode)"
