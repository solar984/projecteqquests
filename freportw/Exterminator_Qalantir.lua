-- items: 13071
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Pleased to meet you! If you are a newcomer to Freeport then you can clearly see we are having quite the rat problem. If you are interested, the militia has granted me some coin to reward those that bring me four rat whiskers.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I specifically asked for four Rat Whiskers. Nothing more, nothing less."

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13071,item2 = 13071,item3 = 13071,item4 = 13071,},1,text)) then
		e.self:Say("This is good work " .. e.other:GetCleanName() .. "! I know this isn't much, but it is all I can offer you. Thanks for your help!");
		e.other:Faction(330,1); -- Faction: The Freeport Militia
		e.other:Faction(336,1); -- Faction: Coalition of Tradefolk Underground
		e.other:Faction(281,-1); -- Faction: Knights of Truth
		e.other:Faction(362,-1); -- Faction: Priests of Marr
		e.other:QuestReward(e.self,{copper = 1,silver = 1,gold = 1, exp = 50});
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--End of Exterminate the Vermin
