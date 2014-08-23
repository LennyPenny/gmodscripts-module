assert(os.getenv("SOURCE_SDK"), "SOURCE_SDK environmental variable not set")
local SOURCE_SDK = os.getenv("SOURCE_SDK") .. "mp/src/"

local GMOD_FOLDER -- You could set this to your Garry's Mod folder so that it copies the DLL there.


local module_name = "gargamel"

local os_names = {windows="win32",macosx="osx",linux="linux"}

local function setTarget(targetName)
	targetname(targetName)
	if os.get()=="windows" and GMOD_FOLDER then
		postbuildcommands{"move /Y ..\\build\\windows\\"..targetName..'.dll "'..GMOD_FOLDER..'"'}
	end
end

solution("gmodscripts-module")
language("C++")
kind("SharedLib")
location("proj-"..os.get() .."-".._ACTION)

defines{"GMMODULE"}
flags{"Symbols","NoEditAndContinue","NoPCH","StaticRuntime"}
linkoptions {"/NODEFAULTLIB:libcmt"}

	--From relese config
	defines{"NDEBUG"}

	includedirs{"include/",SOURCE_SDK.."public/"}

	libdirs{SOURCE_SDK .. "lib/public"}
	links{ --Not sure what libs we need. Will it hurt to link to them all?
	"appframework",
	"bitmap",
	"choreoobjects",
	"dmxloader",
	"fgdlib",
	"libprotobuf",
	"libz",
	"mathlib",
	"matsys_controls",
	"nvtristrip",
	"particles",
	"raytrace",
	"shaderlib",
	"steam_api",
	"tier0",
	"tier1",
	"tier2",
	"tier3",
	"vgui_controls",
	"vmpi",
	"vstdlib",
	"vtf"
}

targetdir("build/"..os.get().."/")

configurations{ 
"1-ServerModule","2-ClientModule"
}

configuration("1-ServerModule")
setTarget("gmsv_"..module_name.."_"..os_names[os.get()])
configuration("2-ClientModule")
setTarget("gmcl_"..module_name.."_"..os_names[os.get()])

project("gmodscripts-module")
files{"src/**.*","include/**.*"}
