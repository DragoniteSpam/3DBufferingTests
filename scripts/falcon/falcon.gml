#macro FALCON_DLL "Falcon.dll"
#macro FALCON_CALLTYPE dll_cdecl
#macro FALCON_VERSION "1.0.1"

global.__falcon_combine_vertices = buffer_create(512000, buffer_fast, 1);
global.__falcon_combine_data = buffer_create(1000 * 3, buffer_grow, 4);
global.__falcon_combine_format = undefined;

// default vertex format, just in case
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();
falcon_set_vertex_format(vertex_format_end());
falcon_set_vertex_size(36);