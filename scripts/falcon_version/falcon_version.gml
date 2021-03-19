function falcon_version() {
    static dll_ref = external_define(FALCON_DLL, "falcon_version", FALCON_CALLTYPE, ty_string, 0);
    show_debug_message("Falcon GML version: " + FALCON_VERSION);
    show_debug_message("Falcon DLL version: " + external_call(dll_ref));
}

falcon_version();