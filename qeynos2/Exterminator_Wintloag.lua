-- items: 13071
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I really can't believe it, ".. e.other:GetName() .. ". I have seen Qeynos in bad shape but this is unbelievable! The rodents have practically taken over our city. If you see some of them running around, keep the rat whiskers, and I will reward you for every four you bring me.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I specifically asked for four Rat Whiskers. Nothing more, nothing less."
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13071,item2 = 13071,item3 = 13071,item4 = 13071},1,text)) then
		e.self:Say("Here is something for you, ".. e.other:GetName() .. ". I certainly appreciate your help with our pest problem here. Great work.");
		e.other:Faction(262,1); -- Faction: Guards of Qeynos
		e.other:Faction(219,1); -- Faction: Antonius Bayle
		e.other:Faction(230,-1); -- Faction: Corrupt Qeynos Guards
		e.other:Faction(223,-1); -- Faction: Circle of Unseen Hands
		e.other:Faction(291,1); -- Faction: Merchants of Qeynos
		e.other:QuestReward(e.self,{copper = 1, silver = 1, gold = 1, exp = 50})
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
