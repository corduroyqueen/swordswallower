obj = argument0
if !obj.death && !dmg_flashing {
	//player takes hit
	damage_script(1,sign(x-obj.x),5,-1)
}
