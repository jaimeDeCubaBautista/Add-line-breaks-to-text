@echo off

set "powershell_script=add_line_breaks.ps1"

powershell -ExecutionPolicy Bypass -File "%powershell_script%"

timeout /t 2 >nul

exit