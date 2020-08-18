/// @description Insert description here
// You can write your code in this editor
part_system = part_system_create()

part_emitter = part_emitter_create(part_system)

part_type = part_type_create()

//part_type_sprite(part_type,
part_type_sprite(part_type,blood_sprite_spr3,false,false,false)


part_type_life(part_type, 99999999999999, 99999999999999);
part_type_speed(part_type, 0.1,1, 0, 0.1);
part_type_direction(part_type, 0, 360, 0, 10);

//part_emitter_region(part_system,part_emitter,50,100,50,100,ps_shape_rectangle,ps_distr_linear)

//part_emitter_stream(part_system,part_emitter,part_type,4)

for(a=0;a<room_width;a+=random_range(300,600)) {
	for(b=0;b<room_height;b+=random_range(300,600)) {
		a+=random_range(-200,200)
		part_particles_create(part_system,a,b,part_type,1)
	}	
}