shader_type canvas_item;

uniform vec3 color = vec3(1.0, 1.0, 1.0);

void fragment() {
    // Calculate the color burn effect
    COLOR.rgb = 1.0 - (1.0 - COLOR.rgb) / (color.rgb);
}
