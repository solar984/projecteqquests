-- halas warrior noobie armor quests

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Are you a young warrior here for [training]? If not, I do not have time to chat.");
	elseif(e.message:findi("training")) then
		e.self:Say("Very good. With my instruction you will craft a set of [armor] that if crafted well, should serve you well for some time to come.");
	elseif(e.message:findi("armor")) then
		e.self:Say("I will give you instructions to make your first set of armor. Just keep in mind that I don't tolerate those that are lazy! Once you start something, you should always finish it! With that said, take this Northern Wolf Plate Assembly Kit. You will use it to create the various parts of your armor such as [helm], [bracers], [armplates], [boots], [legplates], [gauntlets], and [breastplate]. When you combine components in your kit, make sure they are un-stacked. Let me know what piece you wish to craft and I will give you instructions.");
		e.other:SummonItem(55095); -- Item: Northern Wolf Plate Assembly Kit
	elseif(e.message:findi("helm")) then
		e.self:Say("To craft your Helm of Northern Wolf, you will need two Small Pieces of Ore, one Gnoll Pup Scalp, and two Bone Chips. You should be able to find most of these items in Everfrost. The ore is most likely sold here in town. Once you have combined these items in your Assembly Kit, take the Helm of the Northern Wolf Material to a forge along with this mold to create your new helm.");
		e.other:SummonItem(55111); -- Item: Northern Wolf Helm Mold
	elseif(e.message:findi("bracers")) then
		e.self:Say("To craft your Bracers of the Northern Wolf, collect one small Piece of Ore, three Bone Chips, and one Polar Bear Skin. Once you have combined these items in your Assembly Kit, take the Bracers of the Northern Wolf Material to a forge along with this mold to create your new bracers.");
		e.other:SummonItem(55112); -- Item: Northern Wolf Bracer Mold
	elseif(e.message:findi("armplates")) then
		e.self:Say("You are doing well so far. Continue to work hard and you will accomplish much. To craft Armplates of the Northern Wolf, collect one Small Piece of Ore, two Ruined Wolf Pelts, one Bone Chip, and one Patch of Gnoll Fur. Once you have combined these items in your Assembly Kit, take the Armplates of the Northern Wolf Material to a forge along with this mold to create your new armplates.");
		e.other:SummonItem(55113); -- Item: Northern Wolf Armplate Mold
	elseif(e.message:findi("boots")) then
		e.self:Say("It is always wise to protect one's feet. To craft Boots of the Northern Wolf, you must find two Small Pieces of Ore, one Spiderling Legs, and one Polar Bear Skin. Once you have combined these items in your Assembly Kit, take the Boots of the Northern Wolf Material to a forge along with this mold to create your new boots.");
		e.other:SummonItem(55114); -- Item: Northern Wolf Boot Mold
	elseif(e.message:findi("legplates")) then
		e.self:Say("To craft your legplates you must find one Small Piece of Ore, two Ruined Wolf Pelts, one Bone Chip, and one Spiderling Leg. Once you have combined these items in your Assembly Kit, take the Legplates of the Northern Wolf Material to a forge along with this mold to create your new legplates.");
		e.other:SummonItem(55115); -- Item: Northern Wolf Legplate Mold
	elseif(e.message:findi("gauntlets")) then
		e.self:Say("To craft Gauntlets of the Northern Wolf, you must collect one Small Piece of Ore, four Bone Chips, and one Ruined Wolf Pelt. Once you have combined these items in your Assembly Kit, take the Gauntlets of the Northern Wolf Material to a forge along with this mold to create your new gauntlets.");
		e.other:SummonItem(55116); -- Item: Northern Wolf Gauntlets Mold
	elseif(e.message:findi("breastplate")) then
		e.self:Say("Probably the most important part of your armor is the Breastplate of the Northern Wolf. It shows your true dedication to our cause. This is perhaps the most difficult part of your armor that you will create. To construct your breastplate, you will need to find three Small Pieces of Ore, two Ruined Wolf Pelts, and one Spider Venom Sac. Once you have combined these items in your Assembly Kit, take the Breastplate of the Northern Wolf Material to a forge along with this mold to create your new breastplate. Once you have completed your breastplate, I have another [task] for you should you feel ready.");
		e.other:SummonItem(55117); -- Item: Northern Wolf Breastplate Mold
	elseif(e.message:findi("task")) then
		e.self:Say("Part of becoming an effective warrior is overcoming your fears. Travel to Blackburrow and find two Perfect Gnoll Skins and two Giant Snake Rattles. Return them to me and you shall be rewarded for your bravery.");
    end
end

function event_trade(e)
    local item_lib = require("items");

    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 27421, item2 = 27421, item3 = 13058, item4 = 13058})) then
        e.self:Say("I must say, I am impressed. You have passed your training and should now have a full set of armor to begin your adventures. Take this weapon as a symbol of your dedication and hard work. You have earned it. Your training with me has ended. Farewell.");
		e.other:Faction(320,1); -- Faction: Wolves of the North
		e.other:Faction(327,1); -- Faction: Shamen of Justice
		e.other:Faction(328,1); -- Faction: Merchants of Halas
		e.other:Faction(311,1); -- Faction: Steel Warriors
       e.other:QuestReward(e.self,{itemid = 55103, exp = 50}) -- Item: Sword of the Northern Wolf
    end
    item_lib.return_items(e.self, e.other, e.trade)
end

-- EOF zone: halas ID: 29078 NPC: Rollian_Galothar

