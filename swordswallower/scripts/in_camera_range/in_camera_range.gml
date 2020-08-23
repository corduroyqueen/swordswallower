xc = argument0
yc = argument1

var cx = player_obj.camx
var cy = player_obj.camy
if xc<(cx+player_obj.cam_width+2)
&& xc>(cx-2)
&& yc<(cy+player_obj.cam_height+2)
&& yc>(cy-2) {
	return true
} else {
	return false	
}


