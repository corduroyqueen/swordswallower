xi = argument0
yi = argument1

var ok = random_range(0.7,0.9)
		
//draw_sprite_ext(whitecircle,0,xi,yi,ok,ok,0,c_red,0.4)
	
gpu_set_blendmode(bm_normal)
gpu_set_colorwriteenable(true,true,true,false)
draw_sprite_ext(purpleblur,0,xi,yi,ok,ok,0,c_white,1)
	
gpu_set_blendmode(bm_normal)
	
var uTime = shader_get_uniform(shader1,"Time");
shader_set(shader1)
shader_set_uniform_f(uTime,current_time/100)
	
draw_sprite_ext(purpbleflame,image_index,xi,yi,0.5,0.5,0,c_white,1)
	gpu_set_colorwriteenable(true,true,true,true)
shader_reset()