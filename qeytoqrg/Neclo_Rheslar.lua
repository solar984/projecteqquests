function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("A Hello, citizen... Watch your step, there have been many vicious beasts about today.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18823})) then -- Note to Neclo
		e.self:Say("Ah.. Hello friend.. So, I see Daenor sent you.. Uh huh, ok.. Here's something that will be very useful for you. Practice this well, friend.. It will help protect you in this harsh world.");
		-- Confirmed Live Factions
		e.other:Faction(342,5); -- Order of Three
		e.other:Faction(221,-1); -- Bloodsabers
		e.other:Faction(262,1); -- Guards of Qeynos
		e.other:Faction(296,-1); -- Opal Dark Briar
		e.other:QuestReward(e.self,{itemid = 15288, exp = 1000}); -- Spell: Minor Shielding
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
