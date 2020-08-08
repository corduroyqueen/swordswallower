/// @description Insert description here
// You can write your code in this editor

if following {
	if start {
		x = checkpoint_manager.x - 10
		y = checkpoint_manager.y - 10
		player_obj.xpreva2 = checkpoint_manager.x -9
		player_obj.ypreva2 = checkpoint_manager.y -32
		start = false
	}
	if point_distance(x,y,player_obj.xpreva2,player_obj.ypreva2)<1280 {
		x = lerp(x,player_obj.xpreva2,0.05)	
		y = lerp(y,player_obj.ypreva2-32,random_range(0.01,0.05))
	}
	
	if point_distance(x,y,player_obj.x,player_obj.y)>1280 {
		x = player_obj.x-9
		y = player_obj.y-9
	}
	
	x = player_obj.x+2+player_obj.hsp
	y = player_obj.y+2+player_obj.vsp/2
	
}
