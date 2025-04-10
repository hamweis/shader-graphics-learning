#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

void main() {

    vec2 uv = (gl_FragCoord.xy * 2.0 - u_resolution.xy) / u_resolution.y;
    uv *= 15.;
    uv -= sin(u_time * .5);

    float e;

    for(float i = 0.; i < 10.; i++) {
        float d = length(vec2(uv.x+i*2.,uv.y+sin(1.2*u_time+i*0.5)));
        d -= 1.;
        
        //d-=sin(.2*u_time)/2.+i;
        
        d = 0.002 / d;
        d = abs(d);
        d = smoothstep(-.01, .1, d);
        e += d;
    }


    // Output to screen
    gl_FragColor = vec4(e, -0.5+e, 0, 1.0);
}