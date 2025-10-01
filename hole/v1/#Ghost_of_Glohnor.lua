-- Part of SK Epic 1.0
-- items: 14377

-- Part of SK Epic 1.0
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14377})) then
		eq.spawn2(39130, 0, 0, 464.4, 819, -678, 125); -- NPC: Mummy_of_Glohnor
		e.other:Faction(404, 7); -- Faction: True Spirit
		eq.depop_with_timer();
	end
end
