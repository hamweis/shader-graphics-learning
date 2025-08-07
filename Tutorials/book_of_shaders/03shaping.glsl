#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float plot_linear(vec2 st) {    
    return step( .01, abs(st.y - st.x));
}

float plot_mouse_move(vec2 st) {    
    //return step( .01, abs(st.y - st.x));
    return step(0.01,abs(st.x-u_mouse.x/u_resolution.x));
}

float plot_time(vec2 st) {    
    return step(0.01,abs(st.x-abs(sin(u_time)/2.+0.5)));
    //return step(0.01,abs((st.x)*0.01/sin(u_time)));
}

float plot(vec2 st) {    
    return  abs(st.y-pow(st.x,2.));
}

void main() {
	vec2 st = gl_FragCoord.xy/u_resolution;

    float y = st.x;

    //vec3 color = vec3(y);

    // Plot a line
    float pct = plot(st);
    //color = (1.0-pct)*color+pct*vec3(0.0,1.0,0.0);
	//gl_FragColor = vec4(color,1.0);

    vec3 onlyline = vec3(pct);
    gl_FragColor = vec4(onlyline, 1.);
}