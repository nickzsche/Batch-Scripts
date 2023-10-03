chcp 65001
@echo off
setlocal enabledelayedexpansion

REM Klasörünüzün yolu ve Git repo adını belirtin
set klasor_yolu=C:\Users\Admin\Desktop\Git\Kamu_Saglik_Html_Popup

REM Klasördeki değişiklikleri kontrol edin
cd %klasor_yolu%
git status | find "nothing to commit" >nul 2>&1

REM "nothing to commit" metni bulunamazsa (yani değişiklikler varsa)
if errorlevel 1 (
    REM Değişiklikleri ekleyin (commit)
    git add .

    REM Geçerli tarih ve saat bilgisini alın (YYYYMMDD-HHMMSS formatında)
    for /f "delims=" %%a in ('wmic OS Get LocalDateTime ^| find "."') do set tarih_saat=%%a
    set tarih=!tarih_saat:~0,8!-!tarih_saat:~8,6!

    git commit -m "Push - !tarih!"
    
    REM Değişiklikleri Git'e push edin
    git push origin main
    REM Push işlemi başarıyla tamamlandı mesajını göster
    echo Push işlemi başarıyla tamamlandı.
) else (
    REM Push işlemi için değişiklik bulunamadı mesajını göster
    echo Push işlemi için değişiklik bulunamadı.
)

pause
