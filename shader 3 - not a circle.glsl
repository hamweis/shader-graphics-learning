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
    vec2 uv =(gl_FragCoord.xy*2.0 -2.*u_resolution.xy)/u_resolution.y;
    float d = length(uv.x);

    const vec3 k = vec3(0.809016994,0.587785252,0.726542528);
    vec2 p =vec2(gl_FragCoord.xy*2.0 -2.*u_resolution.xy)/u_resolution.y;
    float r =0.5;
    p.x = abs(p.x);
    p -= 2.0*min(dot(vec2(-k.x,k.y),p),0.0)*vec2(-k.x,k.y);
    p -= 2.0*min(dot(vec2( k.x,k.y),p),0.0)*vec2( k.x,k.y);
    p -= vec2(clamp(p.x,-r*k.z,r*k.z),r);    
    float e = length(p)*sign(p.y);
    vec3 col = vec3(1.,1.,0.);
   
    d=sin(d*8.+3.*sin(u_time*5.));
    d=abs(d);
    d=0.2/d;
    
    e=sin(e*8.+u_time*5.);
    e=abs(e);
    e=0.2/e;

    col*=d;
    col*=e;
    gl_FragColor=vec4(col, 1.0);
}