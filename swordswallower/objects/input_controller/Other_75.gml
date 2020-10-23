/// @description Insert description here
// You can write your code in this editor

switch async_load[? "event_type"] {
	case "gamepad lost":
		controller_present = false
		controller = controller_keyboard;
	case "gamepad discovered":
		controller_present = true
		controller = controller_ds4;
}