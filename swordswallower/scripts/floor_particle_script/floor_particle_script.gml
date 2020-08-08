
//ang = point_direction(0,0,speedxp,speedyp)

//normx = cos(degtorad(ang))
//normy = -sin(degtorad(ang))

//dot = dot_product(-normx,-normy,speedxp,speedyp)

//if (dot<0) {
//	dot *= -1;
//	normx *= -1;
//	normy *= -1;
//}

//speedx = (other.normx * other.dot)
//speedy = (-other.normy * other.dot)


if //position_meeting(player_obj.x+84 * -player_sprite_obj.image_xscale, player_obj.y+34, wall_obj) && 
player_obj.tail_carry &&
player_obj.grounded && 
abs(player_obj.hsp)>1 {
	
	particle = instance_create_depth(
	player_obj.x+84 * -player_sprite_obj.image_xscale,
	player_obj.y+33,
	-1000,
	spark_particle_obj)
	
	var scalevar = random_range(0.1,0.5)
	particle.image_xscale = scalevar*3
	particle.image_yscale = scalevar*0.5
	var speedstart = choose(2,1.5,1.25,1.2,1.15,1.1,1.05,1,1,1,1,0.95,0.9,0.85,0.8,0.75,0.5,0.4,0.2,0.1,0,-0.1,-0.2)
	particle.hspeed = player_obj.hsp/3 * speedstart * random_range(0.9,1.05)
	
	particle.vspeed = -6* random_range(0.9,1.1)
	
	particle.image_angle = point_direction(0,0,particle.hspeed,particle.vspeed)+90
	particle.color_timer = 0.5-scalevar
	if !audio_is_playing(scrape_s) {
		
		audio_play_sound(scrape_s,0,true)
		
	}

} else {
	if audio_is_playing(scrape_s) {
		audio_stop_sound(scrape_s)	
	}
}