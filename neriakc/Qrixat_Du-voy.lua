function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What do you want?");
	elseif (e.message:findi("summons")) then
		e.self:Say("You have performed admirably in the past, so I shall overlook your tardiness responding to my call. One of our own has heeded the call of Solusek Ro over that of Innoruuk and is conspiring with that other traitorous cur, Opal Dark Briar. The wizard Salarz is a Teir'Dal now in the hands of the Knights of Marr in Freeport, but we have good information connecting him with the Dismal Rage and the Temple of Solusek Ro in a plot to create a phylactery. Somehow, this is connected to the news you brought from Befallen about the resurrection of Marnek. One who might know the answer is the oracle in the Ocean of Tears. Seek him out and learn what is required to create a phylactery so that we will remain one step ahead of any others. Go now and take this letter for the oracle with you!");
		e.other:SummonItem(55274);
	end
end

