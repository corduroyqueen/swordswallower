speedx = argument0
speedy = argument1
reduction = argument2
amount = argument3
vary_pos = argument4
width = argument5
height = argument6
obj = argument7
color = argument8
//color = argument7


for (i=0;i<(amount+random_range(10,60));i++){
	
	
	particle = instance_create_depth(x,y,-1,obj)
	
	var scalevar = random_range(0.2,2)
	particle.image_xscale = scalevar
	particle.image_yscale = scalevar
	particle.hsp = speedx * reduction + random_range(-3,3)
	particle.vsp = speedy * reduction + random_range(-3,3)
	particle.image_blend = color
	
}