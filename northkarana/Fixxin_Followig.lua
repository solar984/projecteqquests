-- Fixxin Followigs Silvery Blades
function event_spawn(e)
	eq.set_timer("follow",1000);
end

function event_timer(e)
	if(e.timer == "follow") then
		local mobtypeID =  eq.get_entity_list():GetMobByNpcTypeID(13065);
		
		if(mobtypeID) then
			local follow_mob = mobtypeID:GetID();
			eq.follow(follow_mob,35);
			eq.stop_timer("follow");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 16500})) then
		e.self:Say(string.format("thanks %s heartily. 'Here is the book as promised. I wish you luck with your enchanted weapons. May they slay many lycanthropes before they go dull.'",e.other:GetName()));
		e.other:SummonItem(18178); -- Item: Fixxin Followigs Silvery Blades
		e.other:Ding();
		e.other:Faction(345,10,0); -- karana residents
		e.other:Faction(262,10,0); -- guards of qeynos
		e.other:Faction(341,10,0); -- priests of life
		e.other:Faction(280,10,0); -- knights of thunder
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- EOF zone: northkarana ID: 13063 NPC: Fixxin_Followig 

