function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if e.other:HasItem(18851) then
		e.other:Message(MT.Yellow,"As you orient yourself amongst the filth and decay of the catacombs, a menacing figure turns to address you. 'I am Reania Jukle. Should you wish to dedicate your pathetic life to the way of Bertoxxulous and learn the ways of the Enchanter, read the note in your inventory and hand it to me to begin your training.'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ". What can I help you with?");
	elseif(e.message:findi("what is the ink of the dark")) then
		e.self:Say("Ink of the Dark, you say? That isn't an everyday item, you know. In fact, I can't remember the last time someone requested it. I have given up keeping any here with me. You are going to need to find your own supply now. Sorry.");
	elseif(e.message:findi("find the ink of the dark") or e.message:findi("find your own supply")) then
		e.self:Say("The ink is the blood of a dark scribe. Tempt him and give him this vial. He should cooperate.");
		e.other:SummonItem(10626); -- Item: Empty Ink Vial
	elseif(eq.is_omens_of_war_enabled()) then
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
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18851})) then --Blood Stained Note
		e.other:Faction(221,100); --Bloodsabers
		e.other:Faction(262,-15); --Guards of Qeynos
		e.other:Faction(296,10); --Opal Dark Briar
		e.other:Faction(341,-25); --Priest of Life
		e.other:Faction(230,5); --Corrupt Qeynos Guards
		e.other:QuestReward(e.self,0,0,0,0,13596,20); --Dirty Purple Robe*
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- EOF Zone: qcat ID: 45082 NPC: Reania_Jukle
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
