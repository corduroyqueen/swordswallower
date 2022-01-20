//fuck yes
draw_set_font(font2)
	draw_text(19,89,"fps  " + string(fps))	
	draw_text(19,120,"real fps  " + string(fps_real))	
	draw_text(19,151,"active instances  " + string(instance_count))
	draw_text(19,182,"d time  " + string(delta_time))
	
	fps_timer1++
	if fps_timer1>5{
		fps_timer1=0
		
		//if ds_list_size(fps_list)>60 {
		//	ds_list_delete(fps_list,0)
		//}
		ds_list_add(fps_list,fps_real)
		
		fps_avg=0
		sz = ds_list_size(fps_list)
		for(var i=0;i<sz;i++){
			fps_avg+=fps_list[| i]
		}
		fps_avg=fps_avg/sz
	}
	
	draw_text(19,242,"fps avg  " + string(fps_avg))
	draw_text(19,302,"size  " + string(sz))