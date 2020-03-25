/// @description Insert description here
// You can write your code in this editor
if place_meeting(x,y,player_obj) && !player_obj.zoom_timer_bool {
	if player_obj.vspeed>0.1 {
		timer++	
	}
	
	player_obj.vspeed=0.3
	player_obj.hspeed/= 1.05 + timer/300
	
	
} else {
	timer = 0	
}

if player_obj.y - player_obj.sprite_height - 40 > y - sprite_height/2
&& place_meeting(x,y,player_obj) {
	damage_script(10,sign(player_obj.x-x),5,-1)
}