@echo off
setlocal
cd /d "%~dp0"

where uv >nul 2>&1
if %errorlevel%==0 (
    uv run --project "%~dp0" main.py
) else (
    where py >nul 2>&1
    if %errorlevel%==0 (
        py "%~dp0run.sh"
    ) else (
        python "%~dp0run.sh"
    )
)

if not "%errorlevel%"=="0" (
    echo Boot Asteroids could not be started.
    pause
)
endlocal
