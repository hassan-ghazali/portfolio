@echo off
REM ============================================================
REM  Deploy / Update portfolio ke Vercel
REM
REM  Kali pertama: run fail ni sekali sahaja (dah login).
REM  Lepas ni, setiap kali ada perubahan pada index.html,
REM  double-click fail ni sahaja untuk update website live.
REM ============================================================
setlocal

echo.
echo ============================================
echo   Update Portfolio ke Vercel
echo ============================================
echo.

where npx >nul 2>nul
if errorlevel 1 (
  echo [!] Node.js tak dijumpai.
  echo     Install dulu dari https://nodejs.org - ambil versi LTS.
  echo.
  pause
  exit /b 1
)

echo Deploy ke production...
echo.

REM Jangan guna --name: ia deprecated dan boleh pulangkan "Not authorized"
REM sebab ia cuba guna project di personal scope, bukan team scope.
REM Project dah dilink dalam .vercel\project.json, jadi deploy kosong pun cukup.
call npx --yes vercel@latest deploy --prod --yes
if errorlevel 1 (
  echo.
  echo [!] Deploy gagal. Baca mesej error di atas.
  echo     Kalau ia minta login, run:  npx vercel login
  echo.
  pause
  exit /b 1
)

echo.
echo ============================================
echo   SIAP - website dah dikemaskini
echo ============================================
echo.
echo Link live: https://hassan-ghazali.vercel.app
echo.
echo Tekan Ctrl+F5 dalam browser kalau perubahan tak nampak
echo (cache browser lama^).
echo.
pause
