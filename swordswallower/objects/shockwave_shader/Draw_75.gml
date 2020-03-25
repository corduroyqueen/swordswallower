/// @description Insert description here
// You can write your code in this editor
surface_reset_target();
draw_surface(GUI,0,0); //draw gui to game!

surface_set_target(application_surface);
draw_surface(GUI,0,0);
surface_reset_target();