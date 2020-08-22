/// @description Insert description here
// You can write your code in this editor
num = instance_number(firefly_particles_bounds_obj)
fireflies_x = ds_list_create()
fireflies_y = ds_list_create()
fireflies_hsp = ds_list_create()
fireflies_vsp = ds_list_create()
fireflies_dir = ds_list_create()
fireflies_s = ds_list_create()
with firefly_particles_bounds_obj {
	for(a=x;a<x+sprite_width;a+=random_range(400,600)) {
		for(b=y;b<y+sprite_height;b+=random_range(200,400)) {
			with other {
				ds_list_add(fireflies_x,other.a+random_range(-300,300))
				ds_list_add(fireflies_y,other.b)
				ds_list_add(fireflies_dir,random_range(0,360))
				ds_list_add(fireflies_s,random_range(0.3,0.7))
				ds_list_add(fireflies_hsp,0)
				ds_list_add(fireflies_vsp,0)
			}
		}
	}
}
fireflies_ct = ds_list_size(fireflies_x)