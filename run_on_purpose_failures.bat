@echo off
setlocal EnableExtensions EnableDelayedExpansion

set "VCTX=python ..\vctx-lang\vctx-cli.py"

set /a total=0
set /a ok=0
set /a bad=0

echo.
echo === Expected-fail sims: on_purpose_failures_sim ===
if not exist "on_purpose_failures_sim" (
  echo missing directory: on_purpose_failures_sim
  goto CHECK_DIR
)

for %%F in ("on_purpose_failures_sim\*.vctx") do (
  set /a total+=1
  echo.
  echo [SIM xfail] %%~nxF
  set "OUT=%TEMP%\vctx_onp_sim.txt"
  %VCTX% sim "on_purpose_failures_sim\%%~nxF" > "!OUT!" 2>&1
  set "code=!ERRORLEVEL!"
  type "!OUT!"
  if "!code!"=="0" (
    echo [UNEXPECTED PASS] %%~nxF
    set /a bad+=1
  ) else (
    python "%~dp0_on_purpose_has_e_code.py" "!OUT!"
    if errorlevel 1 (
      echo [MISSING E_ code in output] %%~nxF
      set /a bad+=1
    ) else (
      echo [OK: failed as expected with E_ code] %%~nxF - exit !code!
      set /a ok+=1
    )
  )
)

:CHECK_DIR
echo.
echo === Expected-fail checks: on_purpose_failures_check ===
if not exist "on_purpose_failures_check" (
  echo missing directory: on_purpose_failures_check
  goto SUMMARY
)

for %%F in ("on_purpose_failures_check\*.vctx") do (
  set /a total+=1
  echo.
  echo [CHECK xfail] %%~nxF
  set "OUT=%TEMP%\vctx_onp_chk.txt"
  %VCTX% check "on_purpose_failures_check\%%~nxF" > "!OUT!" 2>&1
  set "code=!ERRORLEVEL!"
  type "!OUT!"
  if "!code!"=="0" (
    echo [UNEXPECTED PASS] %%~nxF
    set /a bad+=1
  ) else (
    python "%~dp0_on_purpose_has_e_code.py" "!OUT!"
    if errorlevel 1 (
      echo [MISSING E_ code in output] %%~nxF
      set /a bad+=1
    ) else (
      echo [OK: failed as expected with E_ code] %%~nxF - exit !code!
      set /a ok+=1
    )
  )
)

echo.
echo === Expected-fail MLIR: on_purpose_failures_mlir ===
if not exist "on_purpose_failures_mlir" (
  echo missing directory: on_purpose_failures_mlir
  goto SUMMARY
)

for %%F in ("on_purpose_failures_mlir\*.vctx") do (
  set /a total+=1
  echo.
  echo [MLIR xfail] %%~nxF
  set "pkg=on_purpose_failures_mlir.%%~nF"
  set "OUT=%TEMP%\vctx_onp_mlir.txt"
  %VCTX% mlir --top "!pkg!" > "!OUT!" 2>&1
  set "code=!ERRORLEVEL!"
  type "!OUT!"
  if "!code!"=="0" (
    echo [UNEXPECTED PASS] %%~nxF
    set /a bad+=1
  ) else (
    python "%~dp0_on_purpose_has_e_code.py" "!OUT!"
    if errorlevel 1 (
      echo [MISSING E_ code in output] %%~nxF
      set /a bad+=1
    ) else (
      echo [OK: failed as expected with E_ code] %%~nxF - exit !code!
      set /a ok+=1
    )
  )
)

:SUMMARY
echo.
echo === Summary ===
echo Total: !total!  OK(xfail): !ok!  UnexpectedPass: !bad!

if not "!bad!"=="0" (
  exit /b 1
)
exit /b 0
