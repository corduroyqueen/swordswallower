sprite = argument0
subimg = argument1

with ui_manager {
	
	draw_sprite_ext(
		sprite,
		subimg,
		player_obj.camx+850,
		player_obj.camy+100,
		1,1,0,c_white,1)
	
}