/// @description Insert description here
// You can write your code in this editor
event_inherited()
death = false
hp = 1
hsp=0
vsp=0
met = false
blood_color = level1_master.enemy_blood_reds[| irandom_range(0,ds_list_size(level1_master.enemy_blood_reds)-1)]
sword_reject = false

death_blood_spawn_x = 0
death_blood_spawn_y = 0

material_stone = 1
material_wood = 2
material_meat = 3

material_type = 3

sword_ignore = false
/*
if current_time-player_obj.start_time>50 {
	with enemy_activation_handler {
		event_user(2)
	}
}