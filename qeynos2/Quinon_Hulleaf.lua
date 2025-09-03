function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Eh?... <yawn>... Ah good evening to you, too, " .. e.other:GetCleanName() .. ". I'd be careful outside the city gates tonight if I were you... I've heard rumors of evil people and undead wandering the hills recently.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	-- live confirmed text + faction
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18020})) then
		e.self:Say("Ah, hey, " .. e.other:GetCleanName() .. "...  <yawns>...  Here ya go...  <yawns>...  Please excuse my yawning, but this working nights has really drained the energy out of me.  Though, it does...  <yawn>...  get interesting around here sometimes, which helps to keep me awake.  Anyway, be safe, " .. e.other:GetCleanName() .. ", and I'll see you later.");
		e.other:Faction(284,10); -- Faction: League of Antonican Bards
		e.other:Faction(281,1); -- Faction: Knights of Truth
		e.other:Faction(262,1); -- Faction: Guards of Qeynos
		e.other:Faction(304,-1); -- Faction: Ring of Scale
		e.other:Faction(285,-1); -- Faction: Mayong Mistmoore
		e.other:QuestReward(e.self,{itemid = 18025, exp = 200}); -- Item: Quinons Report
	end
	item_lib.return_items(e.self, e.other, e.trade)
end