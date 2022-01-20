inputlistx = argument0
inputlisty = argument1
color = argument2

draw_set_color(color)
draw_set_alpha(1)
var tx,ty
tx = x-150
ty = y-150
for (var pts=1;pts<7;pts++) {
	draw_line_width(tx+inputlistx[|pts],ty+inputlisty[|pts],tx+inputlistx[|pts-1],ty+inputlisty[|pts-1],(7-pts)*2+1)
}
draw_set_color(c_blue)
for (var pts=0;pts<7;pts++) {
	//draw_circle(tx+cape_p_l_x[|pts],ty+cape_p_l_y[|pts],5,false)
}
//draw_circle(tx+cape_p_l_x[|0],ty+cape_p_l_y[|0],10,false)
draw_set_color(c_white)