add_rules("mode.debug", "mode.release")
set_encodings("utf-8")
set_warnings("all")
set_languages("cxx17")
set_toolchains("msvc")

-- Visual Studio 2026 MSVC include/lib paths
-- Uses v143 (14.44.35207) stable toolchain; change to 14.50.35717 for v145 preview
local msvc_ver = "14.44.35207"
local winsdk_ver = "10.0.26100.0"
local vs_base = "C:/Program Files/Microsoft Visual Studio/18/Community/VC/Tools/MSVC/" .. msvc_ver
local winsdk_base = "C:/Program Files (x86)/Windows Kits/10"

local exercises = {
    -- {target_name, source_dir}
    {"exercise00", "00_hello_world"},
    {"exercise01", "01_variable&add"},
    {"exercise02", "02_function"},
    {"exercise03", "03_argument&parameter"},
    {"exercise04", "04_static"},
    {"exercise05", "05_constexpr"},
    {"exercise06", "06_array"},
    {"exercise07", "07_loop"},
    {"exercise08", "08_pointer"},
    {"exercise09", "09_enum&union"},
    {"exercise10", "10_trivial"},
    {"exercise11", "11_method"},
    {"exercise12", "12_method_const"},
    {"exercise13", "13_class"},
    {"exercise14", "14_class_destruct"},
    {"exercise15", "15_class_clone"},
    {"exercise16", "16_class_move"},
    {"exercise17", "17_class_derive"},
    {"exercise18", "18_class_virtual"},
    {"exercise19", "19_class_virtual_destruct"},
    {"exercise20", "20_function_template"},
    {"exercise21", "21_runtime_datatype"},
    {"exercise22", "22_class_template"},
    {"exercise23", "23_template_const"},
    {"exercise24", "24_std_array"},
    {"exercise25", "25_std_vector"},
    {"exercise26", "26_std_vector_bool"},
    {"exercise27", "27_strides"},
    {"exercise28", "28_std_string"},
    {"exercise29", "29_std_map"},
    {"exercise30", "30_std_unique_ptr"},
    {"exercise31", "31_std_shared_ptr"},
    {"exercise32", "32_std_transform"},
    {"exercise33", "33_std_accumulate"},
}

for _, ex in ipairs(exercises) do
    target(ex[1])
        set_kind("binary")
        add_includedirs(vs_base .. "/include")
        add_includedirs(winsdk_base .. "/Include/" .. winsdk_ver .. "/ucrt")
        add_includedirs(winsdk_base .. "/Include/" .. winsdk_ver .. "/shared")
        add_includedirs(winsdk_base .. "/Include/" .. winsdk_ver .. "/um")
        add_linkdirs(vs_base .. "/lib/x64")
        add_linkdirs(winsdk_base .. "/Lib/" .. winsdk_ver .. "/ucrt/x64")
        add_linkdirs(winsdk_base .. "/Lib/" .. winsdk_ver .. "/um/x64")
        add_files(ex[2] .. "/main.cpp")
end
