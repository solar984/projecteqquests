function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if e.other:HasItem(18755) then
		e.other:Message(MT.Yellow,"A sly looking Dark Elf turns to address you. 'Come to me, young Wizard. I am Gath N'Mare. Read the note in your inventory and hand it to me so that you may begin on the path of the Wizard. True Power can be yours should you have the will to train hard enough!'");
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
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18755})) then --Tattered Note
		e.self:Say("I am Gath N'Mare, master wizard of the Tower of the Spurned. Welcome to our guild. Let's get started, shall we?  Here is your tunic, represent us well with it. Shanez X'Teria is our beginning guild trainer. He will teach you the basics and give you a solid learning foundation of magic.  Good luck, and study hard.");
		e.other:Faction(363,100); --The Spurned
		e.other:Faction(239,-15); --The Dead
		e.other:QuestReward(e.self,0,0,0,0,13584,20); --Stained Red Robe*
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:neriakb  ID:41053 -- Gath_N`Mare
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
