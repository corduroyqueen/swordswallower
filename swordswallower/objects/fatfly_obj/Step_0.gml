/// @description Insert description here
// You can write your code in this editor
audio_sound_pitch(s_fly_buzz,0.63)

if distance_to_object(player_obj)<575 {
	
	
	if !audio_is_playing(s_fly_buzz){
		s_fly_buzz = audio_play_sound(fly_sound,0,true)
		audio_sound_gain(s_fly_buzz,0,0)
		audio_sound_gain(s_fly_buzz,.55,500)
	} else {
		audio_sound_gain(s_fly_buzz,.55,10)	
	}
} else if distance_to_object(player_obj)>700 {
	audio_sound_gain(s_fly_buzz,0,1000)
	if audio_is_playing(s_fly_buzz) && audio_sound_get_gain(s_fly_buzz)>0.06{
		audio_stop_sound(s_fly_buzz)	
	}
}
audio_stop_sound(s_fly_buzz)
if keyboard_check_pressed(ord("R")) {
	audio_stop_sound(s_fly_buzz)
}
if death {
	if distance_to_object(player_obj)<575 {
		just_blood(player_obj.hspeed,player_obj.vspeed,0.9,60,true,sprite_width/1.5,sprite_height/1.5)
	}
	//reset_zoom()
	if audio_is_playing(s_fly_buzz) {
		audio_stop_sound(s_fly_buzz)	
	}
	if !place_meeting(x,y,fatfly_destroyer) && met {
		player_obj.tail_planted = false
		player_obj.tail_pulling = true
		player_obj.bounced = false
		reset_intangibility()
		player_obj.zoom_timer_bool = false
		player_obj.zoom_timer = 0
	}
	
	
	if distance_to_object(player_obj) < 575 {
	
		audio_manager(false,0,false,3)
		audio_manager(squelchy_mouth,0,false,0)
	}
	
	instance_destroy()	
}

if player_obj.tail_pulling && met {
	
	//tail_obj.pull_timer=tail_obj.pull_wall_t
	
	player_obj.pull_timer = 0
	sword_lock = false
	
	death = true
}

if player_obj.tail_carry {
	sword_lock = false
	if !player_obj.zoom_timer_bool {
		met = false	
	}
	
}

if met {
	if mouse_check_button_pressed(mb_left) {
		audio_play_sound(Knife_Pull_140,0,false)	
	}
}

if sword_lock {
	tail_obj.x = x + swordx
	tail_obj.y = y + swordy
	tail_obj.inside_flier = true
	tail_obj.current_obj = self
}



if wall_checker(x+2,y) {
	move_right = false
}

if wall_checker(x-2,y) {
	move_right = true
}

if move_right {
	image_xscale = 1
	hspeed = 0.82
} else {
	image_xscale = -1
	hspeed = -0.82
}


