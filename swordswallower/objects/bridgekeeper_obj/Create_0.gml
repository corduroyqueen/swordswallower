/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

dialogue = "theyve blocked the entrance to the temple :o "
sprite_index = bridgekeeper
image_speed = 1

dialogue_array[0] = "......."
dialogue_array[1] = "Your deaths. They're " + string(level1_master.death_num) + ". "
dialogue_array[2] = "When you've seen death 50 times, you will speak to me again. "
dialogue_array[3] = "There are always more to come. "
dialogue_array[4] = false

dialogue_array[0] = "......."
dialogue_array[1] = string(level1_master.death_num) + " deaths. "
dialogue_array[2] = "I am... fascinated. Impressed. "
dialogue_array[3] = "......"
dialogue_array[4] = "With your deaths as payment, I would like to give special thanks to a few individuals on the behalf of Uti and Julia. "
dialogue_array[5] = "Gabe. Matt. Noah. Clair. Spencer. Elizabeth. Marganne. Juan. Isabella. Corey. "
dialogue_array[6] = "That is all, that is all, there is nothing else. "
dialogue_array[7] = false

gravd = false

ealpha = 0