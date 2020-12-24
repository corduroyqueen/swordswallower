/// @description Insert description here
// You can write your code in this editor


//
//if event_type == ev_draw
//   {
//   if event_number == 0
//      {
//		surface_set_target(art_surface)
//      }
//   }
   
//


//surface_set_target(blood_splat_surface);
//surface_set_target(blood_surface)
//draw_clear_alpha($FF7F7F, 1);
//gpu_set_colofrwriteenable(true,true,true,false)
//draw_sprite(scary_skull,0,50,50)

//draw_clear_alpha(c_white,0)

//gpu_set_blendenable(false)
//gpu_set_colorwriteenable(false,false,false,true);
//draw_set_alpha(0);
//draw_rectangle(0,0, 1920,1080, false);

//draw_set_alpha(1);
//draw_surface(art_surface,0,0)
//gpu_set_blendenable(true);
//gpu_set_colorwriteenable(true,true,true,true);

//draw_clear_alpha(c_white,0)
	
//shader_set(shader_blood_alpha)
//gpu_set_colofrwriteenable(true,true,true,true)
////draw_sprite(blood_sprite_spr,0,250,250)
//draw_sprite(blood_sprite_spr,0,600,250)

//gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
//gpu_set_alphatestenable(true);

//var cx =player_obj.camx
//var cy =player_obj.camy
////gpu_set_colorwriteenable(true,true,true,false)
////var spal
//for (i=0;i<ds_list_size(splat_list_x);i++) {
	
//	draw_sprite_ext(blood_splat_lel1,0,
//	splat_list_x[| i]-cx,splat_list_y[| i]-cy,
//	splat_list_s[| i],splat_list_s[| i],splat_list_rot[| i],c_white,1)
//	if point_distance(splat_list_x[| i],splat_list_y[| i],player_obj.x,player_obj.y)>2000 {
//		ds_list_delete(splat_list_x,i)	
//		ds_list_delete(splat_list_y,i)	
//		ds_list_delete(splat_list_rot,i)	
//		ds_list_delete(splat_list_s,i)	
		
//	}
//}

//gpu_set_alphatestenable(false);
//gpu_set_blendmode(bm_normal);
//shader_reset()
//gpu_set_colorwriteenable(true,true,true,true)
//surface_reset_target()

surface_set_target(light_surface)
draw_clear_alpha(c_black,0)
draw_lights()
surface_reset_target()


//tex_art = surface_get_texture(art_surface)
//texture_set_stage(shader_art_surface, tex_art);
if !player_obj.death {
	gpu_set_colorwriteenable(true, true, true, false);
	
} else {
	gpu_set_colorwriteenable(true, true, true, true);
	//gpu_set_blendmode_ext(bm_one,bm_inv_dest_color)
}
//if keyboard_check(ord("P")) {
//	gpu_set_colorwriteenable(true, true, true, false);
//} else {
//	gpu_set_colorwriteenable(true, true, true, true);
//}

//shader_set(shader_alpha_one)
//gpu_set_blendenable(true)
draw_surface(art_surface,player_obj.camx,player_obj.camy)
//gpu_set_blendenable(true)
//shader_reset()



tex_art = surface_get_texture(art_surface)
texture_set_stage(shader_art_surface, tex_art);
shader_set(shader_blood_alpha_surface)
shader_set_uniform_f(u_blood_r2,global.blood_cr)
shader_set_uniform_f(u_blood_g2,global.blood_cg)
shader_set_uniform_f(u_blood_b2,global.blood_cb)
draw_surface(blood_splat_surface,player_obj.camx,player_obj.camy)

shader_reset()


gpu_set_blendmode(bm_add)
texture_set_stage(shader_art_surface2, tex_art);
shader_set(shader_light_alpha_surface)
draw_surface(light_surface,player_obj.camx,player_obj.camy)
shader_reset()
gpu_set_blendmode(bm_normal)


//gpu_set_blendmode(bm_normal)

gpu_set_colorwriteenable(true, true, true, true)
//gpu_set_blendenable(true)

//draw_surface(blood_splat_surface,player_obj.camx,player_obj.camy)

surface_set_target(art_surface)
if !player_obj.death || player_obj.respawn_timer>58 {
	draw_clear_alpha(c_black,0)
	
}
//draw_set_color(c_black)

//draw_rectangle(0,0,1920,1080,false)
//draw_set_color(c_white)
surface_reset_target()



draw_set_color(c_black)
if level1_master.in_void {
	void_black_rect_a+=0.025
} else {
	void_black_rect_a-=0.025
}
void_black_rect_a = clamp(void_black_rect_a,0.00,1.00)
gpu_set_colorwriteenable(true, true, true, true)

if void_black_rect_a>0 {
	draw_set_alpha(void_black_rect_a)
	draw_rectangle(player_obj.camx,player_obj.camy,player_obj.camx+1920,player_obj.camy+1080,false)
	draw_set_alpha(1)
	draw_set_color(c_white)
	
	with player_sprite_obj {
		event_user(0)
	}
	with tutorial_text_obj {
		event_user(1)
	}
}




draw_set_color(c_white)
if level1_master.in_void {
	
	with tail_obj {
		if !player_obj.tail_carry {
			event_user(0)
		}
	}
	with powerup_bug_obj {
		if mask_index!=blank_collision {
			draw_sprite(sprite_index,image_index,x,y)
		} else {
			event_user(0)
		}
	}
	
	
}
	
//draw_surface(art_surface,player_obj.camx,player_obj.camy)