/// @description Insert description here
// You can write your code in this editor



/*

if player_obj.zoom_timer_bool {
	for (i=0;i<10;i++){
		shadow[i].visible = true
		shadow[i].x = prevx[i]
		shadow[i].y = prevy[i]
	}
} else {
	for (i=0;i<10;i++){
		shadow[i].visible = false
	}	
}

location_timer++
if location_timer>1 {
	for (i=10; i>=0; i--) {
		if i>0 {
			prevx[i] = prevx[i-1]
			prevy[i] = prevy[i-1]
		} else {
			prevx[i] = player_obj.x	
			prevy[i] = player_obj.y
		}
	}
	location_timer=0
}

