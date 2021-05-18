/// @description Insert description here
// You can write your code in this editor
if (global.p_score <= 0){
game_restart()
}

if (delay > 0)
{
delay -= 1
return;
}

switch(global.current_phase)
{
	
	case global.phase_new_round:
	global.c_score = 1.00;
	var newenemy = instance_create_layer(540,200,"Instances",obj_bee);


	
	ds_list_shuffle(global.deck);
				for(i = 0; i < deck_size; i++)
				{
				global.deck[| i].depth = deck_size - i;
				global.deck[| i].target_y = deck_y;
				audio_play_sound(snd_card,1,false);
				}
	
	global.current_phase = global.phase_dealing;
	
	case global.phase_dealing:
	 if	(ds_list_size(global.hand_player) < hand_size)
		
		{
			var card = global.deck[| ds_list_size(global.deck)-1];
			ds_list_delete(global.deck,ds_list_size(global.deck)-1);
			ds_list_add(global.hand_player,card);
			show_debug_message(ds_list_size(global.hand_player));
			card.target_y = 560;
			card.target_x = 135 + (125 * (ds_list_size(global.hand_player)));
			card.hand_x = card.target_x;
			card.in_hand = true;
			delay = 0.5*room_speed;
			audio_play_sound(snd_card,1,false);
		}
		else {
			for(i = 0; i < hand_size; i++)
			{
				global.hand_player[|i].is_face_up = true;		
			}	
		
				global.current_phase = global.phase_player_chooses;
				delay = 0.5*room_speed;
		}
	
		break;
	
	case global.phase_player_chooses:
	
			if (position_meeting(mouse_x, mouse_y, obj_deck_overlay))
		{
			show_debug_message(ds_list_size(global.hand_player));
			if (mouse_check_button_pressed(mb_left))
			{
				if(global.energy >= 1) && (ds_list_size(global.deck) > 0) {
					global.energy -= 1;
					var card = global.deck[| ds_list_size(global.deck)-1];
					ds_list_delete(global.deck,ds_list_size(global.deck)-1);
					ds_list_add(global.hand_player,card);
					show_debug_message(ds_list_size(global.hand_player));
					card.in_hand = true;
					card.is_face_up = true;
					delay = 0.5*room_speed;
					audio_play_sound(snd_card,1,false);
					for(i = 0; i < ds_list_size(global.hand_player); i++)
						{
						global.hand_player[| i].target_x = 135 + (125 * (i +1));
						global.hand_player[| i].target_y = 560;
						global.hand_player[| i].hand_x = global.hand_player[| i].target_x;
						}

				}
			}
			
		}
			if (keyboard_check(vk_space)){
			global.current_phase = global.phase_discard;
			if (global.c_score > 0){
			audio_play_sound(snd_bee,1,false);
			delay = 3*room_speed;
			global.p_score -= 10;}
			}

	

	break;
	
	case global.phase_discard:
	 if (ds_list_size(global.hand_player) > 0)
			{
			var card = global.hand_player[| ds_list_size(global.hand_player)-1];
			ds_list_delete(global.hand_player, ds_list_size(global.hand_player)-1);
			ds_list_add(global.discard, card);
			card.target_y = discard_y;
			card.target_x = 906;
			card.in_hand = false;
			card.is_held = false;
			delay = 0.5*room_speed;
			audio_play_sound(snd_card,1,false);
			} 
	 if (ds_list_size(global.deck) < hand_size) && (ds_list_size(global.deck) > 0) {
			var card = global.deck[| ds_list_size(global.deck)-1];
			ds_list_delete(global.deck, ds_list_size(global.deck)-1);
			ds_list_add(global.discard, card);
			card.target_y = discard_y;
			card.target_x = 906;
			card.is_face_up = true;
	}
		if (ds_list_size(global.hand_player) == 0){
		if (ds_list_size(global.deck) == 0) {
		global.current_phase = global.phase_reshuffle;
		} else {
		global.current_phase = global.phase_dealing;
		}
			}
	break;
	
	case global.phase_reshuffle:

		if (ds_list_size(global.deck) == deck_size){
			ds_list_shuffle(global.deck);
			delay = 0.5*room_speed;
			
		for(i = 0; i < deck_size; i++)
			{
			var card = global.deck[| i];
			card.y = deck_y - (2 * i);
			global.deck[| i].target_x = 56 + 125/2;
			global.deck[| i].target_y = deck_y;
			} if (global.c_score == 0){
				global.current_phase = global.phase_new_round;} else {
				global.current_phase = global.phase_dealing;
				}
			} else {
			var card = global.discard[| ds_list_size(global.discard)-1];
			ds_list_delete(global.discard, ds_list_size(global.discard)-1);
			ds_list_add(global.deck, card);
			card.is_face_up = false;
			card.target_x = 56 + 125/2;
			card.target_y = deck_y;
			audio_play_sound(snd_card,1,false);
			delay = 0.5*room_speed;
		}	
	break;
}