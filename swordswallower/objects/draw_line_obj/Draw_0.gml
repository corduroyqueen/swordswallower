/// @description Insert description here
// You can write your code in this editor
/*
draw_set_color(c_red)
if go = true {
	
	alpha-=0.1
	draw_set_alpha(alpha)
	
	
	
	
	if player_obj.zoom_timer_bool {
		if tail_obj.current_obj!=false {
			draw_line_width(player_obj.x,player_obj.y,tail_obj.x,tail_obj.y,7)		
		} else {
			sdm(tail_obj.current_obj)
			draw_line_width(player_obj.x,player_obj.y,tail_obj.current_obj.x,tail_obj.current_obj.y,7)	
		}	
	}
	
	
	
	gotimer-=1
	
	
	
	if gotimer<=0 {
		go=false
		alpha = 0
	}
}

draw_set_alpha(1)