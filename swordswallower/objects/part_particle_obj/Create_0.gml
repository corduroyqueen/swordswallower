/// @description Insert description here
// You can write your code in this editor
spr = false
size = 0
xx = 0
yy = 0

step = 0

locked = false
image_speed=0
//direction = random(360); //this points the particle in a random direction.
 //speed = random_range(4,8); //this is how fast the particles will move
 alarm[0] = random_range(400,600); //this will determine how long a particle exists before destroying it
// motion_set(direction,speed); //this tells the particle to start moving



hsp = tail_obj.throwxs * 0.10 + irandom_range(-6,6) *
	choose(-1,-1,
	0,1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,
		1,1,1,1,1,1,1,1,1,1,1,1.1,1.2,1.3,1.4,1.5,1.75,1.7)

vsp = tail_obj.throwys * 0.17 + irandom_range(-3,3) *
	choose(-1,-1,
	0,1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,
		1,1,1,1,1,1,1,1,1,1,1,1.1,1.2,1.3,1.4,1.5,1.75,1.7) - random_range(4,10)


rotation_dir = -sign(tail_obj.throwxs)
rotation_speed = 0