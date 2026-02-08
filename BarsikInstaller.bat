@echo off
chcp 65001 >nul

:: BarsikInstaller.bat
:: Основной файл BarsikInstaller

:: Проверка агрументов
if "%1" == "install" (
    call install.bat %2
) else if "%*" == "info version" (
    echo.
    echo BarsikInstaller, версия 2026.1.1.
    echo Сборка собрана 2026/02/10 ^(гггг/мм/дд^).
    echo GitHub: https://github.com/barsik0396/BarsikInstaller
    echo Создал: @barsik0396
    echo.
) else if "%*" == "-u" (
    echo Проверка наличия обновлений...
    echo Загрузка файла...
    powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/barsik0396/BarsikInstaller/refs/heads/main/last_ver_main.txt' -OutFile 'lastver.txt'"
    echo Файл загружен: lastver.txt
    echo Выполняется проверка...
    goto u
)
exit /b 0

:: Проверка обновления
:u
:: Проверка существования lastver.txt
if not exist lastver.txt (
    echo ОШИБКА: файл lastver.txt не найден!
    exit /b 0
)
:: Если обнов нет - сообщение
set /p lastver=<"lastver.txt"
if "%lastver%" == "2026.1.1" (
    powershell -Command ^
        "Write-Host 'INFO: ' -ForegroundColor Blue -NoNewline; Write-Host 'Обновлений не найдено!' -ForegroundColor Green"
)
del lastver.txt