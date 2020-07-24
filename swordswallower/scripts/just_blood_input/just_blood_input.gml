speedx = argument0
speedy = argument1
xad = argument2
yad = argument3
amount = argument4
vary_pos = argument5
width = argument6
height = argument7
//color = argument7

blood_splat_script()

for (i=0;i<(amount+40);i++){
	var poschangex
	var poschangey
	if vary_pos {
		poschangex = random_range(-width/2,width/2)
		poschangey = random_range(-height/2,height/2)
	} else {
		poschangex = 0
		poschangey = 0
	}
	
	
	
	particle = instance_create_depth(x+poschangex,y+poschangey,-1,blood_obj)
	
	var scalevar = (amount+40-i)/(amount+40)
	var angle = point_direction(0,0,tail_obj.throwxs,tail_obj.throwys)
	particle.image_xscale = scalevar
	particle.image_yscale = scalevar
	particle.hspeed = cos(degtorad(angle+random_range(-30,30))) * i/10 * 10
	particle.vspeed = -sin(degtorad(angle+random_range(-30,30))) * i/10 * 10 - 5
	
	
	
	//var scalevar = random_range(0.1,1)
	//particle.image_xscale = scalevar
	//particle.image_yscale = scalevar
	//particle.hspeed = xad + random_range(-3,3)*
	//	choose(0.0,0,0,1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,
	//		1,1,1,1,1,1,1,1,1,1,1,1.1,1.2,1.3,1.4,1.5,1.75,1.7,2,4)
			
	//particle.vspeed = yad + random_range(-4,2)*
	//	choose(0.0,0,0,1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,
	//		1,1,1,1,1,1,1,1,1,1,1,1.1,1.2,1.3,1.4,1.5,1.75,1.7,2,4)
			
	if i%10==0 {
		particle.spr = blood_sprite_spr2
	} else {
		particle.spr = blood_sprite_spr
	}
	particle.scalevar = scalevar
	particle.rot = random_range(0,360)
	
}