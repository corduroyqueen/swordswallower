//fuck yes
dead_count=0
first_head_angle+=head_turn_rate
if first_head_angle>360 {
	first_head_angle = 0
}

for(var i=0; i<number_of_heads; i++) {
	var head = head_list[|i]
	head.x = x + lengthdir_x(head_length,first_head_angle + angle_head_difference * i)
	head.y = y + lengthdir_y(head_length,first_head_angle + angle_head_difference * i)
	if !head.hitbox_on {
		dead_count++
	}
}

if dead_count>=number_of_heads {
	for(var i=0; i<number_of_heads; i++) {
		instance_destroy(head_list[|i])
	}
	instance_destroy(id)
}