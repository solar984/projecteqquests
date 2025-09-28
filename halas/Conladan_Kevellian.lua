-- Halas rogue quest armor

function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("The Order of the White Rose welcomes you, young rogue. Have you come to begin your [training]?");
    elseif(e.message:findi("training")) then
         e.self:Say("I recommend that all starting rogues complete my training and craft a set of [armor] to help them in their perilous adventures that lie ahead.");
    elseif(e.message:findi("Mammoth Hide Parchment")) then
        e.self:Say("Here you go.");
       e.other:SummonItem(12621); -- Mammoth Hide Parchment
    elseif(e.message:findi("armor")) then
         e.self:Say("It is a set of armor worn only by the White Rose rogues of Halas. It will serve you well for a good period of time in your beginning adventures. Take this White Rose Assembly Kit. You will use it to craft the various pieces of your White Rose armor. When you combine components in your kit, make sure they are un-stacked. Simply tell me what piece you would like to craft first, and I will give you instructions. The different pieces are [cap], [bracers], [sleeves], [boots], [leggings], [gloves], and [tunic].");
       e.other:SummonItem(55163); -- White Rose Assembly Kit
    elseif(e.message:findi("cap")) then
         e.self:Say("A cap is a good choice to start with. Once created, it will provide you with protection and serve to conceal your face from local authorities if that need arises. To craft your Cap of the White Rose, you will need two Spiderling Silks, two Bone Chips, and one Gnoll Pup Scalp. You should be able to find these items by hunting in Everfrost. Once you have combined these items in your Assembly Kit, take the White Rose Cap Material to a loom along with this pattern to create your new cap.");
       e.other:SummonItem(55156); -- White Rose Cap Pattern
    elseif(e.message:findi("bracers")) then
         e.self:Say("Look for the following items in Everfrost to create a Bracer of the White Rose: one Polar Bear Skin, two Spiderling Legs, and three Bone Chips. Once you have combined these items in your Assembly Kit, take the White Rose Bracer Material to a loom along with this pattern to create your new bracer.");
       e.other:SummonItem(55157); -- White Rose Bracer Pattern
    elseif(e.message:findi("sleeves")) then
         e.self:Say("If Sleeves of the White Rose are what you wish to craft, you will need to collect two Spiderling Silks, two Spiderling Legs, and one Ruined Wolf Pelt. Once you have combined these items in your Assembly Kit, take the White Rose Sleeves Material to a loom along with this pattern to create your new sleeves.");
       e.other:SummonItem(55158); -- White Rose Sleeves Pattern
    elseif(e.message:findi("boots")) then
         e.self:Say("Boots of the White Rose will serve you well in the harsh tundra. You cannot make a very fast escape from danger with feet that have suffered frostbite, now can ya?! To create your boots, venture into Everfrost and collect two Spiderling Legs, two Ruined Wolf Pelts, and one Bone Chip. Once you have combined these items in your Assembly Kit, take the White Rose Boots Material to a loom along with this pattern to create your new boots.");
       e.other:SummonItem(55159); -- White Rose Boots Pattern
    elseif(e.message:findi("leggings")) then
         e.self:Say("Leggings of the White Rose are a bit more complex to craft than some of the other pieces of your armor. However if you feel you are ready for this task, go to Everfrost and collect one Patch of Gnoll Fur, one Spider Venom Sack, one Goblin Ice Necklace, and two Ruined Wolf Pelts. Once you have combined these items in your Assembly Kit, take the White Rose Leggings Material to a loom along with this pattern to create your new leggings.");
       e.other:SummonItem(55160); -- White Rose Leggings Pattern
    elseif(e.message:findi("gloves")) then
         e.self:Say("Gloves of the White Rose are a very important part of your armor. These special gloves will protect your hands, yet at the same time be flexible enough for you to pick even the most delicate of locks. To create your gloves, go to Everfrost and collect four Spiderling Silks, one Bone Chip, and one Ruined Wolf Pelt. Once you have combined these items in your Assembly Kit, take the White Rose Gloves Material to a loom along with this pattern and create your new gloves.");
       e.other:SummonItem(55161); -- White Rose Gloves Pattern
    elseif(e.message:findi("tunic")) then
         e.self:Say("The most important part of your White Rose Armor ensemble; the Tunic of the White Rose. This very important part of your armor can be assembled by collecting one Ruined Wolf Pelt, three Patches of Gnoll Fur, one Spiderling Silk, and one Perfect Gnoll Skin. You might have to journey to Blackburrow to find the gnoll skin. Once you have combined these items in your Assembly Kit, take the White Rose Tunic Material to a loom along with this pattern and create your new tunic. Once you have completed your tunic, I have another [job] for you if you are looking for adventure.");
       e.other:SummonItem(55162); -- White Rose Tunic Pattern
    elseif(e.message:findi("job")) then
         e.self:Say("The Gnolls of Blackburrow have long been a thorn in our side. If you could venture to Blackburrow and kill some of these gnolls and then bring me [proof] of your victory, I could part with a nice dagger I have.");
    elseif(e.message:findi("proof")) then
         e.self:Say("Bring me one Gnoll Ulna, one Gnoll Pelvis, one Severed Gnoll Foot, and one High Quality Gnoll Fur. Do so and you shall be rewarded. Good luck to you, " .. e.other:GetCleanName() .. ".");
    end
end

function event_trade(e)
    local item_lib = require("items");

    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20181, item2 = 27424, item3 = 27409, item4 = 27427})) then
		e.self:Say("I must say, " .. e.other:GetCleanName() .. ", I am impressed. You have passed your training and should now have a full set of armor to begin your adventures. Take this weapon as a symbol of your dedication and hard work. You have earned it. Your training with me has ended. Farewell.");
		e.other:Faction(305,10); -- Rogues of the White Rose
		e.other:QuestReward(e.self,{itemid = 55148, exp = 50}); -- Dagger of the White Rose
    end
    item_lib.return_items(e.self, e.other, e.trade)
end

