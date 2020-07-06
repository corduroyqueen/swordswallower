ww = sprite_get_width(sprite_index); //we need to know how wide

hh = sprite_get_height(sprite_index); //and how tall our sprite is

chunk = 6; //this is how big your chunks will be in pixels

var h = sprite_get_xoffset(sprite_index)
var k = sprite_get_yoffset(sprite_index)
for (i=0;i<ww;i+=chunk) { //we loop 4 pixel at a time all the way across
	for (j=0;j<hh;j+=chunk) { //while picking all the vertical pixels in each column
		particle = instance_create_depth(
			x+i-h,
			y+j-k,
			depth+random_range(-20,20),piece_particle_obj); //we create a particle relative to the object, offset by the proper amount
		particle.spr = sprite_index; //we need to tell the particle which sprite to draw. in this case, it's drawing the sprite of the object that's creating it
		particle.size = chunk;
		particle.xx = i; //we'll need the particles to have these valu es so they can draw the right part of the sprite
		particle.yy = j;
		
		
	}
}

