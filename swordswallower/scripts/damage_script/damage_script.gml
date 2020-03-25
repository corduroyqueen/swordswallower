damage = argument0
direc = argument1
hforce = argument2
vforce = argument3

player_obj.damage_start = true

if player_obj.damage_start && !player_obj.dmg_flashing {
	player_obj.hp-=1
	if damage >100 {
		player_obj.hp-=1	
	}
	if player_obj.shielded {
		player_obj.shielded = false	
	}
	player_obj.dmg_flashing = true
	player_obj.hspeed = hforce * direc
	player_obj.vspeed = vforce
	player_obj.zoom_timer_bool = false
	player_obj.zoom_timer = 0
	player_obj.camera_shake = true
	audio_manager(ow_0157,0,false,0)
	reset_intangibility()
}

player_obj.damage_start = false