#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

vec3 palette(float t) {
    vec3 a = vec3(0.5, 0.5, 0.5);
    vec3 b = vec3(0.4, 0.4, 0.4);
    vec3 c = vec3(1.0, 1.0, 1.0);
    vec3 d = vec3(0.00, 0.010, 0.20);
    return a + b*atan( 6.283185*(c*t+d) );
}

void main() {
    float x = u_time*.2;
    //mat2(cos(x), -sin(x),sin(x), cos(x));
    vec2 uv =(gl_FragCoord.xy*2.0 -u_resolution.xy)/u_resolution.y;
    
    vec3 finalcolor;
    uv*=200.;
    uv-=0.5;

    for (float i=0.0;i<4.;i++) {
    vec2 uv2 =uv*mat2(cos(x), -sin(x),sin(x), cos(x));
    uv2=fract(uv2*.03)-0.5;
    float d = length(.05*uv2.xy*i);
    d=abs(d);
    d=.05/d;


    float e = length(uv.xy)*exp(sin(u_time));

    vec3 col1 = vec3(0.2*-d,d*e-e,0.);
    vec3 col2 = vec3(uv2,0.);
    vec3 col3 = palette(sin(u_time*length(uv*0.01)));
    finalcolor = col3+(col2-col1-0.02);

    }

    gl_FragColor =vec4(finalcolor,1.0);
}