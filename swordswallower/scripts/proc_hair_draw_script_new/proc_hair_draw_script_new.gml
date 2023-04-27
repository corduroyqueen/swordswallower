color = argument0

var tx,ty
tx = x-150
ty = y-150

var rip = sprite_get_texture(spr_hair_1,0)

draw_primitive_begin_texture(pr_trianglestrip,rip)

var cl = make_color_rgb(1,0,0)

for (var pts=0;pts<6;pts++) {
	//draw_line_width(tx+hair_p_l_x[|pts],ty+hair_p_l_y[|pts],tx+hair_p_r_x[|pts-1],ty+hair_p_r_y[|pts-1],10)
	draw_vertex_texture_color(tx+hair_p_l_x[|pts],ty+hair_p_l_y[|pts],0,pts/6,c_gray,0.4)
	draw_vertex_texture_color(tx+hair_p_r_x[|pts],ty+hair_p_r_y[|pts],1,pts/6,c_gray,0.4)
}

draw_primitive_end()