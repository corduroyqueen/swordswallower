xp = argument0
yp = argument1
sp = argument2
lp = argument3

var angle = degtorad(point_direction(x,y,xp,yp))
var tempx = cos(angle)
var tempy = -sin(angle)
hsp = lerp(hsp,tempx*sp,lp)
vsp = lerp(vsp,tempy*sp,lp)