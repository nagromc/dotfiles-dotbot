@echo off

doskey cd=cd /d $*
doskey ls=dir /b $*
doskey showaliases=doskey /m
doskey showpath=@echo %%PATH:;= ^& echo.%%
