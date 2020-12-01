//fuck yes
if !run {
	return
}
gpu_set_colorwriteenable(1,1,1,0)
n=0
draw_set_color(c_red)
while n<num_rings-1 {
	//draw_line(rings_x[| n],rings_y[| n],rings_x[| n+1],rings_y[| n+1])
	var spr
	if n%2==0 {
		spr=rope_bit_even
	} else {
		spr=rope_bit_odd
	}
	draw_sprite_ext(spr,0,rings_x[| n],rings_y[| n],1,1,point_direction(rings_x[| n],rings_y[| n],rings_x[| n+1],rings_y[| n+1])+90,c_white,1)
	n++
}
gpu_set_colorwriteenable(1,1,1,1)
//n=0
//while n<num_rings {
//	draw_circle(rings_x[| n],rings_y[| n],5,false)
//	n++
//}
draw_set_color(c_white)