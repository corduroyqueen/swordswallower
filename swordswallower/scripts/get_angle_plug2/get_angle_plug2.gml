xp = argument0
yp = argument1
local_obj = argument2

tarx = xp - local_obj.x
tary = yp - local_obj.y

direcxh = cos(degtorad(local_obj.image_angle));
direcyh = -sin(degtorad(local_obj.image_angle));

anga = 0


direcxv = cos(degtorad(local_obj.image_angle+90));
direcyv = -sin(degtorad(local_obj.image_angle+90));

dy = dot_product(tarx,tary,direcxv,direcyv)
if dy>=(local_obj.image_yscale * 32) { anga = local_obj.image_angle+90 }
if dy<=(-local_obj.image_yscale * 32) { anga = local_obj.image_angle+270 }


dx = dot_product(tarx,tary,direcxh,direcyh)
if dx>=(local_obj.image_xscale * 32) { anga = local_obj.image_angle }
if dx<=(-local_obj.image_xscale * 32) { anga = local_obj.image_angle+180 }

return anga