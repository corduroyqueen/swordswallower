/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


lock = 1
closed = true


mask_index = -1

start = true
var angle = image_angle
var eee = 105
var distd = 130
angle += eee
chain1 = instance_create_depth(x+dcos(angle)*distd,y-dsin(angle)*distd,depth-1,sim_chain_obj)
chain1.num_rings = 14
//ok.pinned = false
//ok.run = true
with chain1 {
	init = false
	init_ang = point_direction(x,y,other.x,other.y)
	event_user(1)
	drawself = false
	pinned = true
	rings_pinned[|0] = true
	rings_pinned[|13] = true
	//rings_x[|15] = other.x - dcos(angle)*100
	//rings_y[|15] = other.y + dsin(angle)*100
	run = true
}
angle -= 30
chain2 = instance_create_depth(x+dcos(angle)*distd,y-dsin(angle)*distd,depth-1,sim_chain_obj)
chain2.num_rings = 14
//ok.pinned = false
//ok.run = true
with chain2 {
	init = false
	init_ang = point_direction(x,y,other.x,other.y)
	event_user(1)
	pinned = true
	drawself = false
	rings_pinned[|0] = true
	rings_pinned[|13] = true
	//rings_x[|15] = other.x - dcos(angle)*100
	//rings_y[|15] = other.y + dsin(angle)*100
	run = true
}
lockx = x
locky = y + 20



lock_surf = surface_create(40,46)
//for (var lot=0; lot<num_rings;lot++) {
//	if rings_pinned[|lot] {
//		pinned = true
//		break
//	}
//}
//var spark = instance_create_depth(ok.x,ok.y,depth+1,spark_particle_effect_obj)
//spark.angle = point_direction(0,0,-tail_obj.hsp,-tail_obj.vsp)