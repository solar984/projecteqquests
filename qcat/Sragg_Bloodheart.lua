function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if e.other:HasItem(18706) then
		e.other:Message(MT.Yellow,"As you orient yourself amongst the filth and decay of the catacombs, a menacing figure turns to address you. 'I am Sragg Bloodheart. Should you wish to dedicate your pathetic life to the way of Bertoxxulous and learn the ways of the Shadowknight, read the note in your inventory and hand it to me to begin your training.'");
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

function event_signal(e)
	e.self:Say("I will hear no more excuses, Tovax!  Enjoy eternal pain and suffering!");
	eq.attack_npc_type(45040); --Tovax Vmar
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18706})) then --Stained Cloth Note
		e.self:Say("Ah, another would-be soldier for the army of the Plaguebringer. Unmuz has just lost a few of his men, he'll have plenty of work for you. I'm sure. Begone!");
		e.other:Faction(221,100); --Bloodsabers
		e.other:Faction(262,-15); --Guards of Qeynos
		e.other:Faction(296,10); --Opal Dark Briar
		e.other:Faction(341,-25); --Priest of Life
		e.other:Faction(230,5); --Corrupt Qeynos Guards
		e.other:QuestReward(e.self,0,0,0,0,13598,20); --Ruined Training Tunic*
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18802})) then --A Sealed Letter (Letter to Opal)
		e.self:Say("What have you brought me, worm? Hmm... This is disappointing. That Tovax has failed us for the last time. Your loyalty to Bertoxxulous and the Bloodsabers has been noted. Now, if you will excuse me a moment...");
		e.other:Faction(221,50); -- Faction: Bloodsabers
		e.other:Faction(262,-7); -- Faction: Guards of Qeynos
		e.other:Faction(296,5); -- Faction: Opal Dark Briar
		e.other:Faction(341,-12); -- Faction: Priests of Life
		e.other:Faction(230,2); -- Faction: Corrupt Qeynos Guards
		e.other:QuestReward(e.self,0,0,0,0,14007,100); -- Potion of Light Healing
		eq.unique_spawn(45040,0,0,-321,415,-38,64); -- NPC: Tovax Vmar
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
