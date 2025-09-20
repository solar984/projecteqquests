function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I do not know what you are doing up here, but I am a busy man. Please return to the bar downstairs and enjoy the atmosphere.");
		eq.signal(5055,2) -- NPC: Beef
	elseif(e.message:findi("oblong bottle")) then
		e.self:Say("The oblong bottle is a legend. They say one drink and you're off to oblivion, but just before that you feel the best you've ever felt and relive all your finest memories in the blink of an eye. The last I heard, some guy by the name of Turgin Swillfod turned up in Freeport spouting that he had found it. He was never heard from again.");
	elseif(e.message:findi("never stop chopping")) then
		e.self:Say("Hey!! You must be the one I traded my axe to. Funny.. I thought you were much shorter. If you have my axe I will return your gem to you. Well..? Let's have it!");		
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("The boss might need some help!");
		local stanos = eq.get_entity_list():GetMobByNpcTypeID(5088); -- Stanos_Herkanor
		if ( stanos.valid ) then
			e.self:MoveTo(stanos:GetX(), stanos:GetY(), stanos:GetZ(), -1, false);
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12366})) then -- Never Stop Chopping
		e.self:Say("On second thought.. You can do a little favor for me first. An associate of mine has asked me to acquire a case of spirits for him. Take this box and seek out what is needed to fill it. Inside you will combine the spirits of Lendel's Grand Lager, Gator Gulp Ale, Blackburrow Swig, Tunare's Finest, Underfoot Triple Bock, Frozen Toe Rum, Blood Spirit, Vasty Deep Ale, Clockwork Oil Stout and the legendary..[Oblong Bottle].");
		-- Confirmed Live Factions
		e.other:Faction(336,10); -- Coalition of Tradefolk Underground
		e.other:Faction(229,10); -- Coalition of Tradefolk
		e.other:Faction(329,1); -- Carson McCabe
		e.other:Faction(230,1); -- Corrupt Qeynos Guards
		e.other:Faction(330,1); -- The Freeport Militia
		e.other:QuestReward(e.self,{itemid = 17984, exp = 15000}); -- Bottle Crate
		eq.signal(5055,3) -- NPC: Beef
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12365})) then
		e.self:Say("I cannot believe you actually acquired all those drinks!! You do good work, kid. Here is the gem as I promised. And a few plat for good measure. Don't let it be said that the Axe doesn't treat his friends right.");
		e.other:Faction(336,25); -- Coalition of Tradefolk Underground
		e.other:Faction(229,25); -- Coalition of Tradefolk
		e.other:Faction(329,2); -- Carson McCabe
		e.other:Faction(230,1); -- Corrupt Qeynos Guards
		e.other:Faction(330,3); -- The Freeport Militia
		e.other:QuestReward(e.self,{platinum = math.random(10), itemid = 12348, exp = 15000}); -- Item: Gem of Stamina
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
