@echo off

doskey cd=cd /d $*
doskey g=git $*
doskey ls=dir /b $*
doskey showaliases=doskey /m
doskey showpath=@echo %%PATH:;= ^& echo.%%
