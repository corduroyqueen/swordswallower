obj = argument0

if collision_line(x,y,obj.x,obj.y,wall_obj,false,true)==noone 
&& collision_line(x,y,obj.x,obj.y,door_obj,false,true)==noone 
&& collision_line(x,y,obj.x,obj.y,break_wall_obj,false,true)==noone 
&& collision_line(x,y,obj.x,obj.y,falling_rock_obj,false,true)==noone
&& collision_line(x,y,obj.x,obj.y,black_wall_obj,false,true)==noone 
&& collision_line(x,y,obj.x,obj.y,wood_wall_obj,false,true)==noone
&& collision_line(x,y,obj.x,obj.y,switch_wall_obj,false,true)==noone
&& collision_line(x,y,obj.x,obj.y,voidwall_obj,false,true)==noone
&& collision_line(x,y,obj.x,obj.y,close_wall_obj,false,true)==noone
&& collision_line(x,y,obj.x,obj.y,double_switch_wall_obj,false,true)==noone {
	return true	
} else {
	return false	
}