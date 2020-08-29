/// @description Insert description here
// You can write your code in this editor
if closed {
	sprite_index = coffin_closed
	image_speed = 1
	//if tail_obj.current_obj==self {
	if place_meeting(x,y,tail_obj) && (player_obj.tail_throwing || player_obj.tail_pulling) {
		closed = false
		sprite_index = coffin_open
		image_speed = 0.5
		if room==subtemple01 {
			level1_master.st_coffin_boss_1_opened = true
		}
		part_emitter_region(part_system, part_emitter, x-30, x+30, y-50, y+50, ps_shape_ellipse,ps_distr_gaussian);
		part_emitter_burst(part_system, part_emitter, part_type, 100);
		boss = instance_create_depth(x,y-10,depth-10,boss_type)
	}
} else {
	sprite_index = coffin_open
	image_index = 2
	if player_present && !instance_exists(boss)  {
		enabled = true
		if room==subtemple01 {
			level1_master.st_coffin_boss_1_beaten = true
		}
	}
	
	if instance_exists(boss) && boss.state != boss.state_idle {
		music_cue = true	
	}
}