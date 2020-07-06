ang = argument0
timer = argument1
timer_m = argument2
ispeed = argument3
xpos = argument4
ypos = argument5


	particle = instance_create_depth(xpos,ypos,-1,blood_obj)
	
	var scalevar = random_range(0.1,1)
	particle.image_xscale = scalevar
	particle.image_yscale = scalevar
		
	particle.hspeed = ispeed*cos(degtorad(ang*random_range(0.95,1.05)))*random_range(0.9,1.1)
			
	particle.vspeed = ispeed*-sin(degtorad(ang*random_range(0.95,1.05)))*random_range(0.9,1.1)