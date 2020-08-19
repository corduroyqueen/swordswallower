/// @description Insert description here
// You can write your code in this editor

x = 150
y = 150

//x = player_obj.x
//y = player_obj.y
if player_obj.zoom_timer_bool {
	if player_obj.hsp>0 {
		facing_right = true
	} else {
		facing_right = false	
	}
} else if !player_obj.held_position {
	if player_obj.k_right {
		facing_right = true
	} else if player_obj.k_fire_p && player_obj.tail_dest_x>player_obj.x {
		facing_right = true
	}
	if player_obj.k_left {
		facing_right = false	
	} else if player_obj.k_fire_p && player_obj.tail_dest_x<player_obj.x {
		facing_right = false
	}
} else {
	if player_obj.on_wall_right {
		facing_right = false	
	} else if player_obj.on_wall_left {
		facing_right = true	
	}
}
depth=-1901

if facing_right {
	image_xscale = -1
} else {
	image_xscale = 1
}

if player_obj.tail_carry {
	if player_obj.held_position {
		if floor(tail_obj.ang)==0 || floor(tail_obj.ang)==180 {
			sprite_index = s_player_wall_cling
		} else if floor(tail_obj.ang)==270 {
			sprite_index = s_player_idle_e
		} else {
			sprite_index = s_player_ceil_cling
		}
	} else if player_obj.grounded && (player_obj.k_right || player_obj.k_left) {
		sprite_index = s_player_run_s
		image_speed= abs(player_obj.hsp) * 0.1
	} else if player_obj.grounded && player_obj.k_down {
		sprite_index = spr_mc_gettingupaftercrouch
		image_speed = 1
	} else if !player_obj.grounded {
		sprite_index = s_player_falling_s
	} else {
		sprite_index = s_player_idle_s
	}
}

if !player_obj.tail_carry {
	
	if player_obj.held_position {
		if floor(tail_obj.ang)==0 || floor(tail_obj.ang)==180 {
			sprite_index = s_player_wall_cling
		} else if floor(tail_obj.ang)==270 {
			sprite_index = s_player_idle_e
		} else {
			sprite_index = s_player_ceil_cling
		}
		
	} else if player_obj.grounded && (player_obj.k_right || player_obj.k_left) {
		sprite_index = s_player_run_e
		image_speed= abs(player_obj.hsp) * 0.1
	} else if player_obj.grounded && player_obj.k_down {
		sprite_index=spr_mc_gettingupaftercrouch
		image_speed = 1
	} else if player_obj.grounded {
		sprite_index = s_player_idle_e
	} else if player_obj.vsp>=0 && !player_obj.zoom_timer_bool {
		sprite_index = s_player_falling_e
	} else if player_obj.vsp<0 && !player_obj.zoom_timer_bool {
		sprite_index = s_player_falling_e
	}
}
if player_obj.zoom_timer_bool||player_obj.out_of_dash_t<00 || player_obj.zoom_ctdn>0 {
		image_angle = point_direction(player_obj.x,player_obj.y,player_obj.tail_dest_x,player_obj.tail_dest_y)-90
		image_speed = 1.5
		sprite_index = s_boost
	} else {
		image_angle = 0	
	}
if player_obj.zoom_timer_bool && place_meeting(x,y,wall_obj) {
	//image_blend = c_purple	
} else if !player_obj.zoom_timer_bool && player_obj.zoom_hitbox_active {
	sprite_index = spr_mc_somersault
	image_index = floor(current_time/2) % 5
} else if player_obj.stinky_check {
	image_blend = c_blue
} else {
	if player_obj.hp==1 {
		image_blend = c_white	
	} else {
		image_blend = c_white	
	}
}



if player_obj.intro {
	if !checkpoint_manager.text_bool {
		sprite_index = s_player_idle_e
	} else {
		sprite_index = s_player_idle_s
	}
	facing_right = true
	image_xscale = 1
}

if player_obj.death {
	sprite_index = scary_skull	
	image_xscale = 0
}


if player_obj.ability_held_release_jump {
	if player_obj.held_position && player_obj.ability_held_release_t>player_obj.ability_held_release_m {
		//image_blend = c_purple	
	}
}