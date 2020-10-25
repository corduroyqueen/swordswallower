if event_type == ev_draw
{
	if event_number == 0 {
		surface_set_target(art_surface_setter.blood_splat_surface);
		if !player_obj.death || player_obj.respawn_timer>58 {
			draw_clear_alpha(c_black,0)
		}
		
		gpu_set_alphatestenable(true)
		gpu_set_alphatestref(200)
	   
	   
		//draw_clear_alpha(c_white,0)
		//gpu_set_colorwriteenable(true, true, true, false);
	}
}

