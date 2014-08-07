@echo off
If NOT exist config.lua (
	copy config.default.lua config.lua
	echo Setup config.lua. Edit it if necessary, then run again to generate projects.
	pause
	exit
)
echo Generating Windows project...
premake4 --os=windows --platform=x32 --file=premake.lua vs2010
echo Generating Mac project...
premake4 --os=macosx --platform=universal32 --file=premake.lua gmake
echo Generating Linux project...
premake4 --os=linux --platform=x32 --file=premake.lua gmake
pause