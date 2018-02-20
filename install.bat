@echo off

:: if no arg, set it to "--link"
set arg=%1
if [%arg%]==[] (
    set arg=--link
)

:: check if arg is "--link", "--hardlink", or "--copy"
if not [%arg%]==[--link] if not [%arg%]==[--hardlink] if not [%arg%]==[--copy]  (
    echo The argument %arg% is not supported
    goto:eof
)

call:link %USERPROFILE%\.atom\config.cson %CD%\atom\config.cson %arg%
call:link %USERPROFILE%\.atom\init.coffee %CD%\atom\init.coffee %arg%
call:link %USERPROFILE%\.atom\keymap.cson %CD%\atom\keymap.cson %arg%
call:link %USERPROFILE%\.atom\snippets.cson %CD%\atom\snippets.cson %arg%
call:link %USERPROFILE%\.atom\styles.less %CD%\atom\styles.less %arg%
call:link %APPDATA%\Brackets\brackets.json %CD%\brackets\brackets.json %arg%
call:link %APPDATA%\Code\User\settings.json %CD%\code\settings.json %arg%
call:link %USERPROFILE%\.editorconfig %CD%\editorconfig\editorconfig %arg%
mkdir %APPDATA%\Mozilla\Firefox\default\ %APPDATA%\Mozilla\Firefox\dev-edition-default
:: Firefox on Windows seems to need a hard link
call:link %APPDATA%\Mozilla\Firefox\profiles.ini %CD%\firefox\profiles.ini --hardlink
call:link %APPDATA%\Mozilla\Firefox\default\user.js %CD%\firefox\user.js %arg%
:: Git for Windows will look for .gitconfig in "%HOMEDRIVE%%HOMEPATH%" if `HOME` is not set. We force `HOME` to "%USERPROFILE%"
setx HOME ~USERPROFILE~
call:link %USERPROFILE%\.gitconfig %CD%\git\gitconfig %arg%


echo N | copy /-Y %CD%\git\gitconfig_local.template %USERPROFILE%\.gitconfig_local
echo. & echo. & echo.
echo Please edit "%USERPROFILE%\.gitconfig_local" to adapt Git's behaviour to Windows (especially to disable GPG signing commits).
echo.

pause & goto:eof

:link
if [%~3]==[--link] (
    del %~1
    mklink %~1 %~2
) else if [%~3]==[--hardlink] (
    del %~1
    mklink /H %~1 %~2
) else if [%~3]==[--copy] (
    copy %~2 %~1
)
goto:eof
