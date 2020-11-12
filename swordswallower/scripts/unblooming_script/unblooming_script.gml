//gpu_set_blendmode_ext(bm_zero, bm_inv_src_alpha)
gpu_set_blendmode_ext( bm_src_color, bm_inv_src_alpha)
//gpu_set_blendmode_ext(bm_inv_src_color, bm_inv_src_alpha)
//gpu_set_colorwriteenable(true,true,true,false)
if keyboard_check(ord("Z")) {
	gpu_set_blendmode_ext( bm_zero, bm_inv_src_alpha)
}
if instance_exists(bridgekeeper_obj) {
	with bridgekeeper_obj {
		draw_sprite_ext(sprite_index,image_index,x-player_obj.camx,y-player_obj.camy,image_xscale,image_yscale,0,c_white,1)
	}
}

if instance_exists(twojoints_obj) {
	//gpu_set_colorwriteenable(true,true,true,false)
	
	
	if instance_exists(twojoints_obj.rightarm) {
		with twojoints_obj.rightarm {
			if !destroy_arm {
				arm_w = 50
				draw_set_color(color)
				draw_set_alpha(image_alpha)

				draw_sprite_ext(boss_arm1,0,x-player_obj.camx,y-player_obj.camy,1,1,point_direction(x,y,seg_x[0],seg_y[0]),c_white,1)
				draw_sprite_ext(boss_arm2,0,seg_x[0]-player_obj.camx,seg_y[0]-player_obj.camy,1,1,point_direction(seg_x[0],seg_y[0],seg_x[1],seg_y[1]),c_white,1)
				draw_sprite_ext(boss_arm3,0,seg_x[1]-player_obj.camx,seg_y[1]-player_obj.camy,1,1,point_direction(seg_x[1],seg_y[1],seg_x[2],seg_y[2]),c_white,1)
				draw_set_color(c_white)
				draw_set_alpha(1)
			}
		}
	}
	with twojoints_obj {
		
		draw_sprite_ext(sprite_index,image_index,x-player_obj.camx,y-player_obj.camy,image_xscale,image_yscale,0,c_white,1)
		
	}
	if instance_exists(twojoints_obj.leftarm) {
		with twojoints_obj.leftarm {
			if !destroy_arm {
				arm_w = 50
				draw_set_color(color)
				draw_set_alpha(image_alpha)

				draw_sprite_ext(boss_arm1,0,x-player_obj.camx,y-player_obj.camy,1,1,point_direction(x,y,seg_x[0],seg_y[0]),c_white,1)
				draw_sprite_ext(boss_arm2,0,seg_x[0]-player_obj.camx,seg_y[0]-player_obj.camy,1,1,point_direction(seg_x[0],seg_y[0],seg_x[1],seg_y[1]),c_white,1)
				draw_sprite_ext(boss_arm3,0,seg_x[1]-player_obj.camx,seg_y[1]-player_obj.camy,1,1,point_direction(seg_x[1],seg_y[1],seg_x[2],seg_y[2]),c_white,1)
				draw_set_color(c_white)
				draw_set_alpha(1)
			}
		}
	}
	if instance_exists(twojoints_head_obj) {
		with twojoints_head_obj {
			draw_sprite_ext(sprite_index,image_index,x-player_obj.camx,y-player_obj.camy,image_xscale,image_yscale,0,c_white,1)
		}
	}
	//gpu_set_colorwriteenable(true,true,true,true)
}



//gpu_set_colorwriteenable(true,true,true,true)
gpu_set_blendmode(bm_normal)