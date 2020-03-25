/// @description Insert description here
// You can write your code in this editor
if player_obj.x>-450 &&
player_obj.x<158 &&
player_obj.y>17408 {
	if start {
		musicvar = audio_play_sound(brinstar,100,true)
		audio_sound_gain(musicvar,0,0)
		start = false
	}
	volfunc = (19901-player_obj.y)/2493
	audio_sound_gain(musicvar,volfunc,0)
}