xc = argument0
yc = argument1

expand=150

//sdm(xc)
//sdm(yc)
//sdm("1")
//sdm(camera_get_view_x(view_camera[0])-2-expand)
//sdm(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])+2+expand)
//sdm("2")
//sdm(camera_get_view_y(view_camera[0])-2-expand)
//sdm(camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])+2+expand)


var cx = player_obj.camx
var cy = player_obj.camy
if xc<(cx+player_obj.cam_width+2+expand)
&& xc>(cx-2-expand)
&& yc<(cy+player_obj.cam_height+2+expand)
&& yc>(cy-2-expand) {
	return true
} else {
	return false	
}


