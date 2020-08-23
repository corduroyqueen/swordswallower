/*-----------------------------------------------------------------------------
BLUR Fragment Shader:
2-PASS with lineral interpolated gaussian weighted samples (very fast)
-------------------------------------------------------------------------------
_______________________________________________________________________________
INFO:
-------------------------------------------------------------------------------
- Vertex Shader is a pass-though shader
- clamp:		add clamp() if image is a sprite not on its own
				texture page:
				clamp(v_vTexcoord [...] * blur_vector, 0, 1)
					
_______________________________________________________________________________
UNIFORMS:
-------------------------------------------------------------------------------
- blur_steps:	how many pixels to blur to each side of the
				blur center. 5 steps => 11x11 kernel
- blur_vector:	(1.0, 0.0) for horizontal blur
				(0.0, 1.0) for vertical blur
- texel_size:	(image uv width) / (image pixel width)
				where image uv width is 1 if image is on a
				seperate texture page or is a surface
- sigma:		the gaussian sigma, try something from 0.2 to 0.5

_______________________________________________________________________________
EXAMPLE: (including scaling)
-------------------------------------------------------------------------------

Create event:
---------------------------------------
shader			= shd_blur_2-pass_gauss_lerp;
u_blur_steps	= shader_get_uniform(shader, "blur_steps");
u_blur_vector	= shader_get_uniform(shader, "blur_vector");
u_texel_size	= shader_get_uniform(shader, "texel_size");
u_sigma			= shader_get_uniform(shader, "sigma");

image_w			= surface_get_width(application_surface);
image_h			= surface_get_height(application_surface);
texel_w			= 1 / image_w;
texel_h			= 1 / image_h;

srf_ping		= -1;
srf_pong		= -1;
srf_scale		= 1;
srf_scale_prev	= 1;

	
Draw event:
---------------------------------------
var blur_steps_D	= 5;								// blur steps for discrete samples
var blur_steps		= ceil(blur_steps_D / 2);			// only half the steps needed when lerping
var kernel_D		= 2 * blur_steps_D + 1;
var kernel			= 2 * blur_steps + 1;

var sigma_D			= 0.3;								// sigma for discrete samples
var sigma			= sigma_D * kernel_D / kernel;		// multiply by 2 and kernel ratio to get the same strength as in discrete sampling

srf_scale			= 0.125;							// 1/8

// Create pass surfaces and resize if needed:
if (!surface_exists(srf_ping)) {
	srf_ping = surface_create(image_w * srf_scale, image_h * srf_scale);
	draw_clear(c_black);
	srf_scale_prev = srf_scale;
}
	
if (!surface_exists(srf_pong)) {
	srf_pong = surface_create(image_w * srf_scale, image_h * srf_scale);
	draw_clear(c_black);
	srf_scale_prev = srf_scale
}
	
if (srf_scale_prev != srf_scale) {
	surface_resize(srf_ping, image_w * srf_scale, image_h * srf_scale);
	surface_resize(srf_pong, image_w * srf_scale, image_h * srf_scale);
	srf_scale_prev = srf_scale
}

gpu_set_tex_filter(true);
	
// 1st pass: downscale:
// AppSrf -> ping
surface_set_target(srf_ping);
draw_surface_stretched(application_surface, 0, 0, round(image_w * srf_scale), round(image_h * srf_scale));
surface_reset_target();
	
// 2nd pass: horizontal:
// ping -> pong
shader_set(shader);
	
shader_set_uniform_f(u_blur_steps, blur_steps);			// half of the blur kernel size, whole number >= 1
shader_set_uniform_f(u_texel_size, texel_w/srf_scale, texel_h/srf_scale);
shader_set_uniform_f(u_sigma, sigma);					// lower sigma: less blur, but less blocky
	
shader_set_uniform_f(u_blur_vector, 1, 0);				// 1,0: horizontal blur | 0,1: vertical blur
surface_set_target(srf_pong);
draw_surface(srf_ping, 0, 0);
surface_reset_target();
	
// 3rd pass: vertical
// pong -> ping
shader_set_uniform_f(u_blur_vector, 0, 1);				// 1,0: horizontal blur | 0,1: vertical blur
surface_set_target(srf_ping);
draw_surface(srf_pong, 0, 0);
surface_reset_target();

// 4th pass: scale up interpolated
// ping -> AppSrf / Screen
shader_reset();
draw_surface_stretched(srf_ping, 0, 0, image_w, image_h);
	
gpu_set_tex_filter(false);
*/

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float	blur_steps;
uniform vec2	texel_size;
uniform float	sigma;
uniform vec2	blur_vector;

float weight(float pos) { // Gauss 1D
	return exp(-(pos * pos) / (2.0 * sigma * sigma));
}


void main()
{
    highp vec4 blurred_col	= texture2D(gm_BaseTexture, v_vTexcoord);
	
	vec2  sample;
	float offset_D1, offset_L, sample_weight_D1, sample_weight_D2, sample_weight_L;
	float total_weight	= 1.0;
	float kernel		= 2.0 * blur_steps + 1.0;
	
	for (offset_D1 = 1.0; offset_D1 <= (2.0 * blur_steps); offset_D1 += 2.0) {
		sample_weight_D1	= weight(offset_D1/kernel);
		sample_weight_D2	= weight((offset_D1 + 1.0)/kernel);
		sample_weight_L		= sample_weight_D1 + sample_weight_D2;
		total_weight		+= 2.0 * sample_weight_L;
		
		offset_L			= (offset_D1 * sample_weight_D1 + (offset_D1 + 1.0) * sample_weight_D2) / sample_weight_L;
			
		sample				= v_vTexcoord - offset_L * texel_size * blur_vector;
		blurred_col			+= texture2D(gm_BaseTexture, sample) * sample_weight_L;

		sample				= v_vTexcoord + offset_L * texel_size * blur_vector;
		blurred_col			+= texture2D(gm_BaseTexture, sample) * sample_weight_L;
	}
	
	gl_FragColor = v_vColour * blurred_col / total_weight;
}
