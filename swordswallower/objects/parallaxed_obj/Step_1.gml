/// @description Insert description here
// You can write your code in this editor
if start {
	x = x - (x/parallax_num)
	
	vBaseX = x
	vBaseY = y
	start = false	
	if !variable_instance_exists(id,"distance") {
		distance = 1280	
	}
}