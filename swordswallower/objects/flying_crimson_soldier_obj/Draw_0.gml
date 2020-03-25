/// @description Insert description here
// You can write your code in this editor


if !preparing_sniper && player_detected {
	draw_set_color(c_red)
	if sniping_timer>(sniping_timer_m-45) {
		draw_set_alpha(floor((sin(current_time/25)+1)*2))
	} else {
		draw_set_alpha(0.75)	
	}
	draw_line(x,y,player_obj.x,player_obj.y)
}

draw_set_color(c_white)
draw_set_alpha(1)
draw_self()