@echo off
REM Copies the scanner into the Portfolio repo so it can be published over HTTPS,
REM which is the only way an iPhone will allow camera access.
REM
REM After running this, from the qr-result folder:
REM     git add scan
REM     git commit -m "Add serial scanner"
REM     git push
REM Then open https://neelng7.github.io/Portfolio/scan/ on your phone.

setlocal
set "SRC=%~dp0"
set "DEST=%~dp0..\qr-result\scan"

if not exist "%~dp0..\qr-result\index.html" (
  echo Could not find the qr-result folder next to this one.
  echo Expected: %~dp0..\qr-result
  exit /b 1
)

echo Copying scanner to %DEST%
robocopy "%SRC%." "%DEST%" index.html /NJH /NJS /NDL /NP >nul
robocopy "%SRC%vendor" "%DEST%\vendor" jsQR.js /NJH /NJS /NDL /NP >nul

if exist "%DEST%\index.html" (
  echo.
  echo Done. Now, from the qr-result folder:
  echo     git add scan
  echo     git commit -m "Add serial scanner"
  echo     git push
  echo.
  echo Then open https://neelng7.github.io/Portfolio/scan/ on your iPhone.
) else (
  echo Copy failed.
  exit /b 1
)
endlocal
