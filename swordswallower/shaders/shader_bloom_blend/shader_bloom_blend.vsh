/*-----------------------------------------------------------------------------
Bloom Shader 2 - Blend: Draws application surface and bloom surface to the screen
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
float		bloom_intensity
			mainly for brightness but also affects contrast & saturaton
float		bloom_darken
			to darken the base texture / application surface
float		bloom_saturation
			(de-)saturate the bloom texture to change the mood
			=0:	grey
			<1:	desaturated
			=1:	no change
			>1:	saturated
sampler2D	bloom_texture
			texture with blurred light colours / bloom surface
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
