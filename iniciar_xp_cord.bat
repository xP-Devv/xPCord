@echo off
title xP Cord Launcher
cd /d "%~dp0"

echo ==========================================
echo           xP Cord Launcher
echo ==========================================
echo.
echo [1] Iniciar servidor + cliente
echo [2] Abrir outro cliente
echo [3] Sair
echo.
set /p opcao=Escolha uma opcao: 

if "%opcao%"=="1" goto startall
if "%opcao%"=="2" goto client
if "%opcao%"=="3" exit
goto end

:startall
echo.
echo Iniciando servidor...
start "xP Cord - Server" cmd /k "cd /d ""%~dp0"" && npm run dev --workspace=server"

timeout /t 2 /nobreak >nul

echo Iniciando Vite + primeiro cliente...
start "xP Cord - Cliente 1" cmd /k "cd /d ""%~dp0"" && npm run dev --workspace=client"

goto end

:client
echo.
echo Abrindo outro cliente usando o Vite que ja esta rodando...
start "xP Cord - Cliente Extra" cmd /k "cd /d ""%~dp0client"" && npx electron ."

goto end

:end
echo.
echo Pronto.
timeout /t 2 >nul
exit
