---@diagnostic disable: undefined-global

OutputDirectory = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}/"
BasePath = debug.getinfo(1).source:match("@?(.*/)")

module = {}

module.Project = "ImGui"
module.Include = {
	BasePath .. "source"
}

project (module.Project)
    kind "StaticLib"
    language "C++"
    staticruntime "on"
	
	targetdir (_MAIN_SCRIPT_DIR .. "/Build/Bin/" .. OutputDirectory .. "%{prj.name}")
	objdir (_MAIN_SCRIPT_DIR .. "/Build/Obj/" .. OutputDirectory .. "%{prj.name}")
	
	location (_MAIN_SCRIPT_DIR .. "/Build")

	files
	{
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


    
	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		runtime "Release"
		optimize "on"

return module