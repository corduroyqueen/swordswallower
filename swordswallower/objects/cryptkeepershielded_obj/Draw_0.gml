/// @description Insert description here
// You can write your code in this editor

gpu_set_colorwriteenable(true,true,true,false)
draw_self()



for(i=0;i<number_of_pus;i++) {
	var bv = pus_bv[i]
	var sc = pus_sc[i]
	
	bv += (pus_starting_sc-sc) * 0.2
	bv *= 0.92

	sc += bv
	var ys = pus_starting_sc+(pus_starting_sc-sc)
	
	draw_sprite_ext(pus_s[i],0,x+pus_x[i]*image_xscale,y+pus_y[i],sc*image_xscale,ys,0,c_white,1)
	
	
	if abs(bv)<0.0001 {
		if abs(hsp)>0.2 {
			bv = random_range(0.05,0.1)
		} else {
			bv = random_range(0.01,0.04)
		}
	}
	
	pus_bv[i] = bv
	pus_sc[i] = sc
}

if shielded {
	draw_sprite(shield_spr,0,x,y)
}

gpu_set_colorwriteenable(true,true,true,true)