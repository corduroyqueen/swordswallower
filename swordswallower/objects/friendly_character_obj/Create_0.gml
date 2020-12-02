/// @description Insert description here
// You can write your code in this editor
event_inherited()
dialogue=""
player_present = false
plf = false
starty =y
startx = x
dialogue_array = ds_list_create()//array_create(100)
current_pick = 0
init = true
o=0
mapguy = false
stopped = false
gravd=true

dialogue_master_array = ds_list_create()

times_spoken = 0

keybool = false

ealpha = 0

boatboy = false
boatboyenter = false

mapguy_visited = false

dialogue_sound_list = ds_list_create()
ds_list_add(dialogue_sound_list,mapguy_v_1)
ds_list_add(dialogue_sound_list,mapguy_v_2)
ds_list_add(dialogue_sound_list,mapguy_v_3)
ds_list_add(dialogue_sound_list,mapguy_v_4)