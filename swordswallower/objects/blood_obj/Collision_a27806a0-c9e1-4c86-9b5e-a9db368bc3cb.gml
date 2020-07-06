/// @description Insert description here
// You can write your code in this editor
if !other.start_death && !other.death && player_sprite_obj.spr_bloodied_a<0.5 {
	player_got = true
	hspeed=0
	vspeed=0
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