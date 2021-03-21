function falcon_version() {
    show_debug_message("Falcon GML version: " + FALCON_VERSION);
    show_debug_message("Falcon DLL version: " + __falcon_version());
}

falcon_version();