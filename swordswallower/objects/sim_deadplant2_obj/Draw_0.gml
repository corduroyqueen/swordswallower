//fuck yes


n=0
gpu_set_colorwriteenable(1,1,1,0)
draw_set_color(c_red)
while n<num_rings-1 {
	//draw_line(rings_x[| n],rings_y[| n],rings_x[| n+1],rings_y[| n+1])
	if n<num_rings-2 || cut_bool {
		if n%2==0 {
			draw_sprite_ext(venus_segment1,0,rings_x[| n],rings_y[| n],0.4,1,point_direction(rings_x[| n],rings_y[| n],rings_x[| n+1],rings_y[| n+1])+90,c_white,1)
		} else if n%2==1 {
			draw_sprite_ext(venus_segment2,0,rings_x[| n],rings_y[| n],0.4,1,point_direction(rings_x[| n],rings_y[| n],rings_x[| n+1],rings_y[| n+1])+90,c_white,1)
		}
	}
	//} else {
	//	draw_sprite_ext(deadhead,0,rings_x[| n],rings_y[| n],1,1,point_direction(rings_x[| n],rings_y[| n],rings_x[| n+1],rings_y[| n+1])+90,c_white,1)
	//}
	n++
}
gpu_set_colorwriteenable(1,1,1,1)
//n=0
//while n<num_rings {
//	draw_circle(rings_x[| n],rings_y[| n],5,false)
//	n++
//}
draw_set_color(c_white)