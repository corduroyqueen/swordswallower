/// @description Insert description here
// You can write your code in this editor
art_surface = surface_create(1920,1080)
lay_id=-4

splat_list_x = ds_list_create()
splat_list_y = ds_list_create()
splat_list_rot = ds_list_create()
splat_list_s = ds_list_create()


blood_splat_surface = -1
shader_art_surface = shader_get_sampler_index(shader_blood_alpha_surface, "artSurface");

layer_script_begin("level_art", layer_surface_script_start);
layer_script_end("level_art", layer_surface_script_end);

layer_script_begin("foreground", layer_surface_script_start);
layer_script_end("foreground", layer_surface_script_end);

layer_script_begin("inside_wall_art", layer_surface_script_start);
layer_script_end("inside_wall_art", layer_surface_script_end);

layer_script_begin("solid_color", layer_surface_script_start);
layer_script_end("solid_color", layer_surface_script_end);

layer_script_begin("misc", layer_surface_script_start);
layer_script_end("misc", layer_surface_script_end);


layer_script_begin("level_art2", layer_surface_script_start);
layer_script_end("level_art2", layer_surface_script_end);

layer_script_begin("Assets_2", layer_surface_script_start);
layer_script_end("Assets_2", layer_surface_script_end);

layer_script_begin("inside_wall_art2", layer_surface_script_start);
layer_script_end("inside_wall_art2", layer_surface_script_end);

layer_script_begin("solid_color2", layer_surface_script_start);
layer_script_end("solid_color2", layer_surface_script_end);

layer_script_begin("misc2", layer_surface_script_start);
layer_script_end("misc2", layer_surface_script_end);



layer_script_begin("level_art3", layer_surface_script_start);
layer_script_end("level_art3", layer_surface_script_end);

layer_script_begin("inside_wall_art3", layer_surface_script_start);
layer_script_end("inside_wall_art3", layer_surface_script_end);

layer_script_begin("solid_color3", layer_surface_script_start);
layer_script_end("solid_color3", layer_surface_script_end);

layer_script_begin("misc3", layer_surface_script_start);
layer_script_end("misc3", layer_surface_script_end);




//layer_script_begin("solid_color", layer_stop_alpha_start);
//layer_script_end("solid_color", layer_stop_alpha_end);


layer_script_begin("parallax", layer_stop_alpha_start);
layer_script_end("parallax", layer_stop_alpha_end);

layer_script_begin("bkd", layer_stop_alpha_start);
layer_script_end("bkd", layer_stop_alpha_end);

layer_script_begin("bkd2", layer_stop_alpha_start);
layer_script_end("bkd2", layer_stop_alpha_end);

layer_script_begin("bkd3", layer_stop_alpha_start);
layer_script_end("bkd3", layer_stop_alpha_end);



layer_script_begin("bkdp2", layer_stop_alpha_start);
layer_script_end("bkdp2", layer_stop_alpha_end);

layer_script_begin("bkdp22", layer_stop_alpha_start);
layer_script_end("bkdp22", layer_stop_alpha_end);

layer_script_begin("bkdp23", layer_stop_alpha_start);
layer_script_end("bkdp23", layer_stop_alpha_end);

layer_script_begin("Assets_3", layer_stop_alpha_start);
layer_script_end("Assets_3", layer_stop_alpha_end);


layer_script_begin("p3bkd1", layer_stop_alpha_start);
layer_script_end("p3bkd1", layer_stop_alpha_end);

layer_script_begin("p3bkd2", layer_stop_alpha_start);
layer_script_end("p3bkd2", layer_stop_alpha_end);

layer_script_begin("p3bkd3", layer_stop_alpha_start);
layer_script_end("p3bkd3", layer_stop_alpha_end);








layer_script_begin("background", layer_stop_alpha_start);
layer_script_end("background", layer_stop_alpha_end);


layer_script_begin("gameobjects", layer_stop_alpha_start);
layer_script_end("gameobjects", layer_stop_alpha_end);