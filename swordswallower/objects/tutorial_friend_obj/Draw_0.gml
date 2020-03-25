/// @description Insert description here
// You can write your code in this editor

if tutorial_friend.timer>43 {
	if tutorial_friend.timer<45 {
		audio_play_sound(Laser_Cannon,0,false)	
		//damage_script(10,sign(player_obj.x-x),5,-1)
	}
	
	var uTime = shader_get_uniform(shader1,"Time");

    shader_set(shader1)
    shader_set_uniform_f(uTime,current_time/250)
	
	draw_set_color(c_white)
	draw_self()
	
	shader_reset()
	
	draw_set_color(c_red)
	draw_line_width(x,y,player_obj.x+50,player_obj.y+60,60)
	draw_set_color(c_yellow)
	draw_line_width(x,y,player_obj.x+50,player_obj.y+60,40)
	draw_set_color(c_white)
	
	
} else {
	var uTime = shader_get_uniform(shader1,"Time");

    shader_set(shader1)
    shader_set_uniform_f(uTime,current_time/250)
	draw_self()	
	shader_reset()
}