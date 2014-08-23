@echo off
echo Generating Windows project...
premake5 --os=windows --file=buildProjects.lua vs2013
echo.
echo Generating Mac project...
premake5 --os=macosx --file=buildProjects.lua gmake
echo.
echo Generating Linux project...
premake5 --os=linux --file=buildProjects.lua gmake
echo.
pause