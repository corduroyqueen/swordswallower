if in_camera_range_bigger(x,y) || in_camera_range_bigger(rings_x[|num_rings-1],rings_y[|num_rings-1]) {
	run = true
} else {
	run = false
}


if run {
	for(var i=0;i<4;i++){
		event_user(0)
	}
}