//fuck yes
gpu_set_colorwriteenable(true,true,true,false)
if retracted {
	spr_index -= 1
	if player_obj.tail_carry && collision_line(x,y,player_obj.x,player_obj.y,wall_parent_obj,false,true) {
		retracted = false
	}
	//image_alpha = random_range(0.000,1.000)
} else {
	spr_index += 0.5
	if 
	(!collision_line(x,y,player_obj.x,player_obj.y,wall_parent_obj,false,true) 
	&& point_distance(x,y,player_obj.x,player_obj.y)<500)
	||
	(player_obj.tail_throwing || player_obj.tail_pulling) 
	&& collision_line(tail_obj.x,tail_obj.y,tail_obj.x+tail_obj.hsp*20,tail_obj.y+tail_obj.vsp*20,self,false,false) 
	{
		retracted = true
	}
	//image_alpha = 0.5
}
//image_alpha = choose(0,0.05,0.5,0.55,0.6,0.65,0.7,0.75,0.8)
spr_index = clamp(spr_index,0,image_number-1)
image_index = floor(spr_index)
draw_self()
gpu_set_colorwriteenable(true,true,true,true)