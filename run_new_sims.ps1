$ErrorActionPreference = "Stop"

# Define the directories containing the new vctx files
$directories = @(
    "arrays_slicing",
    "components",
    "comptime",
    "control_flow",
    "intrinsics",
    "literals",
    "operators",
    "registers",
    "sim"
)

$passed = 0
$failed = 0
$total = 0

Write-Host "Starting batch simulation of vctx files..." -ForegroundColor Cyan

foreach ($dir in $directories) {
    if (Test-Path $dir) {
        $files = Get-ChildItem -Path $dir -Filter "*.vctx" -Recurse
        foreach ($file in $files) {
            # Convert file path to package format: operators.filename
            $package = $file.Directory.Name + "." + $file.BaseName
            $total++
            
            Write-Host "Running: $package ... " -NoNewline
            
            # Run the simulation for the specific package
            # We capture stdout and stderr to parse the result
            $output = py -3.14t -X gil=0 ../vctx-cli.py sim $package 2>&1
            
            if ($LASTEXITCODE -eq 0 -and $output -match "passed, 0 failed") {
                Write-Host "PASSED" -ForegroundColor Green
                $passed++
            } else {
                Write-Host "FAILED" -ForegroundColor Red
                $failed++
                # Optional: Uncomment to see the error for the first failure
                # if ($failed -eq 1) { Write-Host $output -ForegroundColor Yellow }
            }
        }
    }
}

Write-Host ""
Write-Host "========================================="
Write-Host "Simulation Summary"
Write-Host "========================================="
Write-Host "Total Files: $total"
Write-Host "Passed:      $passed" -ForegroundColor Green
Write-Host "Failed:      $failed" -ForegroundColor Red
Write-Host "========================================="

if ($failed -eq 0) {
    Write-Host "All new validation files passed!" -ForegroundColor Green
} else {
    Write-Host "Some validation files failed. Review the output above." -ForegroundColor Yellow
}
