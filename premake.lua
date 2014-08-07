require("config.lua")

local module_name = "gargamel"

local os_names = {windows="win32",macosx="osx",linux="linux"}

solution("gmodscripts-module")
	language("C++")
	location("proj-"..os.get() .."-".._ACTION)
	flags{"Symbols","NoEditAndContinue","NoPCH","StaticRuntime","EnableSSE"}
	kind("SharedLib")

	defines{"GMMODULE"}

	includedirs{"include/",config.source_sdk_dir.."mp/src/public/"}

	libdirs{config.source_sdk_dir.."mp/src/lib/public/"}
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
	targetname("gmsv_"..module_name.."_"..os_names[os.get()])

	configurations{ 
		"Release"
	}
	
	configuration("Release")
		defines{"NDEBUG"}
		flags{"Optimize","FloatFast"}

	project("gmodscripts-module")
		files{"src/**.*","include/**.*"}