speedx = argument0
speedy = argument1
reduction = argument2
amount = argument3
vary_pos = argument4
width = argument5
height = argument6
//color = argument7


for (i=0;i<(amount+random_range(30,50));i++){
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
	
	var scalevar = random_range(0.1,1)
	particle.image_xscale = scalevar
	particle.image_yscale = scalevar
	particle.hspeed = tail_obj.throwxs * reduction + random_range(-3,3)
	particle.vspeed = tail_obj.throwys * reduction + random_range(-3,3)
	
}