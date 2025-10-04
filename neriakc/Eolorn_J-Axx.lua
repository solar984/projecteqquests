function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if e.other:HasItem(18752) then
		e.other:Message(MT.Yellow,"Eolorn J'Axx turns towards you. 'Are you a new recruit? All new recruits must read the note in their inventory and hand it to me to begin their training.'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It is good to see new blood in our halls. I am the leader of this house. If you are looking for guidance, seek out the masters within. I rarely appoint tasks to new recruits, unless I need to retrieve the [foreign take].");
	elseif(e.message:findi("foreign take")) then
		e.self:Say("We have rogues operating in a few great cities. We send young rogues to retrieve the monthly take. We have been awaiting the Freeport delivery. The last youth I sent must have been killed along the way. I will need a new runner to [retrieve the chest].");
	elseif(e.message:findi("retrieve the chest")) then
		e.self:Say("You seem able enough. Here. Take this note to Freeport. Go through the Commonlands and be careful not to encounter any Freeport guards. There is a network of aqueducts accessible through hidden passages. Search the outside walls of Freeport. Take the note to Giz. She will meet you at night, on an island in the harbor. Good luck.");
		e.other:SummonItem(18844); -- Item: A Sealed Letter
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
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18752})) then --tattered note
		e.self:Say("You wanna be part of the Ebon Mask, huh? Well, you'll need to impress me. Here's your guild tunic. Go find Hekzin, he'll have some work for you, I'm sure. Don't screw up, kid.  That pretty face of yours would make a fine trophy, got it? Now, quit breathin' my air, and go get some work done.");
		e.other:Faction(244,100); --Ebon Mask
		e.other:Faction(262,-5); --Guard of Qeynos
		e.other:Faction(320,-25); --Wolves of the North
		e.other:Faction(263,-10); --Guardians of the Vale
		e.other:Faction(329,-25); --Carson McCabe
		e.other:QuestReward(e.self,0,0,0,0,13581,20); --Old Black Tunic*
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13891}, 0)) then
		e.self:Say("The Hall thanks you. You have performed supremely. We are glad to have you with us. I offer you this, loot from former takes. I hope you can use it.");
		e.other:Faction(244,10); --Ebon Mask
		e.other:Faction(262,-1); --Guard of Qeynos
		e.other:Faction(320,-2); --Wolves of the North
		e.other:Faction(263,-1); --Guardians of the Vale
		e.other:Faction(329,-2); --Carson McCabe
		e.other:QuestReward(e.self,math.random(10),0,0,0,eq.ChooseRandom(7007,7008,1050,1051,13003),1000); -- rusty dagger, rusty rapier, rat fur cap, rat pelt cape, small lantern --verified xp
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:neriakc  ID:42074 -- Eolorn_J`Axx

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
