/// @description Insert description here
// You can write your code in this editor
if initialize {
	pre_nodes = collision_list(x,y,beat_node_obj)
	
	node_count = ds_list_size(pre_nodes)
	
	nodes = array_create(node_count+1)
	
	for(i=0;i<node_count;i++) {
		nodes[pre_nodes[| i].num] = pre_nodes[| i]
		
	}
	
	bird = instance_create_depth(nodes[0].x,nodes[0].y,0,hummingbird_obj)
	bird.nodes = array_create(node_count+1)
	bird.nodes = nodes
	bird.nodes[node_count] = nodes[0]
	bird.node_count = node_count
	
	initialize = false	
	
}