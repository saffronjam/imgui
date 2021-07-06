---@diagnostic disable: undefined-global

local function GetBasePath()
	return debug.getinfo(1).source:match("@?(.*/)")
end

local module = {}

module.Project = "ImGui"
module.Include = function ()
	includedirs {
		GetBasePath() .. "source"
	}
end
module.Link = function ()
	links {
		module.Project
	}
end

project (module.Project)
    kind "StaticLib"
    language "C++"
    staticruntime("On")

	targetdir (OutBin)
	objdir (OutObj)
	location (OutLoc)

	files {
        "source/imconfig.h",
		"source/imgui.cpp",
		"source/imgui.h",
		"source/imgui_demo.cpp",
		"source/imgui_draw.cpp",
		"source/imgui_internal.h",
		"source/imgui_tables.cpp",
		"source/imgui_widgets.cpp",
		"source/imstb_rectpack.h",
		"source/imstb_textedit.h",
		"source/imstb_truetype.h"
    }

    includedirs {
        "source"
    }

	filter "configurations:Debug"
		defines { "DEBUG" }
		symbols "On"

	filter "configurations:Release or Dist"
		defines { "NDEBUG" }
		optimize "On"

return module
