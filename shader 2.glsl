#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

vec3 palette(float t) {
    vec3 a = vec3(0.5, 0.5, 0.5);
    vec3 b = vec3(0.5, 0.5, 0.5);
    vec3 c = vec3(1.0, 1.0, 1.0);
    vec3 d = vec3(0.00, 0.10, 0.20);
    return a + b*cos( 6.283185*(c*t+d) );
}

void main() {
    vec4 final_color=vec4(0.0);
    vec2 uv = (gl_FragCoord.xy*2.0 -u_resolution.xy)/u_resolution.y;
    vec2 uv2 =uv;
    uv=fract(uv*sin(u_time)*10.)-0.5;
    float d = length(uv);

    d=sin(d*8.+u_time)/8.;
    d=0.02/d;
    d=abs(d);
    vec3 color=palette(length(uv2)+u_time);

    color*=d;


    gl_FragColor=vec4(color, 1.0);
}
