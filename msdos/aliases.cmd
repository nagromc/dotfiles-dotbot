@echo off

doskey cd=cd /d $*
doskey g=git $*
doskey gpgcs=gpg --card-status
doskey ls=dir /b $*
doskey nsl=nslookup $*
doskey showaliases=doskey /m
doskey showpath=@echo %%PATH:;= ^& echo.%%
doskey x=exit
