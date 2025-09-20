function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13861})) then
		e.self:Emote("darts into the jar, or just darted past it!! The Knights of Truth do not tolerate people attempting to catch these fish!!");
		e.other:Faction(281,-2); -- Faction: Knights of Truth
		e.other:Faction(271,1); -- Faction: Dismal Rage
		e.other:Faction(330,1); -- Faction: The Freeport Militia
		e.other:Faction(362,-2); -- Faction: Priests of Marr
		e.other:Faction(311,-2); -- Faction: Steel Warriors
		e.other:QuestReward(e.self,{itemid = eq.ChooseRandom(13861,13862)}); -- Item(s): A Jar of Liquid (13861), Fish in a Jar (13862)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
