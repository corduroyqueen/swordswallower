/// @description Insert description here
// You can write your code in this editor
if !start {
	return	
}
for(i=-num_to_spawn/2;i<num_to_spawn/2;i++) {
	ak = instance_create_depth(x,y,depth,deathweed_obj)
	ak.x = x + cos(degtorad(image_angle))	* i * 64
	ak.y = y - sin(degtorad(image_angle))	* i * 64
	ak.image_angle = image_angle
	ak.active = active
}
start = false