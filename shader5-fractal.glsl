#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

void main() {

    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = (gl_FragCoord.xy*2.0 -u_resolution.xy)/u_resolution.y;

    float d = length(uv);
    d=0.02/d;
    d = d-sin(u_time);
    //d = d/0.02;
    
    //uv*=sin(u_time)*15.;
    //uv = fract(uv)-0.5;

    //float d = length(uv);
    //d-=-sin(2.*u_time)/2.;
    //d=0.02/d;

    // Output to screen
    gl_FragColor =vec4(d,d, 0., 1.0);
}