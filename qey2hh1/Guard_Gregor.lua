function event_say(e)
	if(e.other:GetLevel() >= 20 and e.other:GetLevel() <= 30 and eq.is_omens_of_war_enabled()) then
		if(e.message:findi("hail")) then
			e.self:Say("Oh, hello " .. e.other:GetCleanName() .. ". Would you like to assist me in a [task]?");
		elseif(e.message:findi("task")) then
			e.self:Say("Excellent! I was hoping you would be able to help me.");
			eq.task_selector({500143}); -- Task: Bringing Goods to the Karanas
		end
	else
		e.self:Say("Sorry, " .. e.other:GetCleanName() .. ". I am quite busy...");
	end
end
