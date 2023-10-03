chcp 65001
@echo off
setlocal enabledelayedexpansion

REM Yedeklemek istediğiniz klasörün yolu
set "kaynak_klasor=C:\Users\Admin\Desktop\Git"

REM Flash belleğin bağlandığı sürücü harfi (örneğin, E:)
set "flash_surucu=F:"

REM Hedef klasörü oluştur
set "hedef_klasor=%flash_surucu%\Yedek"

mkdir "%hedef_klasor%" 2>nul

REM Klasörü flash belleğe kopyala
xcopy "%kaynak_klasor%\*" "%hedef_klasor%\" /E /C /I /H /R /Y

echo Yedekleme tamamlandı.

pause
