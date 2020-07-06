ww = sprite_get_width(sprite_index); //we need to know how wide

hh = sprite_get_height(sprite_index); //and how tall our sprite is

chunk = 6; //this is how big your chunks will be in pixels


//for (i=0;i<ww;i+=chunk) { //we loop 4 pixel at a time all the way across
//	for (j=0;j<hh;j+=chunk) { //while picking all the vertical pixels in each column
//		particle = instance_create_depth(
//			x+i-sprite_width/2,
//			y+j-sprite_height/2,
//			depth+random_range(-20,20),piece_particle_obj); //we create a particle relative to the object, offset by the proper amount
//		particle.spr = sprite_index; //we need to tell the particle which sprite to draw. in this case, it's drawing the sprite of the object that's creating it
//		particle.size = chunk;
//		particle.xx = i; //we'll need the particles to have these values so they can draw the right part of the sprite
//		particle.yy = j;
		
		
//	}
//}

var oldyy = yy
if abs(other.checky  - (y - sprite_get_yoffset(sprite_index)))>yy {
	yy = abs(other.checky - (y - sprite_get_yoffset(sprite_index)))
	
	
	particle = instance_create_depth(x,y - sprite_get_yoffset(sprite_index)+oldyy,depth,severed_particle_obj)
	particle.spr = sprite_index; //we need to tell the particle which sprite to draw. in this case, it's drawing the sprite of the object that's creating it
	particle.sprite_index = sprite_index; 
	particle.xx = 0; //we'll need the particles to have these values so they can draw the right part of the sprite
	particle.yy = oldyy;
	particle.w = sprite_width
	particle.h = yy-oldyy
	particle.step = 0.5
	particle.hspeed = tail_obj.hspeed * 0.01
	particle.vspeed = tail_obj.vspeed * 0.02-1

	with particle {
		//sprite_set_offset(spr,sprite_width/2,yy/2)	
	}

	//particle.speed=0

	
}


