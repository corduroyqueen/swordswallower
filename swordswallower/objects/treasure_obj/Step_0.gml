/// @description Insert description here
// You can write your code in this editor



if level1_master.lol {
	instance_destroy()	
}


if place_meeting(x,y,player_obj) {
	if keyboard_check_pressed(ord("E")) {
		checkpoint_particle_script(player_obj.x,player_obj.y,36)
		player_obj.treasure_count++
		level1_master.available_checkpoints++
		if room==subtemple01 {
			level1_master.subtemple01ckptbool = true	
		}
		instance_destroy()
		if !ui_manager.show_checkpoints {
			ui_manager.show_checkpoints = true
		}	
	}
}