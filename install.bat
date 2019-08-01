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


::==============================================================================
:: Environment variables
::==============================================================================

setx ChocolateyToolsLocation "%%USERPROFILE%%\choco-tools"
setx LC_ALL "C.UTF-8"
setx RIPGREP_CONFIG_PATH "%%USERPROFILE%%\.config\ripgrep\ripgreprc"


::==============================================================================
:: Links
::==============================================================================

mkdir %USERPROFILE%\.atom
call:link %USERPROFILE%\.atom\config.cson %CD%\atom\config.cson %arg%
call:link %USERPROFILE%\.atom\init.coffee %CD%\atom\init.coffee %arg%
call:link %USERPROFILE%\.atom\keymap.cson %CD%\atom\keymap.cson %arg%
call:link %USERPROFILE%\.atom\snippets.cson %CD%\atom\snippets.cson %arg%
call:link %USERPROFILE%\.atom\styles.less %CD%\atom\styles.less %arg%
mklink /D %USERPROFILE%\.dotfiles %CD%
mkdir %USERPROFILE%\.local\bin
call:link %USERPROFILE%\.local\bin\diff-so-fancy %CD%\bin\diff-so-fancy\third_party\build_fatpack\diff-so-fancy %arg%
mkdir %USERPROFILE%\.msdos
call:link %USERPROFILE%\.msdos\aliases.cmd %CD%\msdos\aliases.cmd %arg%
mkdir %USERPROFILE%\.ssh
call:link %USERPROFILE%\.ssh\config %CD%\ssh\config %arg%
mkdir %APPDATA%\Brackets
call:link %APPDATA%\Brackets\brackets.json %CD%\brackets\brackets.json %arg%
mkdir %APPDATA%\bug.n
call:link %APPDATA%\bug.n\Config.ini %CD%\bug.n\Config.ini %arg%
mkdir %APPDATA%\Code\User
call:link %APPDATA%\Code\User\keybindings.json %CD%\code\keybindings.json %arg%
call:link %APPDATA%\Code\User\settings.json %CD%\code\settings.json %arg%
call:link %USERPROFILE%\.editorconfig %CD%\editorconfig\editorconfig %arg%
mkdir %APPDATA%\gnupg
call:link %APPDATA%\gnupg\gpg.conf %CD%\gnupg\gpg.conf %arg%
call:link %APPDATA%\gnupg\gpg-agent.conf %CD%\gnupg\gpg-agent.conf.windows %arg%
call:link %APPDATA%\gnupg\gpg.conf %CD%\gnupg\gpg.conf %arg%
mkdir %APPDATA%\Mozilla\Firefox\default\ %APPDATA%\Mozilla\Firefox\dev-edition-default
:: Firefox on Windows seems to need a hard link
call:link %APPDATA%\Mozilla\Firefox\profiles.ini %CD%\firefox\profiles.ini --hardlink
call:link %APPDATA%\Mozilla\Firefox\default\user.js %CD%\firefox\user.js %arg%
mkdir %APPDATA%\Notepad++\themes
call:link %APPDATA%\Notepad++\themes\Monokai.xml %CD%\notepad++\themes\scheme.mg.monokai.git\notepad++\Monokai.xml --link
mkdir %USERPROFILE%\.config\aria2
call:link %USERPROFILE%\.config\aria2\aria2.conf %CD%\aria2\aria2.conf %arg%
:: Git for Windows will look for .gitconfig in "%HOMEDRIVE%%HOMEPATH%" if `HOME` is not set. We force `HOME` to "%USERPROFILE%"
setx HOME ~USERPROFILE~
mklink /D %USERPROFILE%\.config\git\git_template %CD%\git\template
mkdir %USERPROFILE%\.config\git
call:link %USERPROFILE%\.config\git\config %CD%\git\gitconfig %arg%
call:link %USERPROFILE%\.config\git\gitignore_global %CD%\git\gitignore_global %arg%
call:link %USERPROFILE%\.config\git\gitconfig_windows %CD%\git\gitconfig_windows %arg%
mkdir %USERPROFILE%\.config\ripgrep
call:link %USERPROFILE%\.config\ripgrep\ripgreprc %CD%\ripgrep\ripgreprc %arg%


echo N | copy /-Y %CD%\git\gitconfig_local.template %USERPROFILE%\.config\git\gitconfig_local
echo. & echo. & echo.
echo Please edit "%USERPROFILE%\.config\git\gitconfig_local" to adapt Git's behaviour to Windows (especially to disable GPG signing commits).
echo.


::==============================================================================
:: Commands
::==============================================================================

reg import "%CD%\putty\default-settings.reg"
reg import "%CD%\msdos\install-aliases.reg"
reg import "%CD%\windows\prefs.reg"
call msdos/add-to-path.cmd %%%%USERPROFILE%%%%\.local\bin


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
