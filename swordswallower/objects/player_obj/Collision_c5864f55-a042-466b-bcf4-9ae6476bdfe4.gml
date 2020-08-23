/// @description Insert description here
// You can write your code in this editor
with other {
	player_got = true
	hsp=0
	vsp=0
	surrounded = true
	obj = player_obj				
	locked = true
	lockedobj = obj

	xoff = x-obj.x
	yoff = y-obj.y

	x=150+xoff
	y=150+yoff
	
	instance_destroy()
	
	player_sprite_obj.spr_bloodied = true
	player_sprite_obj.spr_bloodied_a = 1	
}