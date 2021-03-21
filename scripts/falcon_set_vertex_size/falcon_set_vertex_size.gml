function falcon_set_vertex_size(bytes) {
    // being able to calculate this directly based on vertex format would be
    // nice, but alas
    __falcon_set_vertex_size(bytes div 4);
}