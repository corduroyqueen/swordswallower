/// @description Insert description here
// You can write your code in this editor
if place_meeting(x,y,player_obj) {
	level1_master.ability_dash = true	
	just_blood(player_obj.hsp*30,player_obj.vsp*30-100,0.3,10,false,sprite_width/4,sprite_height)
}
if level1_master.ability_dash {
	instance_destroy()
}