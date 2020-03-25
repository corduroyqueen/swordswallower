box = argument0
xpos = argument1
ypos = argument2


if xpos>box.x-(box.sprite_width/2) &&
xpos<box.x+(box.sprite_width/2) &&
ypos>box.y-(box.sprite_height/2) &&
ypos<box.y+(box.sprite_height/2) {
	return true	
} else {
	return false	
}