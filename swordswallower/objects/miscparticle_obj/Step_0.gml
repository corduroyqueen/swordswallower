/// @description Insert description here
// You can write your code in this editor


//if place_meeting(x+hwidth,y+hheight,wall_obj) && place_meeting(x+hwidth,y-hheight,wall_obj) 
//&& place_meeting(x-hwidth,y+hheight,wall_obj) && place_meeting(x-hwidth,y-hheight,wall_obj) {
	
if !surrounded {
	vsp+=.4
	if moveBoolX(hsp) || moveBoolY(vsp) {
		hsp=0
		vsp=0
		x = xpreva
		y = ypreva
		surrounded = true
		 /*else if obj.pers==1 {
			hsp=0
			vsp=0
			sdm("FUUUUUUUUUUUUUCK")
			surrounded = true
				
			locked = true
			lockedobj = obj
			
			xoff = x-obj.x
			yoff = y-obj.y
				
		} else {
					
		}*/
	}
		
} else {
	lifect++
	
	if lifect >200 {
		image_alpha-=0.02
	}
	if image_alpha<=0 {
		instance_destroy()	
	}
	if locked {
		if instance_exists(obj) {
			x = obj.x + xoff
			y = obj.y + yoff
		} else {
			surrounded = false	
			locked = false
		}
	}
}
xpreva = x
ypreva = y
