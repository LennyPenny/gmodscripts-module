gmodscripts-module
==================

A module for downloading and mounting stuff from gmodscripts-site.

It doesn't currently do any of that... Right now it just creates a directory and adds it to the game search path. It should probably be loaded by the menu context. The name "gargamel" is temporary.

Setup
--------
Requirements: 
- premake5 (You can just throw the executable in there if you want...)
- Source SDK (By default it assumes Valve's [source-sdk-2013](https://github.com/ValveSoftware/source-sdk-2013) repository is cloned in the same directory as this repository. You can change this later.)
- Visual Studio 2013 (For windows, not tested on other platforms.)

Instructions: 

1. Run premake.bat once.
4. Build with Visual Studio.
5. Place the .dll in garrysmod/lua/bin/
6. Add 'require("gargamel")' to garrysmod/lua/menu/menu.lua to load the module on startup.
