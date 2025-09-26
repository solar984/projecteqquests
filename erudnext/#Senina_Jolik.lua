
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Hello, stranger, welcome to Erudin. I would invite you to browse my store, but alas my latest supply shipment has not come in. I am very worried. Perhaps if you have the time, you could [assist] me with this predicament?");
    elseif(e.message:findi("assist")) then
        e.self:Say("You would really help me, a complete stranger? You are kind. If you could help me I would certainly reward your noble efforts! But I am getting ahead of myself. A shipment of very valuable supplies was supposed to be here a week ago. However, they have not arrived and I fear the worst. If you can, please go to the Port Authority here in Erudin and talk to Jordin Sretin. He handles the paperwork for all ships coming and leaving the city. I must wait here for my father to return. He went to Qeynos to check if they have seen the ship. Please ask him if he has seen the ship, The Light's Glory.");
    end
end
  
function event_trade(e)
    local item_lib = require("items");

    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 55004})) then
        e.self:Say("I cannot believe you did it. My father and I thank you for helping to find our missing goods. They are a bit wet but I think they are mostly salvageable. My father gave this to me long ago, but I want you to have it for your bravery. Stop by anytime and say hi!");
        e.other:QuestReward(e.self,{itemid = 55028}) -- Fluorite Stone Earring
    end
    item_lib.return_items(e.self, e.other, e.trade)
end
