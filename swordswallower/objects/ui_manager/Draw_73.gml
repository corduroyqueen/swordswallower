/// @description Insert description here
// You can write your code in this editor



//draw_sprite(scary_skull,0,
//	global.mousepx,
//	global.mousepy)



/// @description Insert description here
// You can write your code in this editor

camx = camera_get_view_x(view_camera[0])
camy = camera_get_view_y(view_camera[0])



if !player_obj.intro {
//draw_sprite_ext(healthbar,0,camx+10,camy+10,210,1,0,c_gray,1)
//draw_sprite_ext(healthbar,0,camx+15,camy+15,player_obj.hp*2,0.85,0,c_green,1)
}
//cool_list = ds_list_create()
//draw_surface(art_surface_setter.art_surface,player_obj.camx,player_obj.camy)
if player_obj.death {
	//draw_text(camera_get_view_x(view_camera[0])+560,camera_get_view_y(view_camera[0])+315,"Press T to respawn.")
	//draw_text(camera_get_view_x(view_camera[0])+550,camera_get_view_y(view_camera[0])+330,"Press T to start over.")
}

if speaking {
	//sdm("speek")
	
	if current_dialogue == "end" {
		//sdm("lellllllllllllllllllllllllllllllllllllllll")
		speaking = false	
		printing = false
		current_dialogue = ""
		global.display_txt = ""
		global.tboxActive = false;
	    txt = global.txtCache;
	    global.txtCache = "";
		
		txt = global.placeholderTxt;
	    global.placeholderTxt = "";
	    global.temp_placeholderTxt = "";
	    global.txtIndex = 1;
	    global.maxPrintTimer = txtSpeed;
		printing = false
	} else {
		//sdm("ok fuck")
		scr_textbox(current_dialogue, font1, player_obj.k_speak_p, 0.1)	
	}
}

	//draw_sprite(scary_skull,0,player_obj.camx+40,player_obj.camy+40)




//draw_circle(tail_obj.x+tail_hilt_x,tail_obj.y+tail_hilt_y,5,false)
//draw_circle(tail_obj.x,tail_obj.y,5,true)

if player_obj.death {
	//draw_set_color( make_color_rgb(255 * level1_master.blood_cr,255  * level1_master.blood_cg,255  * level1_master.blood_cb) )
	//draw_set_color(c_white)
	draw_set_color(player_obj.blood_color)
	draw_set_alpha(0.8)
	
	//zero zero : black
	//one zero: red rect
	//zero one : normal
	//gpu_set_colorwriteenable(true,true,true,true);
	// dark
	//gpu_set_blendmode_ext(bm_zero,bm_dest_color)

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
	
	if player_obj.death { 
		//with art_surface_setter {
		//	tex_art = surface_get_texture(art_surface)
		//	texture_set_stage(shader_art_surface, tex_art);
		//	if !player_obj.death {
		//		gpu_set_colorwriteenable(true, true, true, false);
		//	} else {
		//		gpu_set_colorwriteenable(true, true, true, true);
		//	}
		//	//shader_set(shader_alpha_one)
		//	//gpu_set_blendenable(true)
		//	draw_surface(art_surface,player_obj.camx,player_obj.camy)
		//	//gpu_set_blendenable(true)
		//	//shader_reset()

		//	shader_set(shader_blood_alpha_surface)
		//	shader_set_uniform_f(u_blood_r2,global.blood_cr)
		//	shader_set_uniform_f(u_blood_g2,global.blood_cg)
		//	shader_set_uniform_f(u_blood_b2,global.blood_cb)
		//	draw_surface(blood_splat_surface,player_obj.camx,player_obj.camy)
		//	shader_reset()
		//}
	}
	//gpu_set_colorwriteenable(true,true,true,true);
	if player_obj.respawn_timer>58 {
		draw_sprite(player_obj.deathParticles,0,player_obj.deathx,player_obj.deathy)
		
		shader_set(shader_blood_alpha)
		u_blood_var = 4
		shader_set_uniform_f(u_blood_trans,u_blood_var)
		shader_set_uniform_f(u_blood_r,global.blood_cr)
		shader_set_uniform_f(u_blood_g,global.blood_cg)
		shader_set_uniform_f(u_blood_b,global.blood_cb)
		//draw_sprite(player_obj.deathParticles2,0,player_obj.deathx,player_obj.deathy)
		shader_reset()
	}
	

} else if !player_obj.ending_lock {
	
	draw_set_font(font2)
	//draw_text(player_obj.camx+20,player_obj.camy+20,string(player_obj.gems))	
	if player_obj.k_dash || player_obj.k_fire {
		//draw_set_color(c_dkgray)
	} else {
		//draw_set_color(c_ltgray)
	}
	
	if input_controller.controller == input_controller.controller_ds4 {
		mouse_ui_x = lerp(mouse_ui_x,global.mousepx,0.2)
		mouse_ui_y = lerp(mouse_ui_y,global.mousepy,0.2)
	} else if input_controller.controller == input_controller.controller_keyboard {
		mouse_ui_x = mouse_x
		mouse_ui_y = mouse_y
	}
	//if !keyboard_check_pressed(ord("V")) {
		//draw_sprite(mouse_ui_spr,player_obj.k_dash || player_obj.k_fire,mouse_ui_x,mouse_ui_y)
	//}
	draw_circle(mouse_ui_x,mouse_ui_y,9,false)
	draw_set_color(c_white)
	
	//draw_sprite_ext(sword5,0,global.mousepx,global.mousepy,0.5,0.5,point_direction(player_obj.x,player_obj.y,global.mousepx,global.mousepy)-90,c_white,1)
} else {
	
}

//if player_obj.ckpt_place_timer>0 && !position_meeting(player_obj.x,player_obj.y,checkpoint_manager.checkpoint) {
//	draw_sprite_ext(statue3,0,player_obj.x,player_obj.y,current_time % 2, 1,0,c_white,1)	
//} else if player_obj.ckpt_place_timer>0 {
//	draw_sprite_ext(statue3,0,checkpoint_manager.checkpoint.x,checkpoint_manager.checkpoint.y,current_time % 2, 1,0,c_red,1)	
//}

//with player_sprite_obj {
//	draw_set_color(c_red)
//	draw_circle(player_sprite_obj.sword_tx,player_sprite_obj.sword_ty,10,false)
	
//	draw_set_color(c_white)
//	draw_circle(arm_hand_x - 150 + player_obj.x //+ arm_hand_x
//	,
//	arm_hand_y - 150 + player_obj.y// + arm_hand_y
//	,
//	7,false)

//}

/*
if show_checkpoints {
	
	//draw_text_transformed(player_obj.x-5,player_obj.y-70,level1_master.available_checkpoints,1,1,0)
		
	
	if level1_master.available_checkpoints>0 {
		tempcolor = c_fuchsia	
	} else {
		tempcolor = c_ltgray
	}
	px = player_obj.x - player_obj.hsp
	py = player_obj.y - player_obj.vsp
	
	draw_set_color(tempcolor)
	draw_ellipse(px-8,py-52,px+8,py-42,false)
	draw_set_color(c_black)
	draw_ellipse(px-4,py-49,px+4,py-45,false)
	draw_set_color(c_white)
	
	
}*/
//draw_sprite(red_pointer,0,
//player_obj.tail_dest_x,
//player_obj.tail_dest_y)

/*
draw_sprite(red_pointer,0,
player_obj.x + cos(degtorad(player_obj.ang1))*50,
player_obj.y + sin(degtorad(player_obj.ang1))*50)

draw_sprite(red_pointer,0,
player_obj.x + cos(degtorad(player_obj.ang2))*50,
player_obj.y + sin(degtorad(player_obj.ang2))*50)

draw_sprite(red_pointer,0,
player_obj.x + cos(degtorad(180-player_obj.ang1))*50,
player_obj.y + sin(degtorad(180-player_obj.ang1))*50)

draw_sprite(red_pointer,0,
player_obj.x + cos(degtorad(180-player_obj.ang2))*50,
player_obj.y + sin(degtorad(180-player_obj.ang2))*50)


draw_circle(bbox_right,y,4,false)
draw_circle(bbox_left,y,4,false)


with player_obj {
	draw_circle(bbox_right,y,4,false)
	draw_circle(bbox_left,y,4,false)	
	draw_circle(x,bbox_bottom,4,false)
	draw_circle(x,bbox_top,4,false)	
}

with tail_obj {
	draw_circle(bbox_right,y,4,false)
	draw_circle(bbox_left,y,4,false)
	draw_circle(x,bbox_bottom,4,false)
	draw_circle(x,bbox_top,4,false)	
	
	
}