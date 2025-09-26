-- erudnext divine protectors armor

function event_say(e)
    if(e.message:findi("hail")) then
       e.self:Say("Hello, " .. e.other:GetCleanName() .. ", are you new to this house? I do not believe we have ever met before. Allow me to introduce myself, I am Alimaja Shanthun High Priest of Erudin. If you are a [cleric] I believe I might be able to help you.");
    elseif(e.message:findi("cleric")) then
       e.self:Say("This is great news, we have been awfully short on new talent lately and I am glad to see eager ones like yourself. All of our clerics must first go through a series of training exercises before they can truly be released into Norrath with our blessing. If you are [interested in crafting your own armor] that will result from these exercises I can get you started.");
    elseif(e.message:findi("interested")) then
       e.self:Say("Fantastic, " .. e.other:GetCleanName() .. ", please take this Assembly Kit. You will use this kit to assemble your armor materials but first there are many [various items] you will need to collect.");
        e.other:SummonItem(61092);  --  Divine Protectors Assembly Kit
    elseif(e.message:findi("various items")) then
       e.self:Say("The many items that you need to locate can be found out in the forest or here in town. When you are ready to attempt a specific piece please let me know what piece you wish to [craft] and I will give you the necessary mold along with the recipe. I have the recipe for Divine Protector [Helms], [Bracers], [Armguards], [Boots], [Greaves], [Gauntlets] and [Breastplates].");
    elseif(e.message:findi("helm")) then
       e.self:Say("To create your helm material you will need to combine 2 Bricks of Crude Bronze, 1 Rat Tooth, 1 Fire Beetle Eye and 1 Water Flask in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Divine Protector's Helm.");
        e.other:SummonItem(38911);  --  Mold for Erudian Helms
    elseif(e.message:findi("bracer")) then
       e.self:Say("To create your bracer material you will need to combine 1 Brick of Crude Bronze, 2 Snake Eggs, 1 Spiderling Leg and 1 Raw Bamboo in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Divine Protector's Bracer.");
        e.other:SummonItem(38907);  --  Mold for Erudian Wristguards
    elseif(e.message:findi("armguard")) then
       e.self:Say("To create your armguard material you will need to combine 2 Bricks of Crude Bronze, 2 Fish Scales, 1 Fire Beetle Leg and 1 Bottle in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Divine Protector's Armguards.");
        e.other:SummonItem(38908);  --  Mold for Erudian Sleeves
    elseif(e.message:findi("boot")) then
       e.self:Say("To create your boot material you will need to combine 3 Bricks of Crude Bronze, 1 Kobold Skull, 1 Rat Eye and 1 Short Ale in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Divine Protector's Boots.");
        e.other:SummonItem(38910);  --  Mold for Erudian Boots
    elseif(e.message:findi("greave")) then
       e.self:Say("To create your greaves material you will need to combine 4 Bricks of Crude Bronze, 2 Rat Teeth, 1 Kobold Head and 1 White Wine in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Divine Protector's Greaves.");
        e.other:SummonItem(38913);  --  Mold for Erudian Leggings
    elseif(e.message:findi("gauntlet")) then
       e.self:Say("To create your gauntlets material you will need to combine 3 Bricks of Crude Bronze, 1 Snake Bile, 1 Skunk Scent Gland and 1 Bottle of Kalish in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Divine Protector's Gauntlets.");
        e.other:SummonItem(38909);  --  Mold for Erudian Gloves
    elseif(e.message:findi("breastplate")) then
       e.self:Say("To create your breastplate material you will need to combine 5 Bricks of Crude Bronze, 1 Giant Wood Spider Thorax, 1 Spider Venom, 1 Large Briar Snake Skin, 1 Skeleton Tibia, 1 Skunk Tail in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Divine Protector's Breastplate. Return to me for one [final task] after you have completed your breastplate.");
        e.other:SummonItem(38912);  --  Mold for Erudian Chestplates
    elseif(e.message:findi("final task")) then
       e.self:Say("We have been seeking someone to carry a weapon that we wish to provide all new clerics with. I do not trust simply anyone to have the first one but you have shown to me that you are willing to assist our house. If you collect a few [specific things] I will present you with the magical staff that I speak of.");
    elseif(e.message:findi("specific things")) then
       e.self:Say("I seek 1 Twilight Bloom, 1 Poachers Head, 1 Plague Rat Tail and 1 Large Fire Beetle Sternite. Bring me these items as soon as possible.");
	end
end

function event_trade(e)
    local item_lib = require("items");

    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 63125, item2 = 13825, item3 = 9131, item4 = 19864})) then
		e.other:QuestReward(e.self,{itemid = 61097}) -- Staff of the Divine Protector
    end
    item_lib.return_items(e.self, e.other, e.trade)
end
