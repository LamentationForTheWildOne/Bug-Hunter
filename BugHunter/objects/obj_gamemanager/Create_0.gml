/// @description Insert description here
// You can write your code in this editor
global.drink = 0;
global.net = 1;
global.cookie = 2;


global.phase_dealing = 0;
global.phase_player_chooses = 2;
global.phase_results = 4;
global.phase_discard = 5;
global.phase_reshuffle = 6;
global.phase_new_round = 8;

global.current_phase = global.phase_new_round;

global.energy = 0;

deck_size = 6;
hand_size = 5;

global.p_score = 100;
global.c_score = 1.00;



global.deck = ds_list_create();
global.hand_player = ds_list_create();
global.discard = ds_list_create();
deck_y = 680

for(i = 0; i < deck_size; i++)
{ 
	deck_y += 2;
	
	var newcard = instance_create_layer(56 + 125/2,deck_y,"Instances",obj_card);
	
	if (i < deck_size / hand_size)
	{
		newcard.type = global.drink;
		newcard.cost = 0;
	}
	else if (i < (deck_size / hand_size)* 2)
	{
		newcard.type = global.net;
		newcard.cost = 2;
	}
	else
	{
		newcard.type = global.cookie;
		newcard.cost = 1;
	}
	
	ds_list_add(global.deck,newcard);
}

ds_list_shuffle(global.deck);
deck_y = 680
discard_y = 680;
delay = 0;

for(i = 0; i < deck_size; i++)
{
var card = global.deck[| i];
card.y = deck_y;
global.deck[| i].target_x = global.deck[| i].x;
global.deck[| i].target_y = global.deck[| i].y;
global.deck[| i].depth = deck_size-i;
}
