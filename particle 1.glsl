#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

void main() {
    float x = (u_time)*0.1;
    vec2 uv2 = (gl_FragCoord.xy*2.0 -u_resolution.xy)/u_resolution.y;

    vec2 uv = (gl_FragCoord.xy/u_resolution.xy);
    uv.x-=0.5;
    
    uv.y-=sin(x);
    

    //Squre SDF
    float d = length(max(abs(uv2)-.005,0.));
    float e = length(max(abs(uv)-.005,0.));
    d = 0.001 / d;
    e = 0.001 / e;

    gl_FragColor =vec4((d+e),0.4*(d+e),0.,1.0);
}