function falcon_add_vertex_buffer(source, x, y, z) {
    var vert = global.__falcon_combine_vertices;
    var data = global.__falcon_combine_data;
    var tell_vert = buffer_tell(global.__falcon_combine_vertices);
    var tell_data = buffer_tell(global.__falcon_combine_data);
    var size_vert = buffer_get_size(global.__falcon_combine_vertices);
    var size_data = buffer_get_size(global.__falcon_combine_data);
    var size_source = buffer_get_size(source);
    
    if (tell_vert + size_source > size_vert || tell_data + 3 > size_data) {
        falcon_end();
        falcon_begin();
        tell_vert = 0;
    }
    
    buffer_write(data, buffer_f32, x);
    buffer_write(data, buffer_f32, y);
    buffer_write(data, buffer_f32, z + 32 * dsin(current_time / 16 + x + y));
    buffer_copy(source, 0, size_source, vert, tell_vert);
    buffer_seek(vert, buffer_seek_relative, size_source);
}