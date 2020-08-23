/// @description Insert description here
// You can write your code in this editor



if player_obj.y>20000 {
	time			+=  0.0001;
	var size		= 0.05 * 4;
	var strength	= 3 * 0.01;


	// DRAW:
	//-----------------------------------------------------------------------------

	gpu_set_tex_filter_ext(u_distort_tex, true);

	shader_set(shader);
		texture_set_stage(u_distort_tex, distort_tex);
		shader_set_uniform_f(u_time, time);
		shader_set_uniform_f(u_size, size);					// should be turned into a constant once you're happy with the setting
		shader_set_uniform_f(u_strength, strength);			// should be turned into a constant once you're happy with the setting
		

	


	draw_set_alpha(0.1)
	draw_sprite(fog_spr1,0,player_obj.camx-40,y)
	//for (i=0;i<num;i++) {
	//	xs[i]-=0.2
	//	if xs[i]<8000 {
	//		xs[i] = 8000+sprite_width*num
	//	}
	//	//if abs(xs[i]-player_obj.camx+player_obj.cam_width_h)<sprite_width/2+player_obj.cam_width_h {
			
	//	draw_sprite(fog_spr1,0,xs[i],y)
	//	//}
	//}
	shader_reset();
	gpu_set_tex_filter(false);
	draw_set_alpha(1)
}
