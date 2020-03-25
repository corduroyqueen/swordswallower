firstAngle = argument0
secondAngle = argument1

var difference = firstAngle - secondAngle
while (difference < -180) difference += 360;
while (difference > 180) difference -= 360;
return difference;