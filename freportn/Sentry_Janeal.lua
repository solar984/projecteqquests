function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome. friend!  Please seek the words of the clerics of Marr.  Their words are the words which will set us free from the tyranny of the Freeport Militia.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12130})) then
		e.self:Say("I feel quite alert now. Thank you. You should take this to the next sentry.");
		e.other:Faction(362,1); -- Faction: Priests of Marr
		e.other:Faction(330,-1); -- Faction: The Freeport Militia
		e.other:Faction(281,1); -- Faction: Knights of Truth
		e.other:QuestReward(e.self,{itemid = 12131, exp = 100}); -- Item: Half of Potion of Marr
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
