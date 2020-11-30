//fuck yes

if !run {
	return
}
n=0
draw_set_color(c_red)
while n<num_rings-1 {
	//draw_line(rings_x[| n],rings_y[| n],rings_x[| n+1],rings_y[| n+1])
	if n<num_rings-2 || cut_bool {
		draw_sprite_ext(chandelier_chain,0,rings_x[| n],rings_y[| n],1,1,point_direction(rings_x[| n],rings_y[| n],rings_x[| n+1],rings_y[| n+1])+90,c_white,1)
	} else {
		draw_sprite_ext(chandelier_end,0,rings_x[| n],rings_y[| n],1,1,point_direction(rings_x[| n],rings_y[| n],rings_x[| n+1],rings_y[| n+1])+90,c_white,1)
	}
	n++
}
//n=0
//while n<num_rings {
//	draw_circle(rings_x[| n],rings_y[| n],5,false)
//	n++
//}
draw_set_color(c_white)