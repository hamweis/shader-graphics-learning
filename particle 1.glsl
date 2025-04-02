#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

void main() {
    float x = (u_time) * .1;
    vec2 uv = (gl_FragCoord.xy * 2. - u_resolution.xy) / u_resolution.y;
    vec3 particle_collection = vec3(0.);

    for(int i = 0; i < 40; i++) {

        vec2 uv_moving = vec2(uv.x, uv.y -= sin(x));
        float d = length(max(abs(uv_moving) - .005, 0.));

        d = .001 / d;
        particle_collection.x += d;
        particle_collection.y += d;
        particle_collection.z = 4. / exp(x) * x;

    }

    gl_FragColor = vec4(particle_collection.xy, 0., particle_collection.z);
}
