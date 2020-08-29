/// @description Insert description here
// You can write your code in this editor
if !enabled && !closed {
	part_emitter_region(part_system, part_emitter, x-30, x+30, y-50, y+50, ps_shape_ellipse,ps_distr_gaussian);
	part_emitter_burst(part_system, part_emitter, part_type, 100);
	boss = instance_create_depth(x,y-10,depth-10,boss_type)
}