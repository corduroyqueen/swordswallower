ww = sprite_get_width(sprite_index); //we need to know how wide

hh = sprite_get_height(sprite_index); //and how tall our sprite is

chunk = 6; //this is how big your chunks will be in pixels





if abs(other.checky  - (y - sprite_get_yoffset(sprite_index)))<h {
	oldh = h
	
	h = abs(other.checky - (y - sprite_get_yoffset(sprite_index)))
	
	particle = instance_create_depth(x,y - sprite_get_yoffset(sprite_index)+h,depth,severed_particle_obj)
	particle.spr = sprite_index; //we need to tell the particle which sprite to draw. in this case, it's drawing the sprite of the object that's creating it
	particle.sprite_index = sprite_index; 
	particle.xx = 0; //we'll need the particles to have these values so they can draw the right part of the sprite
	particle.yy = h;
	particle.w = sprite_width
	particle.h = oldh-h
	particle.step = 0.5
	particle.hspeed = 0
	particle.vspeed = 0

	
	//particle.speed=0

	if !audio_is_playing(Ice_Break__Shatter__Smash_03) {
		audio_play_sound(Ice_Break__Shatter__Smash_03,0,false)
	}
}


