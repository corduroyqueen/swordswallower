//fuck yes
//if(i<20) {
//	if !surface_exists(reflection_surface[i]) {
//		reflection_surface[i] = surface_create(4,4)	
//	}

//	surface_set_target(pieces_surfaces[i])
//} 
//draw_clear_alpha(c_white,0)


//draw_set_color(c_white)
//draw_set_alpha(1)

			
//gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
//gpu_set_alphatestenable(true);
			
			
//draw_sprite_ext(
//		player_sprite_obj.sprite_index,
//		player_sprite_obj.image_index,
//		player_obj.x-pieces_px[| i],
//		70,
//		player_sprite_obj.image_xscale,player_sprite_obj.image_yscale,
//		0,c_white,1)
	
//gpu_set_alphatestenable(false);
//gpu_set_blendmode(bm_normal);
			
			
//surface_reset_target()
if point_distance(x,y,player_obj.x,player_obj.y)<2000 && surface_exists(shockwave_shader.GUI) {
	draw_surface_part_ext(	shockwave_shader.GUI, x-250-player_obj.camx, y-194-player_obj.camy,
							152, 262, x+76, y-194,
							-1, 1,
							c_white, 1);	
}
			
draw_self()
dialogue_start_npc_script2(x-50,y - sprite_height/2 - 140)