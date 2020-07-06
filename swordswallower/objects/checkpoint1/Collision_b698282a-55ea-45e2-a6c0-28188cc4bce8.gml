/// @description Insert description here
// You can write your code in this editor
if ready && !thrown {
	
	checkpoint_particle_script(x,y,24)
	
	
	if player_obj.hp<2 && !player_obj.tail_carry {
		//checkpoint_particle_script(player_obj.x,player_obj.y,12)
	}
	player_obj.hp = 2
	if room==subtemple02 {
		if instance_exists(big_boi_time) {
			big_boi_bool = big_boi_time.special_guy
		}
	}
	if checkpoint_manager.checkpoint != self || starting_bool {
		audio_sound_gain(fire_sound,audio_sound_get_gain(firecrackle1),0)
		audio_play_sound(firelit1,0,false)	
		audio_play_sound(Ice_Projectile_Shoot_03,0,false)
		starting_bool = false
	}
	
	savegame_script()
	
	ready = false
	thrown = false
}