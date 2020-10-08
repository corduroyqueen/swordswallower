//fuck yes
timer++
if state==0 {
	x = start_x + (end_x - start_x) * timer/timer_m
	y = (start_y + (end_y - start_y) * timer/timer_m) //+ (timer/timer_m * 100)
	
	if x == end_x && y == end_y {
		state=1
	}
} else {
	x = end_x
	y+=fall_speed
	if place_meeting(x,y,wall_parent_obj) {
		instance_destroy()
	}
}