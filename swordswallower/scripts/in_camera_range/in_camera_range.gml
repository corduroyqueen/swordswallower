xc = argument0
yc = argument1

if xc<(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])+2)
&& xc>(camera_get_view_x(view_camera[0])-2)
&& yc<(camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])+2)
&& yc>(camera_get_view_y(view_camera[0])-2) {
	return true
} else {
	return false	
}


