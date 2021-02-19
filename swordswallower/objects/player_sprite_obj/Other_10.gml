//fuck yes
/// @description Insert description here
// You can write your code in this editor



if !surface_exists(player_surface) {
	player_surface = surface_create(300,300)	
}
//for(var pts=1;pts<7;pts++) {
//	cape_p_l_wind_timer[|pts]+=0.05
//	if cape_p_l_wind_timer[|pts] >=1 {
//		cape_p_l_wind_timer[|pts]=0
//	}
//}
proc_cape_calc_l_script()
proc_cape_calc_r_script()

surface_set_target(player_surface)
draw_clear_alpha(c_white,0)
if player_obj.shielded {
	draw_sprite(shield_spr,0,x,y)	
}


//gpu_set_colorwriteenable(true,true,true,true);
//draw_set_color(c_white)
//draw_set_alpha(1)

//proc_cape_draw_script()
with level1_master {
	var t=ds_list_size(level1_master.hats_list)
	
	
	if keyboard_check_pressed(ord("2")) {
		head_spr_i++
		if head_spr_i>=t {
			head_spr_i=0
		}
	}else if keyboard_check_pressed(ord("1")) {
		head_spr_i--
		if head_spr_i<0 {
			head_spr_i=t-1
		}
	}
}

var headi = level1_master.hats_list[|level1_master.head_spr_i]

draw_self()
if sprite_index==spr_mc_somersault || player_obj.zoom_timer_bool {
	
} else if pythag(player_obj.hsp,player_obj.vsp)<1 {
	if player_obj.k_down {
		draw_sprite_ext(spr_mc_face_idle,headi,x+10*-image_xscale,y,image_xscale,image_yscale,0,c_white,1)
	} else {
		draw_sprite_ext(spr_mc_face_idle,headi,x+2*-image_xscale,y-26,image_xscale,image_yscale,0,c_white,1)
	}
} else {
	if player_obj.k_down {
		draw_sprite_ext(spr_mc_face_idle,headi,x+10*-image_xscale,y,image_xscale,image_yscale,0,c_white,1)
	} else if player_obj.k_left || player_obj.k_right {
		draw_sprite_ext(spr_mc_face_facing,headi,x+head_pos_table_x[image_index]*-image_xscale,y+head_pos_table_y[image_index],image_xscale,image_yscale,0,c_white,1)
	} else {
		draw_sprite_ext(spr_mc_face_facing,headi,x+2*-image_xscale,y-26,image_xscale,image_yscale,0,c_white,1)
	}
}

if !player_obj.zoom_timer_bool {
	gpu_set_blendenable(false)
	gpu_set_colorwriteenable(false,false,false,true);
	draw_set_alpha(0);
	draw_sprite_stretched(rect,0,0,0,300,300)


	draw_set_alpha(1);
	
	
	draw_self()
	if sprite_index==spr_mc_somersault {
		
	} else if pythag(player_obj.hsp,player_obj.vsp)<1 {
		if player_obj.k_down {
			draw_sprite_ext(spr_mc_face_idle,headi,x+10*-image_xscale,y,image_xscale,image_yscale,0,c_white,1)
		} else {
			draw_sprite_ext(spr_mc_face_idle,headi,x+2*-image_xscale,y-26,image_xscale,image_yscale,0,c_white,1)
		}
	} else {
		if player_obj.k_down {
			draw_sprite_ext(spr_mc_face_idle,headi,x+10*-image_xscale,y,image_xscale,image_yscale,0,c_white,1)
		} else if player_obj.k_left || player_obj.k_right {
			draw_sprite_ext(spr_mc_face_facing,headi,x+head_pos_table_x[image_index]*-image_xscale,y+head_pos_table_y[image_index],image_xscale,image_yscale,0,c_white,1)
		} else {
			draw_sprite_ext(spr_mc_face_facing,headi,x+2*-image_xscale,y-26,image_xscale,image_yscale,0,c_white,1)
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
		draw_sprite_stretched(rect,0,0,182-spr_tarheight,0,118+spr_tarheight)
		
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
		draw_sprite_ext(white_circle,0, 150,150,0.8,0.8,1,c_blood,spr_bloodied_a);
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

gpu_set_colorwriteenable(true,true,true,false)

x=player_obj.x
y=player_obj.y


if !player_obj.zoom_timer_bool {
	proc_cape_draw_r_script(cape_p_r_x,cape_p_r_y,  cloak_color_dark)
	proc_cape_draw_m_script(cloak_color_dark)
}

draw_surface(player_surface,player_obj.x-150,player_obj.y-150)
if !player_obj.zoom_timer_bool {
	proc_cape_draw_l_script(cape_p_l_x,cape_p_l_y,  cloak_color)
}
draw_set_color(c_white)
//sdm("ok")
//sdm(player_obj.tail_carry)
//sdm(player_obj.out_of_dash_t)
//sdm(player_obj.held_position)
//sdm("ok")
//sdm(sword_pos_x)
//sdm(sword_pos_y)
if player_obj.tail_carry && player_obj.out_of_dash_t>=00 && !player_obj.held_position {
	//draw_circle(temp_pin_x,temp_pin_y,arm_max_length,true
	
	//sword_angle_calc()
	//draw_circle(sword_pos_x,sword_pos_y,5,false)
	//draw_sprite_ext(newsword_hilt,0,sword_pos_x,sword_pos_y,sword_facing,1,sword_ang,c_white,1)
	draw_sprite_ext(sword6_hilt,0,sword_pos_x,sword_pos_y,sword_facing,1,sword_ang,c_white,1)
	draw_sprite_ext(swordsparklies_hilt,0,sword_pos_x,sword_pos_y,sword_facing,1,sword_ang,c_white,1)
	
	
	//draw_circle(sword_pos_x, sword_pos_y, 7, false);
}
floor_particle_script()	
draw_set_color(c_green)
//draw_circle(shoulder_x,shoulder_y,6,false)
draw_set_color(c_fuchsia)
//draw_circle(elbow_pos_x+player_obj.x-150,elbow_pos_y+player_obj.y-150,6,false)
//sdm(shoulder_x)
//sdm(shoulder_y)
draw_set_color(c_white)
x=150
y=150


gpu_set_colorwriteenable(true,true,true,true)

//draw_circle(part_floor_spawnx,part_floor_spawny,10,false)
//gpu_set_colorwriteenable(true,true,true,false)

//gpu_set_blendmode_ext(bm_one,bm_dest_alpha)


