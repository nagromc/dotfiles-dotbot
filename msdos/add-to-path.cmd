:: Add a directory to Path if doesn't already exists
@echo off


set bup=%CD%\path-backup.txt
set "pathToAdd=%~1"

:: get current value of PATH
for /f "usebackq skip=2 tokens=1,2*" %%N in (`reg query "HKEY_CURRENT_USER\Environment" /v Path`) do set originalPath=%%P
echo ";%originalPath%;"

echo ";%%originalPath%%;" | find /C /I ";%pathToAdd%;" && (
  echo "%pathToAdd%" already exists in PATH. Nothing to add.
  goto:eof
) || (
  :: first, save the previous PATH
  echo Saving in "%bup%" your previous PATH value to avoid accidents...
  if not exist "%bup%" (
    echo Here are saved your previous PATH values >> "%bup%" & echo. >> "%bup%"
  )
  echo "%DATE%-%TIME%: %originalPath%" >> "%bup%"

  :: then set the envvar
  REG ADD "HKEY_CURRENT_USER\Environment" /v Path /t reg_expand_sz /d "%pathToAdd%;%originalPath%" /f

  echo "%pathToAdd%" successfully added to PATH. Reload your session to apply the changes to your system.
)
