/// @description Insert description here
// You can write your code in this editor
cam_height = camera_get_view_height(view_camera[0])
cam_width = camera_get_view_width(view_camera[0])
cam_height_h = cam_height/2
cam_width_h = cam_width/2
scr_globalvars()
global.tboxActive = true

view_hview = 500
view_wview = 1000
max_width = 1280
max_height = 600

current_dialogue="my nam ei suti bticH im the best ever and dont u know it "
speaking = false
printing = true
show_checkpoints = true

lel=-1

font2 = font_add("lato.ttf",32,false,false,32,128)

ealpha = 0

mouse_ui_x = 0
mouse_ui_y = 0

u_blood_trans = shader_get_uniform(shader_blood_alpha, "v_mult");

u_blood_r = shader_get_uniform(shader_blood_alpha, "blood_r");
u_blood_g = shader_get_uniform(shader_blood_alpha, "blood_g");
u_blood_b = shader_get_uniform(shader_blood_alpha, "blood_b");

u_blood_r2 = shader_get_uniform(shader_blood_alpha_surface, "blood_r");
u_blood_g2 = shader_get_uniform(shader_blood_alpha_surface, "blood_g");
u_blood_b2 = shader_get_uniform(shader_blood_alpha_surface, "blood_b");