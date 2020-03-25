/// @description Insert description here
// You can write your code in this editor
x = clamp(x,x1,x2)
y = clamp(y,y1,y2)
if start {
	if enabled {
		x = endx
		y = endy
	} else {
		x = startx
		y = starty
	}
	start = false	
}