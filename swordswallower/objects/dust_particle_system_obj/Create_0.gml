/// @description Insert description here
// You can write your code in this editor
part_system = part_system_create()

part_emitter = part_emitter_create(part_system)

part_type = part_type_create()

//part_type_sprite(part_type,
part_type_sprite(part_type,dust_sprite_spr,false,false,false)


part_type_life(part_type, 99999999999999, 99999999999999);
part_type_speed(part_type, 0.1,0.2, 0, 0.01);
part_type_direction(part_type, 0, 360, 0, 10);
part_system_automatic_draw(part_system, false);

part_particles_clear(part_system)

for(a=12000;a<32500;a+=random_range(200,400)) {
	for(b=4555;b<room_height;b+=random_range(200,400)) {
		
		part_particles_create(part_system,a+random_range(-100,100),b,part_type,1)
	}	
}	
//part_emitter_region(part_system,part_emitter,50,100,50,100,ps_shape_rectangle,ps_distr_linear)

//part_emitter_stream(part_system,part_emitter,part_type,4)

spawn = false