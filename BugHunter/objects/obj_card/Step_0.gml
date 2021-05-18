/// @description Insert description here
// You can write your code in this editor
		sprite_index = spr_cardback;
	
	if (global.current_phase == global.phase_player_chooses)
	{	
		if (position_meeting(mouse_x, mouse_y, id))
		{
			if (mouse_check_button_pressed(mb_left)) && (in_hand = true){
			is_held = true;
			depth = -5;
			}
			if (mouse_check_button_released(mb_left))
			{
				if (y <= 450){
					if (cost <= global.energy)
					{
					global.energy -= cost;
					depth = 1;
					in_hand = false;
					is_held = false;
					target_x = 906;
					target_y = 680;
					pos = ds_list_find_index(global.hand_player, id);
					ds_list_add(global.discard, id);
					ds_list_delete(global.hand_player, pos);
				
				//Card Effects
				
					if (type = global.drink){
						global.energy += 1;
						audio_play_sound(snd_energy,1,false)
					}
					if (type = global.cookie){
						global.p_score += 5;
						audio_play_sound(snd_cookie,1,false)
					}
					if (type = global.net){
						global.c_score -= 0.25;
						audio_play_sound(snd_net,1,false)
					}
					
				} else{
				if (in_hand == true) {
				depth = 0;
				is_held = false;
				target_x = hand_x;
				target_y = 560;	
				}
				
				}
				}
				else{
				if (in_hand == true) {
				depth = 0;
				is_held = false;
				target_x = hand_x;
				target_y = 560;	
				}
				
				}
			}
		}
	}
	
	if (is_held == true){
	target_x = mouse_x;
	target_y = mouse_y;
	}
	
	if(is_face_up = true){
		
	if(type = global.drink){
	sprite_index = spr_energy;
	}
	if(type = global.cookie){
	sprite_index = spr_cookie;
	}
	if(type = global.net){
	sprite_index = spr_net;
	}
	}

	x = x + (target_x - x) * 0.1;
	y = y + (target_y - y) * 0.1;


