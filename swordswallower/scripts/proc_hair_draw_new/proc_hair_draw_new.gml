draw_set_color(c_red)var tx,ty
tx = x-150
ty = y-150

for (var pts=1;pts<hair_length;pts++) {
	draw_line_width(tx+hair_1_x[|pts],ty+hair_1_y[|pts],tx+hair_1_x[|pts-1],ty+hair_1_y[|pts-1],10)
}