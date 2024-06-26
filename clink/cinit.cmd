@echo off

if [%1] EQU [--path-only] goto path_only

:: Start the goodness
call clink inject --quiet

:: Setup aliases
if not exist %DOT%\clink\aliases (
  "%GIT_INSTALL_ROOT%\usr\bin\bash" --login %DOT%\clink\collect-aliases.sh
)
doskey /macrofile=%DOT%\clink\aliases

:: ENV
set BAT_THEME=Dracula
set FZF_DEFAULT_COMMAND=fd -t f
set FZF_DEFAULT_OPTS=--height=40%% --layout=reverse ^
    --bind "alt-e:execute(nvr {})+abort" ^
    --bind "alt-y:execute-silent(echo | set /p={} | clip)+abort" ^
    --color=dark,gutter:-1 ^
    --color=fg:#f8f8f2,hl:#bd93f9 ^
    --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 ^
    --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 ^
    --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4
set RIPGREP_CONFIG_PATH=%HOME%\.rgrc
set LS_COLORS=di=34

:: Clean title
title cmd

:: Setup PATH
:path_only
if exist %USERPROFILE%\bin\ set PATH=%USERPROFILE%\bin;%PATH%
set PATH=%DOT%\win\bin;%PATH%
