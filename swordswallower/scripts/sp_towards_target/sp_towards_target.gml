xp = argument0
yp = argument1
sp = argument2
lp = argument3

var angle = arctan((yp-y-loltemp)/(xp-x))
var tempx = -cos(angle) * sign(x-xp)
var tempy = -sin(angle) * sign(x-xp)
			
hsp = lerp(hsp,tempx*sp,lp)
vsp = lerp(vsp,tempy*sp,lp)