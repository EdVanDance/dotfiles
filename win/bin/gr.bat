:: Change working directory to git project root

@echo off

git rev-parse --is-inside-work-tree > NUL 2>&1

if errorlevel 1 exit /b %ERRORLEVEL%

:: tr, because pushd can't handle paths with "/"
for /f "delims=" %%p in ('git rev-parse --show-toplevel ^| tr "/" "\\"') do pushd %%p
