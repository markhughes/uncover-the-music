precision mediump float;

uniform sampler2D uMainSampler;
varying vec2 outTexCoord;

void main() {
    vec2 coord = vec2(outTexCoord.x, 1.0 - outTexCoord.y);
    vec2 transformedCoord = vec2(coord.x * 0.9917 - coord.y * 0.5595 - 69.95 / 80.0,
                                 coord.x * 0.8959 + coord.y * 0.4932 + 7.9 / 73.0);
    gl_FragColor = texture2D(uMainSampler, mod(transformedCoord, 1.0));
}
