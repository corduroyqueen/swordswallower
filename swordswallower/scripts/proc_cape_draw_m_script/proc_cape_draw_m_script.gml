color = argument0

draw_set_color(color)
draw_set_alpha(1)
var tx,ty
tx = x-150
ty = y-150

//color = make_color_rgb(217,4,70)
//for (var pts=1;pts<7;pts++) {
//	draw_line_width(tx+cape_p_l_x[|pts],ty+cape_p_l_y[|pts],tx+cape_p_r_x[|pts-1],ty+cape_p_r_y[|pts-1],10)
//}
var rip = sprite_get_texture(spr_ripped_cape,0)
rip = sprite_get_texture(capeTexture2,0)
draw_primitive_begin_texture(pr_trianglestrip,rip)

for (var pts=0;pts<7;pts++) {
	//draw_line_width(tx+cape_p_l_x[|pts],ty+cape_p_l_y[|pts],tx+cape_p_r_x[|pts-1],ty+cape_p_r_y[|pts-1],10)
	draw_vertex_texture_color(tx+cape_p_l_x[|pts],ty+cape_p_l_y[|pts],0,pts/6,color,1)
	draw_vertex_texture_color(tx+cape_p_r_x[|pts],ty+cape_p_r_y[|pts],1,pts/6,color,1)
}

draw_primitive_end()


for (var pts=0;pts<7;pts++) {
	//draw_circle(tx+cape_p_l_x[|pts],ty+cape_p_l_y[|pts],1,false)
}
//draw_circle(tx+cape_p_l_x[|0],ty+cape_p_l_y[|0],10,false)
draw_set_color(c_white)