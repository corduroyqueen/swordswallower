/// @description Insert description here
// You can write your code in this editor
var size = ds_list_size(player_positions_x)
//sdm(player_obj.zoom_timer_bool)
//sdm(player_obj.zoom_hitbox_active)
if player_obj.zoom_timer<20 && player_obj.zoom_timer_bool {
	ds_list_add(player_positions_x,player_obj.x)	
	ds_list_add(player_positions_y,player_obj.y)	
	life_timer=0
} else {
	if size>1 {
		life_timer++
		if life_timer>25 {
			life_timer=0
			ds_list_clear(player_positions_x)	
			ds_list_clear(player_positions_y)
			size = ds_list_size(player_positions_x)
		}
	}
}

if size>1 {
	draw_set_color(global.magic_color)
	draw_set_alpha(0.5 - life_timer/25)
	
	for(u=0;u<size-1;u++) {
		sdm(player_positions_x[| u])
		draw_line_width(
			player_positions_x[| u],
			player_positions_y[| u],
			player_positions_x[| (u+1)],
			player_positions_y[| (u+1)],
			6)	
		
	}
	draw_set_color(c_white)
	draw_set_alpha(1)
	
}