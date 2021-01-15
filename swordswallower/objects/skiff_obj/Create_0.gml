/// @description Insert description here
// You can write your code in this editor
go = false
startx = x
dt=1
sword_present = false

material_stone = 1
material_wood = 2
material_meat = 3

material_type = 2

dialogue=""
player_present = false
plf = false
starty =y
dialogue_array = array_create(100)
current_pick = 0
init = true
o=0
done = false

loop1 = 0
loop2 = 0.5

loop1out = 0
loop2out = 0

leg1_ang=0
leg2_ang=0

leg2out=-10
leg1out=-10

maxy = y

okthen = 0

yolo = false

hsp=0
vsp=0
riding_list = ds_list_create();

dialogue_sound_list = ds_list_create()
ds_list_clear(dialogue_sound_list)
ds_list_add(dialogue_sound_list,boatboy_v_1)
ds_list_add(dialogue_sound_list,boatboy_v_2)
ds_list_add(dialogue_sound_list,boatboy_v_3)
ds_list_add(dialogue_sound_list,boatboy_v_4)

init_talk = false

//dialogue_array[0] = "A man entered the gates and cast a curse over our city. "
//dialogue_array[1] = "The wood turned red and gnarled and the goddess' watchers turned against us. They ate many of us alive. "
//dialogue_array[2] = "The worst of it is the sinners. He turned every sinner in our city into a yellow flesh-eating beast. "
//dialogue_array[3] = "My wife is somewhere in the city now. I watched her eat her best friend. "
//dialogue_array[4] = "I... don't even know what she did to be cursed. "
//dialogue_array[5] = "... "
//dialogue_array[6] = "If you're trying to climb to the top of the cave, the tower is the only way up. It will be the first building you visit once you enter the city. "
//dialogue_array[7] = "But it is blocked by the red wood now. So you will have to find some way to break it. "
//dialogue_array[8] = "Good luck. "


//dialogue_array[0] = "Did that creature do something to ya? "
//dialogue_array[1] = "... "
//dialogue_array[2] = "I'm guessing you're not one for words. "
//dialogue_array[3] = "... "
//dialogue_array[4] = "... "
//dialogue_array[5] = "... "
dialogue_array[0] = "Wha... What's that ahead of us? Hold on. "
dialogue_array[1] = "... "
dialogue_array[2] = "The island ahead of us... I've never seen it before. I passed through just this morning, too. "
dialogue_array[3] = "It looks like it's covered the width of the pass, so I can't get past. "
dialogue_array[4] = "I guess I'm going to drop you off. I'll go back and take the long way around... "
dialogue_array[5] = "Maybe I can pick you up from the other side. "
dialogue_array[6] = "... "
dialogue_array[7] = "Did it bubble up from the bottom of the lake? "

times_spoken=0