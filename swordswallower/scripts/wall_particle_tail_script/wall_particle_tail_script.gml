speedxp = argument0
speedyp = argument1
reduction = argument2
amount = argument3
vary_pos = argument4
width = argument5
height = argument6
color = argument7

//ang = point_direction(0,0,speedxp,speedyp)

//normx = cos(degtorad(ang))
//normy = -sin(degtorad(ang))

//dot = dot_product(-normx,-normy,speedxp,speedyp)

//if (dot<0){
//	dot *= -1;
//	normx *= -1;
//	normy *= -1;
//}

//speedx = (other.normx * other.dot)
//speedy = (-other.normy * other.dot)
var lelang = point_direction(0,0,throwxs,throwys)+180
for (i=0;i<(amount+random_range(2,9));i++){
	var poschangex
	var poschangey
	if vary_pos {
		poschangex = random_range(-width/2,width/2)
		poschangey = random_range(-height/2,height/2)
	} else {
		poschangex = 0
		poschangey = 0
	}
	
	
	
	particle = instance_create_depth(
	x+poschangex-throwxs/3,
	y+poschangey-throwys/3,
	-1,miscparticle_obj)
	
	var scalevar = random_range(0.1,0.6)
	particle.image_xscale = scalevar
	particle.image_yscale = scalevar
	var ta = lelang*random_range(0.8,1.2)
	particle.hsp = cos(degtorad(ta))*2.5*random_range(0.5,1.5)
	particle.vsp = -sin(degtorad(ta))*2.5*random_range(0.5,1.5)
	particle.image_angle = random_range(0,360)
	particle.sprite_index = color
	
}