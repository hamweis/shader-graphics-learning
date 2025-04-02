#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;


void main() {
    vec2 uv = (gl_FragCoord.xy*2.0 -u_resolution.xy)/u_resolution.y;
    uv*=2.;

    //Smooth Rotation back and forth
    //float x = 2.*smoothstep(-.8,.8,sin(u_time*3.))-1.;

    //Clockwise Rotation
    float x = (u_time);


    uv=uv*mat2(cos(x), -sin(x),sin(x), cos(x));
    
    float d;

    //SQUARE First Try
    //d = pow(ceil((uv.y)),2.) + pow(ceil((uv.x)),2.);

    //SQUARE INIGO QUILEZ
    d = length(max(abs(uv)-.5,0.));
    
    
    //SQAURE Second Try - Centered
    /*if ((uv.x>=0. &&uv.x<=1.)&& uv.y>=0. && uv.y<=1.) {
        d = 1.+pow(uv.y,2.);
    } else if ((uv.x<=0. &&uv.x>=-1.)&& uv.y>=0. && uv.y<=1.) {
        d = 1.+pow(uv.y,2.);
    } else if ((uv.x>=0. &&uv.x<=1.)&& uv.y<=0. && uv.y>=-1.) {
        d = 1.+pow(uv.x,2.);
    } else if ((uv.x<=0. &&uv.x>=-1.)&& uv.y<=0. && uv.y>=-1.) {
        d = 1.+pow(uv.x,2.);
    }*/
    //d=sin(d*8.-u_time)/8.;
    //d=abs(d);

    d=pow(0.1/d,1.);

    gl_FragColor =vec4(d,d,1.,1.);
}