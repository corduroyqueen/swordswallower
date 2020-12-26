draw_set_color(cloak_color)
draw_set_alpha(1)
var tx,ty
tx = x-150
ty = y-150
for (var pts=1;pts<7;pts++) {
	draw_line_width(tx+cape_p_l_x[|pts],ty+cape_p_l_y[|pts],tx+cape_p_l_x[|pts-1],ty+cape_p_l_y[|pts-1],(7-pts)*1.5+3)
}
for (var pts=0;pts<7;pts++) {
	//draw_circle(tx+cape_p_l_x[|pts],ty+cape_p_l_y[|pts],1,false)
}
//draw_circle(tx+cape_p_l_x[|0],ty+cape_p_l_y[|0],10,false)
draw_set_color(c_white)