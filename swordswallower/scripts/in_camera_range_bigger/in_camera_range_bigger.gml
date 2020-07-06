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



if xc<(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])+2+expand)
&& xc>(camera_get_view_x(view_camera[0])-2-expand)
&& yc<(camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])+2+expand)
&& yc>(camera_get_view_y(view_camera[0])-2-expand) {
	return true
} else {
	return false	
}


