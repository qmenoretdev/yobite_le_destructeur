draw_self();
draw_set_font(fnt_bouton);
draw_set_color(c_black);
var _var_x = (sprite_width - string_width(text))/2
var _var_y = (sprite_height - string_height(text))/2
draw_text_ext(x+_var_x,y+_var_y,text,string_height(text),sprite_width);