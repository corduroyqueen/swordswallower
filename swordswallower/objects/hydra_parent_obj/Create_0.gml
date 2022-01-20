//fuck yes

// Inherit the parent event
event_inherited();

number_of_heads = 2

angle_head_difference = 360/number_of_heads

first_head_angle = 0
head_turn_rate = 3
head_length = 130

head_list = ds_list_create()
var head_loop
for(var i=0; i<number_of_heads; i++) {
	head_loop = instance_create_layer(x,y,layer,hydra_head_obj)
	ds_list_add(head_list,head_loop)
}

dead_count = 0