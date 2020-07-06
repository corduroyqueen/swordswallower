/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
timer++
if timer<9000 && timer>750 {
	alpha+=0.002
}

camx = camera_get_view_x(view_camera[0])
camy = camera_get_view_y(view_camera[0])

if timer>2500 {
	fade_alpha+=0.002

	draw_set_alpha(fade_alpha)
	draw_set_color(c_black)
	draw_rectangle(camx-50,camy-50,camx+2000,camy+1100,false)
	
	reflection_obj.image_alpha = 1 - fade_alpha
}

if timer>4000 {
	game_end()	
}
draw_set_alpha(1)

var uTime = shader_get_uniform(shader1,"Time");

shader_set(shader1)
shader_set_uniform_f(uTime,current_time/10000)
	

//draw_sprite_ext(sword515,0,640,550,3,3,180,c_white,alpha)
//draw_sprite_ext(titlescreenline,0,camx,camy,1,1,0,c_white,alpha)

shader_reset()

draw_set_color(c_white)
//draw_sprite_ext(titlescreentitle,0,camx,camy,1,1,0,c_white,alpha*1.5)

draw_sprite_ext(swsw3,0,camx+960,camy+540,1.350,1.350,0,c_white,alpha*15)

	