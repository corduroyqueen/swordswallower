/// @description Insert description here
// You can write your code in this editor
if place_meeting(x,y,player_obj) && player_obj.k_speak_p && !player_obj.door_enter {
	player_obj.x = tx
	player_obj.y = ty
	player_obj.camx = tx-player_obj.cam_width_h
	player_obj.camy = ty-player_obj.cam_height_h
	player_obj.door_enter = true
}