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
  %VCTX% sim "%%~fF"
  set "code=!ERRORLEVEL!"
  if "!code!"=="0" (
    echo [UNEXPECTED PASS] %%~nxF
    set /a bad+=1
  ) else (
    echo [OK: failed as expected] %%~nxF - exit code !code!
    set /a ok+=1
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
  %VCTX% check "%%~fF"
  set "code=!ERRORLEVEL!"
  if "!code!"=="0" (
    echo [UNEXPECTED PASS] %%~nxF
    set /a bad+=1
  ) else (
    echo [OK: failed as expected] %%~nxF - exit code !code!
    set /a ok+=1
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
