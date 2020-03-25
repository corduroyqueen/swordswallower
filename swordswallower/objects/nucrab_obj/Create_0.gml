/// @description Insert description here
// You can write your code in this editor

h_accel = .3
h_max_speed = 2.5
grav = .4

going_right = false

met = false
sword_present = false

death = false

creat_cd = 25
thrown = false
writhing = false
falling = false
fallingoverride = false
override_killready = false

if !variable_instance_exists(instance_place(x,y,all).id, "pers") {
	local_obj = self		
} else if place_meeting(x,y,all) {
	if instance_place(x,y,all).pers==0 {
		local_obj = instance_place(x,y,all)
	}
} else {
	falling = true
	writhing = true	
}

pickedup = false
heldbymonster = false

tarx = x - local_obj.x
tary = y - local_obj.y

direcxh = cos(degtorad(local_obj.image_angle));
direcyh = -sin(degtorad(local_obj.image_angle));
direcxv = cos(degtorad(local_obj.image_angle+90));
direcyv = -sin(degtorad(local_obj.image_angle+90));

walkang=0

dy = dot_product(tarx,tary,direcxv,direcyv)
if dy>=(local_obj.image_yscale * 16) { walkang = local_obj.image_angle+90 }
if dy<=(-local_obj.image_yscale * 16) { walkang = local_obj.image_angle+270 }

dx = dot_product(tarx,tary,direcxh,direcyh)
if dx>=(local_obj.image_xscale * 16) { walkang = local_obj.image_angle }
if dx<=(-local_obj.image_xscale * 16) { walkang = local_obj.image_angle+180 }



image_angle = walkang+270

while place_meeting(x,y,local_obj) {
	x+=cos(degtorad(walkang))
	y+=-sin(degtorad(walkang))
}


fly_hp = 4
last_fly_hp = 4
//if dir_ground {
//	while !place_meeting(x,y+0.01,wall_obj) {
//		y+=0.01	
//	}
//}
//if dir_ceiling{
//	while !place_meeting(x,y-0.01,wall_obj) {
//		y-=0.01	
//	}
//}
//if dir_lwall {
//	while !place_meeting(x-0.01,y,wall_obj) {
//		x-=0.01	
//	}
//}
//if dir_rwall {
//	while !place_meeting(x+0.01,y,wall_obj) {
//		x+=0.01	
//	}
//}