/// @description Insert description here
// You can write your code in this editor
draw_self()


draw_circle(bbox_right,y,4,false)
draw_circle(bbox_left,y,4,false)


with player_obj {
	draw_circle(bbox_right,y,4,false)
	draw_circle(bbox_left,y,4,false)	
	draw_circle(x,bbox_bottom,4,false)
	draw_circle(x,bbox_top,4,false)	
}

with tail_obj {
	draw_circle(bbox_right,y,4,false)
	draw_circle(bbox_left,y,4,false)
	draw_circle(x,bbox_bottom,4,false)
	draw_circle(x,bbox_top,4,false)	
	
	
}
//draw_circle(x + (sprite_get_bbox_right(mask_index) - sprite_get_xoffset(mask_index)) * image_xscale,y,10,false)

//draw_circle(x - (sprite_get_xoffset(mask_index) - sprite_get_bbox_left(mask_index)) * image_xscale,y,10,false)

//with player_obj {
//	draw_circle(x + (sprite_get_bbox_right(mask_index) - sprite_get_xoffset(mask_index)) * image_xscale,y,10,false)

//	draw_circle(x - (sprite_get_xoffset(mask_index) - sprite_get_bbox_left(mask_index)) * image_xscale,y,10,false)

	
//}