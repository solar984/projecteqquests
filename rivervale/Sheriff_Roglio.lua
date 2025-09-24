-- items: 51121, 51122, 18733, 13540, 13931, 13023, 13024
function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18733)) then
		e.other:Message(MT.Yellow,"As your eyes adjust to the interior of your surroundings, you see Mayor Gubbin and Sheriff Roglio standing nearby. The Mayor turns towards Sheriff Roglio. 'Looks like we have another fine young recruit to join your ranks, Roglio!' Sheriff Roglio looks your way. 'Greetings, recruit. Read the note in your inventory and hand it to me when you wish to start your training.'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 200) then
			e.self:Say("Hail, " .. e.other:GetCleanName() .. "! Stand tall whenever you are speaking to the Sheriff of Rivervale. I command the warriors of this vale. You must be new to the ranks of the Guardians of the Vale, so be sure to report to your squad at once. We must protect our people. The [danger] has come closer to home. If you are not a deputy, then please leave these halls.");
		else
			e.self:Say("Please come back when you have proven yourself more and I may have a task for you.");	
		end
	elseif(e.message:findi("danger")) then
		if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 100) then
			e.self:Say("What danger?!! You must be new to the community. The goblins of Clan Runnyeye have been scaling our wall somehow. You must join our forces in exterminating every one of those beasts. Your wages are earned with every four bloody goblin warbead necklaces you return to me. Now be off and fight the good fight.");
		elseif(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 0) then
			e.self:Say("You are in good standing with the Guardians of the Vale. Continue with your good work and then we may speak.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself.","Oh look, a talking lump of refuse.  How novel!"));
		end	
	elseif(eq.is_lost_dungeons_of_norrath_enabled()) then
		if(e.message:findi("trades")) then
			e.self:Say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [" .. eq.say_link("second book",false,"second book") .. "], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
			e.other:SummonItem(51121); -- Item: Tradeskill Basics : Volume I
		elseif(e.message:findi("second book")) then
			e.self:Say("Here is the second volume of the book you requested, may it serve you well!");
			e.other:SummonItem(51122); -- Item: Tradeskill Basics : Volume II
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18733})) then -- Hand in Warrior Recuitment Letter
		e.self:Say("Welcome to the Guardians of the Vale. I'm Roglio Bruth, and I run this proud little outfit. You seem to be of hearty stock, let's put you to work. Here's your guild tunic - hope it fits. Start your training right away.  Speak with the marshals of this guild.");
		e.other:Faction(263, 100,0); -- Gaurdians of the Vale
		e.other:Faction(286, 15,0); -- Mayor Gubbin
		e.other:Faction(355, 10,0); -- Storm Reapers
		e.other:Faction(292, 15,0); -- Merchants of Rivervale
		e.other:Faction(334,-15,0); -- Dreadguard Outer
		e.other:QuestReward(e.self,0,0,0,0,13540,20); -- Old Tan Tunic
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13931, item2 = 13931, item3 = 13931, item4 = 13931})) then -- Hand in Runnyeye Warbeads -- works regardless of faction for takp era
		e.self:Say("Good work, Deputy " .. e.other:GetCleanName() .. "! We shall soon rid our countryside of the goblin threat. Here are your wages. Eat well tonight!");
		e.other:Faction(263, 1,0); -- Gaurdians of the Vale
		e.other:Faction(286, 1,0); -- Mayor Gubbin
		e.other:Faction(355, 1,0); -- Storm Reapers
		e.other:Faction(292, 1,0); -- Merchants of Rivervale
		e.other:Faction(334,-1,0); -- Dreadguard Outer
		e.other:QuestReward(e.self,{silver = math.random(10),items = {13024,13023},exp = 5000}); -- Tanglefoot Tingle Drink, Bixie Berry Buns ; exp data confirmed
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- End of File, Zone:rivervale  NPC:19058 -- Sheriff_Roglio
