obj = argument[0]


if argument_count>1 {
	timer = argument[1]
} else {
	timer = 3
}
//sdm("hitpause")
hitpause = true
image_angle = point_direction(x,y,obj.x,obj.y)-90
tail_obj.hitpause_timer = timer