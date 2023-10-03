chcp 65001
@echo off
echo Hatalı DLL Dosyalarını Kontrol Ediliyor...

sfc /scannow | find "Windows Resource Protection found corrupt files"

if %errorlevel% neq 0 (
    echo Hatalı DLL Dosyaları Bulundu:
    sfc /scannow | find "repair"
) else (
    echo Hatalı DLL Dosyası Bulunamadı.
)

pause
