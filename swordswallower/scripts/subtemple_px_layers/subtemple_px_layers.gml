//parallax info:
//lower numbers represent objects that are farther away, higher numbers are closer to the screen
//currently the way that placing objects works is you put it

with level1_master {
	parallax_layer_move_x(px_layer_sky,px_layer_sky_amt,-960)
	parallax_layer_move_y(px_layer_sky,px_layer_sky_amt,-540)
	//layer_x(px_layer_sky,player_obj.x)
	//parallax_layer_move_x(layer_get_id("px_sky_1"),1.01)
	//layer_x(layer_get_id("px_sky_1"),player_obj.x)
	//sdm("AHA")
	//sdm(layer_get_x(layer_get_id("px_sky_1")))
	//var temp = layer_sprite_get_id(layer_get_id("px_sky_1"),"moonpx")
	//sdm(layer_sprite_get_x(temp))
	parallax_layer_move_x(px_layer_bkd1,px_layer_bkd1_amt,0)
	parallax_layer_move_y(px_layer_bkd1,px_layer_bkd1_amt,0)
	parallax_layer_move_x(px_layer_bkd2,px_layer_bkd2_amt,0)
	parallax_layer_move_y(px_layer_bkd2,px_layer_bkd2_amt,0)
	parallax_layer_move_x(px_layer_near1,px_layer_near1_amt,0)
	parallax_layer_move_x(px_layer_near2,px_layer_near2_amt,0)
}