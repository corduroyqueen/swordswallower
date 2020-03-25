/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white)

if setpoint {
	draw_text(x,y,"checkpoint!")
	draw_circle(x,y,5,true)
} else {
	draw_set_color(c_fuchsia)
	draw_text(x+5,y,"checkpoint!")
	draw_set_color(c_white)
	 var uTime = shader_get_uniform(shader1,"Time");

    shader_set(shader1)
    shader_set_uniform_f(uTime,current_time/1000)
	draw_sprite_ext(checkpoint_spr,0,x,y,1,1,0,c_white,1)
	shader_reset()
}
if refreshtext {
	refreshpos+=0.75
	draw_set_color(c_fuchsia)
	if setpoint {
		draw_text(x,y-refreshpos,"respawn set!")
	} else {
		draw_text(x,y-refreshpos,"respawn set!")
	}
	draw_set_color(c_white)
	if refreshpos>50 {
		refreshtext = 0	
	}
} else {
	refreshpos = 0	
}