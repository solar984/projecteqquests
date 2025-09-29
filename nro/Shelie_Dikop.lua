function event_trade(e)
    local item_lib = require("items");

    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 55269})) then -- Kayci's Note
		e.self:Say("Dis note covered in cat hair! Oh, Kayci give to you. Make sense now. You want upgrade your satchel? You need a Stone Frog Skin from Takish'Hiz. I have one. I guess I don't need it anymore. You can have. You need other things though if you want upgrade bag.");
		e.self:Emote("begins to scribble something on the note you gave to her. 'Take this note to Jilsuia Lluarea in Butcherblock camp. Mebbe she have another item you need to upgrade bag. Bye bye.");
		e.other:QuestReward(e.self,{items = {55270,55266}}) -- Shelie's Note, Stone Frog Skin
    end
    item_lib.return_items(e.self, e.other, e.trade)
end