//fuck yes

n=0
var Lx
var Ly
var Lunitx
var Lunity
var mag
var s
var prev_force_x = 0
var prev_force_y = 0
var fx
var fy
while n<num_rings {
	if n<num_rings-1 {
		Lx = rings_x[| n]-rings_x[| n+1]
		Ly = rings_y[| n]-rings_y[| n+1]
		mag = point_distance(rings_x[| n],rings_y[| n],rings_x[| n+1],rings_y[| n+1])
		
		Lunitx = Lx/mag
		Lunity = Ly/mag
		
		//Lang = point_direction(rings_x[| n],rings_y[| n],rings_x[| n+1],rings_y[| n+1])
		s = mag - lo
		
		spring_hsp[| n] = -ks * s * Lunitx
		spring_vsp[| n] = -ks * s * Lunity
	}
	
	fx = spring_hsp[| n] - prev_force_x
	fy = spring_vsp[| n] + grav - prev_force_y
	if n==0 {
		fx=0
		fy=0
	}
	rings_hsp[| n] += fx * 0.01
	rings_vsp[| n] += fy * 0.01
	prev_force_x = spring_hsp[| n]
	prev_force_y = spring_vsp[| n]
	
	n++
}

n=0

while n<num_rings {
	rings_x[| n] = rings_x[| n] + rings_hsp[| n]
	rings_y[| n] = rings_y[| n] + rings_vsp[| n]
	if n<num_rings-1 {
		spring_x[| n] = rings_x[| n+1]
		spring_y[| n] = rings_y[| n+1]
		spring_axx = rings_x[| n] - rings_x[| n+1]
		spring_axy = rings_y[| n] - rings_y[| n+1]
	}
	n++
}