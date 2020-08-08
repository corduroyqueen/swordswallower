obj = argument0

if place_meeting(x,y+2,obj) {
	if instance_place(x,y+2,obj).vertical {
		if !instance_place(x,y+2,obj).onedirec {
			
			var xt = x + instance_place(x,y+2,obj).hspeed
			//var yt = y + instance_place(x,y+2,obj).vspeed	
			x = xt
			//y = yt
			
			if instance_place(x,y+2,obj).vspeed<0 {
				y+=instance_place(x,y+2,obj).y-instance_place(x,y+2,obj).ypreva
			}
			
			if place_meeting(x,y,wall_obj) {
				var h = hsp
				var v = vsp
				hsp = instance_place(x,y+2,obj).hspeed
				vsp = instance_place(x,y+2,obj).vspeed
				default_collision(wall_obj)
			}
		} else {
			var xlast = x
			
			//x = x + instance_place(x,y+2,obj).hspeed/10
			if !place_meeting(x,y,tar_obj)
			&& instance_place(x,y+2,obj).vspeed < 
			((instance_place(x,y+2,obj).starty+instance_place(x,y+2,obj).dist2)-instance_place(x,y+2,obj).y) {
				
				y+=instance_place(x,y+2,obj).vspeed
			}
			
			//y+=instance_place(x,y+10,obj).y-instance_place(x,y+10,obj).ypreva
			
			
			//(instance_place(x,y+2,obj).y-instance_place(x,y+2,obj).ypreva)/2
			//vsp=0
		}
	} else {
		var xt = x + instance_place(x,y+2,obj).hspeed
		var yt = y + instance_place(x,y+2,obj).vspeed	
		x = xt
		y = yt
		if place_meeting(x,y,wall_obj) {
			var h = hsp
			var v = vsp
			hsp = instance_place(x,y+2,obj).hspeed
			vsp = instance_place(x,y+2,obj).vspeed
			default_collision(wall_obj)
		}	
	}
	
	//x+=instance_place(x,y+1,obj).x-instance_place(x,y+1,obj).xprevious
    //y+=instance_place(x,y+1,obj).y-instance_place(x,y+1,obj).yprevious
}

if !held_position && place_meeting(x,y-2,obj) {
	//x = x + instance_place(x,y+1,moving_platform_obj).hsp	
	//y = y + instance_place(x,y-2,obj).vsp * 1.2
}