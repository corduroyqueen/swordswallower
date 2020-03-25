xin = argument0
yin = argument1
amt = argument2

for (i=0;i<amt;i++){
	lol = instance_create_depth(xin,yin,1,checkpoint_particle_obj)
	lol.vspeed=random_range(-3,-1)
	lol.hspeed = (i-amt/2)/2+random_range(-2,2)
}