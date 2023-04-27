//fuck yes

mask_index = sprite_index

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

image_xscale = sign(hsp)
//image_angle = point_direction(x,y,hsp,vsp)
