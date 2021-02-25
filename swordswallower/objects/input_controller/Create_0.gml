/// @description Insert description here
// You can write your code in this editor
controller = 0

controller_keyboard = 0
controller_ds4 = 1

mang = 0
global.mousepx = cos(degtorad(mang))*650
global.mousepy = sin(degtorad(mang))*650

mang = 0

controller_present = false

mouse_x_last = mouse_x
mouse_y_last = mouse_y

global.mousepx = mouse_x
global.mousepy = mouse_y

controllers_disabled = true