#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;// Canvas size (width,height)
uniform vec2 u_mouse;// mouse position in screen pixels
uniform float u_time;// Time in seconds since load

vec4 color(){
    return vec4(0.,1.,.9176,1.);
}

void main(){
    vec2 normalized_position=gl_FragCoord.xy/u_resolution-.5;
    float d=length(normalized_position);
    d=.01/d;
    d=abs(d);
    gl_FragColor=vec4(d,0.,0.,1.);
}