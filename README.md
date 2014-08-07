gmodscripts-module
==================

A module for downloading and mounting stuff from gmodscripts-site.

It doesn't currently do any of that... Right now it just creates a directory and adds it to the game search path. It should probably be loaded by the menu context. The name "gargamel" is temporary. I'll be taking a break from this and prototyping some kind of git downloader in lua.

Requires premake4. You also need the source sdk. You can configure where it is located in config.lua after running premake.bat once. Only tested on windows and could only get it to build with VS 2010 SP1.

-- Parakeet
