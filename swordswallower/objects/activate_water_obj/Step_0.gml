/// @description Insert description here
// You can write your code in this editor
if point_distance(x,y,player_obj.x,player_obj.y)<100 && player_obj.k_speak_p {
	with dc_water_obj {
		mask_index = daytime
		visible = true
		x=startx
		y=starty
	}
	level1_master.waterbool = true
}