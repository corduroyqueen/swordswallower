/// @description Insert description here
// You can write your code in this editor
art_surface = surface_create(1920,1080)
lay_id=-4

splat_list_x = ds_list_create()
splat_list_y = ds_list_create()
splat_list_rot = ds_list_create()
splat_list_s = ds_list_create()


blood_splat_surface = surface_create(1920,1080)
shader_art_surface = shader_get_sampler_index(shader_blood_alpha_surface, "artSurface");
shader_art_surface2 = shader_get_sampler_index(shader_light_alpha_surface, "artSurface");

light_surface = surface_create(1920,1080)
//layer_script_begin("level_art", layer_surface_script_start);
//layer_script_end("level_art", layer_surface_script_end);

//layer_script_begin("foreground", layer_surface_script_start);
layer_script_end("foreground", layer_surface_script_end);

//layer_script_begin("inside_wall_art", layer_surface_script_start);
//layer_script_end("inside_wall_art", layer_surface_script_end);

//layer_script_begin("solid_color", layer_surface_script_start);
//layer_script_end("solid_color", layer_surface_script_end);

layer_script_begin("misc", layer_surface_script_start);
//layer_script_end("misc", layer_surface_script_end);


//layer_script_begin("gameobjects", layer_surface_script_start);
//layer_script_end("gameobjects", layer_surface_script_end);


//layer_script_begin("level_art2", layer_surface_script_start);
//layer_script_end("level_art2", layer_surface_script_end);

//layer_script_begin("Assets_2", layer_surface_script_start);
layer_script_end("Assets_2", layer_surface_script_end);

//layer_script_begin("inside_wall_art2", layer_surface_script_start);
//layer_script_end("inside_wall_art2", layer_surface_script_end);

//layer_script_begin("solid_color2", layer_surface_script_start);
//layer_script_end("solid_color2", layer_surface_script_end);

layer_script_begin("misc2", layer_surface_script_start);
//layer_script_end("misc2", layer_surface_script_end);



//layer_script_begin("level_art3", layer_surface_script_start);
//layer_script_end("level_art3", layer_surface_script_end);

//layer_script_begin("inside_wall_art3", layer_surface_script_start);
layer_script_end("inside_wall_art3", layer_surface_script_end);

//layer_script_begin("solid_color3", layer_surface_script_start);
//layer_script_end("solid_color3", layer_surface_script_end);

layer_script_begin("misc3", layer_surface_script_start);
//layer_script_end("misc3", layer_surface_script_end);




//layer_script_begin("solid_color", layer_stop_alpha_start);
//layer_script_end("solid_color", layer_stop_alpha_end);


//layer_script_begin("parallax", layer_stop_alpha_start);
//layer_script_end("parallax", layer_stop_alpha_end);

layer_script_begin("background", layer_stop_alpha_start);
//layer_script_end("bkd", layer_stop_alpha_end);

//layer_script_begin("bkd2", layer_stop_alpha_start);
//layer_script_end("bkd2", layer_stop_alpha_end);

//layer_script_begin("bkd3", layer_stop_alpha_start);
layer_script_end("checkpoints", layer_stop_alpha_end);


//layer_script_begin("actors", layer_stop_alpha_start);
//layer_script_begin("actors", layer_stop_alpha_end);

//layer_script_begin("px_near1", layer_stop_alpha_start);
//layer_script_end("px_near1", layer_stop_alpha_end);

//layer_script_begin("px_near2", layer_stop_alpha_start);
//layer_script_end("px_near2", layer_stop_alpha_end);

//layer_script_begin("px_bkd2", layer_stop_alpha_start);
//layer_script_end("px_bkd2", layer_stop_alpha_end);

//layer_script_begin("px_bkd", layer_stop_alpha_start);
//layer_script_end("px_bkd", layer_stop_alpha_end);

//layer_script_begin("px_sky", layer_stop_alpha_start);
//layer_script_end("px_sky", layer_stop_alpha_end);



//layer_script_begin("bkdp2", layer_stop_alpha_start);
//layer_script_end("bkdp2", layer_stop_alpha_end);

//layer_script_begin("bkdp22", layer_stop_alpha_start);
//layer_script_end("bkdp22", layer_stop_alpha_end);

//layer_script_begin("bkdp23", layer_stop_alpha_start);
//layer_script_end("bkdp23", layer_stop_alpha_end);

//layer_script_begin("Assets_3", layer_stop_alpha_start);
//layer_script_end("Assets_3", layer_stop_alpha_end);


//layer_script_begin("p3bkd1", layer_stop_alpha_start);
//layer_script_end("p3bkd1", layer_stop_alpha_end);

//layer_script_begin("p3bkd2", layer_stop_alpha_start);
//layer_script_end("p3bkd2", layer_stop_alpha_end);

//layer_script_begin("p3bkd3", layer_stop_alpha_start);
//layer_script_end("p3bkd3", layer_stop_alpha_end);



u_blood_r2 = shader_get_uniform(shader_blood_alpha_surface, "blood_r");
u_blood_g2 = shader_get_uniform(shader_blood_alpha_surface, "blood_g");
u_blood_b2 = shader_get_uniform(shader_blood_alpha_surface, "blood_b");

lay_id_level_art_1 = layer_get_id("level_art");
lay_id_foreground_1 = layer_get_id("foreground");
lay_id_inside_wall_art_1 = layer_get_id("inside_wall_art");
lay_id_solid_color_1 = layer_get_id("solid_color");
lay_id_misc_1 = layer_get_id("misc");

lay_id_level_art_2 = layer_get_id("level_art2");
lay_id_foreground_2 = layer_get_id("Assets_2");
lay_id_inside_wall_art_2 = layer_get_id("inside_wall_art2");
lay_id_solid_color_2 = layer_get_id("solid_color2");
lay_id_misc_2 = layer_get_id("misc2");

lay_id_level_art_3 = layer_get_id("level_art3");
lay_id_inside_wall_art_3 = layer_get_id("inside_wall_art3");
lay_id_solid_color_3 = layer_get_id("solid_color3");
lay_id_misc_3 = layer_get_id("misc3");

lay_id_blood_splats = layer_get_id("blood_splat");

layer_script_begin("blood_splat", layer_blood_splat_start);
layer_script_end("blood_splat", layer_surface_script_end);
//layer_script_begin("background", layer_stop_alpha_start);
//layer_script_end("background", layer_stop_alpha_end);


//layer_script_begin("gameobjects", layer_stop_alpha_start);
//layer_script_end("gameobjects", layer_stop_alpha_end);