#include <stdio.h>

#include "GarrysMod/Lua/Interface.h"

#include "Color.h"
#include "tier0/dbg.h"
#include "filesystem.h"
#include "tier2/fileutils.h"
#include "tier1/interface.h"

using namespace std;
using namespace GarrysMod::Lua;

//Credit to gm_io, I am a dumb pleb and have no idea what reinterpret_cast does.
#define LOADINTERFACE(_module_, _version_, _out_) Sys_LoadInterface(_module_, _version_, NULL, reinterpret_cast<void**>(& _out_ ))

IFileSystem* filesys;

Color gPrintColor = Color(0,255,100,255);
void gPrint(const char * fmt,...) {
	char buffer[1024];

	va_list args;
	va_start(args,fmt);

	vsprintf(buffer, fmt, args);

	va_end(args);

	ConColorMsg(gPrintColor,"[Gargamel] %s \n",buffer);
}

//Called when the goddamn module is opened
GMOD_MODULE_OPEN()
{
	gPrint("Module Started!");

	//Load the filesystem interface (goddamnit it took me so long to figure out they changed the name of the library)
	if (!LOADINTERFACE("FileSystem_Stdio",FILESYSTEM_INTERFACE_VERSION,filesys)) {
		gPrint("ERROR! Could not load filesystem interface!");
		return 1; //Does returning 1 here actually DO ANYTHING? Is it handled any differently?
	}

	//Make the directories
	if (!filesys->IsDirectory("gargamel","GAME"))
		filesys->CreateDirHierarchy("gargamel","GAME");

	if (!filesys->IsDirectory("gargamel/lua","GAME"))
		filesys->CreateDirHierarchy("gargamel/lua","GAME");

	//Add to path, this was a test, we can just mount stuff as legacy addons if we want or something.
	//Also, lua paths get reset every map change :/
	filesys->AddSearchPath("garrysmod/gargamel","GAME");
	filesys->AddSearchPath("garrysmod/gargamel/lua","lcl"); //Clientside L.U.A.
	filesys->AddSearchPath("garrysmod/gargamel/lua","lsv"); //Serverside L.U.A.

	//For downloads, we could probably use /steam/isteamhttp.h
	//Unless theres some reason not to/a better solution.

	return 0;
}

//Called when the goddamn module is closed
//Not sure if this ever gets called since we're running in the menu context
GMOD_MODULE_CLOSE()
{
	gPrint("Module Stopped!");
	return 0;
}