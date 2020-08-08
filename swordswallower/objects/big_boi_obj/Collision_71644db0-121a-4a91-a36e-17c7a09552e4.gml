/// @description Insert description here
// You can write your code in this editor

if other.x<x {
	wallheight = 0
	while (wall_detect(x-10,y-wallheight) && wallheight <= maxheight) wallheight += 1;
	if wallheight<=maxheight && wallheight>10 {
		sdm("ok")
		climbing=true
	}
} else if on_wall_right {
	wallheight = 0
	while (wall_detect(x+10,y-wallheight) && wallheight <= maxheight) wallheight += 1;
	if wallheight<=maxheight && wallheight>10 {
		sdm("ok")
		climbing=true
	}
}
	
default_collision(other)