/// @description Insert description here
// You can write your code in this editor
//arm_draw()

elbowx = x
elbowy = y

handx = seg_x[2]
handy = seg_y[2]

draw_circle(seg_x[0],seg_y[0],30,false)

draw_circle(seg_x[1],seg_y[1],20,false)


draw_circle(seg_x[2],seg_y[2],10,false)

draw_line(seg_x[0],seg_y[0],seg_x[1],seg_y[1])
draw_line(seg_x[1],seg_y[1],seg_x[2],seg_y[2])