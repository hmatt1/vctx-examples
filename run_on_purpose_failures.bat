@echo off
setlocal EnableExtensions

REM Delegate to streaming Python runner (more reliable in IDE shells).
python "%~dp0run_on_purpose_failures.py"
exit /b %ERRORLEVEL%

