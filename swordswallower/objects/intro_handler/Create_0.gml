/// @description Insert description here
// You can write your code in this editor
alpha = 0
startposx = sword_swallower.x
startposy =sword_swallower.y+100

intro_timer = -50

if level1_master.dev {
	//intro_timer= 600
}

font2 = font_add("lato.ttf",16,false,false,32,128)

black_timer_m = 700

names = array_create(2)
names[0] = uti
names[1] = julia

names_f = choose(0,1)

a2=0
	
	
level1artm = layer_get_id("area1art")

level1art1 = layer_get_id("foreground")
level1art2 = layer_get_id("inside_wall_art")
level1art3 = layer_get_id("level_art")
level1art4 = layer_get_id("solid_color")
level1art5 = layer_get_id("misc")

level1bgm = layer_get_id("p1bkd")

level1bg1 = layer_get_id("bkd")
level1bg2 = layer_get_id("bkd2")
level1bg3 = layer_get_id("bkd3")
	
	
	
level2artm = layer_get_id("area2art")

level2art1 = layer_get_id("Assets_2")
level2art2 = layer_get_id("inside_wall_art2")
level2art3 = layer_get_id("level_art2")
level2art4 = layer_get_id("solid_color2")
level2art5 = layer_get_id("misc2")

level2bgm = layer_get_id("p2bkd")

level2bg1 = layer_get_id("bkdp2")
level2bg2 = layer_get_id("bkdp22")
level2bg3 = layer_get_id("bkdp33")
level2bg4 = layer_get_id("Assets_3")
		
		
		
			
level3artm = layer_get_id("area3art")

level3art1 = layer_get_id("inside_wall_art3")
level3art2 = layer_get_id("level_art3")
level3art3 = layer_get_id("solid_color3")
level3art4 = layer_get_id("misc3")

level3bgm = layer_get_id("p3bkd")

level3bg1 = layer_get_id("p3bkd1")
level3bg2 = layer_get_id("p3bkd2")
level3bg3 = layer_get_id("p3bkd3")

layer_1_tog = true
layer_1p5_tog = false
layer_2_tog = false
layer_3_tog = false

layer_obj_1 = layer_get_id("gameobjects_area1")
layer_obj_1p5 = layer_get_id("gameobjects_area1p5")
layer_obj_2 = layer_get_id("gameobjects_area2")
layer_obj_3 = layer_get_id("gameobjects_area3")

alarm[0] = 2