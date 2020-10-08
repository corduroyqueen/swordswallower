//fuck yes
/// @description Insert description here
// You can write your code in this editor
//draw_set_color(c_white)

if !position_meeting(hand_x+dcos(forearm_ang+ang1s)*350,hand_y-dsin(forearm_ang+ang1s)*350,wall_parent_obj) {
	ang1s--
	forearm_ang+=ang1s
}
forearm_ang = clamp(forearm_ang,270,450)

var el_x = hand_x+dcos(forearm_ang)*350
var el_y = hand_y-dsin(forearm_ang)*350

timer++
if timer>10 {
	
	if !position_meeting(el_x+dcos(cutarm_ang+ang2s)*cut_length,el_y-dsin(cutarm_ang+ang2s)*cut_length,wall_parent_obj) {
		ang2s--
		cutarm_ang+=ang2s
	}
	cutarm_ang = clamp(cutarm_ang,180,450)
}

arm_w = 50
draw_set_color(c_green)
draw_set_alpha(1)


draw_line_width(hand_x,hand_y,el_x,el_y,arm_w)
draw_line_width(el_x,el_y,el_x+dcos(cutarm_ang)*cut_length,el_y-dsin(cutarm_ang)*cut_length,arm_w)
draw_sprite_ext(two_jointed_arm_out_t1,0,hand_x,hand_y,1,1,hand_ang,c_white,image_alpha)

draw_set_color(c_white)



/*arm_draw()
/*
draw_circle(seg_x[0],seg_y[0],30,false)
draw_circle(seg_x[1],seg_y[1],20,false)
draw_circle(seg_x[2],seg_y[2],10,false)