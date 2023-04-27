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
//var rip = sprite_get_texture(spr_cloak_2,0)

var rate = 100
if player_obj.k_left || player_obj.k_right {
	rate = 50
}

var rip = sprite_get_texture(SWSW_cape_base_end_smaller2,floor(current_time/rate) % 63)

if keyboard_check(ord("N")) {
	rip = sprite_get_texture(spr_cloak_2,0)
}

draw_primitive_begin_texture(pr_trianglestrip,rip)

var cl = make_color_rgb(0.8,0.3,0.5)
cl = make_color_rgb(150,150,150)
//cl = c_white

/*var pt_amt = 3

for (var pts=0;pts<4;pts++) {
	//draw_line_width(tx+cape_p_l_x[|pts],ty+cape_p_l_y[|pts],tx+cape_p_r_x[|pts-1],ty+cape_p_r_y[|pts-1],10)
	draw_vertex_texture_color(tx+cape_p_l_x[|pts],ty+cape_p_l_y[|pts],0,pts/pt_amt,cl,1)
	draw_vertex_texture_color(tx+cape_p_r_x[|pts],ty+cape_p_r_y[|pts],1,pts/pt_amt,cl,1)
}*/

/*var pt_amt = 3

for (var pts=0;pts<4;pts++) {
	//draw_line_width(tx+cape_p_l_x[|pts],ty+cape_p_l_y[|pts],tx+cape_p_r_x[|pts-1],ty+cape_p_r_y[|pts-1],10)
	draw_vertex_texture_color(tx+140-(pts*20),ty+cape_p_l_y[|pts],0,pts/pt_amt,cl,1)
	draw_vertex_texture_color(tx+160+(pts*20),ty+cape_p_r_y[|pts],1,pts/pt_amt,cl,1)
}*/


/*
draw_vertex_texture_color(tx+90,ty+200,0,1,c_red,1)
draw_vertex_texture_color(tx+150,ty+200,0.5,1,c_green,1)
draw_vertex_texture_color(tx+150,ty+130,0.5,0,c_blue,1)
draw_vertex_texture_color(tx+210,ty+200,1,1,c_yellow,1)*/

/*draw_vertex_texture_color(tx+90,ty+200,0,1,c_red,1)
draw_vertex_texture_color(tx+210,ty+200,1,1,c_yellow,1)
draw_vertex_texture_color(tx+150,ty+130,0.5,0,c_blue,1)*/

/*draw_vertex_texture_color(tx+90,ty+200,0,1,c_red,1)
draw_vertex_texture_color(tx+150,ty+200,0.5,1,c_green,1)

draw_vertex_texture_color(tx+140,ty+130,0.4,0,c_blue,1)
draw_vertex_texture_color(tx+160,ty+130,0.6,0,c_blue,1)

draw_vertex_texture_color(tx+150,ty+200,0.5,1,c_green,1)
draw_vertex_texture_color(tx+210,ty+200,1,1,c_yellow,1)*/


//pts = 4
//draw_vertex_texture_color(tx+cape_p_l_x[|pts],ty+cape_p_l_y[|pts],0,pts/pt_amt,cl,1)

//draw_vertex_texture_color(tx+cape_p_r_x[|pts],ty+cape_p_r_y[|pts],1,pts/pt_amt,cl,1)

//draw_vertex_texture_color(
//	(tx+cape_p_l_x[|pts] + tx+cape_p_r_x[|pts])/2,
//	ty+cape_p_l_y[|pts] + 15,
//	0.5,pts/pt_amt,cl,1)


draw_primitive_end()

// left triangle

draw_primitive_begin_texture(pr_trianglestrip,rip)

if player_obj.k_left {
	
} else if player_obj.k_right {
	draw_vertex_texture_color(tx+30,ty+135,0,1,cl,1)
	draw_vertex_texture_color(tx+120,ty+170,0.7,1,cl,1)
	draw_vertex_texture_color(tx+140,ty+135,0,0,cl,1)
	draw_vertex_texture_color(tx+150,ty+135,0.7,0,cl,1)
} else {
	draw_vertex_texture_color(tx+90,ty+200,0,1,cl,1)
	draw_vertex_texture_color(tx+150,ty+190,0.7,1,cl,1)
	draw_vertex_texture_color(tx+130,ty+140,0,0,cl,1)
	draw_vertex_texture_color(tx+150,ty+135,0.7,0,cl,1)
}


draw_primitive_end()


// right triangle

draw_primitive_begin_texture(pr_trianglestrip,rip)

if player_obj.k_left {
	
} else if player_obj.k_right {
	draw_vertex_texture_color(tx+150,ty+135,0.3,0,cl,1)
	draw_vertex_texture_color(tx+160,ty+135,0.8,0,cl,1)
	draw_vertex_texture_color(tx+120,ty+170,0.3,1,cl,1)
	draw_vertex_texture_color(tx+170,ty+200,0.8,1,cl,1)
} else {
	draw_vertex_texture_color(tx+150,ty+135,0.3,0,cl,1)
	draw_vertex_texture_color(tx+170,ty+140,1,0,cl,1)
	draw_vertex_texture_color(tx+150,ty+190,0.3,1,cl,1)
	draw_vertex_texture_color(tx+210,ty+200,1,1,cl,1)
}
draw_primitive_end()


draw_set_color(c_white)