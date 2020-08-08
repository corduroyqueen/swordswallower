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
	o_bbox_left = bbox_left
	o_bbox_right = bbox_right
	o_bbox_bottom = bbox_bottom
	o_bbox_top = bbox_top
	ox = x
	oy = y
	x=0
	y=0
	//sdm(riding_list[| 0])
	//Make this Solid non-collidable for Actors, 
	//so that Actors moved by it do not get stuck on it 
	//Collidable = false    
	if (moveXPos != 0) { 
	    xRemainder -= moveXPos; 
	    ox += moveXPos; 
		
	    if (moveXPos > 0) { 
		    for (i=0; i<instance_number(actor_parent_obj); i++) { 
				var actor = instance_find(actor_parent_obj,i)
				//sdm(ds_list_find_index(riding_list,actor))
		        if (place_meeting(ox,oy,actor)) { 
			        //Push right 
					with actor {
						moveX(other.o_bbox_right - bbox_left + other.moveXPos + 1)
					}
			    } else if ds_list_find_index(riding_list,actor)>-1 { 
			        //Carry right 
					with actor {
						moveX(other.moveXPos); 
					}
			    } 
			 } 
		 } else { 
		    for (i=0; i<instance_number(actor_parent_obj); i++) { 
				var actor = instance_find(actor_parent_obj,i)
				
		        if (place_meeting(ox,oy,actor)) 
		        { 
					//Push left 
					with actor {
						moveX(other.o_bbox_left - bbox_right + other.moveXPos - 1)
					}
		        } else if ds_list_find_index(riding_list,actor)>-1 { 
					//Carry left 
					with actor {
						moveX(other.moveXPos); 
					}
					
				} 
			}
		}
		
	}     
	
	if (moveYPos != 0) 
	{ 
	    //Do y-axis movement 
	    yRemainder -= moveYPos; 
	    oy += moveYPos; 
		
	    if (moveYPos > 0) { 
		    for (i=0; i<instance_number(actor_parent_obj); i++) { 
				var actor = instance_find(actor_parent_obj,i)
		        if (place_meeting(ox,oy,actor)) { 
			        //Push down
					with actor {
						moveY(other.o_bbox_bottom - bbox_top + other.moveYPos+ 1)
					}
			    } else if ds_list_find_index(riding_list,actor)>-1 { 
			        //Carry down
					with actor {
						moveY(other.moveYPos); 
					}
			    } 
			 } 
		 } else { 
		    for (i=0; i<instance_number(actor_parent_obj); i++) { 
				var actor = instance_find(actor_parent_obj,i)
				
		        if (place_meeting(ox,oy,actor)) 
		        { 
					//Push up
					with actor {
						moveY(other.o_bbox_top - bbox_bottom + other.moveYPos - 1)
					}
		        } else if ds_list_find_index(riding_list,actor)>-1 { 
					//Carry up 
					with actor {
						moveY(other.moveYPos); 
					}
					
				} 
			}
		}
		
	}     
	//Re-enable collisions for this Solid 
	x = ox
	y = oy
	
	ds_list_clear(riding_list)
	//Collidable = true; 
} 