/// @description Insert description here
// You can write your code in this editor



//draw_sprite(scary_skull,0,
//	global.mousepx,
//	global.mousepy)

if player_obj.death {
	draw_set_color(c_red)
	draw_set_alpha(0.8)
	
	//zero zero : black
	//one zero: red rect
	//zero one : normal
	//gpu_set_colorwriteenable(true,true,true,true);
	// dark
	gpu_set_blendmode_ext(bm_zero,bm_dest_color)

	//tinted dark
	gpu_set_blendmode_ext(bm_dest_color,bm_dest_color)

	//tinted
	//gpu_set_blendmode_ext(bm_dest_color,bm_one)
	
//gpu_set_blendmode_ext(bm_dest_color,bm_zero)
//gpu_set_blendmode_ext(bm_zero,bm_src_color)
	//blue
	//gpu_set_blendmode_ext(bm_src_alpha_sat,bm_inv_src_color)

	//blue
	//gpu_set_blendmode_ext(bm_inv_src_color,bm_src_alpha_sat)
	if player_obj.respawn_timer<2 {
		gpu_set_blendmode(bm_normal)
	} else {
		draw_set_alpha(0.1)
	}
	
	draw_rectangle(
		player_obj.camx,
		player_obj.camy,
		player_obj.camx + player_obj.cam_width,
		player_obj.camy + player_obj.cam_height,
		false
	)
	
	gpu_set_blendmode(bm_normal)
	draw_set_color(c_white)
	draw_set_alpha(1)
	//gpu_set_colorwriteenable(true,true,true,true);
	if player_obj.respawn_timer>58 {
		draw_sprite(player_obj.deathParticles,0,player_obj.deathx,player_obj.deathy)
	}
	

} else if !player_obj.ending_lock {
	
	draw_set_font(font2)
	draw_text(player_obj.camx+20,player_obj.camy+20,string(player_obj.gems))	
	draw_set_color(c_ltgray)
	draw_circle(global.mousepx,global.mousepy,9,false)
	draw_set_color(c_white)
	
	//draw_sprite_ext(sword5,0,global.mousepx,global.mousepy,0.5,0.5,point_direction(player_obj.x,player_obj.y,global.mousepx,global.mousepy)-90,c_white,1)
} else {
	
}

if player_obj.ckpt_place_timer>0 && !position_meeting(player_obj.x,player_obj.y,checkpoint_manager.checkpoint) {
	draw_sprite_ext(statue3,0,player_obj.x,player_obj.y,current_time % 2, 1,0,c_white,1)	
} else if player_obj.ckpt_place_timer>0 {
	draw_sprite_ext(statue3,0,checkpoint_manager.checkpoint.x,checkpoint_manager.checkpoint.y,current_time % 2, 1,0,c_red,1)	
}
/*
if show_checkpoints {
	
	//draw_text_transformed(player_obj.x-5,player_obj.y-70,level1_master.available_checkpoints,1,1,0)
		
	
	if level1_master.available_checkpoints>0 {
		tempcolor = c_fuchsia	
	} else {
		tempcolor = c_ltgray
	}
	px = player_obj.x - player_obj.hspeed
	py = player_obj.y - player_obj.vspeed
	
	draw_set_color(tempcolor)
	draw_ellipse(px-8,py-52,px+8,py-42,false)
	draw_set_color(c_black)
	draw_ellipse(px-4,py-49,px+4,py-45,false)
	draw_set_color(c_white)
	
	
}*/
//draw_sprite(red_pointer,0,
//player_obj.tail_dest_x,
//player_obj.tail_dest_y)
