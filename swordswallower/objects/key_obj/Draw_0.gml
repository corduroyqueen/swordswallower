//fuck yes
var fc = -sign(player_obj.x-x)
if unlocking {
	fc = -sign(target.x-x)
}
if flying_away {
	fc = -sign(x-xpreva)
}
draw_sprite_ext(keybird_1,image_index,x,y,1.5*fc,1.5,0,c_white,1)
draw_sprite_ext(keybird_2,image_index,x,y,1.5*fc,1.5,0,c_white,1)

if !flying_away {
	draw_sprite_ext(keybird_3,image_index,x,y,1.5*fc,1.5,0-clamp((x-xpreva),-60,60),c_white,1)
}