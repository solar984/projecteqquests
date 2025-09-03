function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ah..  good day. friend.  My name's Leanon Ruksey. loyal member of the League of Antonican Bards..  Qeynos Chapter. of course.  It's part of my job to keep up with the goings-on of the city. who's coming and going and all that.  So we usually keep a man here and one at the docks.  Anyway. nice chatting with you..  be careful out there!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18020})) then
		e.self:Say("Ah, hello there, " .. e.other:GetCleanName() .. ". It's such a fine day out, wouldn't you say? Ah, reports are due in. Very well, here you go. Say hello to the fellows back at the Wind Spirit's Song for me. May you have many safe travels, my friend.");
		-- live confirmed text + faction
		e.other:Faction(284,10); 
		e.other:Faction(281,1); 
		e.other:Faction(262,1);
		e.other:Faction(304,-1);
		e.other:Faction(285,-1);
		e.other:QuestReward(e.self,{itemid = 18024, exp = 200}); -- Item: Leanons Report
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
