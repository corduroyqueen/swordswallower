/// @description Insert description here
// You can write your code in this editor

if death {
	just_blood(player_obj.hsp,player_obj.vsp,0.9,60,true,sprite_width/1.5,sprite_height/1.5)
	body = instance_create_depth(x,y-10,0,friendo2_obj_dead)
	body.hsp = player_obj.hsp*0.7
	body.vsp = player_obj.vsp*0.7
	reset_zoom()
	instance_destroy(id)	
}

if player_obj.tail_pulling && met {
	tail_obj.pull_timer=10
	sword_lock = false
}

if player_obj.tail_carry {
	sword_lock = false
	if !player_obj.zoom_timer_bool {
		met = false	
	}
	
}

if met {
	
}

if sword_lock {
	tail_obj.x = x + swordx
	tail_obj.y = y + swordy
	tail_obj.inside_flier = true
	tail_obj.current_obj = self
}



if place_meeting(x+2,y,wall_obj) {
	move_right = false
}

if place_meeting(x-2,y,wall_obj) {
	move_right = true
}

if move_right {
	image_xscale = -1
	hsp = 0.75
} else {
	image_xscale = 1
	hsp = -0.75
}


