function falcon_end() {
    var vert = global.__falcon_combine_vertices;
    var data = global.__falcon_combine_data;
    var tell_vert = buffer_tell(vert);
    var tell_data = buffer_tell(data);
    if (tell_vert > 0) {
        static ref = external_define(FALCON_DLL, "falcon_combine", FALCON_CALLTYPE, ty_real, 3, ty_string, ty_string, ty_real);
        external_call(ref, buffer_get_address(vert), buffer_get_address(data), tell_data / 16);
        var vb_combine = vertex_create_buffer_from_buffer_ext(vert, vertex_format, 0, tell_vert / 36);
        vertex_submit(vb_combine, pr_trianglelist, sprite_get_texture(spr_tree, 0));
        vertex_delete_buffer(vb_combine);
    }
}