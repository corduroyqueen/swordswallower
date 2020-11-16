speedx = argument0
speedy = argument1
reduction = argument2
amount = argument3
vary_pos = argument4
width = argument5
height = argument6
//color = argument7

blood_splat_script()

amount/=2
for (i=0;i<(amount+40);i++){
	
	
	particle = instance_create_depth(x,y,-1,blood_obj)
	
	
	
	var scalevar = (amount+40-i)/(amount+40) * 1.1
	var angle = point_direction(0,0,speedx,speedy)
	particle.image_xscale = scalevar
	particle.image_yscale = scalevar
	if !variable_instance_exists(id,"blood_color") {
		blood_color = global.blood_color
	}
	particle.image_blend = blood_color
	angle = 90
	particle.hsp = cos(degtorad(angle+random_range(-30,30))) * (amount+20)/(amount+41-i) * 10
	
	
	//+ random_range(-3,3) *
	//	choose(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,
	//		1,1,1,1,1,1,1,1,1,1,1,1.1,1.2,1.3,1.4,1.5,1.75,1.7,2,4)
		
	particle.vsp = -sin(degtorad(angle+random_range(-30,30))) * (amount+20)/(amount+41-i) * 10 - 5 
	particle.hsp = clamp(particle.hsp,-20,20)
	particle.vsp = clamp(particle.vsp,-20,20)
	//+ random_range(-3,3) *
	//	choose(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,
	//		1,1,1,1,1,1,1,1,1,1,1,1.1,1.2,1.3,1.4,1.5,1.75,1.7,2,4)
	particle.scalevar = scalevar
	
	if rval==0 {
		rval = image_xscale
		bounce_vel = rval * random_range(0.7,1.4)
	}
	
	
	
}