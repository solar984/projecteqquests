function event_trade(e)
	local item_lib = require("items");

	if(not eq.is_content_flag_enabled("Classic_OldWorldDrops") and item_lib.check_turn_in(e.self, e.trade, {item1 = 12139})) then
		e.other:Faction(343, 1); -- Faction: QRG Protected Animals
		e.other:Faction(302, 1); -- Faction: Protectors of Pine
		e.other:Faction(272, 1); -- Faction: Jaggedpine Treefolk
		e.other:Faction(366, -1); -- Faction: Karana Bandits
		e.other:QuestReward(e.self,{itemid = 18809, exp = 200}); -- Item: Bayle List II
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
