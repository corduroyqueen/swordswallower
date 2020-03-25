/// @description Insert description here
// You can write your code in this editor
if player_obj.intro {
	x = player_obj.x
	y = player_obj.y
} else {
	x = camera_get_view_x(view_camera[0])	
	y = camera_get_view_y(view_camera[0])	
}