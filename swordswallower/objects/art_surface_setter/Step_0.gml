/// @description Insert description here
// You can write your code in this editor
if !surface_exists(art_surface) {
	art_surface = surface_create(1920,1080)
}



lay_id = layer_get_id("level_art");
layer_x(lay_id,-player_obj.camx)
layer_y(lay_id,-player_obj.camy)

lay_id = layer_get_id("foreground");
layer_x(lay_id,-player_obj.camx)
layer_y(lay_id,-player_obj.camy)

lay_id = layer_get_id("inside_wall_art");
layer_x(lay_id,-player_obj.camx)
layer_y(lay_id,-player_obj.camy)

lay_id = layer_get_id("solid_color");
layer_x(lay_id,-player_obj.camx)
layer_y(lay_id,-player_obj.camy)

lay_id = layer_get_id("misc");
layer_x(lay_id,-player_obj.camx)
layer_y(lay_id,-player_obj.camy)