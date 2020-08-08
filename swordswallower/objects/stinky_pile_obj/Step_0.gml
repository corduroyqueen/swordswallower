/// @description Insert description here
// You can write your code in this editor
if lit {
	sprite_index = stinky_pile_lit
	
	
	particle_spawn++
	if particle_spawn>5 {
		xset = random_range(-sprite_width,sprite_width)/2
		yset = random_range(-sprite_height,sprite_height)/2
		boop = instance_create_depth(x+xset,y+yset,-1,stinky_particle_obj)
		boop.deprate = 0.01
		boop.vsp = -1
		boop.rval = irandom_range(1,1.5)
		particle_spawn = 0
		
		
	}
	
} else {
	if place_meeting(x,y,player_obj) && player_obj.stinky_check {
		lit = true	
	} 
	sprite_index = stinky_pile_empty
}