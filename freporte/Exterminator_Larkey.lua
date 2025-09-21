function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there " .. e.other:GetCleanName() .. ", I hope you are doing well on this fine day. I would be great myself if it wasn't for these darn Rodents, they are everywhere! I don't suppose you would be able to help us with our problem? I would be glad to reward you for every four rat whiskers you can bring me.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I specifically asked for four Rat Whiskers. Nothing more, nothing less."

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13071,item2 = 13071,item3 = 13071,item4 = 13071})) then
		e.self:Say("I knew I could count on you " .. e.other:GetCleanName() .. ", here is a little something for you.");
		e.other:Faction(330,1); -- Faction: The Freeport Militia
		e.other:Faction(336,1); -- Faction: Coalition of Tradefolk Underground
		e.other:Faction(281,-1); -- Faction: Knights of Truth
		e.other:Faction(362,-1); -- Faction: Priests of Marr
		e.other:QuestReward(e.self,{copper = 1,silver = 1,gold = 1, exp = 50});
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
