/// @description Insert description here
// You can write your code in this editor
if point_distance(x,y,player_obj.x,player_obj.y)<2000 {
	
	draw_self()
	hand_anim_i+=0.3
	if hand_anim_i>=6 {
		hand_anim_i = 0	
	}
	hand_anim_i_o = floor(hand_anim_i)
	draw_set_color(c_orange)
	for(i=0;i<pn_total;i++){
		//draw_sprite(hand_point_ui,0,points_x[| i],points_y[| i])
		
		
		points_ang_p[i] = lerp(points_ang_p[i],point_direction(points_x[| i],points_y[| i],player_obj.x,player_obj.y),0.1)
		
		nx = points_x[| i] + cos(degtorad(points_ang_p[i])) * points_length[i]
		ny = points_y[| i] - sin(degtorad(points_ang_p[i])) * points_length[i]
	
		
		
		draw_line(points_x[| i],points_y[| i],nx,ny)
		
		draw_sprite_ext(hand_t,hand_anim_i_o + points_hand_anim[i] 
		,nx,ny,1,1,points_ang_p[i]-180,c_white,1)
		//draw_sprite(hand_t,0,nx,ny)
	}
	draw_set_color(c_white)
	//
}