//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 c = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	//v_alpha = 
    gl_FragColor = vec4(c.rgb, ceil(c.a-0.64)); 
}
