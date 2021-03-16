function vertex_buffer_push(vbuff, source, position) {
    for (var i = 0, n = buffer_get_size(source); i < n; i += 36) {
        var xx = buffer_peek(source, i + 00, buffer_f32) + position.x;
        var yy = buffer_peek(source, i + 04, buffer_f32) + position.y;
        var zz = buffer_peek(source, i + 08, buffer_f32) + position.z;
        var nx = buffer_peek(source, i + 12, buffer_f32);
        var ny = buffer_peek(source, i + 16, buffer_f32);
        var nz = buffer_peek(source, i + 20, buffer_f32);
        var xt = buffer_peek(source, i + 24, buffer_f32);
        var yt = buffer_peek(source, i + 28, buffer_f32);
        var c  = buffer_peek(source, i + 32, buffer_u32);
        vertex_position_3d(vbuff, xx, yy, zz);
        vertex_normal(vbuff, nx, ny, nz);
        vertex_texcoord(vbuff, xt, yt);
        vertex_colour(vbuff, c & 0xffffff, (c >> 24) / 0xff);
    }
}

function vertex_buffer_push_dll(vbuff, source, position, addr) {
    static dll_name = "Fast3DStuff.dll";
    static dll_calltype = dll_cdecl;
    static ref_setup = external_define(dll_name, "vertex_set_position", dll_calltype, ty_real, 3, ty_real, ty_real, ty_real);
    static ref = external_define(dll_name, "vertex_buffer_combine", dll_calltype, ty_real, 4, ty_string, ty_string, ty_real, ty_real);
    external_call(ref_setup, position.x, position.y, position.z);
    return external_call(ref, buffer_get_address(vbuff), buffer_get_address(source), buffer_get_size(source), addr);
}