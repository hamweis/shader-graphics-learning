#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

void main() {
    float x = (u_time)*0.1;
    vec2 uv = (gl_FragCoord.xy*2.0 -u_resolution.xy)/u_resolution.y;
    vec3 particle_collection= vec3(0.0);

    //movement
    //uv.y-=sin(x);
    
    for (int i = 0; i < 40; i++) {
    vec2 uv_moving = vec2(uv.x,uv.y-=sin(x));
    float d = length(max(abs(uv_moving)-.005,0.));
    d = 0.001 / d;
    particle_collection.x+=d;
    particle_collection.y+=d;
    
    }
    
    gl_FragColor = vec4(particle_collection,1.0);
}
