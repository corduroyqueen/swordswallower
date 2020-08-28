/// @description Insert description here
// You can write your code in this editor
closed = true
enabled = false
boss = noone
boss_type = noone
player_present = false

music_cue = false

part_system = part_system_create()

part_emitter = part_emitter_create(part_system)

part_type = part_type_create()

if room==subtemple01 {
	if level1_master.st_coffin_boss_1_opened {
		closed = false
	}
	if level1_master.st_coffin_boss_1_beaten {
		closed = false
		enabled = true
	}
}
//part_type_sprite(part_type,
part_type_sprite(part_type,chainlink,false,false,false)


part_type_life(part_type, 60,90);
part_type_speed(part_type, 13,20, -0.8, 0.1);
part_type_direction(part_type, 0, 359, random_range(0,5), 1);

part_type_orientation( part_type, 0,359, 3, 1, false );