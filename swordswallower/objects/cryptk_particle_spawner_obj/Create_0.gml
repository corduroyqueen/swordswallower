//fuck yes
part_system = part_system_create()

part_emitter = part_emitter_create(part_system)

part_type = part_type_create()

//part_type_sprite(part_type,
part_type_sprite(part_type,chainlink,false,false,false)


part_type_life(part_type, 5,10);
part_type_speed(part_type, 13,20, 0.0, 0.1);
part_type_direction(part_type, 0, 359, random_range(0,5), 1);

part_type_orientation( part_type, 0,359, 3, 1, false );

xt=0
yt=0


particles_x = ds_list_create()
particles_y = ds_list_create()
particles_hsp = ds_list_create()
particles_vsp = ds_list_create()
particles_i = ds_list_create()

delete_list = ds_list_create()

num_to_spawn = 0

grav = .8