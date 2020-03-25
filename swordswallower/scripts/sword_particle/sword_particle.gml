if player_obj.tail_planted {
	sword_particle_spawn--
	var xscale = 12
	var yscale = 2
	var offset = random_range(-10,10)
	
	
	
	if floor(sword_particle_spawn)==20 {
		var particle = instance_create_depth(x+offset,y,0,sword_particle_obj)
		particle.image_angle = point_direction(x,y,player_obj.x,player_obj.y)
		particle.image_blend = c_fuchsia
		particle.image_xscale = xscale
		particle.image_yscale = yscale
	}
	
	if floor(sword_particle_spawn)==10 {
		var particle = instance_create_depth(x+offset,y,0,sword_particle_obj)
		particle.image_angle = point_direction(x,y,player_obj.x,player_obj.y)
		particle.image_blend = c_gray
		particle.image_xscale = xscale
		particle.image_yscale = yscale
	}
	
	
	var xscale = 12
	var yscale = 10
	var offset = random_range(-5,5)
	
	if sword_particle_spawn/2 == floor(sword_particle_spawn) {
		var particle = instance_create_depth(x+offset,y,0,sword_particle_obj)
		particle.image_angle = point_direction(x,y,player_obj.x,player_obj.y)
		particle.image_blend = c_purple
		particle.image_xscale = xscale
		particle.image_yscale = yscale
		sword_particle_spawn = 30
	}
}