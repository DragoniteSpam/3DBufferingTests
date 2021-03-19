function falcon_begin() {
    var vert = global.__falcon_combine_vertices;
    var data = global.__falcon_combine_data;
    buffer_seek(vert, buffer_seek_start, 0);
    buffer_seek(data, buffer_seek_start, 0);
}