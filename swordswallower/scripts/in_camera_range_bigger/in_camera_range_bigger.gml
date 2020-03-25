xc = argument0
yc = argument1

expand=150
if xc<(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])+2+expand)
&& xc>(camera_get_view_x(view_camera[0])-2-expand)
&& yc<(camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])+2+expand)
&& yc>(camera_get_view_y(view_camera[0])-2-expand) {
	return true
} else {
	return false	
}


