ang1 = other.image_angle
while ang1 > 90 {
	ang1-=90	
}
while ang1 < 0 {
	ang1+=90	
}
					
ang2 = 90-ang1
var cang=-90
if !wall_checker(x+cos(degtorad(ang1)),y-sin(degtorad(ang1))) {
	if !wall_checker(x+cos(degtorad(ang2)),y-sin(degtorad(ang2))) {
		if ang2>ang1 {
			cang = ang2
		} else {
			cang = ang1	
		}
	} else {
		cang = ang1
	}
} else if !wall_checker(x+cos(degtorad(180-ang1)),y-sin(degtorad(180-ang1))) {
	if !wall_checker(x+cos(degtorad(180-ang2)),y-sin(degtorad(180-ang2))) {
		if ang2>ang1 {
			cang = 180-ang2
		} else {
			cang = 180-ang1	
		}
	} else {
		cang = 180-ang1
	}
}
if cang>0 {
	if abs(cang-point_direction(0,0,hspeed,vspeed))<=90 {
		hspeed = cos(degtorad(cang))*abs(vspeed)*0.6
		vspeed = -sin(degtorad(cang))*abs(vspeed)*0.6
	} else {
		hspeed = cos(degtorad(cang))*abs(vspeed)*0.6
		vspeed = -sin(degtorad(cang))*abs(vspeed)*0.6
	}
						
}
					