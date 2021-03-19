function falcon_set_vertex_size(bytes) {
    static ref = external_define(FALCON_DLL, "set_vertex_size", FALCON_CALLTYPE, ty_real, 1, ty_real);
    external_call(ref, bytes div 4);
}