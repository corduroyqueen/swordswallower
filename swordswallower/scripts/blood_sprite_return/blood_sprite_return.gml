bobj = argument0
wobj = argument1


var w = 16
//corner checks

if bobj.x<=wobj.x-wobj.sprite_width/2+w && bobj.y<=wobj.y-wobj.sprite_height/2+w && wobj.sprite_width>64 {
	//top left
	bobj.sprite_index = bloodsplatcorner
	bobj.x = wobj.x-wobj.sprite_width/2
	bobj.y = wobj.y-wobj.sprite_height/2
} else if bobj.x>=wobj.x+wobj.sprite_width/2-w && bobj.y<=wobj.y-wobj.sprite_height/2+w  && wobj.sprite_width>64 {
	//top right
	bobj.sprite_index = bloodsplatcorner
	bobj.image_angle = 270
	bobj.x = wobj.x+wobj.sprite_width/2
	bobj.y = wobj.y-wobj.sprite_height/2
} else if bobj.x<=wobj.x-wobj.sprite_width/2+w && bobj.y>=wobj.y+wobj.sprite_height/2-w && wobj.sprite_width>64  {
	//bottom left
	bobj.image_angle = 90
	bobj.sprite_index = bloodsplatcorner
	bobj.x = wobj.x-wobj.sprite_width/2
	bobj.y = wobj.y+wobj.sprite_height/2
} else if bobj.x>=wobj.x+wobj.sprite_width/2-w && bobj.y>=wobj.y+wobj.sprite_height/2-w  && wobj.sprite_width>64 {
	//bottom right
	bobj.sprite_index = bloodsplatcorner
	bobj.image_angle = 180
	bobj.x = wobj.x+wobj.sprite_width/2
	bobj.y = wobj.y+wobj.sprite_height/2
} else {


	if bobj.y<=wobj.y-wobj.sprite_height/2+1 {
		//floor
		bobj.image_angle=0
		bobj.image_speed=random_range(0.00,0.05)
		
		bobj.sprite_index = choose(bloodsplat_d_1,bloodsplat_d_2,bloodsplat_d_3,bloodsplat_d_4)
		
	} else if bobj.y>=wobj.y+wobj.sprite_height/2-1 {
		//ceiling
		bobj.image_angle=0
		bobj.image_speed=random_range(0.00,0.05)
		bobj.sprite_index = choose(bloodsplat_u)
	} else if bobj.x<=wobj.x-wobj.sprite_width/2+1 {
		//left
		
		bobj.image_angle=0
		
		bobj.image_speed=random_range(0.01,0.05)
		
		if vs>0 {
			bobj.sprite_index = choose(bloodsplat_l_d1,bloodsplat_l_1)
		} else {
			bobj.sprite_index = choose(bloodsplat_l_u1,bloodsplat_l_1)
		}
	} else if bobj.x>=wobj.x+wobj.sprite_width/2-1 {
		//right
		bobj.image_angle=0
		bobj.image_xscale*=-1
		bobj.image_speed=random_range(0.01,0.05)
		if vs>0 {
			bobj.sprite_index = choose(bloodsplat_l_d1,bloodsplat_l_1)
		} else {
			bobj.sprite_index = choose(bloodsplat_l_u1,bloodsplat_l_1)
		}
	}
}