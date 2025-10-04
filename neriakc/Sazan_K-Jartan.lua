function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("glances at you from the corner of his eye. 'You'd better speak more swiftly than my blades or you won't walk out of here " .. e.other:GetCleanName() .. ".");
    elseif(e.message:findi("potent poison")) then
        e.self:Say("It is a bubbling concoction that can be quite dangerous to make for those with less than skilled hands. I will make this poison for you. However, I will need you to gather the [necessary materials].");
    elseif(e.message:findi("necessary material")) then
        e.self:Say("Well, first off, we will need one dose of Mage's Bane which I just happen to have here. However, I will also need a dose of Susceptible Essence, a dose of Mind Melt and two [special ingredients]. When you have collected these poisons use this mortar to combine them and then hand me the result. Now you must be careful as this mortar is very fragile. If you happen to break it just tell me you need another and I will give you a new one.");
        e.other:SummonItem(67002); -- Slime Coated Mortar and Pestle
    elseif(e.message:findi("special ingredient")) then
        e.self:Say("There is an associate of mine who can be found in a place known as the cauldron. Show him this note and he should be able to point you in the right direction. Be wary, retrieving these two ingredients will not be easy. Keep in mind that my friend will not talk to you unless you have some proof from me. If you lose this note come on back, let me know and I will write another for you.");
      	e.other:SummonItem(67003);
	end
end

function event_trade(e)
    local item_lib = require("items");

    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 67007})) then
        e.self:Emote("takes the materials from you. Sniffing the sickly smell coming from the container, he nods and grabs a small vial from a pouch on his belt. He begins to mix the vial into the jar gently as beads of sweat begin to form on his forehead. Then, he smiles in triumph.");
        e.self:Say("I did it! I didn't think I would be able to but here I stand triumphant. I got the recipe from an associate of mine named Tisumie, beautiful lass, deadly with a blade. It took a fortune to get that recipe from her but it will be well worth it if we can accomplish our goal. Well now, all that remains is the delivery. Take this to Ryoz and he will give you further instructions. It will kill any Froglok in Norrath. That I guarantee!");
        e.other:QuestReward(e.self,{itemid = 67001}) -- Vial of Froglok's Bane
    end
    item_lib.return_items(e.self, e.other, e.trade)
end