//fuck yes
with chain1 {
	cut = 7
	cuttable = true
	drawself = true
	event_user(2)
	
}
with chain2 {
	cut = 7
	cuttable = true
	drawself = true
	event_user(2)
	
}
var lock = instance_create_depth(lockx,locky,depth,default_debris_obj)
lock.sprite_index = spr_lock
lock.image_xscale = 1.275
lock.image_yscale = 1.275