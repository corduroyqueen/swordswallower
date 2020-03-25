zoom_particle_timer++

if zoom_particle_timer>2 {
	var particle = instance_create_depth(x,y,101,juice_obj)
	particle.image_blend = make_color_rgb(131,50,211)
	particle.image_alpha = 0.5
	var scale = random_range(0.9,1.15)
	particle.image_xscale = scale
	particle.image_yscale = scale
	
	var shadow = instance_create_depth(x,y,0,boost_shadow)
	
	
}