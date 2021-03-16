/// @description draw the user interface

draw_set_font(fnt_game);
draw_text(32, 32, "FPS: " + string(fps));
draw_text(32, 64, "Real: " + string(fps_real));
draw_text(32, 96, "Average: " + string(fps_total / frames));
draw_text(32, 128, "Tree count: " + string(TREE_COUNT));