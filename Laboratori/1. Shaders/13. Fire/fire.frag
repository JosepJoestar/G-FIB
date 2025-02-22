#version 330 core

in vec2 vtexCoord;

out vec4 fragColor;

uniform float time;
uniform float slice = 0.1;

uniform sampler2D sampler0;
uniform sampler2D sampler1;
uniform sampler2D sampler2;
uniform sampler2D sampler3;

void main() {
    int t = int(time/slice) % 4;
    
    if      (t == 0) fragColor = texture(sampler0, vtexCoord);
    else if (t == 1) fragColor = texture(sampler1, vtexCoord);
    else if (t == 2) fragColor = texture(sampler2, vtexCoord);
    else             fragColor = texture(sampler3, vtexCoord);
}
