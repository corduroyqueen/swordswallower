xp = argument0
yp = argument1

xRemainder = 0;
yRemainder = 0;

xRemainder += xp
yRemainder += yp 

moveXPos = round(xRemainder); 
moveYPos = round(yRemainder); 



if (moveXPos != 0 || moveYPos != 0) { 
	//Loop through every Actor in the Level, add it to 
	//a list if actor.IsRiding(this) is true 
	for (i=0; i<instance_number(actor_parent_obj); i++) {
		with instance_find(actor_parent_obj,i) {
			if isRiding_movplat(other) {
				with other {
					//sdm("FUCK")
					ds_list_add(riding_list,other)
				}
			}
		}
	}
	//sdm(riding_list[| 0])
	//Make this Solid non-collidable for Actors, 
	//so that Actors moved by it do not get stuck on it 
	//Collidable = false    
	if (moveXPos != 0) { 
	    xRemainder -= moveXPos; 
	    x += moveXPos; 
		ox = x
		oy = y
	    if (moveXPos > 0) { 
		    for (i=0; i<instance_number(actor_parent_obj); i++) { 
				var actor = instance_find(actor_parent_obj,i)
				//sdm(ds_list_find_index(riding_list,actor))
		        if (place_meeting(ox,oy,actor)) { 
			        //Push right 
					x=0 y=0
					with actor {
						moveX(other.bbox_right - bbox_left)
						//moveX(
						//(other.ox + (sprite_get_bbox_right(other.mask_index) - sprite_get_xoffset(other.mask_index)) * other.image_xscale)
						//- 
						//(x - (sprite_get_xoffset(mask_index) - sprite_get_bbox_left(mask_index)) * image_xscale)); 
					}
					x=ox y=oy
			    } else if ds_list_find_index(riding_list,actor)>-1 { 
			        //Carry right 
					x=0 y=0
					with actor {
						moveX(other.moveXPos); 
					}
					x=ox y=oy
			    } 
			 } 
		 } else { 
		    for (i=0; i<instance_number(actor_parent_obj); i++) { 
				var actor = instance_find(actor_parent_obj,i)
				
		        if (place_meeting(ox,oy,actor)) 
		        { 
					//Push left 
					x=0 y=0
					with actor {
						moveX(other.bbox_left - bbox_right)
						//moveX(
						//(other.ox - ((sprite_get_xoffset(other.mask_index) - sprite_get_bbox_left(other.mask_index)) * image_xscale))
						//- 
						//(x + ((sprite_get_bbox_right(mask_index) - sprite_get_xoffset(other.mask_index)) * image_xscale))); 
					}
					x=ox y=oy
		        } else if ds_list_find_index(riding_list,actor)>-1 { 
					//Carry left 
					x=0 y=0
					with actor {
						moveX(other.moveXPos); 
					}
					x=ox y=oy
				} 
			}
		}
		
	}     
	
	if (moveYPos != 0) 
	{ 
	    //Do y-axis movement 
	    
	}     //Re-enable collisions for this Solid 
	
	ds_list_clear(riding_list)
	//Collidable = true; 
} 