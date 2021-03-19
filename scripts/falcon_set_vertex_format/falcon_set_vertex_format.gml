function falcon_set_vertex_format(format) {
    falcon_end();
    global.__falcon_combine_format = format;
    falcon_begin();
}