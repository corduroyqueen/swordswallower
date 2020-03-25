/// @description Insert description here
// You can write your code in this editor

if instance_place(x,y,tail_obj) {
	met = true	
} else {
	met = false	
}

//if met && player_obj.zoom_timer_bool && distance_to_object(player_obj)<20 {
//	broken = true
//	player_obj.tail_pulling = true
//	player_obj.tail_planted = false
	
	
//}

if distance_to_object(player_obj)<40 && player_obj.zoom_timer_bool && met {
	player_obj.tail_planted = false
	player_obj.tail_pulling = true
	tail_obj.pull_timer = tail_obj.pull_wall_t
	player_obj.zoom_timer_bool = false
	player_obj.hspeed *=0.5
	player_obj.vspeed *=0.5
	player_obj.held_position = false
	reset_intangibility()
	instance_destroy()
	instance_destroy(friendo)
	
	varsetter.barriers_to_kill[arrayn] = false
}
if die {
	instance_destroy()
	instance_destroy(friendo)
	varsetter.barriers_to_kill[arrayn] = false
}
if broken {
	player_obj.tail_planted = false
	player_obj.tail_pulling = true
	tail_obj.pull_timer = tail_obj.pull_wall_t
	instance_destroy()
	instance_destroy(friendo)
	
} else {
	if player_obj.zoom_timer_bool && met && instance_place(x,y,player_obj) {
		broken = true	
	}
}