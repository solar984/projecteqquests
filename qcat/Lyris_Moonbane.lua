function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if e.other:HasItem(18721) then
		e.other:Message(MT.Yellow,"As you orient yourself amongst the filth and decay of the catacombs, a menacing figure turns to address you. 'I am Lyris Moonbane. Should you wish to dedicate your pathetic life to the way of Bertoxxulous and learn the ways of the Necromancer, read the note in your inventory and hand it to me to begin your training.'");
	end
end

function event_say(e)
	if(e.message:findi("assignment")) then
		e.self:Say("We have just the thing for your friends back home. It will take some doing, but the pay off will be lovely indeed. In that jar you must combine 4 substances. You'll need two portions of a [goblin..source], one portion of [green river sludge], and one [portion of an experimental nature] that an agent of ours is working on. Bring the mixture back to me and we'll speak again.");
	elseif(e.message:findi("goblin source")) then
		e.self:Say("The goblins of Antonica are known for their filthy habits and unclean practices. They often carry a menagerie of diseases and conditions. A more concentrated form of this aspect of goblin life cannot be found anywhere else but in the sewers of their citadel in the Sepent Spine. They must have workers who maintain the sewers. Find them and find the substance.");
	elseif(e.message:findi("green river sludge")) then
		e.self:Say("The ogres of Oggok don't spend much time on sanitation, so naturally their kind harbors many diseases. This is easily apparent in the river that runs near their city, Greenblood. Down at the very bottom of the river is where the ancient plagues have come to rest and hibernate. Once the sludge is mixed in with the other substances, those glorious blessings of Bertoxxulous will most assuredly awaken.");
	elseif(e.message:findi("portion of an experimental nature")) then
		e.self:Say("We have an agent studying in Freeport. Well, she actually isn't in Freeport proper but rather under it, in the sewers. Her name is Driana Poxsbourne. When you find her, tell her I have sent you for the substance. She will most likely have a task for you to complete before she can give you the fourth portion. Obey her.");
	elseif(e.message:findi("deliver")) then
		e.self:Say("You'll need to find the source of the kobold water supply and pour the substance into it. Once you do that, the disease will infest whatever living organisms it comes in contact with so do yourself a favor and leave the area quickly. You can then take the empty jar to your master for your reward.");
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
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18721})) then -- Blood Stained Note
		e.self:Say("So, you wish to to walk with the dead, eh? The army of the Plaguebringer is quietly amassing its diseased soldiers in the shadows and sewers of Norrath. Go to Brother Bruax. He will turn you into something useful, I hope.");
		e.other:Faction(221,100); -- Bloodsabers
		e.other:Faction(262,-15); -- Guards of Qeynos
		e.other:Faction(296,10); -- Opal Dark Briar
		e.other:Faction(341,-25); -- Priest of Life
		e.other:Faction(230,5); -- Corrupt Qeynos Guards
		e.other:QuestReward(e.self,0,0,0,0,13552,20); -- Dark Stained Purple Robe*
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1792})) then -- Heavy Locked Chest
		e.self:Emote("examines the lock on the chest and pulls a black key from a pouch at her hip. The lock clicks open. Her eyes widen as she carefully opens the chest, revealing a pile of platinum coins and a small note. After admiring the coins she takes the note and reads it. The necromancer glances up, then at her spectral pet who then hands you a glass jar. She says, 'Are you ready for your first [assignment], " .. e.other:Race() .. "?");
		e.other:QuestReward(e.self,0,0,0,0,17060); -- Thick Glass Jar
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1795})) then -- Sealed Jar
		e.self:Emote("'s eyes light up with childish glee as she takes the jar containing the disgusting and deadly substance. From her pouch she removes a gob of putty and a gem carved into the likeness of a flying insect. After sticking the putty to the lid of the jar, she mashes the carved gem into the putty and hands the jar back to you. She then says, 'This is enchant the substance. You must then [deliver] the substance.");
		e.other:QuestReward(e.self,0,0,0,0,1799); -- Harbinger of Bertoxxulous
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
