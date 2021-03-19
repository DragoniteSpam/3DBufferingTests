function falcon_add_buffer(source, x, y, z) {
    var vert = global.__falcon_combine_vertices;
    var data = global.__falcon_combine_data;
    var tell_vert = buffer_tell(vert);
    var tell_data = buffer_tell(data);
    var size_vert = buffer_get_size(vert);
    var size_data = buffer_get_size(data);
    var size_source = buffer_get_size(source);
    
    if (tell_vert + size_source > size_vert) {
        falcon_end();
        falcon_begin();
        tell_vert = 0;
    }
    
    buffer_write(data, buffer_u32, size_source);
    buffer_write(data, buffer_f32, x);
    buffer_write(data, buffer_f32, y);
    buffer_write(data, buffer_f32, z);
    buffer_copy(source, 0, size_source, vert, tell_vert);
    buffer_seek(vert, buffer_seek_relative, size_source);
}