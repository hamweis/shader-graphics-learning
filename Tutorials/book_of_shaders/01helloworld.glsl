#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;  // Canvas size (width,height)
uniform vec2 u_mouse;       // mouse position in screen pixels
uniform float u_time;       // Time in seconds since load

vec4 color(){
    return vec4(1.0, 0.0, 0.0, 1.0);
}

void main() {
    vec4 given_color= color();
    //given_color *=abs(sin(u_time*0.5));
	gl_FragColor = given_color;
}