:: Fuzzy Change Directory

@echo off
setlocal

if not "%1" == "" set QRY="-q %*"

for /f "usebackq delims=" %%i in (`fd . -t d ^| fzf %QRY%`) do set TARGET=%%~fi

if not defined TARGET goto :eof

endlocal & pushd %TARGET%
