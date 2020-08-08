speedxp = argument0
speedyp = argument1
reduction = argument2
amount = argument3
vary_pos = argument4
width = argument5
height = argument6
color = argument7

ang = point_direction(0,0,speedxp,speedyp)

normx = cos(degtorad(ang))
normy = -sin(degtorad(ang))

dot = dot_product(-normx,-normy,speedxp,speedyp)

if (dot<0) {
	dot *= -1;
	normx *= -1;
	normy *= -1;
}

speedx = (other.normx * other.dot)
speedy = (-other.normy * other.dot)

for (i=0;i<(amount+random_range(5,15));i++){
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
	player_hitbox_check_obj.x+poschangex,
	player_hitbox_check_obj.y+poschangey,
	-1,miscparticle_obj)
	
	var scalevar = random_range(0.1,0.6)
	particle.image_xscale = scalevar
	particle.image_yscale = scalevar
	particle.hsp = -player_obj.held_start_hsp * reduction + random_range(-3,3)
	particle.vsp = -player_obj.held_start_vsp/20 + random_range(-3,3)
	particle.image_angle = random_range(0,360)
	particle.sprite_index = color
	
}