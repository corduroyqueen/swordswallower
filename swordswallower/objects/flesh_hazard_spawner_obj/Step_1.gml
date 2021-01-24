/// @description Insert description here
// You can write your code in this editor
if !start {
	return	
}
for(i=-num_to_spawn/2;i<num_to_spawn/2;i++) {
	ak = instance_create_depth(x,y,depth,flesh_hazard_weed_obj)
	ak.x = x + cos(degtorad(image_angle))	* i * 64
	ak.y = y - sin(degtorad(image_angle))	* i * 64
	ak.startx = ak.x
	ak.starty = ak.y
	ak.image_angle = image_angle
	ak.active = active
	ds_list_add(array_members,ak)
}
l = ds_list_size(array_members)
start = false