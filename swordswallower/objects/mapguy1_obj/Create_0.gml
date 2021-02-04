//fuck yes
/// @description Insert description here
// You can write your code in this editor
event_inherited()
dialogue=""
player_present = false
plf = false
starty =y
startx = x
dialogue_array = array_create(100)
current_pick = 0
init = true
o=0
mapguy = false
stopped = false
gravd=true
times_spoken  = 0


keybool = false

ealpha = 0

boatboy = false
boatboyenter = false

//level1_master.mapguy_visited = false

dialogue_sound_list = ds_list_create()
ds_list_add(dialogue_sound_list,mapguy_v_1)
ds_list_add(dialogue_sound_list,mapguy_v_2)
ds_list_add(dialogue_sound_list,mapguy_v_3)
ds_list_add(dialogue_sound_list,mapguy_v_4)

//sprite_index = oracle;
mapguy = true
dialogue_array[0] = "Greetings. That's a rather large sword."
dialogue_array[1] = "If you're down here, then you must've fallen at the bridge, too. "
dialogue_array[2] = "I came down the cliffs on the other side of that bridge, and was fooled as well. Now I'm down here. "
dialogue_array[3] = "Tell you what, let's make a deal-"
dialogue_array[4] = "I'm a cartographer, and I've mapped this entire area. And you're a warrior, with that giant sword of yours."
dialogue_array[5] = "I'll give you a map of this tower and the cliffs above, and you'll put the bridge back the way it was so we can get out of here. "
dialogue_array[6] = "Here you go. Press 'SHIFT/CIRCLE' to look at it. "
dialogue_array[7] = "If you can find a way to open the door behind me, you'll find your way back to the bridge. "
dialogue_array[8] = "Good luck. "
dialogue_array[9] = "end"