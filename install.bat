@echo off

call:link %USERPROFILE%\.atom\apmrc %CD%\atom\apmrc
call:link %USERPROFILE%\.atom\config.cson %CD%\atom\config.cson
call:link %USERPROFILE%\.atom\init.coffee %CD%\atom\init.coffee
call:link %USERPROFILE%\.atom\keymap.cson %CD%\atom\keymap.cson
call:link %USERPROFILE%\.atom\snippets.cson %CD%\atom\snippets.cson
call:link %APPDATA%\Brackets\brackets.json %CD%\brackets\brackets.json
call:link %APPDATA%\Code\User\settings.json %CD%\code\settings.json
call:link %USERPROFILE%\.editorconfig %CD%\editorconfig\editorconfig
call:link %USERPROFILE%\.gitconfig %CD%\git\gitconfig


echo N | copy /-Y %CD%\git\gitconfig_local.template %USERPROFILE%\.gitconfig_local
echo. & echo. & echo.
echo Please edit "%USERPROFILE%\.gitconfig_local" to adapt Git's behaviour to Windows (especially to disable GPG signing commits).
echo.

pause & goto:eof

:link
del %~1
mklink %~1 %~2
goto:eof
