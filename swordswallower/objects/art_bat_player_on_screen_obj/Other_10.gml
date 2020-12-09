//fuck yes
if point_distance(x,y,player_obj.x,player_obj.y)<fly_dist || point_distance(x,y,tail_obj.x,tail_obj.y)<200 {
	idle = false
	hsp = -sign(image_xscale)*random_range(0,7)
	vsp = random_range(0,7)
	image_index = floor(random_range(0,4))
}