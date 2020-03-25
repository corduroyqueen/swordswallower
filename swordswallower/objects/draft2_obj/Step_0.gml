/// @description Insert description here
// You can write your code in this editor

if !player_obj.held_position  {
	if place_meeting(x,y,tail_obj) && !player_obj.tail_carry {
		
	} else if place_meeting(x,y-2,player_obj) {
		//player_obj.hspeed=cos(degtorad(image_angle+90))*h_accel
		//player_obj.vspeed=-sin(degtorad(image_angle+90))*h_accel
		/*player_obj.tail_planted = false
		player_obj.tail_throwing = false
		player_obj.tail_pulling = true
		player_obj.held_release_timer = 60*/
		player_obj.vspeed=-h_accel
	} 
}
if place_meeting(x,y-64,fly_obj) {
	var hallo = instance_place(x,y-64,fly_obj)
	hallo.vspeed -= v_accel*2
}