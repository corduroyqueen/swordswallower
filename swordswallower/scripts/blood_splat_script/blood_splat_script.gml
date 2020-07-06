dd = instance_create_depth(x,y,depth-10,blood_splat_effect_obj)
dd.image_angle = point_direction(0,0,tail_obj.throwxs,tail_obj.throwys)
dd.image_speed = 4


var sw = sprite_get_bbox_right(sprite_index) - sprite_get_bbox_left(sprite_index)
var sh = sprite_get_bbox_bottom(sprite_index) - sprite_get_bbox_top(sprite_index)


dd.image_xscale = 1+1 * (sh/64)
dd.image_yscale = 1+1 * (sh/64)
