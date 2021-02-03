obj = argument0
sdm("damage script1")
sdm(ds_list_size(level1_master.hats_list))
if !obj.death && !dmg_flashing {
	//player takes hit
	damage_script(1,sign(x-obj.x),5,-1)
}
sdm("damage script2")
sdm(ds_list_size(level1_master.hats_list))