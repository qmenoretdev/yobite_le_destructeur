application_surface_draw_enable(true);
window_set_fullscreen(true);
// Gestion du curseur
window_set_cursor(cr_none);
cursor_sprite = spr_pointer;

// textbox
text_box = undefined;
text_box_next = undefined;
text_box_previous = undefined;
text_index = 0;
text = "";
text_tab = [];

switch(room) {
	case rm_level_1_intro:
		text_index = 0;
		text = "";
		text_tab = ["Yobite le Fécondateur vit heureux à Verga avec ses 1001 femmes. Il travaille avec acharnement au réarmement démographique de sa nation.",
					"Jusqu'au jour où Capote-Man le Contracepteur lui vole une femme. Ce n'est pas n'importe quelle femme. C'est LA femme, la perle de sa collection. La 1000 unième : Gronon Létchoutches.",
					"Turgescent de colère, le bien membré Fécondateur devient Yobite le Destructeur et part à la poursuite de ce gros vilain !",
					"La première étape du Sanguin jouflu est Chasteau, dans les monts Pogne, le fort protégeant les contrées de Capote-Man. Yobite aura fort à faire face à ses sbires. Pour assurer ses arrières il ne doit pas seulement traverser, il doit massacrer tout ce qui flatule."];
		text_box = instance_create_depth(room_width/2,room_height/2,0,obj_textbox);
		break;

	case rm_level_2_intro:
		text_index = 0;
		text = "";
		text_tab = ["Yobite est maintenant en terres ennemis. Il doit redoubler de prudence.",
					"Cependant Gronon Létchoutches est en danger, il ne peut se permettre de perdre du temps. Il choisit donc de prendre au plus court, à travers le territoire étouffant du gang des Slips Chauffants..."];
		text_box = instance_create_depth(room_width/2,room_height/2,0,obj_textbox);
		break;

	case rm_level_3_intro:
		text_index = 0;
		text = "";
		text_tab = ["Après avoir sacrifié quelques poils pubiens dans les flammes, Yobite parvient à sortir du territoire du gang des Slips Chauffants.",
					"Les puissants phéromones de Gronon Létchoutches lui confirment qu'il touche au but. Mais l'armée de Capote-Man l'attend de pied ferme... Pour s'en sortir Yobite doit les exterminer."];
		text_box = instance_create_depth(room_width/2,room_height/2,0,obj_textbox);
		break;

	case rm_level_4_intro:
		text_index = 0;
		text = "";
		text_tab = ["Yobite le divin protubérant a défait l'armée du Contracepteur. Entre lui et Gronon il ne reste que Capote-Man. L'heure de la confrontation finale a sonné ! Il doit faire tomber Capote-Man en remplissant ses ballons de foutre."];
		text_box = instance_create_depth(room_width/2,room_height/2,0,obj_textbox);
		break;

	case rm_end:
		text_index = 0;
		text = "";
		text_tab = ["Victoire pour Yobite ! Il rentra à Verga avec Gronon saine et sauve. Il vécut heureux et eu beaucoup (trop) d'enfants ! Il créa un déséquilibre démographique mondial qui eu pour effet de multiplier par deux la taille moyenne des pénis. La Georgette devint un sport international et le floc un prérequis social pour se faire accepter."];
		text_box = instance_create_depth(room_width/2,room_height/2,0,obj_textbox);
		break;
		
	case rm_game_over:
		text_index = 0;
		text = "";
		text_tab = ["La bite de Yobite est KO ! Heureusement il a toujours un peu de pommade magique pour la remettre d'attaque."];
		text_box = instance_create_depth(room_width/2,room_height/2,0,obj_textbox);
		break;
}

if (scr_instance_exist_custom(text_box)) {
		// boutons next et previous
	var _marge = 16;
	text_box_next = instance_create_depth(text_box.x+(text_box.sprite_width/2)-_marge,text_box.y+(text_box.sprite_height/2)-_marge,text_box.depth - 1, obj_next);
	text_box_before = instance_create_depth(text_box.x-(text_box.sprite_width/2)+_marge,text_box.y+(text_box.sprite_height/2)-_marge,text_box.depth - 1, obj_before);
}

audio_stop_all();