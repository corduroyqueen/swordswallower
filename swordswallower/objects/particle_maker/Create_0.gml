/// @description Insert description here
// You can write your code in this editor

prevx = array_create(10,x)
prevy = array_create(10,y)
shadow = array_create(10)

for (i=0;i<10;i++){
	shadow[i] = instance_create_depth(x,y,1,boost_shadow)
	shadow[i].visible = false
	shadow[i].image_alpha = (1-(i/10))
}

location_timer = 0