xc = argument0
yc = argument1

//expand=150

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
if abs(xc-(cx+960))<960+150 &&
abs(yc-(cy+540))<540+150 {
	return true	
} else {
	return false
}

/*
if xc<(cx+1920+2+150)
&& xc>(cx-2-150)
&& yc<(cy+1080+2+150)
&& yc>(cy-2-150) {
	return true
} else {
	return false	
}


