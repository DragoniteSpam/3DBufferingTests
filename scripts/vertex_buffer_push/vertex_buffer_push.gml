function vertex_buffer_push_dll(vbuff, source, position, addr) {
    static dll_name = "Fast3DStuff.dll";
    static dll_calltype = dll_cdecl;
    static ref_setup = external_define(dll_name, "vertex_set_position", dll_calltype, ty_real, 3, ty_real, ty_real, ty_real);
    static ref = external_define(dll_name, "vertex_buffer_combine", dll_calltype, ty_real, 4, ty_string, ty_string, ty_real, ty_real);
    buffer_copy(source, 0, buffer_get_size(source), vbuff, addr);
    external_call(ref_setup, position.x, position.y, position.z + 32 * dsin(current_time / 16 + position.x + position.y));
    return external_call(ref, buffer_get_address(vbuff), buffer_get_address(source), buffer_get_size(source), addr);
}

function vertex_buffer_push_combine(vbuff, position_buffer) {
    static dll_name = "Fast3DStuff.dll";
    static dll_calltype = dll_cdecl;
    static ref = external_define(dll_name, "vertex_buffer_combine_single", dll_calltype, ty_real, 3, ty_string, ty_string, ty_real);
    return external_call(ref, buffer_get_address(vbuff), buffer_get_address(position_buffer), TREE_COUNT);
}