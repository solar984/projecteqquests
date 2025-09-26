-- erudnext deepwater knight armor

function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Good day, " .. e.other:GetCleanName() .. ", is there something I can help you with? I am currently training young paladins the way of our house so if you are a [paladin] perhaps we can start you off on the right path.");
	elseif(e.message:findi("paladin")) then
		e.self:Say("All right then " .. e.other:GetCleanName() .. ", lets see what you got. When you are ready to begin I will send you into the field to collect [various items].");
	elseif(e.message:findi("various items")) then
		e.self:Say("There are numerous items that you will need to collect and combine in your kit. I will present you with the recipe for Sentinel [Helms], [Bracers], [Armguards], [Boots], [Greaves], [Gauntlets] and [Breastplates]. When you are ready to attempt a specific piece please let me know what piece you wish to [craft] and I will give you the necessary mold along with the recipe.");
		e.other:SummonItem(61093); -- Sentinels Assembly Kit
	elseif(e.message:findi("helm")) then
		e.self:Say("To create your helm material you will need to combine 2 Bricks of Crude Bronze, 1 Fire Beetle Leg, 1 Spider Silk and 1 Short Ale in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Sentinel's Helm.");
		e.other:SummonItem(38911); -- Mold for Erudian Helms
	elseif(e.message:findi("bracer")) then
		e.self:Say("To create your bracer material you will need to combine 1 Brick of Crude Bronze, 2 Rat Whiskers, 1 Snake Scales and 1 Ration in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Sentinel's Bracer.");
		e.other:SummonItem(38907); -- Mold for Erudian Wristguards
	elseif(e.message:findi("armguard")) then
		e.self:Say("To create your armguard material you will need to combine 2 Bricks of Crude Bronze, 1 Snake Fang, 1 Bone Chip and 1 Mead in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Sentinel's Armguards.");
		e.other:SummonItem(38908); -- Mold for Erudian Sleeves
	elseif(e.message:findi("boot")) then
		e.self:Say("To create your boot material you will need to combine 3 Bricks of Crude Bronze, 1 Rat Ear, 1 Fresh Fish and 1 Bandage in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Sentinel's Boots.");
		e.other:SummonItem(38910); -- Mold for Erudian Boots
	elseif(e.message:findi("greave")) then
		e.self:Say("To create your greaves material you will need to combine 4 Bricks of Crude Bronze, 2 Fire Beetle Legs, 1 Kobold Head and 1 Bottle in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Sentinel's Greaves.");
		e.other:SummonItem(38913); -- Mold for Erudian Leggings
	elseif(e.message:findi("gauntlet")) then
		e.self:Say("To create your gauntlets material you will need to combine 3 Bricks of Crude Bronze, 1 Skunk Tail, 1 Snake Venom Sac and 2 Bat Wings in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Sentinel's Gauntlets.");
		e.other:SummonItem(38909); -- Mold for Erudian Gloves
	elseif(e.message:findi("breastplate")) then
		e.self:Say("To create your breastplate material you will need to combine 5 Bricks of Crude Bronze, 1 Skunk Eye, 1 Large Briar Snake Skin, 1 Snake Fang, 1 Skeleton Tibia, and 1 Snake Bile in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Sentinel's Breastplate. Return to me for one [final favor] I have to ask of you after you have completed your breastplate.");
		e.other:SummonItem(38912); -- Mold for Erudian Chestplates
	elseif(e.message:findi("final favor")) then
		e.self:Say("Well you see we have been having quite a problem with poachers benefiting off of our wildlife and I think as Paladins it is our duty to see that it does not continue. If you would like to help I will have you collect some [specific items] along with the head of a poacher.");
	elseif(e.message:findi("specific items")) then
		e.self:Say("Return to me with 1 Large Briar Snake Skin, 1 Giant Wood Spider Thorax, 1 Plague Rat Tail and 1 Poachers Head to claim your reward.");
    end
end

function event_trade(e)
    local item_lib = require("items");

    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20355, item2 = 19660, item3 = 9131, item4 = 13825})) then
		e.other:QuestReward(e.self,{itemid = 61098}); -- Sentinels Claymore
    end
    item_lib.return_items(e.self, e.other, e.trade)
end

