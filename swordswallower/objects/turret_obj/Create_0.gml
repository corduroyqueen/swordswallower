/// @description Insert description here
// You can write your code in this editor
shooting = true
shooting_timer=0
tracking =true

death = false
death_timer = 0

if !variable_instance_exists(instance_place(x,y,all).id, "pers") {
	local_obj = self
	
} else if place_meeting(x,y,all) {
	//sdm("goooooooooooo")
	if instance_place(x,y,all).pers==0 {
		local_obj = instance_place(x,y,all)
		//sdm("lelelelel")
	}
}

if place_meeting(x,y,wall_obj) {
	local_obj = instance_place(x,y,wall_obj)
}

tarx = x - local_obj.x
tary = y - local_obj.y

direcxh = cos(degtorad(local_obj.image_angle));
direcyh = -sin(degtorad(local_obj.image_angle));
direcxv = cos(degtorad(local_obj.image_angle+90));
direcyv = -sin(degtorad(local_obj.image_angle+90));


dy = dot_product(tarx,tary,direcxv,direcyv)

walkang = 0
if dy>=(abs(local_obj.image_yscale) * 16) { walkang = local_obj.image_angle+90 }
if dy<=(-abs(local_obj.image_yscale) * 16) { walkang = local_obj.image_angle+270 }

dx = dot_product(tarx,tary,direcxh,direcyh)
if dx>=(abs(local_obj.image_xscale) * 16) { walkang = local_obj.image_angle }
if dx<=(-abs(local_obj.image_xscale) * 16) { walkang = local_obj.image_angle+180 }



image_angle = walkang+270

while place_meeting(x,y,local_obj) {
	x+=cos(degtorad(walkang))
	y+=-sin(degtorad(walkang))
}


timer_max = 60