
tarx = x - local_obj.x
tary = y - local_obj.y

direcxh = cos(degtorad(local_obj.image_angle));
direcyh = -sin(degtorad(local_obj.image_angle));




direcxv = cos(degtorad(local_obj.image_angle+90));
direcyv = -sin(degtorad(local_obj.image_angle+90));

dy = dot_product(tarx,tary,direcxv,direcyv)
if dy>=(local_obj.image_yscale * 16) { ang = local_obj.image_angle+90 }
if dy<=(-local_obj.image_yscale * 16) { ang = local_obj.image_angle+270 }


dx = dot_product(tarx,tary,direcxh,direcyh)
if dx>=(local_obj.image_xscale * 16) { ang = local_obj.image_angle }
if dx<=(-local_obj.image_xscale * 16) { ang = local_obj.image_angle+180 }

