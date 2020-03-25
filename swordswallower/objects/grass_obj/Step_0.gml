/// @description Insert description here
// You can write your code in this editor
if lol {
	if abs(player_obj.x-x)<abs(sprite_width/2) && abs(player_obj.y-y+32)<sprite_height/2
	{
		if !present {
			present = true
			if sign(image_xscale)>0 {
				if point_direction(x,y,player_obj.x,player_obj.y)+360 >= image_angle+360+90 { 
					breezestate=2
					set = false
				} else {
					breezestate=1
					set = false
				}
			} else {
				if point_direction(x,y,player_obj.x,player_obj.y)+360 >= image_angle+360+90 { 
					breezestate=1
					set = false
				} else {
					breezestate=2
					set = false
				}
			}
		}
		
		
	} else {
		breezestate=0
		present = false
		if sprite_index!=grassarray[grasstype] set = false
	}
	
	if set exit
	
	if breezestate==0 {
		sprite_index = grassarray[grasstype]
		image_index = image_number - 1
		set = true
	} else if breezestate==1 {
		sprite_index = grassarrayl[grasstype]
		set = true
	} else if breezestate==2 {
		sprite_index = grassarrayr[grasstype]
		set = true
	}
	
}