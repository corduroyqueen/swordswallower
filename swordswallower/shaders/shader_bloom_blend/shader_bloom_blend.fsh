/*-----------------------------------------------------------------------------
Bloom Shader 2 - Blend: Draws application surface and bloom surface to the screen
Fragment Shader: Blend application surface with bloom surface
-----------------------------------------------------------------------------*/

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float		bloom_intensity;
uniform float		bloom_darken;
uniform float		bloom_saturation;
uniform sampler2D	bloom_texture;

void main()
{
    vec4 base_col		= texture2D( gm_BaseTexture, v_vTexcoord );
	vec3 bloom_col		= texture2D( bloom_texture, v_vTexcoord ).rgb;
	
	
	// saturate bloom colour:
	float lum			= dot(bloom_col, vec3(0.299, 0.587, 0.114));
	bloom_col			= mix(vec3(lum), bloom_col, bloom_saturation);
	
	// add (linear dodge):
	base_col.rgb		= base_col.rgb * bloom_darken + bloom_col * bloom_intensity;
	
	gl_FragColor		= v_vColour * base_col;
}
