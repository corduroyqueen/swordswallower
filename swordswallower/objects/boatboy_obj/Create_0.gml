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


keybool = false

ealpha = 0

boatboy = false
boatboyenter = false

dialogue_array[0] = "Hey! Up here! "
dialogue_array[1] = "Yes, me. Hello. Are you following the masked woman? "
dialogue_array[2] = "She just passed here and crossed the tar river. I was going to try and stop her, but she was holding a... very big sword. "
dialogue_array[3] = "I'm worried for my town on the other side and was about to cross. I can take you if you need. "
dialogue_array[4] = "Hang onto the bottom of my skiff. "

gravd = false