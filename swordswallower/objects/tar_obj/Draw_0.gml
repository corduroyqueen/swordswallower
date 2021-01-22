///// @description Insert description here
//// You can write your code in this editor


//gpu_set_colorwriteenable(1,1,1,0)
//depth = 1900
//if abs(player_obj.camy - y) < 1500 {
//	//for (var ok =0;ok<num_fogs;ok++) {
//	//	var l = fog_y[|ok]
//	//	l-=0.2
//	//	if l<-500 {
//	//		l=0
//	//	}
//	//	fog_y[|ok]=l
//	//}
//	if (player_obj.camx +1080 - x -half_wid)>0 &&
//	(player_obj.camx - x +half_wid)<0
//	{
		
//	}
//	for (var ok =0;ok<num_fogs;ok++) {
//		var pos = x+ok*300-half_wid
//		if abs(pos-player_obj.cam_midx)<800 {
//			draw_sprite_ext(fog_t,0,pos,y+fog_y[|ok],2,2,0,c_white,0.2-abs(fog_y[|ok])/2000)
//		}
//	}
//}
//// You can write your code in this editor
//gpu_set_colorwriteenable(1,1,1,0)
var uTime = shader_get_uniform(shader_12combine,"Time");
var uxScale = shader_get_uniform(shader_12combine,"xScale")
var uyScale = shader_get_uniform(shader_12combine,"yScale")
shader_set(shader_12combine)
shader_set_uniform_f(uTime,current_time/1000)
shader_set_uniform_f(uxScale,image_xscale)
shader_set_uniform_f(uyScale,image_yscale)
	
draw_sprite_ext(water_spr,0,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha)

shader_reset()
