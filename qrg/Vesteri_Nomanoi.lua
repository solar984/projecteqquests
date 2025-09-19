function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. ". I am Vesteri Namanoi. I provide training to the Jaggedpine Treefolk and their allies. If you are not busy, I would like to ask a small [favor] of you.");
	elseif(e.message:findi("favor")) then
		if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 100) then -- not verified as exact, tested at 0 faction and wasn't high enough
			e.self:Say("I need you to take this claim check to Qeynos for me. Nesiff Talaherd is a woodcarver who owns a shop in South Qeynos. I am having him carve a small statue of Tunare for Te'Anara. With my training schedule, I can not make the journey to Qeynos. Please give this claim check to Nesiff and bring the statue to me. It is a surprise, so please do not say anything to Te'Anara about it.");
			e.other:SummonItem(18012); -- Item: Claim Check
		elseif(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 0) then
			e.self:Say("We, the Jaggedpine Treefolk, appreciate the help you've given us in the past. But, we must trust you more before allowing you to handle such important matters.");		
		else
			e.self:Say("You are an enemy of the Jaggedpine Treefolk, this forest, and the residents of it. Begone, before I am forced to take drastic measures!");		
		end
	end
end

function event_trade(e)
	local item_lib =require("items");

	if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13864})) then
		e.self:Say("Oh thank you so much! Here. Take this reward for your time. I will also tell Te'Anara of you.");
		e.other:Faction(272, 5); --Jaggedpine Treefolk
		e.other:Faction(302, 1); --Protectors of Pine
		e.other:Faction(343, 1); --QRG Protected Animals
		e.other:Faction(324, -1); --Unkempt Druids
		e.other:Faction(262, 1);   --Guards of Qeynos
		e.other:QuestReward(e.self,{copper = math.random(10), silver = math.random(5), exp = 250});
	end
	item_lib.return_items(e.self, e.other, e.trade)
end