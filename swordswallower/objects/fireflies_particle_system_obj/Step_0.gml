/// @description Insert description here
// You can write your code in this editor


if spawn {
	for(a=0;a<room_width;a+=random_range(300,600)) {
		for(b=0;b<room_height;b+=random_range(300,600)) {
			a+=random_range(-200,200)
			part_particles_create(part_system,a,b,part_type,1)
		}	
	}	
	spawn = false
}
/*
part_emitter_region(part_system,part_emitter,
player_obj.camx,player_obj.camx+1920,
player_obj.camy,player_obj.camy+1080,
ps_shape_rectangle,ps_distr_invgaussian)

