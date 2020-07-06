/// @description Insert description here
// You can write your code in this editor
timer=0
alpha=0

//titlescreenmusic = she_loves_us
//window_set_fullscreen(true)
//audio_play_sound(titlescreenmusic,0,0)

audio_group_set_gain(subtemple_music,0,10000)

with player_obj {
	zoom_timer_bool = false
	zoom_timer = 0
	bounce_buff_timer = 6
	reset_intangibility()
	zoom_allow=7
}

fade_alpha = 0

depth = -200000000000000000000000000