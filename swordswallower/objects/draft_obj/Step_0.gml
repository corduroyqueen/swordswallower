/// @description Insert description here
// You can write your code in this editor

if !player_obj.held_position {
	if place_meeting(x,y-64,player_obj) {
		player_obj.vspeed-=v_accel	
		player_obj.hspeed*=0.97
	} else if place_meeting(x,y-128,player_obj) {
		player_obj.vspeed-=v_accel*0.5
		player_obj.hspeed*=0.97
	}
}
if place_meeting(x,y-64,fly_obj) {
	var hallo = instance_place(x,y-64,fly_obj)
	hallo.vspeed -= v_accel*2
}