//fuck yes


shader_set(perlin_fadein_shader)

	
texture_set_stage(u_perlin_tex, perlin_tex);
//shader_set_uniform_f(u_time2, (sin(current_time/1000)+1)/2);
//range-=0.06
range = 0.900000 - (blood_ctrl_obj.blood_num/150)

//range+=0.01

//range = lerp(range,0,0.08)
//range-=0.00001
shader_set_uniform_f(u_time, range);
shader_set_uniform_f(u_tolerance, 0.0);
shader_set_uniform_f(u_inverse, 1.0);

var r = random_range(-0.15000,0.15000)
image_xscale=1+r
image_yscale=1-r
		
draw_self()

shader_reset()
