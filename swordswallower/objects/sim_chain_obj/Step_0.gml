//fuck yes

n=0
dt = 6
lel = 1
var Lx
var Ly
var Lunitx
var Lunity
var mag
var s
prev_force_x = 0
prev_force_y = 0
var fx
var fy

var spring_fx
var spring_fy
while n<num_rings {
	spring_fx=0
	spring_fy=0
	if n<num_rings-1 {
		Lx = rings_x[| n]-rings_x[| n+1]
		Ly = rings_y[| n]-rings_y[| n+1]
		mag = point_distance(rings_x[| n],rings_y[| n],rings_x[| n+1],rings_y[| n+1])
		ang = point_direction(rings_x[| n],rings_y[| n],rings_x[| n+1],rings_y[| n+1])
		Lunitx = Lx/mag
		Lunity = Ly/mag
		//sdm(point_distance(0,0,Lunitx,Lunity))
		
		//Lang = point_direction(rings_x[| n],rings_y[| n],rings_x[| n+1],rings_y[| n+1])
		s = mag-lo
		//sdm(Lunitx)
		//sdm(Lunity)
		spring_fx = -ks * s * Lunitx * lel
		spring_fy = -ks * s * Lunity * lel
		
	} 
	//sdm("ok")
	//sdm(spring_fx)
	//sdm(spring_fy)
	tgrav = mass * grav
	fx = spring_fx - prev_force_x
	fy = spring_fy + tgrav - prev_force_y
	if n==0 {
		fx=0
		fy=0
	} 
	
	
	rings_hsp[| n] = rings_hsp[| n] + fx/mass * dt
	rings_vsp[| n] = rings_vsp[| n] + fy/mass * dt
	prev_force_x = spring_fx
	prev_force_y = spring_fy
	
	n++
}

n=0

while n<num_rings {
	rings_x[| n] = rings_x[| n] + rings_hsp[| n]/mass * dt
	rings_y[| n] = rings_y[| n] + rings_vsp[| n]/mass * dt
	if n>0 {
		spring_x[| n] = rings_x[| n]
		spring_y[| n] = rings_y[| n]
		spring_axx = rings_x[| n-1] - rings_x[| n]
		spring_axy = rings_y[| n-1] - rings_y[| n]
	}
	n++
}