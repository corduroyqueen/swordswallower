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

//lell_ang = point_direction(0,0,speedxp,speedyp)+180
//with wall_piece_particle_spawn_obj {
//	iang = other.lell_ang
//	ix = other.x
//	iy = other.y
	
//	part_type_life(part_type, 100,150);
//	part_type_gravity(part_type, 0.7, 270);
//	part_type_speed(part_type, random_range(-2,0) - sin(iang) * 5,random_range(0,2)-sin(iang) * 5, 0, 0.1);
//	part_type_direction(part_type, iang-60, iang+60, 0, 0);

//	part_type_orientation( part_type, 0,359, 3, 1, false );
//	part_emitter_region(part_system, part_emitter, ix-10, ix+30, iy-10, iy+10, ps_shape_ellipse,ps_distr_gaussian);
//	part_emitter_burst(part_system, part_emitter, part_type, 50);
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