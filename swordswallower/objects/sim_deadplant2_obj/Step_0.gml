if num_rings>0 {
	if in_camera_range_bigger(x,y) || in_camera_range_bigger(rings_x[|num_rings-1],rings_y[|num_rings-1]) {
		run = true
	} else {
		run = false
	}
} else {
	if in_camera_range_bigger(x,y){
		run = true
	} else {
		run = false
	}
}
if !pinned {
	grav = 1.1
}
p_cut_check = true
if run {
	for(var i=0;i<2;i++){
		event_user(0)
	}
}