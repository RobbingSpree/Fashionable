//https://www.shadertoy.com/view/ttyXR1
// Rainbow effect shader
//
uniform float iGlobalTime; 
uniform vec3 iResolution; 
varying vec2 fragCoord; 
varying vec2 v_vTexcoord;
vec3 hsv2rgb(vec3 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0); //change these values to change colors
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www); //change 6.0 to change the hue range
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y ); //change values to affect saturation and alpha levels
}

void main(void)
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;

    // Time varying pixel color
    float num = (floor((mod(uv.x+uv.y+iGlobalTime,1.0))*7.0)/7.0); //values affect number of segments and numbers of colors
	vec3 col=hsv2rgb(vec3(num,1.0,1.0)); //hsv values to pass into the above formula
	//make texture to use for alpha sampling
	vec4 tex = texture2D(gm_BaseTexture, v_vTexcoord);
	// Output to screen
    gl_FragColor = vec4(col,tex.a);
}
