@echo off

doskey a2=aria2c $*
doskey base64dec=certutil -decode $1 $1.bin
doskey base64enc=certutil -f -encode $1 %TEMP%\tmp.b64 ^&^& findstr /v /c:----- %TEMP%\tmp.b64 ^> $1.b64
doskey cd=cd /d $*
doskey d=docker $*
doskey dcp=docker-compose $*
doskey envvar="C:\Windows\system32\rundll32.exe" sysdm.cpl,EditEnvironmentVariables
doskey g=git $*
doskey gpgcs=taskkill.exe /T /F /IM gpg-agent.exe ^& gpg --card-status
doskey ls=dir /b $*
doskey mkcd=mkdir $1 ^&^& cd /d $1
doskey nsl=nslookup $*
doskey showaliases=doskey /m
doskey showpath=@echo %%PATH:;= ^& echo.%%
doskey t=tig $*
doskey x=exit
