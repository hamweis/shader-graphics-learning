#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;

void main() {
    vec2 st = gl_FragCoord.xy-u_mouse;
    vec2 norm = st/u_resolution;
    norm = abs(norm);

    gl_FragColor = vec4(norm.xy,0.,1.0);
}