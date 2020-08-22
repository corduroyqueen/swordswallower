/// @description Insert description here
// You can write your code in this editor
gpu_set_colorwriteenable(true,true,true,true);
if player_obj.death {
	return	
}


if !surface_exists(player_surface) {
	player_surface = surface_create(300,300)	
}

surface_set_target(player_surface)
draw_clear_alpha(c_white,0)
if player_obj.shielded {
	draw_sprite(shield_spr,0,x,y)	
}


//gpu_set_colorwriteenable(true,true,true,true);
draw_set_color(c_white)
draw_set_alpha(1)
draw_self()
if sprite_index==spr_mc_somersault {
	
} else if pythag(player_obj.hsp,player_obj.vsp)<1 {
	if player_obj.k_down {
		draw_sprite_ext(spr_mc_face_idle,0,x,y,image_xscale,image_yscale,0,c_white,1)
	} else {
		draw_sprite_ext(spr_mc_face_idle,0,x+2*-image_xscale,y-26,image_xscale,image_yscale,0,c_white,1)
	}
} else {
	if player_obj.k_down {
		draw_sprite_ext(spr_mc_face_idle,0,x,y,image_xscale,image_yscale,0,c_white,1)
	} else if player_obj.k_left || player_obj.k_right {
		draw_sprite_ext(spr_mc_face_facing,0,x+head_pos_table_x[image_index]*-image_xscale,y+head_pos_table_y[image_index],image_xscale,image_yscale,0,c_white,1)
	} else {
		draw_sprite_ext(spr_mc_face_facing,0,x+2*-image_xscale,y-26,image_xscale,image_yscale,0,c_white,1)
	}
}

if !player_obj.zoom_timer_bool {
	gpu_set_blendenable(false)
	gpu_set_colorwriteenable(false,false,false,true);
	draw_set_alpha(0);
	draw_rectangle(0,0, 300, 300, false);


	draw_set_alpha(1);
	draw_self()
	if sprite_index==spr_mc_somersault {
		
	} else if pythag(player_obj.hsp,player_obj.vsp)<1 {
		if player_obj.k_down {
			draw_sprite_ext(spr_mc_face_idle,0,x,y,image_xscale,image_yscale,0,c_white,1)
		} else {
			draw_sprite_ext(spr_mc_face_idle,0,x+2*-image_xscale,y-26,image_xscale,image_yscale,0,c_white,1)
		}
	} else {
		if player_obj.k_down {
			draw_sprite_ext(spr_mc_face_idle,0,x,y,image_xscale,image_yscale,0,c_white,1)
		} else if player_obj.k_left || player_obj.k_right {
			draw_sprite_ext(spr_mc_face_facing,0,x+head_pos_table_x[image_index]*-image_xscale,y+head_pos_table_y[image_index],image_xscale,image_yscale,0,c_white,1)
		} else {
			draw_sprite_ext(spr_mc_face_facing,0,x+2*-image_xscale,y-26,image_xscale,image_yscale,0,c_white,1)
		}
	}
	
	gpu_set_blendenable(true);
	gpu_set_colorwriteenable(true,true,true,true);


	gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_src_alpha);
	gpu_set_alphatestenable(true);


	if spr_tarred {
		
		spr_tarred_a+=0.002
		draw_set_alpha(spr_tarred_a)
		draw_set_color(c_gray)
		draw_rectangle(0,182-spr_tarheight,300,300,false)
		
		if spr_tarred_a>=0 {
			spr_tarred = false
		}
		draw_set_alpha(1)
		draw_set_color(c_white)
	}
	gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_src_alpha);
	
	if spr_bloodied {
		
		spr_bloodied_a-=0.002
		//0.003925
		if spr_bloodied_a<=0 {
			spr_bloodied_a=0
			spr_bloodied = false
		}
		//horizontal : 134 to 166
		//vertical   : 118 to 182
		
		var c_blood = global.blood_color
		draw_sprite_ext(white_circle,0, 140,140,0.375,0.375,1,c_blood,spr_bloodied_a);
		draw_sprite_ext(white_circle,0, 150,150,0.1875,0.1875,1,c_blood,spr_bloodied_a);
		draw_sprite_ext(white_circle,0, 153,160,0.1875,0.21,0,c_blood,spr_bloodied_a);
		draw_sprite_ext(white_circle,0, 150,160,0.2625,0.2625,0,c_blood,spr_bloodied_a);
		draw_sprite_ext(white_circle,0, 170,115,0.4875,0.4875,0,c_blood,spr_bloodied_a);
		draw_sprite_ext(white_circle,0, 163,140,0.4875,0.4875,0,c_blood,spr_bloodied_a);
	}
	
	gpu_set_alphatestenable(false);
	gpu_set_blendmode(bm_normal);
	if player_obj.k_down {
		arm_pin_x = x + 2 * image_xscale
		arm_pin_y = y + 4
	} else if player_obj.k_left || player_obj.k_right {
		arm_pin_x = x + arm_pos_table_x[image_index] * -image_xscale
		arm_pin_y = y + arm_pos_table_y[image_index]
	} else {
		arm_pin_x = x + 2 * image_xscale
		arm_pin_y = y - 18	
	}
	player_sword_calc()
	player_arm_draw()

}
//gpu_set_colorwriteenable(true,true,true,false);
surface_reset_target()
//gpu_set_colorwriteenable(true,true,true,true);


draw_surface(player_surface,player_obj.x-150,player_obj.y-150)

x=player_obj.x
y=player_obj.y
if player_obj.tail_carry && player_obj.out_of_dash_t>=00 && !player_obj.held_position {
	//draw_circle(temp_pin_x,temp_pin_y,arm_max_length,true
	
	//sword_angle_calc()
	//draw_circle(sword_pos_x,sword_pos_y,5,false)
	draw_sprite_ext(newsword_hilt,0,sword_pos_x,sword_pos_y,sword_facing,1,sword_ang,c_white,1)
	
}
x=150
y=150


//gpu_set_colorwriteenable(true,true,true,false)

//gpu_set_blendmode_ext(bm_one,bm_dest_alpha)


