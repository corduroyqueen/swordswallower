/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
ds_list_clear(dialogue_sound_list)
ds_list_add(dialogue_sound_list,pierce1_v_)
ds_list_add(dialogue_sound_list,pierce2_v_)
ds_list_add(dialogue_sound_list,pierce3_v_)
ds_list_add(dialogue_sound_list,pierce4_v_)
dialogue = "theyve blocked the entrance to the temple :o "
sprite_index = bridgekeeper
image_speed = 0.5

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

dialogue_array[0] = "Spare me! Please! I'm so sorry! "
dialogue_array[1] = "The Queen made me do it, I swear, I didn't want to trick you! "
dialogue_array[2] = "... "
dialogue_array[3] = "I've been locked up here for years, just like you. They threatened to kill me if I didn't drop every passerby into the tar pit. "
dialogue_array[4] = "Please, just spare me, I promise I won't try to kill anyone else! "
dialogue_array[5] = "... "
dialogue_array[6] = "What do you want from me?? "
dialogue_array[7] = "Is it about the cloaked man? I saw him go up your tower. "
dialogue_array[8] = "If you keep going straight you'll find him. He was carrying an unconscious girl. "
dialogue_array[9] = "... "
dialogue_array[10] = "Is it about the traveler I tricked earlier? The masked one? "
dialogue_array[11] = "If you find him, tell I'm sorry... I really mean it. "
dialogue_array[12] = "... "
dialogue_array[13] = "Please just leave me alone, I won't hurt anyone else! "
dialogue_array[14] = "end"

gravd = false

ealpha = 0

crying_bool = false