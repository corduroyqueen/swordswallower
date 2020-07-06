/// @description Insert description here
// You can write your code in this editor
broken = false

num_pieces = 39

alive = num_pieces

pieces_x = array(x+0,x+124,x+173,x+284,x+445,x+464,x+519,x+658,x+808,x+0,  x+123,x+352,x+465,x+481,x+729,x+0,  x+222,x+0,  x+0,  x+45, x+195,x+379,x+446,x+482,x+495,x+787,x+864,x+621,x+0,  x+24, x+66, x+149,x+292,x+382,x+424,x+484,x+600,x+752,x+833)
																																																									
pieces_y = array(y+0,y+0,  y+0,  y+0,  y+0,  y+0,  y+0  ,y+0  ,y+0,  y+109,y+17, y+65 ,y+127,y+88, y+87, y+111,y+164,y+231,y+303,y+231,y+178,y+163,y+175,y+132,y+161,y+202,y+173,y+227,y+404,y+439,y+357,y+434,y+379,y+439,y+424,y+242,y+367,y+427,y+380)

pieces_px = ds_list_create()
pieces_px = list_c(x+0,x+124,x+173,x+284,x+445,x+464,x+519,x+658,x+808,x+0,  x+123,x+352,x+465,x+481,x+729,x+0,  x+222,x+0,  x+0,  x+45, x+195,x+379,x+446,x+482,x+495,x+787,x+864,x+621,x+0,  x+24, x+66, x+149,x+292,x+382,x+424,x+484,x+600,x+752,x+833)

//pieces_py = ds_list_create()
//pieces_py = list_c(y+0,y+0,y+0,y+0,y+0,y+135,y+135,y+135,y+135,y+135,y+270,y+270,y+270,y+270,y+270,y+405,y+405,y+405,y+405,y+405)

pieces_dead = array(false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false)

pieces_surfaces = array_create(20)
pieces_surfaces = array_create(19)

for(i=0;i<20;i++) {
	pieces_surfaces[i] = surface_create(400,400)	
}

for(i=0;i<19;i++) {
	pieces_surfaces2[i] = surface_create(400,400)	
}


piece_enemy = floor(random_range(0,39))


shuffle_pieces = true

met = false