zoom_particle_timer++

if zoom_particle_timer>3 {
	//var particle = instance_create_depth(x,y,101,juice_obj)
	//particle.image_blend = make_color_rgb(131,50,211)
	//particle.image_alpha = 0.5
	//var scale = random_range(0.9,1.15)
	//particle.image_xscale = scale
	//particle.image_yscale = scale
	
	var shadow = instance_create_depth(x,y,0,boost_shadow)
	shadow.image_angle = point_direction(0,0,player_obj.hsp,player_obj.vsp)
	zoom_particle_timer=0
	//shockwave_shader.trigger = true
	//shockwave_shader.strength_input = 0.00
	
	
}