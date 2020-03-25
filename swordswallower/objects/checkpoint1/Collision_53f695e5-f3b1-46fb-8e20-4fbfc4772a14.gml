/// @description Insert description here
// You can write your code in this editor
if ready {
	player_obj.hp = 2
	checkpoint_particle_script(x,y,24)
	if room==subtemple02 {
		if instance_exists(big_boi_time) {
			big_boi_bool = big_boi_time.special_guy
		}
	}
	
	savegame_script()
	
	ready = false
}