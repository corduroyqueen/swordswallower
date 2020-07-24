/// @description Insert description here
// You can write your code in this editor


//
//if event_type == ev_draw
//   {
//   if event_number == 0
//      {
//		surface_set_target(art_surface)
//      }
//   }
   
//

gpu_set_colorwriteenable(true, true, true, false);
draw_surface(art_surface,player_obj.camx,player_obj.camy)
gpu_set_colorwriteenable(true, true, true, true)

surface_set_target(art_surface)
draw_clear_alpha(c_white,0)
surface_reset_target()

	
//draw_surface(art_surface,player_obj.camx,player_obj.camy)