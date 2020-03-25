/// @description Insert description here
// You can write your code in this editor
grassarray = array_create(6)
grassarray[0] = grass11
grassarray[1] = grass21
grassarray[2] = grass31
grassarray[3] = grass41
grassarray[4] = grass51
grassarray[5] = grass61

grassarrayl = array_create(6)
grassarrayl[0] = grass111
grassarrayl[1] = grass211
grassarrayl[2] = grass311
grassarrayl[3] = grass411
grassarrayl[4] = grass511
grassarrayl[5] = grass611

grassarrayr = array_create(6)
grassarrayr[0] = grass112
grassarrayr[1] = grass212
grassarrayr[2] = grass312
grassarrayr[3] = grass412
grassarrayr[4] = grass512
grassarrayr[5] = grass612

grasstype = floor(random_range(0,6))


image_speed=1.3
sprite_index = grassarray[grasstype]
image_xscale=1.25 * choose(-1,1)
image_yscale=1.25
image_alpha = 0.9

breezestate = 0
lol =false
set = false
present = false