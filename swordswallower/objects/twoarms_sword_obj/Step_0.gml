/// @description Insert description here
// You can write your code in this editor
if state == state_held {
	x = parent.handx
	y = parent.handy
	tarx = lerp(tarx,player_obj.x,0.05)
	tary = player_obj.y
	tarx = player_obj.x
	sprite_index = big_sword_t
	timer=0
	with parent {
		other.image_angle = seg_get_angle(1)
	}
} else if state == state_throwing {
	if timer<1 {
		move_towards_point(tarx,tary,40)
	}
	timer++
	sprite_index = big_sword_whirling_t
	if wall_detect(x,y) {
		state = state_planted
		timer=0
		image_angle = point_direction(0,0,hsp,vsp)-90
		hsp=0
		vsp=0
		timer=0
	}
} else if state == state_planted {
	sprite_index = big_sword_t
} else if state == state_pulling {
	timer++
	if timer<15 {
		sprite_index = big_sword_t
		image_angle+=random_range(-5,5)	
	} else {
		sprite_index = big_sword_whirling_t
		move_towards_point(parent.handx,parent.handy,50)
	}
	if point_distance(x,y,parent.handx,parent.handy)<51 {
		state = state_held	
	}
}