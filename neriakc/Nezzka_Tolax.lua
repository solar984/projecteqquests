function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if e.other:HasItem(18757) then
		e.other:Message(MT.Yellow,"Nezzka Tolax turns towards you. 'Welcome to the Lodge of the Dead. I am Nezzka Tolax and with my training you will learn to master teh ways of the Shadowknight. Read the note in your inventory and hand it to me when you are ready to begin your training.'");
	end
end

function event_say(e)
	if(eq.is_omens_of_war_enabled()) then
    	if(e.message:findi("trades")) then
        	e.self:Say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
	       	e.other:SummorItem(51121); -- Item: Tradeskill Basics : Volume I
    	elseif(e.message:findi("second book")) then
        	e.self:Say("Here is the second volume of the book you requested, may it serve you well!");
        	e.other:SummorItem(51122); -- Item: Tradeskill Basics : Volume II
    	end
    end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18757})) then --tattered note
		e.self:Say("Hmmm, I hope you're tougher than you look. Here, put this on. Go find Ulraz, he'll beat you into shape. There's no turning back now, punk. So, you'd better do well, got it?");
		e.other:Faction(239,100); --The Dead
		e.other:Faction(303,15); --Queen Cristanos Thex
		e.other:Faction(278,-15); --King Naythox Thex
		e.other:Faction(275,-15); --Keeper of the Art
		e.other:Faction(245,-15); --Eldritch Collective
		e.other:Faction(1522,-200); --Primodial Malice
		e.other:QuestReward(e.self,0,0,0,0,13586,20); --Black Training Tunic
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:neriakc  ID:42069 -- Nezzka_Tolax
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
