speedx = argument0
speedy = argument1
reduction = argument2
amount = argument3
vary_pos = argument4
width = argument5
height = argument6
//color = argument7

blood_splat_script()

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
	particle.hspeed = tail_obj.throwxs * reduction + random_range(-3,3) *
		choose(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,
			1,1,1,1,1,1,1,1,1,1,1,1.1,1.2,1.3,1.4,1.5,1.75,1.7,2,4)
		
	particle.vspeed = tail_obj.throwys * reduction + random_range(-3,3) *
		choose(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,
			1,1,1,1,1,1,1,1,1,1,1,1.1,1.2,1.3,1.4,1.5,1.75,1.7,2,4)
	
}