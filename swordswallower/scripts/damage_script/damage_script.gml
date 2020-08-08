damage = argument0
direc = argument1
hforce = argument2
vforce = argument3



if !player_obj.damage_start {
	player_obj.damage_start = true
	player_obj.hp-=damage
	if player_obj.shielded {
		player_obj.shielded = false	
	}
	player_obj.dmg_flashing = true
	player_obj.hsp = hforce * direc
	player_obj.vsp = vforce
	player_obj.zoom_timer_bool = false
	player_obj.zoom_timer = 0
	player_obj.camera_shake = true
	reset_intangibility()
}