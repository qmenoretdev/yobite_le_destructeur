function scr_write_text_outline(font , fa_Valign ,fa_Halign , x , y , text , textcolor ,outlinecolor , outlineSize ){
	draw_set_font(font);
	draw_set_halign(fa_Halign);
	draw_set_valign(fa_Valign);
	
	//Outline  
	draw_set_color(outlinecolor);  
	draw_text(x+outlineSize, y+outlineSize, text);  
	draw_text(x-outlineSize, y-outlineSize, text);  
	draw_text(x,   y+outlineSize, text);  
	draw_text(x+outlineSize,   y, text);  
	draw_text(x,   y-outlineSize, text);  
	draw_text(x-outlineSize,   y, text);  
	draw_text(x-outlineSize, y+outlineSize, text);  
	draw_text(x+outlineSize, y-outlineSize, text); 
	draw_text_transformed_color(x,y,text,1,1,0,textcolor , textcolor,textcolor,textcolor,1);
	
}