function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the holy Temple of Life. Your presence shows an interest in our ways. We are the followers of the [Prime Healer] and would gladly open our arms to any who [serve Rodcet Nife]. Do we not all owe our lives to the sustaining force of the Prime Healer?");
	elseif(e.message:findi("serve the prime healer") or e.message:findi("serve rodcet nife")) then
		if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= -100) then
			e.self:Say("Then you are commanded by the Prime Healer to go into the surrounding terrirories of Qeynos and destroy any rabid creatures you may encounter. There will not be an outbreak of disease within reach of the Temple of Life, see to it! Bring me pelts of any rabid beast as proof of your good deed.");
		else
			e.self:Say("Your mere presence disgusts me. Please remove yourself from my sight. Until you change yourself and your ways, you are unwelcome in the Temple of Life.");
		end
	elseif(e.message:findi("fleshy orb")) then
		e.self:Say("I do not know what you are talking about.  Let me see it.");
	elseif(e.message:findi("prime healer") or e.message:findi("rodcet nife")) then
		e.self:Say("The Prime Healer is Rodcet Nife. The one whose power flows through your body. He is the air that you breathe. To serve Him is to serve every living creature. Do you wish to [serve the Prime Healer] or do you [need more time for contemplation]?");
	elseif(e.message:findi("bertoxxulous") or e.message:findi("plaguebringer")) then
		e.self:Say("You speak the name of the Lord of Disease.  The Plaguebringer.  Dinithn'al.  [Bertoxxulous], the evil one.  It is he who has brought disease unto this world and it is he whom we oppose.  We will not allow him or his followers to taint the beauty of life.");
	elseif(e.message:findi("heal")) then
		e.self:Say("I cannot help you with your request.   You must speak with Brother Tonmerk Plorsin.");
	elseif(e.message:findi("contemplation")) then
		e.self:Say("I understand. Sometimes a person can be filled with the lies of so many other false deities that he cannot see the truth when it lies in front of him.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= -100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13949})) then
		e.self:Say("I see you have rid our land of a beast tainted with the blood of Bertoxxulous. The Prime Healer shall look favorably upon your soul. Here is our thanks and just in case the beast may have bitten you...");
		e.self:CastSpell(96,e.other:GetID()); -- Spell: Counteract Disease
		-- Confirmed Live Factions and exp data
		e.other:Faction(341,5);  -- Priests of Life
		e.other:Faction(280,1);  -- Knights of Thunder
		e.other:Faction(262,2);  -- Guards of Qeynos
		e.other:Faction(221,-1); -- Bloodsabers
		e.other:Faction(219,1);    -- Antonius Bayle
		e.other:QuestReward(e.self,{exp = 4250});
	elseif(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= -100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13298})) then
		e.self:Say("Oh dear. The disease has spread to the realm of the Treefolk. It must have been difficult to kill such a large and rabid beast. Here. Take one of my personal scrolls as thanks for such a brave act of devotion. I pray you can use it. If not, then perhaps one of your fellow adventurers can.");
		e.self:CastSpell(96,e.other:GetID()); -- Spell: Counteract Disease
		-- Confirmed Live Factions and exp data
		e.other:Faction(341,20);  -- Priests of Life
		e.other:Faction(280,6);  -- Knights of Thunder
		e.other:Faction(262,10);  -- Guards of Qeynos
		e.other:Faction(221,-5); -- Bloodsabers
		e.other:Faction(219,3);    -- Antonius Bayle
		e.other:QuestReward(e.self,{gold = math.random(10), platinum = 1, itemid = 15226, exp = 35350}); -- Item: Spell: Endure Disease
	elseif(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= -100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13950})) then
		e.self:Say("This is odd. This could explain the increase in the number of beasts within the lands surrounding Qeynos. You must take this to Freeport. Here. You must speak with Lorme Tredore. Show him this pellet. You had best gear up for the trip. Freeport is very far away. Here is some gold. Outfit yourself at our expense.");
		-- Confirmed Live Factions and exp data
		e.other:Faction(341,10);  -- Priests of Life
		e.other:Faction(280,3);  -- Knights of Thunder
		e.other:Faction(262,5);  -- Guards of Qeynos
		e.other:Faction(221,-2); -- Bloodsabers
		e.other:Faction(219,1);    -- Antonius Bayle
		e.other:QuestReward(e.self,{gold = math.random(20), platinum = 1, itemid = 13951, exp = 6350}); -- Item: Fleshy Orb
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
