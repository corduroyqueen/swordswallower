/*-----------------------------------------------------------------------------
Bloom Shader 1 - Filter Lights: Draws only light colours to a bloom/blur surface
Vertex Shader: Pass-through
-------------------------------------------------------------------------------
_______________________________________________________________________________
INFO:
-------------------------------------------------------------------------------
Process:
Draw The application surface through this shader to a post process surface.
Blur the post process surface.
Draw the application surface with the post process surface to the screen by
the second bloom shader: bloom_blend.

_______________________________________________________________________________
UNIFORMS:
-------------------------------------------------------------------------------
float bloom_threshold
float bloom_range
	lum < threshold:						is drawn black
	lum > threshold + range:				is drawn normally
	threshold < lum < threshold + range:	is drawn darkened
*/

attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}
