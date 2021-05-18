/// @description Insert description here
// You can write your code in this editor
draw_set_font(fnt_score);
draw_set_halign(fa_center);


draw_set_color(c_black);
draw_text(285,705,global.energy);


draw_set_color(c_white);
draw_text(740,705,global.p_score);

draw_set_color(c_red);
draw_rectangle(343,68,343+(339*global.c_score),118,false)