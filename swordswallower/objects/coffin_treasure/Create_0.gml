/// @description Insert description here
// You can write your code in this editor
closed = true
treasure = noone

part_system = part_system_create()

part_emitter = part_emitter_create(part_system)

part_type = part_type_create()

//part_type_sprite(part_type,
part_type_sprite(part_type,chainlink,false,false,false)


part_type_life(part_type, 40,60);
part_type_speed(part_type, 13,20, -0.4, 0.1);
part_type_direction(part_type, 0, 359, random_range(0,5), 1);

part_type_orientation( part_type, 0,359, 3, 1, false );