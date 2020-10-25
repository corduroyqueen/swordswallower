if event_type == ev_draw
   {
   if event_number == 0 {
	   //gpu_set_colorwriteenable(true, true, true, true)
	   
	   gpu_set_alphatestenable(false)
       surface_reset_target();
    }
}