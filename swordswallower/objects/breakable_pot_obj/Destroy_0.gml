/// @description Insert description here
// You can write your code in this editor
googa = s_pot_break
audio_sound_pitch(googa,1.5 - (image_xscale/2))
var cx = player_obj.camx + player_obj.cam_width_h
var cy = player_obj.camy + player_obj.cam_height_h
		
audio_play_sound_at(googa,
	mean(cx,cx,cx,cx,cx,cx,tail_obj.x),
	mean(cy,cy,cy,cy,cy,cy,tail_obj.y),
	10,100,300,1,false,0)
	
var xs
var ys

if lel {
	xs = player_obj.hspeed
	ys = player_obj.vspeed
} else {
	xs = tail_obj.throwxs
	ys = tail_obj.throwys
}
if lel
for (i=0;i<11;i++) { //we loop 4 pixel at a time all the way across
	particle = instance_create_depth(
		x + sprite_get_xoffset(sprites_pot[i]) * image_xscale,
		y + sprite_get_yoffset(sprites_pot[i]) * image_yscale,
		depth+2,part_particle_obj); //we create a particle relative to the object, offset by the proper amount
	particle.sprite_index = sprites_pot[i]; //we need to tell the particle which sprite to draw. in this case, it's drawing the sprite of the object that's creating it
	particle.rotation_speed = 0//random_range(0,5)
	particle.image_index = 1
	particle.image_xscale = image_xscale
	particle.image_yscale = image_yscale
	particle.step = 0.8
		
	particle.hspeed = xs * 0.10 + irandom_range(-6,6) *
	choose(-1,-1,
	0,1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,
		1,1,1,1,1,1,1,1,1,1,1,1.1,1.2,1.3,1.4,1.5,1.75,1.7)

	particle.vspeed = ys * 0.17 + irandom_range(-3,3) *
	choose(-1,-1,
	0,1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,
		1,1,1,1,1,1,1,1,1,1,1,1.1,1.2,1.3,1.4,1.5,1.75,1.7) - random_range(4,10)
		
	
}


for (i=0;i<11;i++) { //we loop 4 pixel at a time all the way across
	particle = instance_create_depth(
		x + sprite_get_xoffset(sprites_pot[i]) * image_xscale,
		y + sprite_get_yoffset(sprites_pot[i]) * image_yscale,
		depth+1,part_particle_obj); //we create a particle relative to the object, offset by the proper amount
	particle.sprite_index = sprites_pot[i]; //we need to tell the particle which sprite to draw. in this case, it's drawing the sprite of the object that's creating it
	particle.rotation_speed = random_range(0,5)
	particle.image_xscale = image_xscale
	particle.image_yscale = image_yscale
	particle.step = 0.8
		
		
	
}
