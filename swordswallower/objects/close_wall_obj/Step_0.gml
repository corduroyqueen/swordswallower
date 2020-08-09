/// @description Insert description here
// You can write your code in this editor
if length ==0 {
	length = point_distance(startx,starty,endx,endy)	
}

if startx<endx {
	x1 = startx
	x2 = endx
} else {
	x1 = endx
	x2 = startx
}
if starty<endy {
	y1 = starty
	y2 = endy
} else {
	y1 = endy
	y2 = starty
}
if master.enter {
	enabled = true	
}
if master.ended {
	enabled = false	
}
if enabled {
	if point_distance(x,y,endx,endy)>1 {
		//movespeed = (length/(point_distance(x,y,endx,endy)) + 0.1)*(length/(point_distance(x,y,endx,endy)) + 0.1) * 1.3
		sp_towards_target(endx,endy,movespeed,1)
		if point_distance(x,y,endx,endy)<(1+speed) && in_camera_range_bigger(x,y){
			player_obj.shake_d=6
			player_obj.camera_shake_d = true	
			audio_play_sound(metal_door,0,false)
			audio_play_sound(Emergency_Sandbag_Heavy_Hitting_Rocks_02,0,false)
			audio_play_sound(hit_wall,0,false)
		}
	} else {
		x = endx
		y = endy
		//movespeed = 0
		hsp = 0  
		vsp = 0
	}
} else {
	if point_distance(x,y,startx,starty)>1 {
		//movespeed = (length/(point_distance(x,y,startx,starty)) + 0.1)*(length/(point_distance(x,y,startx,starty)) + 0.1) * 1.3
		sp_towards_target(startx,starty,movespeed,1)
		if point_distance(x,y,startx,starty)<(1+speed){
			player_obj.shake_d=6
			player_obj.camera_shake_d = true	
		}
	} else {
		x = startx
		y = starty
		//movespeed = 0
		hsp = 0  
		vsp = 0
	}
}
x = clamp(x,x1,x2)
y = clamp(y,y1,y2)

if in_camera_range_bigger(x,y) {
	moving_plat_move(hsp,vsp)
} else {
	moveZoomX(hsp)	
	moveZoomY(vsp)	
}