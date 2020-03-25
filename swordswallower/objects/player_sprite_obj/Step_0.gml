/// @description Insert description here
// You can write your code in this editor

x = player_obj.x
y = player_obj.y
if !player_obj.held_position {
	if keyboard_check(ord("D")) {
		facing_right = true
	}
	if keyboard_check(ord("A")) {
		facing_right = false	
	}
} else {
	if player_obj.on_wall_left {
		facing_right = true	
	} else if player_obj.on_wall_right {
		facing_right = false	
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
		if player_hitbox_check_obj.wall == 0 ||player_hitbox_check_obj.wall == 2 {
			sprite_index = player_holding_left	
		}
		if player_hitbox_check_obj.wall ==1 {
			sprite_index = player_holding_up	
		}
		sprite_index = player_holding_up
	} else if player_obj.grounded && (keyboard_check(ord("D")) || keyboard_check(ord("A"))) {
		sprite_index = sprite319
		image_speed= 0.7 + hspeed
	} else if player_obj.grounded && keyboard_check(ord("S")) {
		sprite_index = sprite320
	} else {
		sprite_index = 	sprite311
	}
}
if !player_obj.tail_carry {
	if player_obj.zoom_timer_bool {
		image_angle = point_direction(player_obj.x,	player_obj.y,player_obj.tail_dest_x,player_obj.tail_dest_y) - 90
		image_speed = 1.5
		sprite_index = boost
	} else {
		image_angle = 0	
	}
	if player_obj.held_position {
		if player_hitbox_check_obj.wall == 0 ||player_hitbox_check_obj.wall == 2 {
			sprite_index = player_holding_left	
		}
		if player_hitbox_check_obj.wall ==1 {
			sprite_index = player_holding_up	
		}
		if player_hitbox_check_obj.wall == 3 {
			sprite_index = sprite310
		}
	} else if player_obj.grounded && (keyboard_check(ord("D")) || keyboard_check(ord("A"))) {
		sprite_index = sprite309
		image_speed= 0.7 + hspeed
	} else if player_obj.grounded && keyboard_check(ord("S")) {
		sprite_index = sprite312
	} else if player_obj.grounded {
		sprite_index = sprite310
	} else if player_obj.vspeed>=0 && !player_obj.zoom_timer_bool {
		sprite_index = sprite310
	} else if player_obj.vspeed<0 && !player_obj.zoom_timer_bool {
		sprite_index = sprite310	
	}
}

if player_obj.zoom_timer_bool && place_meeting(x,y,wall_obj) {
	image_blend = c_purple	
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
		sprite_index = sprite310
	} else {
		sprite_index = sprite311	
	}
	facing_right = true
	image_xscale = 1
}

if player_obj.death {
	sprite_index = scary_skull	
	image_xscale = 1
}