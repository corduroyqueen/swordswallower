/// @description MAIN


//if !in_camera_range_bigger(tx,ty) {
//	return
//}
// SET VALUES:
//-----------------------------------------------------------------------------


// DRAW:
//-----------------------------------------------------------------------------

//draw_self();

if player_obj.zoom_timer_bool && !player_obj.death {
	time			= (time + 1 * 0.05) mod 1;

	var ang = point_direction(0,0,player_obj.hsp,player_obj.vsp)
	var dist = min(point_distance(player_obj.x,player_obj.y,px,py)/20,50)
	var strength_x	= 1 * 0.3;		// [0, 0.3]
	var strength_y	= dist * 0.014				// [0, 1]
	var size		= 0.1 + 0.25;	// [0.25, 0.75]

	gpu_set_tex_filter(true);		
	gpu_set_colorwriteenable(true,true,true,false)
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
	gpu_set_colorwriteenable(true,true,true,true)

} else {
	px = player_obj.x
	py = player_obj.y
}