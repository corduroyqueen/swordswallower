/// @description tween_cubic_out_simple(input_value);
/// @param input_value
/*
_______________________________________________________________________________
INFO:
-------------------------------------------------------------------------------
This script remaps/tweens an input value from an input range of 0 to 1
to an output range of 0 to 1 in a "cubic out" fashion: fast -> slow

input_value			The value to remap
					could i.e. be a timers current value
					
returns				the input_value remapped to the output_range
					so basically out_value
_____________________________________________________________________________*/

/* original version:
t /= d;
t--;
return c*(t*t*t + 1) + b; */


/* Long version:
//var in_min	= 0;			// -
var in_value	= argument0;	// t
//var in_range	= 1;			// d
//var out_min	= 0;			// b
//var out_range	= 1;			// c

in_value--;
return in_value * in_value * in_value + 1; */

// Short version:
var in_value = argument0 - 1;
return in_value * in_value * in_value + 1;
