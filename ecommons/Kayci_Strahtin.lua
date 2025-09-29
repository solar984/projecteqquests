function event_trade(e)
    local item_lib = require("items");

    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 55268})) then -- Kizpi's Note
		e.self:Say("Incessant fleas! Ever since I arrived in the Commonlands, they have plagued me! Oh, sorry. What's this? A note from Kizpi? Let me see. So the ol' bugger finally found a way to upgrade the Satchel of Abu-Kar, eh? It says here that you will need a Rujarkian Orc Hide. You are in luck, I just happen to have one that a previous adventure gave to me from his recent excursion to the Rujarkian Hills. You may have it. You will need some other items though. Kizpi didn't know about that?! His brain must be freezing out there in Everfrost!");
		e.self:Emote("makes some new notes. 'Take this note to Shelie Dikop at the Adventurer's Camp in North Ro. Tell her to come here and scare these fleas away with her ugly face!'");
		e.self:Emote("laughs. 'Perhaps that would be a bad idea. Just hand her this note when you find her. Good luck to you.'");
		e.self:Emote("begins to furiously scratch at the fleas behind his ears.");
		e.other:QuestReward(e.self,{items = {55269,55265}}) -- Kayci's Note, Rujarkian Orc Hide
    end
    item_lib.return_items(e.self, e.other, e.trade)
end