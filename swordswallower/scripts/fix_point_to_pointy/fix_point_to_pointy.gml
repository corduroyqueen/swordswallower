point_ox = argument0
point_oy = argument1
point_tx = argument2
point_ty = argument3
mag = argument4

var angle = point_direction(point_tx,point_ty,point_ox,point_oy)

var p1 = point_ty - dsin(angle) * mag
//var p2 = point_oy - dsin(angle) * mag

return p1