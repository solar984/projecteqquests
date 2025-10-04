function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if e.other:HasItem(18756) then
		e.other:Message(MT.Yellow,"A sly looking Dark Elf turns to address you. 'Come to me, young Cleric. I am Perrir Zexus. Read the note in your inventory and hand it to me so that you may begin on the path of the Cleric True power can be yours should you have the will to train hard enough!'");
	end
end

function event_say(e)
	if(eq.is_the_ruins_of_kunark_enabled()) then
		if(e.message:findi("hail")) then
			if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 100) then
				e.self:Say("Salutations, " .. e.other:GetCleanName() .. "! Your devotion to our Lord Innoruuk is evident in your actions and on your soul. As a member of the Spires of Innoruuk, you are required to obtain and wear the symbol of your station among the clergy. I can award you the [hematite symbol of Innoruuk] worn by the initiates of the Spires.");
			elseif(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 0) then
				e.self:Say("Although I sense the hate building within you, you have not yet done enough service to this temple to be trusted!");
			else
				e.self:Say("You are worthless and pathetic! You could never be of service to our temple!  Begone before your innards decorate our walls!");		
			end
		elseif(e.message:findi("hematite symbol of Innoruuk")) then
			if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 150) then
				e.self:Say("The forest beyond the gates of our grand city has been shaped by the magic of our Lord Innoruuk to be more hospitable to our kind. There are halfling druids in the service of Karana who have set up shrines there in hopes of restoring the forest to its former state. They could never succeed in their task with their feeble powers granted by their insignificant god, yet still, they are a nuisance. Bring me four of the holy symbols worn by the druids and I shall grant you the initiate symbol of Innoruuk.");
			elseif(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 0) then
				e.self:Say("Although I sense the hate building within you, you have not yet done enough service to this temple to be trusted!");
			else
				e.self:Say("You are worthless and pathetic! You could never be of service to our temple!  Begone before your innards decorate our walls!");		
			end
		end

	elseif(eq.is_omens_of_war_enabled()) then
    	if(e.message:findi("trades")) then
        	e.self:Say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
	       	e.other:SummorItem(51121); -- Item: Tradeskill Basics : Volume I
    	elseif(e.message:findi("second book")) then
        	e.self:Say("Here is the second volume of the book you requested, may it serve you well!");
        	e.other:SummorItem(51122); -- Item: Tradeskill Basics : Volume II
    	end
  	else
		if(e.message:findi("hail")) then
			if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 100) then
				e.self:Say("Salutations, " .. e.other:GetCleanName() .. "! Your devotion to our Lord Innoruuk is evident in your actions and on your soul.");
			elseif(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 0) then
				e.self:Say("Although I sense the hate building within you, you have not yet done enough service to this temple to be trusted!");
			else
				e.self:Say("You are worthless and pathetic! You could never be of service to our temple!  Begone before your innards decorate our walls!");		
			end	
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 150 and item_lib.check_turn_in(e.self, e.trade, {item1 = 14550, item2 = 14550, item3 = 14550, item4 = 14550})) then--Woven Grass Amulets
		e.self:Say("You have done well, young initiate. I grant you this medallion invested with the divine hatred of Innoruuk. Wear it proudly as a representation of your importance to these sacred spires. Now, if you will excuse me, I must proceed with the burning of these pathetic halfling symbols of faith.");
		e.other:Faction(340,50);--Priests of Innoruuk
		e.other:Faction(278,7);--King Naythox Thex
		e.other:Faction(362,-17);--Priests of Marr
		e.other:Faction(226,-12);--Clerics of Tunare
		e.other:Faction(341,-7);--Priests of Life
		e.other:Faction(1522, -200); --Primordial Malice
		e.other:QuestReward(e.self,0,0,0,0,1369,2000); --Initiate Symbol of Innoruuk
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18756})) then --Tattered Note
		e.self:Say("Welcome, child of Hate. I am Perrir Zexus, High Priest. We all draw power from the very source that created us, the will of Innoruuk. Here, put on this tunic. It is the tunic of our guild. Represent us well.");
		e.other:Faction(340, 100); --Priests of Innoruuk
		e.other:Faction(278, 15); --King Naythox Thex
		e.other:Faction(362, -35); --Priests of Marr
		e.other:Faction(226, -25); --Clerics of Tunare
		e.other:Faction(341, -15); --Priests of Life
		e.other:Faction(1522, -400); --Primordial Malice
		e.other:QuestReward(e.self,0,0,0,0,13585,20); --Crimson Training Tunic*
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18148})) then --Note of Recommendation
		e.self:Say("" .. e.other:GetCleanName() .. ", eh? My sister has a keen perception for seeing into a person's soul. You may store an abundance of hate but hate can be devoted to different ideals. Prove to me your devotion to our Lord Innoruuk by bringing me the skullcap of a Leatherfoot Raider who has invaded our forest. Go, " .. e.other:GetCleanName() .. ", and do as I have requested.");
		e.other:Faction(340, 200); --Priests of Innoruuk
		e.other:Faction(278, 30); --King Naythox Thex
		e.other:Faction(362, -70); --Priests of Marr
		e.other:Faction(226, -50); --Clerics of Tunare
		e.other:Faction(341, -30); --Priests of Life
		e.other:Faction(1522, -800); --Primordial Malice
		e.other:QuestReward(e.self,0,0,0,0,0,750);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13113})) then --Leatherfoot Skullcap
		e.self:Say("Fine work, " .. e.other:GetCleanName() .. "! You are well on your way to reaping the rewards of the Spires of Innoruuk.");
		e.other:Faction(340, 10); --Priests of Innoruuk
		e.other:Faction(278, 1); --King Naythox Thex
		e.other:Faction(362, -3); --Priests of Marr
		e.other:Faction(226, -2); --Clerics of Tunare
		e.other:Faction(341, -1); --Priests of Life
		e.other:Faction(1522, -40); --Primordial Malice
		e.other:QuestReward(e.self,8,5,0,0,0,250);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:neriakc  ID:42084 -- Perrir_Zexus
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
