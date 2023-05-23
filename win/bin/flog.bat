:: Fuzzy git log sha selection

@echo off
setlocal

set FMT="%%C(red)%%h%%C(reset) %%s %%C(cyan)@%%an%%C(reset)%%C(yellow)%%d %%C(reset)%%C(green)(%%cr)%%C(reset)"

for /f "usebackq delims=" %%i in (`git log --graph --color^=always --pretty^=format:%FMT% --abbrev-commit --date^=relative %* ^| fzf --ansi --no-sort`) do set TARGET="%%i"

if not defined TARGET goto :eof

echo %TARGET% | tr -d "\""

:: sha to clipboard
echo %TARGET% | rg -o -e "[a-f0-9]{7}" | head -1 | tr -d "\n" | clip

endlocal

