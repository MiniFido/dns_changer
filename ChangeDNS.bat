@echo off
:: Check if running as admin
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting Administrator access...
    PowerShell Start-Process PowerShell -ArgumentList '-ExecutionPolicy Bypass -File "%~dp0Set-DNS.ps1"' -Verb RunAs
) else (
    PowerShell -ExecutionPolicy Bypass -File "Set-DNS.ps1"
)
pause
