//fuck yes
if hp<=0 {
	level1_master.ability_dash = true	
	just_blood(tail_obj.hsp,tail_obj.vsp-100,0.3,10,false,sprite_width/4,sprite_height)
	
	level1_master.in_void = false
	level1_master.void_target = player_obj
	
	if level1_master.ability_dash {
		instance_destroy(id)
	}
}