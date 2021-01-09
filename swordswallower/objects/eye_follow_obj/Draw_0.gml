//fuck yes

for(var i=0;i<44;i++) {
	
	var xp = eyesx[|i]
	var yp = eyesy[|i]
	if in_camera_range_bigger(xp,yp) {
		var ang = point_direction(xp,yp,player_obj.x,player_obj.y)
		var sc = eyessc[|i]
		layer_sprite_x(eyes[|i],xp + dcos(ang) * sc * 10)
		layer_sprite_y(eyes[|i],yp - dsin(ang) * sc * 10)
	}
}

