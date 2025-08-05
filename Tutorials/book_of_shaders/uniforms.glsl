#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;

void main() {
    vec2 st = gl_FragCoord.xy/u_mouse-1.;

    gl_FragColor = vec4(st.xy,0.,1.0);
}