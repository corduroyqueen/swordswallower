speedx = argument0
speedy = argument1
xad = argument2
yad = argument3
amount = argument4
vary_pos = argument5
width = argument6
height = argument7
//color = argument7

//blood_splat_script()

for (i=0;i<(80);i++){
	
	particle = instance_create_depth(x,y,-1,blood_obj)
	
	
	var scalevar = random_range(0.1,1)
	var angle = point_direction(0,0,player_obj.hsp,player_obj.vsp)+90
	
	particle.image_xscale = scalevar
	particle.image_yscale = scalevar
	
	if !variable_instance_exists(id,"blood_color") {
		//blood_color = global.blood_color
	}
	particle.image_blend = global.blood_color
	particle.hsp = cos(degtorad(angle+random_range(-30,30))) * 6 + random_range(-5.0,5.0)
	
	
	//+ random_range(-3,3) *
	//	choose(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,
	//		1,1,1,1,1,1,1,1,1,1,1,1.1,1.2,1.3,1.4,1.5,1.75,1.7,2,4)
		
	particle.vsp = -sin(degtorad(angle+random_range(-30,30))) * 7 - 4  + random_range(-5.0,5.0)
	//particle.hsp = clamp(particle.hsp,-20,20)
	//particle.vsp = clamp(particle.vsp,-20,20)
	//+ random_range(-3,3) *
	//	choose(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,
	//		1,1,1,1,1,1,1,1,1,1,1,1.1,1.2,1.3,1.4,1.5,1.75,1.7,2,4)
	//particle.spr = blood_sprite_spr1
	particle.scalevar = scalevar
	particle.rot = random_range(0,360)
	
}