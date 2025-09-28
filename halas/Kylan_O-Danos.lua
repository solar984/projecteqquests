-- items: 51121, 51122, 18760, 13511
function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18760)) then
		e.other:Message(MT.Yellow,"A stern looking Barbarian turns to greet you. 'A new recruit? Well you better get ready for some hard work! I don't tolerate laziness! I am Kylan O`Danos, your new Guild Master. Read the note in your inventory and give it to me when you are ready to begin your training!'");
	end
end

function event_say(e)
	if(eq.is_omens_of_war_enabled()) then
		if(e.message:findi("trades")) then
			e.self:Say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
			e.other:SummonItem(51121); -- Item: Tradeskill Basics : Volume I
		elseif(e.message:findi("second book")) then
			e.self:Say("Here is the second volume of the book you requested, may it serve you well!");
			e.other:SummonItem(51122); -- Item: Tradeskill Basics : Volume II
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18760})) then
		e.self:Say("Greetin's! We are the mighty Wolves o' the North, protectors o' Halas, and we must work hard t' keep it safe fer our citizens. Here is our tunic, it identifies ye as a proud warrior o' this great city. Let's get started with yer training, then, shall we?");
		e.other:Faction(320,100);	-- Wolves of the North
		e.other:Faction(327,20); 	-- Shamen of Justice
		e.other:Faction(328,25);	-- Merchants of Halas
		e.other:Faction(311,5); 	-- Steel Warriors
		e.other:QuestReward(e.self,0,0,0,0,13511,20); -- Item: Patched Fur Tunic*
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
