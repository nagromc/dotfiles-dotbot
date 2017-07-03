@echo off

:: if no arg, set it to "--link"
set arg=%1
if [%arg%]==[] (
    set arg=--link
)

:: check if arg is "--link" or "--copy"
if not [%arg%]==[--link] if not [%arg%]==[--copy]  (
    echo The argument %arg% is not supported
    goto:eof
)

call:link %USERPROFILE%\.atom\config.cson %CD%\atom\config.cson %arg%
call:link %USERPROFILE%\.atom\init.coffee %CD%\atom\init.coffee %arg%
call:link %USERPROFILE%\.atom\keymap.cson %CD%\atom\keymap.cson %arg%
call:link %USERPROFILE%\.atom\snippets.cson %CD%\atom\snippets.cson %arg%
call:link %APPDATA%\Brackets\brackets.json %CD%\brackets\brackets.json %arg%
call:link %APPDATA%\Code\User\settings.json %CD%\code\settings.json %arg%
call:link %USERPROFILE%\.editorconfig %CD%\editorconfig\editorconfig %arg%
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
) else if [%~3]==[--copy] (
    copy %~2 %~1
)
goto:eof
