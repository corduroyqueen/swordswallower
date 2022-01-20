//fuck yes
/// @description Insert description here
// You can write your code in this editor

var spr_mc_head_idle = HeadNewFrontFinal1
var spr_mc_head_side = HeadNewSideFinal1

//if keyboard_check_pressed(ord("8")) {
//	spr_mc_head_idle = e_head_idle
//} else if keyboard_check_pressed(ord("9")) {
//	spr_mc_head_idle = HeadNewFront4
//} else if keyboard_check_pressed(ord("0")) {
//	spr_mc_head_idle = HeadNewFront5
//}

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
draw_clear_alpha(c_black,0)

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

//draw_self()
draw_self()
//image_index = max(image_index,0)//laazy debugd
if sprite_index==spr_mc_somersault || player_obj.zoom_timer_bool {
	
} else if (!(player_obj.k_left || player_obj.k_right) && player_obj.grounded) || player_obj.intro {
	if player_obj.k_down && player_obj.grounded && !player_obj.held_position && !player_obj.intro {
		draw_sprite_ext(spr_mc_head_idle,headi,x+2*-image_xscale,y-10,image_xscale,image_yscale,0,c_white,1)
	} else {
		draw_sprite_ext(spr_mc_head_idle,headi,x+-1*-image_xscale,y-40,image_xscale,image_yscale,0,c_white,1)
	}
} else {
	if player_obj.k_down && player_obj.grounded {
		draw_sprite_ext(spr_mc_head_idle,headi,x+10*-image_xscale,y,image_xscale,image_yscale,0,c_white,1)
	} else if player_obj.k_left || player_obj.k_right {
		draw_sprite_ext(spr_mc_head_side,headi,x+head_pos_table_x[image_index]*-image_xscale,y+head_pos_table_y[image_index],image_xscale,image_yscale,0,c_white,1)
	} else if !player_obj.grounded {
		draw_sprite_ext(spr_mc_head_side,headi,x+5*-image_xscale,y-30,image_xscale,image_yscale,0,c_white,1)
	} else {
		draw_sprite_ext(spr_mc_head_side,headi,x+-1*-image_xscale,y-40,image_xscale,image_yscale,0,c_white,1)
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
		
	} else if (!(player_obj.k_left || player_obj.k_right) && player_obj.grounded) || player_obj.intro  {
		if player_obj.k_down && player_obj.grounded && !player_obj.held_position  && !player_obj.intro  {
			draw_sprite_ext(spr_mc_head_idle,headi,x+2*-image_xscale,y-10,image_xscale,image_yscale,0,c_white,1)
		} else {
			draw_sprite_ext(spr_mc_head_idle,headi,x+-1*-image_xscale,y-40,image_xscale,image_yscale,0,c_white,1)
		}
	} else {
		if player_obj.k_down && player_obj.grounded  {
			draw_sprite_ext(spr_mc_head_idle,headi,x+10*-image_xscale,y,image_xscale,image_yscale,0,c_white,1)
		} else if player_obj.k_left || player_obj.k_right {
			draw_sprite_ext(spr_mc_head_side,headi,x+head_pos_table_x[image_index]*-image_xscale,y+head_pos_table_y[image_index],image_xscale,image_yscale,0,c_white,1)
		} else if !player_obj.grounded {
			draw_sprite_ext(spr_mc_head_side,headi,x+5*-image_xscale,y-30,image_xscale,image_yscale,0,c_white,1)
		} else {
			draw_sprite_ext(spr_mc_head_side,headi,x+-1*-image_xscale,y-40,image_xscale,image_yscale,0,c_white,1)
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
	//draw_sprite(sprite_index,image_index,x,y)
	if player_obj.k_down && !player_obj.held_position && player_obj.grounded  {
		arm_pin_x = x + 2 * image_xscale
		arm_pin_y = y + 4
	} else if (player_obj.k_left || player_obj.k_right) && !player_obj.held_position && player_obj.grounded {
		arm_pin_x = x + arm_pos_table_x[image_index] * image_xscale
		arm_pin_y = y + arm_pos_table_y[image_index]
	} else {
		arm_pin_x = x + 8 * image_xscale
		arm_pin_y = y - 29
	}
	player_sword_calc()
	player_arm_draw()
	draw_set_color(c_green)
}	


//gpu_set_colorwriteenable(true,true,true,false);
surface_reset_target()
//gpu_set_colorwriteenable(true,true,true,true);

gpu_set_colorwriteenable(true,true,true,false)

x=player_obj.x
y=player_obj.y


if !player_obj.zoom_timer_bool {
	proc_cape_draw_r_script(cape_p_r_x,cape_p_r_y,  cloak_color)
	proc_cape_draw_m_script(cloak_color_dark)
}

draw_surface(player_surface,player_obj.x-150,player_obj.y-150)
if !player_obj.zoom_timer_bool {
	proc_cape_draw_l_script(cape_p_l_x,cape_p_l_y,  cloak_color)
}

if !player_obj.zoom_timer_bool {
	var crouch_y =0
	if player_obj.k_down && player_obj.grounded {
		crouch_y = 30
	}
	if ((player_obj.grounded && (player_obj.k_left || player_obj.k_right)) || !player_obj.grounded) && !player_obj.intro {
		draw_sprite_ext(spr_e_CharacterNewSideCollar,0,x+(head_pos_table_x[image_index]-2)*-image_xscale,y+head_pos_table_y[image_index]-15+crouch_y,image_xscale,image_yscale,0,c_white,1)
	} else {
		draw_sprite_ext(top_cape,0,x+(head_pos_table_x[image_index]-3)*-image_xscale+0.5,y+head_pos_table_y[image_index]-15+crouch_y,-image_xscale*0.9,image_yscale*0.9,0,c_white,1)
	}
}
//draw_set_color(c_green)
//draw_circle(arm_pin_x-150+player_obj.x,arm_pin_y-150+player_obj.y,6,false)
//draw_sprite(spr_leftestpupil,0,arm_pin_y-150+player_obj.x,arm_pin_y-150+player_obj.y)
//draw_sprite_ext(CharacterNew,0,x+50,y,0.9,0.9,0,c_white,1)

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
	
	//draw_sprite_ext(sword6_hilt,0,sword_pos_x,sword_pos_y,sword_facing,1,sword_ang,c_white,1)
	draw_sprite_ext(e_sword_test4,0,sword_pos_x,sword_pos_y,sword_facing,1,sword_ang,c_white,1)
	//draw_sprite_ext(swordsparklies_hilt,0,sword_pos_x,sword_pos_y,sword_facing,1,sword_ang,c_white,1)
	
	
	//draw_circle(sword_pos_x, sword_pos_y, 7, false);
}
floor_particle_script()	

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


