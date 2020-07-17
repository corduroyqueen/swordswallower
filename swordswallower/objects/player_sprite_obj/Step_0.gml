/// @description Insert description here
// You can write your code in this editor

x = 150
y = 150

//x = player_obj.x
//y = player_obj.y

if !player_obj.held_position {
	if player_obj.k_right {
		facing_right = true
	}
	if player_obj.k_left {
		facing_right = false	
	}
} else {
	if player_obj.on_wall_right {
		facing_right = false	
	} else if player_obj.on_wall_left {
		facing_right = true	
	}
}
depth=-200

if facing_right {
	image_xscale = 1
} else {
	image_xscale = -1
}

if player_obj.tail_carry {
	if player_obj.held_position {
		if abs(tail_obj.ang)>60 && abs(tail_obj.ang)<120 {
			sprite_index = wall_p1	
		} else if (abs(tail_obj.ang)>=120 && abs(tail_obj.ang)<=220) ||
		
		(abs(tail_obj.ang)>=60 || abs(tail_obj.ang)>310)
		{
			sprite_index = slanted1
		} else {
			sprite_index = wall_p1	
		}
		
		
	} else if player_obj.grounded && (player_obj.k_right || player_obj.k_left) {
		sprite_index = s_player_run_s
		image_speed= 0.7 + hspeed
	} else if player_obj.grounded && player_obj.k_down {
		sprite_index = s_player_crouch_s
	} else {
		sprite_index = s_player_idle_s
	}
}
if !player_obj.tail_carry {
	
	if player_obj.held_position {
		if player_hitbox_check_obj.wall == 0 ||player_hitbox_check_obj.wall == 2 {
			sprite_index = wall_p1
		}
		if player_hitbox_check_obj.wall ==1 {
			sprite_index = slanted
		}
		if player_hitbox_check_obj.wall == 3 {
			sprite_index = s_player_idle_e
		}
	} else if player_obj.grounded && (player_obj.k_right || player_obj.k_left) {
		sprite_index = s_player_run_e
		image_speed= 0.7 + hspeed
	} else if player_obj.grounded && player_obj.k_down {
		sprite_index = s_player_crouch_e
	} else if player_obj.grounded {
		sprite_index = s_player_idle_e
	} else if player_obj.vspeed>=0 && !player_obj.zoom_timer_bool {
		sprite_index = s_player_idle_e
	} else if player_obj.vspeed<0 && !player_obj.zoom_timer_bool {
		sprite_index = s_player_idle_e
	}
}
if player_obj.zoom_timer_bool||player_obj.out_of_dash_t<00 {
		image_angle = point_direction(0,0,player_obj.hspeed,player_obj.vspeed)-90
		image_speed = 1.5
		sprite_index = s_boost
	} else {
		image_angle = 0	
	}
if player_obj.zoom_timer_bool && place_meeting(x,y,wall_obj) {
	//image_blend = c_purple	
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

image_xscale*=1.5
image_yscale=1.5

if player_obj.ability_held_release_jump {
	if player_obj.held_position && player_obj.ability_held_release_t>player_obj.ability_held_release_m {
		//image_blend = c_purple	
	}
}