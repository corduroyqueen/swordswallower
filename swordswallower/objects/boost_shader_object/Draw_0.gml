/// @description MAIN


//if !in_camera_range_bigger(tx,ty) {
//	return
//}
// SET VALUES:
//-----------------------------------------------------------------------------


// DRAW:
//-----------------------------------------------------------------------------

//draw_self();
gpu_set_colorwriteenable(true,true,true,false)
if player_obj.zoom_timer_bool && !player_obj.death {
	
	//with player_sprite_obj {
	//	image_angle = point_direction(player_obj.x,player_obj.y,player_obj.tail_dest_x,player_obj.tail_dest_y)-90
	//	image_speed = 1.5
	//	sprite_index = s_boost	
	//	draw_self()
	//
	var tangg = point_direction(player_obj.x,player_obj.y,player_obj.tail_dest_x,player_obj.tail_dest_y)-90
	particle_timer++
	if particle_timer>particle_timer_m {
		var tiempo = instance_create_depth(player_obj.x,player_obj.y,depth+1,dash_trail_particle_obj)
		tiempo.image_angle = tangg-180
		tiempo.image_xscale = particle_polarity * 1.09
		//Stiempo.image_yscale = 1.1
		particle_polarity = -sign(particle_polarity)
		particle_timer=0
	}
	
	draw_sprite_ext(boost,current_time%2,player_obj.x,player_obj.y,1,1,tangg,c_white,1)
	
	time			= (time + 1 * 0.05) mod 1;

	ang = point_direction(0,0,player_obj.hsp,player_obj.vsp)
	var dist = min(point_distance(player_obj.x,player_obj.y,px,py)/20,50)
	var strength_x	= 1 * 0.3;		// [0, 0.3]
	var strength_y	= dist * 0.014				// [0, 1]
	var size		= 0.1 + 0.25;	// [0.25, 0.75]

	gpu_set_tex_filter(true);		
	
	shader_set(shader);
		texture_set_stage(u_distort_tex, distort_tex);
		shader_set_uniform_f(u_time, time);
		shader_set_uniform_f(u_strength,	strength_x, strength_y);
		shader_set_uniform_f(u_size,		size);
		//shader_set_uniform_f(u_bend,		bend);
		
		draw_sprite_ext(sprites[sprite], 0, 
		player_obj.x+dcos(ang)*30,
		player_obj.y-dsin(ang)*30,
		1.1,1.1,
		ang+90,c_white,1)
	shader_reset();
	
	range = 1.00
	okx = player_obj.x+dcos(ang)*100
	oky = player_obj.y-dsin(ang)*100
} else {
	particle_timer=particle_timer_m
	if range>0{
		shader_set(perlin_fadeout_shader)

	
		texture_set_stage(u_perlin_tex, perlin_tex);
		//shader_set_uniform_f(u_time2, (sin(current_time/1000)+1)/2);
		//range-=0.06
		range = lerp(range,0,0.08)
		range-=0.00001
		shader_set_uniform_f(u_time2, range);
		shader_set_uniform_f(u_tolerance, 0.0);
		shader_set_uniform_f(u_inverse, 1.0);
		var xs
		var ys
		if point_distance(x,y,player_hitbox_check_obj.x,player_hitbox_check_obj.y)<100 {
			xs = 1
			ys = 0.9
		} else {
			xs = 0.6
			ys = 2
		}
		
		draw_sprite_ext(spr_boost_jagged_s,0,okx,oky,xs+(1-range)*2,xs+(1-range)*2,ang+90,c_white,1)

		shader_reset()
	}
	
	px = player_obj.x
	py = player_obj.y
}

gpu_set_colorwriteenable(true,true,true,true)
