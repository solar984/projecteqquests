-- Bregna , Neriaka, 40012
-- Bregna's Big Mistake
-- Need ending statement, mine sucks
-- Need factions
-- Changed to accommodate the Aid Garuuk/Hoop of the Traveler quest -Kilelen, 4/19/2007
-- items: 18651, 77522, 12212, 26662, 29921, 26640, 26632, 28740

function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Me says hi to you. What you want from me? Oh!! Me shaman trainer. You must be shaman. Are you [shaman Darkone]?");
    elseif(e.message:findi("shaman darkone")) then
		e.self:Say("You choose rite if you bes a shaman. We's da best. You remember ta not get in Kaglari way. She get mad berry easy. She gets berry mad at Bregna if she finds out me make [big mistake].");
    elseif(e.message:findi("big mistake")) then
		e.self:Say("Kaglari make me do the tasks for her. She tolds me to take crate of speshal poshuns to sumwun in Nektoolos forust. But I make mistake. I fall asleep under da trees becuz I was so tired. I wake up and poshuns are gone! Sumwun take the poshuns frum me. Dey leave dis note wit me. Me tinks dey play trick on me. Me tinks it be da stinkin' Halflings. Me needs ta gets dem back before Kaglari find out. I need sumwun to help me find da poshuns.");
		e.other:SummonItem(18651); -- Item: Note to the Troll
    end
end

function event_trade(e)
    local item_lib = require("items");

    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 77522})) then
		e.self:Say("Phew! Me are safe from Kaglari's beating. Dank yoo, " .. e.other:GetCleanName() .. ".  Take dis."); -- Text made up, I have no reference.
		e.other:QuestReward(e.self,{itemid = 12212}); --  Item: Kaglari Mana Doll
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 26662, item2 = 29921, item3 = 26640, item4 = 26632})) then -- Swirling Banshee Essence, Arachnae Fangs, A Wrulon Claw, A Blood Raven Tailfeather
		e.self:Say("Me been waitin for doze. Dank yoo, " .. e.other:GetCleanName() .. ".  Take dis.");
		e.other:QuestReward(e.self,{itemid = 28740}); -- Item: Troll Receipt
    end
    item_lib.return_items(e.self, e.other, e.trade)
end