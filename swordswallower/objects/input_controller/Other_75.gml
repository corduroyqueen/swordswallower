/// @description Insert description here
// You can write your code in this editor

switch async_load[? "event_type"] {
	case "gamepad lost":
		controller = controller_keyboard;
	case "gamepad discovered":
		controller = controller_ds4;
}