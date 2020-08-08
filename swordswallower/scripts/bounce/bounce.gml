//if place_meeting(xpreva,ypreva+vspeed,other) {
//	ang = 270
//} 
//if place_meeting(xpreva+hspeed,ypreva,other) {
//	ang = 0
//}

//var bounce_negate
reset_intangibility()
/*
held_release_timer = 0
ang = tail_obj.ang

normx = cos(degtorad(ang));
normy = -sin(degtorad(ang));
hspeed*=0.5
vspeed*=0.5
dot = dot_product(-normx,-normy,hspeed,vspeed)



if (dot<0){
	dot *= -1;
	normx *= -1;
	normy *= -1;
}


with (player_hitbox_check_obj) {
	
		
		
		other.hspeed += (other.normx * other.dot * 2)
		other.vspeed += (other.normy * other.dot * 2)
		//speed = clamp(speed,0,0.5)
		
		//if !(place_meeting(x,y-10,wall_obj) || place_meeting(x,y+10,wall_obj)) {
		//	other.vspeed += (other.normy * other.dot * 2)
		//	other.vspeed*=0.6
		//}
		//if !(place_meeting(x-10,y,wall_obj) || place_meeting(x+10,y,wall_obj)) {
		//	other.hspeed += (other.normx * other.dot * 2)
		//	other.hspeed*=0.6
		//} 
		
	
	
}


//if ang==0 {
	
//	if place_meeting(x,y-5,wall_obj) || place_meeting(x,y+5,wall_obj) {
//		vspeed = 0	
//	}
	
	
//} else {
	
//	if place_meeting(x-5,y,wall_obj) || place_meeting(x+5,y,wall_obj) {
//		hspeed = 0	
//	}
//}



	//audio_sound_pitch(Emergency_Sandbag_Heavy_Hitting_Rocks_02,random_range(0.94,1.06))
	//audio_play_sound(Emergency_Sandbag_Heavy_Hitting_Rocks_02,0,false)

//x = player_hitbox_check_obj.x
//y = player_hitbox_check_obj.y



c_w=tail_obj.current_wall
if tail_obj.ang==0 {
	
	if place_meeting(x,y,wall_obj) {
		if instance_place(x,y,wall_obj).y>y{
			while place_meeting(x,y,wall_obj) {
				y-=2
			}
		} else {
			while place_meeting(x,y,wall_obj) {
				y+=2
			}	
		}
	}
} else {
	
	if place_meeting(x,y,wall_obj) {
		if instance_place(x,y,wall_obj).x>x{
			while place_meeting(x,y,wall_obj) {
				x-=2
			}
		} else {
			while place_meeting(x,y,wall_obj) {
				x+=2
			}	
		}
	}
		
}

if tail_obj.moving_platform_bool && (place_meeting(x,y,wall_obj)||place_meeting(x,y,black_wall_obj)) {

	hspeed = tail_obj.current_wall.hspeed
	vspeed = tail_obj.current_wall.vspeed
	default_collision(wall_obj)
	default_collision(black_wall_obj)
	xvheld = x-tail_obj.current_wall.x
	yvheld = y-tail_obj.current_wall.y
	hspeed = 0
	vspeed = 0	
	
}

x = player_hitbox_check_obj.x - hspeed
y = player_hitbox_check_obj.y - vspeed

if vsp>0 && ang==90 {
	vspeed/=2	
}
	
reset_intangibility()
			
bounced = true

zoom_timer_bool = false
zoom_timer = 0