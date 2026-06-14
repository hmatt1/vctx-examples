param(
    [string]$Root = ".",
    [string]$Output = "combined.md"
)

$Root = (Resolve-Path -Path $Root).Path

$files = Get-ChildItem -Path $Root -Filter *.vctx -Recurse -File | Sort-Object FullName

if ($files.Count -eq 0) {
    Write-Warning "No .vctx files found under $Root"
    return
}

$encoding = [System.Text.UTF8Encoding]::new($false)
$writer = [System.IO.StreamWriter]::new($Output, $false, $encoding)

try {
    foreach ($file in $files) {
        $relative = $file.FullName.Substring($Root.Length).TrimStart('\', '/').Replace('\', '/')
        $content = (Get-Content -Path $file.FullName -Raw).TrimEnd()

        $writer.WriteLine("## $relative")
        $writer.WriteLine()
        $writer.WriteLine('```')
        $writer.WriteLine($content)
        $writer.WriteLine('```')
        $writer.WriteLine()
    }
}
finally {
    $writer.Dispose()
}

Write-Host "Combined $($files.Count) files into $Output"