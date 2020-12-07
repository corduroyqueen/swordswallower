//fuck yes
//fuck yes

n=0

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
addfx = 0
addfy = 0
if player_obj.held_position_start && held_timer<1 {
	var d = point_distance(x,y,player_obj.x,player_obj.y)
	var hti = clamp(5-d/500,0,5)
	addfx = (player_obj.x-x)/d * hti
	addfy = (player_obj.y-y)/d * hti
	held_timer = 1000
} else {
	if held_timer>0 {
		held_timer--
	}
	
}
if player_obj.tail_planted || player_obj.tail_carry {
	met = false
}
//sinc+=choose(-1,0,1)

var wind = level1_master.wind_strength
//wind = clamp( (dsin(current_time/1000000)+0.6)*0.1   ,0,1)
//addfx+=wind
var x1,y1,x2,y2
while n<num_rings {
	spring_fx=0
	spring_fy=0
	
	if n<num_rings-1 {
		x1 = rings_x[| n]
		y1 = rings_y[| n]
		x2 = rings_x[| n+1]
		y2 = rings_y[| n+1]
		Lx = x1-x2
		Ly = y1-y2
		mag = point_distance(rings_x[| n],rings_y[| n],rings_x[| n+1],rings_y[| n+1])
		ang = point_direction(rings_x[| n],rings_y[| n],rings_x[| n+1],rings_y[| n+1])
		Lunitx = Lx/lo
		Lunity = Ly/lo
		//sdm(point_distance(0,0,Lunitx,Lunity))
		
		//Lang = point_direction(rings_x[| n],rings_y[| n],rings_x[| n+1],rings_y[| n+1])
		s = mag-lo
		//sdm(Lunitx)
		//sdm(Lunity)
		spring_fx = -ks * s * Lunitx * lel
		spring_fy = -ks * s * Lunity * lel
		
		
		spring_fx+=addfx
		spring_fy+=addfy
		
		
		//move gravity additionright here for cool shit
	} 
	
	
	
	//var fricx = Lx * fric
	//var fricy = Ly * fric
	
	//sdm("ok")
	//sdm(spring_fx)
	//sdm(spring_fy)
	tgrav = mass * grav
	if n>num_rings-2 {
		tgrav*=2
	}
	fx = spring_fx - prev_force_x
	fy = spring_fy + tgrav - prev_force_y
	if n==0 && pinned {
		fx=0
		fy=0
	} 
	
	var tkko
	if pinned {
		tkko = 0.99
	} else {
		tkko = 1
	}
	rings_hsp[| n] = (rings_hsp[| n] + fx/mass * dt) * tkko
	rings_vsp[| n] = (rings_vsp[| n] + fy/mass * dt) * tkko
	prev_force_x = spring_fx
	prev_force_y = spring_fy
	n++
}

n=0

if player_obj.tail_throwing && point_distance(x,y,tail_obj.x,tail_obj.y)<300 && p_cut_check  {
	check_sw = true
} else {
	check_sw = false
}
cut = -1
while n<num_rings {
	rings_x[| n] = rings_x[| n] + rings_hsp[| n]/mass * dt
	rings_y[| n] = rings_y[| n] + rings_vsp[| n]/mass * dt
	if check_sw && cut<0{
		if point_distance(rings_x[| n],rings_y[| n],tail_obj.x,tail_obj.y)<35 && !met {
			met = true
			cut=n
		}
	}
	//if n>0 {
	//	spring_x[| n] = rings_x[| n]
	//	spring_y[| n] = rings_y[| n]
	//	spring_axx = rings_x[| n-1] - rings_x[| n]
	//	spring_axy = rings_y[| n-1] - rings_y[| n]
	//}
	n++
}

if cut>-1 {
	p_cut_check = false
	var ok = instance_create_depth(rings_x[| cut],rings_y[| cut],depth,object_index)
	//ok.pinned = false
	//ok.run = true
	ok.num_rings = num_rings - cut
	var ww
	with ok {
		init = false
		event_user(1)
		pinned = false
		run = true
		
		for (var e=0;e<num_rings;e++) { 
			ww = other.cut+e
			rings_x[| e] = other.rings_x[| ww]
			rings_y[| e] = other.rings_y[| ww]
			rings_hsp[| e] = other.rings_hsp[| ww]
			rings_vsp[| e] = other.rings_vsp[| ww]
			
		
		}
	}
	
	ok.cut_bool = cut_bool
	cut_bool = true
	//var spark = instance_create_depth(ok.x,ok.y,depth+1,spark_particle_effect_obj)
	//spark.angle = point_direction(0,0,-tail_obj.hsp,-tail_obj.vsp)
	
	num_rings = cut+1
}