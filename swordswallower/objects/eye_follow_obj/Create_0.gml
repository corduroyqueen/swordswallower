//fuck yes
layer1 = layer_get_id("level_art3")
layer2 = layer_get_id("inside_wall_art3")

eyes = ds_list_create()
eyesx = ds_list_create()
eyesy = ds_list_create()
eyessc = ds_list_create()

for(var i=1;i<45;i++) {
	
	var ok = layer_sprite_get_id(layer1,"zone4eye" + string(i))
	//sdm("zone3eye" + string(i))
	
	ds_list_add(eyesx,layer_sprite_get_x(ok))
	ds_list_add(eyesy,layer_sprite_get_y(ok))
	ds_list_add(eyessc,layer_sprite_get_xscale(ok))
	var ok2 = layer_sprite_create(layer2,layer_sprite_get_x(ok),layer_sprite_get_y(ok),eyefollow2)
	layer_sprite_xscale(ok2,layer_sprite_get_xscale(ok))
	layer_sprite_yscale(ok2,layer_sprite_get_yscale(ok))
	ds_list_add(eyes,ok2)
}

