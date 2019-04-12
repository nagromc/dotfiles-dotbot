@echo off

doskey cd=cd /d $*
doskey d=docker $*
doskey dcp=docker-compose $*
doskey envvar="C:\Windows\system32\rundll32.exe" sysdm.cpl,EditEnvironmentVariables
doskey g=git $*
doskey gpgcs=gpg --card-status
doskey ls=dir /b $*
doskey nsl=nslookup $*
doskey showaliases=doskey /m
doskey showpath=@echo %%PATH:;= ^& echo.%%
doskey x=exit
