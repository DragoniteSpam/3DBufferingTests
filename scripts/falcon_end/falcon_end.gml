function falcon_end() {
    var vert = global.__falcon_combine_vertices;
    var data = global.__falcon_combine_data;
    var tell_data = buffer_tell(data);
    if (tell_data > 0) {
        static dll_name = "Fast3DStuff.dll";
        static dll_calltype = dll_cdecl;
        static ref = external_define(dll_name, "vertex_buffer_combine_single", dll_calltype, ty_real, 3, ty_string, ty_string, ty_real);
        external_call(ref, buffer_get_address(vert), buffer_get_address(data), tell_data / 3);
        var vb_combine = vertex_create_buffer_from_buffer(vert, vertex_format);
        vertex_submit(vb_combine, pr_trianglelist, sprite_get_texture(spr_tree, 0));
        vertex_delete_buffer(vb_combine);
    }
}