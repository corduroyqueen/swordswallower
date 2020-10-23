local_obj = argument0
sdm("lel")
tarx = x - local_obj.x
tary = y - local_obj.y

direcxh = cos(degtorad(local_obj.image_angle));
direcyh = -sin(degtorad(local_obj.image_angle));

direcxv = cos(degtorad(local_obj.image_angle+90));
direcyv = -sin(degtorad(local_obj.image_angle+90));

sdm(local_obj.sprite_height)
sdm(local_obj.sprite_width)


dy = dot_product(tarx,tary,direcxv,direcyv)
if dy>=(local_obj.sprite_height/2) { sdm("1") ang = local_obj.image_angle+90 }
if dy<=-(local_obj.sprite_height/2) { sdm("2") ang = local_obj.image_angle+270 }


dx = dot_product(tarx,tary,direcxh,direcyh)
if dx>=(local_obj.sprite_width/2) { sdm("3") ang = local_obj.image_angle }
if dx<=-(local_obj.sprite_width/2) { sdm("4") ang = local_obj.image_angle+180 }

sdm("dun")
//dy = dot_product(tarx,tary,direcxv,direcyv)
//if dy>=(abs(local_obj.image_yscale) * 16) { ang = local_obj.image_angle+90 }
//if dy<=(-abs(local_obj.image_yscale) * 16) { ang = local_obj.image_angle+270 }


//dx = dot_product(tarx,tary,direcxh,direcyh)
//if dx>=(abs(local_obj.image_xscale) * 16) { ang = local_obj.image_angle }
//if dx<=(-abs(local_obj.image_xscale) * 16) { ang = local_obj.image_angle+180 }


//dy = dot_product(tarx,tary,direcxv,direcyv)
//if dy>=(local_obj.bbox_bottom - y) { ang = local_obj.image_angle+90 }
//if dy<=(local_obj.bbox_top - y) { ang = local_obj.image_angle+270 }


//dx = dot_product(tarx,tary,direcxh,direcyh)
//if dx>=(local_obj.bbox_right - x) { ang = local_obj.image_angle }
//if dx<=(local_obj.bbox_left - x) { ang = local_obj.image_angle+180 }
