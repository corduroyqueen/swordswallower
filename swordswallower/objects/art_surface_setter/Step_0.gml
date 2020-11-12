/// @description Insert description here
// You can write your code in this editor
if !surface_exists(art_surface) {
	art_surface = surface_create(1920,1080)
}
if (!surface_exists(blood_splat_surface)) {
	blood_splat_surface = surface_create(1920,1080)
}
if (!surface_exists(light_surface)) {
	light_surface = surface_create(1920,1080)
}
if !surface_exists(ass_setter) {
	ass_setter = surface_create(1920,1080)
}

surface_set_target(art_surface)
if !player_obj.death || player_obj.respawn_timer>58 {
	draw_clear_alpha(c_black,0)
	
}
surface_reset_target()

var xp = -player_obj.camx
var yp = -player_obj.camy

if player_obj.x<27000 && player_obj.y>13000 {
	
	layer_x(lay_id_level_art_1,xp)
	layer_y(lay_id_level_art_1,yp)
	
	layer_x(lay_id_foreground_1,xp)
	layer_y(lay_id_foreground_1,yp)
	
	layer_x(lay_id_inside_wall_art_1,xp)
	layer_y(lay_id_inside_wall_art_1,yp)
	
	layer_x(lay_id_solid_color_1,xp)
	layer_y(lay_id_solid_color_1,yp)
	
	layer_x(lay_id_misc_1,xp)
	layer_y(lay_id_misc_1,yp)
} else if player_obj.y<5400 {
	layer_x(lay_id_level_art_3,xp)
	layer_y(lay_id_level_art_3,yp)
	
	layer_x(lay_id_inside_wall_art_3,xp)
	layer_y(lay_id_inside_wall_art_3,yp)
	
	layer_x(lay_id_solid_color_3,xp)
	layer_y(lay_id_solid_color_3,yp)
	
	layer_x(lay_id_misc_3,xp)
	layer_y(lay_id_misc_3,yp)
}

layer_x(lay_id_level_art_2,xp)
layer_y(lay_id_level_art_2,yp)
	
layer_x(lay_id_foreground_2,xp)
layer_y(lay_id_foreground_2,yp)
	
layer_x(lay_id_inside_wall_art_2,xp)
layer_y(lay_id_inside_wall_art_2,yp)
	
layer_x(lay_id_solid_color_2,xp)
layer_y(lay_id_solid_color_2,yp)
	
layer_x(lay_id_misc_2,xp)
layer_y(lay_id_misc_2,yp)

layer_x(lay_id_blood_splats,xp)
layer_y(lay_id_blood_splats,yp)

