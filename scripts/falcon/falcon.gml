#macro FALCON_DLL "Falcon.dll"
#macro FALCON_CALLTYPE dll_cdecl
#macro FALCON_VERSION "1.0.1"

global.__falcon_combine_vertices = buffer_create(512000, buffer_fast, 1);
global.__falcon_combine_data = buffer_create(1000 * 3, buffer_grow, 4);
global.__falcon_combine_format = undefined;