/*-----------------------------------------------------------------------------
Flame Distortion Shader: Distorts a flame sprite
Vertex Shader: Pass-through
Fragment Shader: Distort
-------------------------------------------------------------------------------
_______________________________________________________________________________
INFO:
-------------------------------------------------------------------------------
This shader distorts a flame sprite so it looks like it's a flickering flame.
It's no fire simulation though. It can't really create particles and move them
individually. It can however mimmick the effect quite well wih the fragment
shader alone.

The shader needs the flame to be on its own n^2 texture page. And it needs a 
distortion mask on it's own n^2 texture page as well.

- The distortion masks red channel is used to distort the flame. a simple 
  leopard pattern works quite nicely. No red means no distortion and full red
  means full distortion.
  A scale uniform scales the pattern on the red channel. The larger the scale
  factor the smaller the pattern gets.
  
- The green channel is split into a left half and right half. The left half is
  a distortion strength multiplier for the x-axis. No green means mutlply the
  distortion by 0 and full green means multiply the distortion by 1. This can 
  be used to fix certain fragments to not distort on the x axis.
  The right half does the same for the y axis.
  There is also a strength vec2 uniform for x and y distortion strength wich is
  multiplied with the green channel to change this dynamically.
  
- The blue channel is a bend factor. We can bend the flame by a uniform to 
  simulate wind or air drag. The blue channels as a factor to the bend strength
  is used to give the bend a natural looking bending curve.
    
_______________________________________________________________________________
UNIFORMS:
-------------------------------------------------------------------------------
uniform float		time;			real | 0 <= time <= 1
									shifts the coordinates on the red channel
									and thus advances the flicker movement
uniform vec2		strength;		real | 0 <= strength <= 1
									distortion multiplier
									(0.2, 0.7) usually looks good
uniform float		size;		real | 0 <= size
									scales the red channel
uniform float		bend;			real | -1 <= bend <= +1
									wind/air drag
									-0.5 to +0.5 usually looks good

uniform sampler2D distort_tex;
	
_______________________________________________________________________________
EXAMPLE:
-------------------------------------------------------------------------------

check demo file
*/

	varying vec2 v_vTexcoord;
	varying vec4 v_vColour;
	
	uniform float	time;
	uniform vec2	strength;
	uniform float	size;
	uniform float	bend;
	
	uniform sampler2D distort_tex;


void main() {
	// distortion offset (red):
	vec2 distort		= texture2D(distort_tex, fract(v_vTexcoord * size + vec2(0.0, time))).rr;
	distort.x			-= 0.5; // to keep the flame horizontally centered

	// distortion strength factor (green):
	vec2 distort_str;
	distort_str.x		= texture2D(distort_tex, vec2(v_vTexcoord.x * 0.5,			v_vTexcoord.y)).g * strength.x;
	distort_str.y		= texture2D(distort_tex, vec2(v_vTexcoord.x * 0.5 + 0.5,	v_vTexcoord.y)).g * strength.y;
	
	// apply distrotion strength:
	distort				*= distort_str;
	
	// bend flame (blue):
	distort.x			+= texture2D(distort_tex, v_vTexcoord).b * bend; // -1 <= bend <= +1
	
	// Output:	
	gl_FragColor		= v_vColour * texture2D( gm_BaseTexture, v_vTexcoord + distort);
}



