
if num_rings==0 {
	return
}
if !pinned {
	grav = 1.1
}
var lll = max(0,num_rings-1)
if in_camera_range_bigger(x,y) && in_camera_range_bigger(rings_x[|lll],rings_y[|lll]) {
	run = true
} else {
	run = false
}
p_cut_check = true
if run {
	
	for(var i=0;i<2;i++){
		event_user(0)
	}
}
