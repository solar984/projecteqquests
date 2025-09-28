-- Halas shaman quest armor

function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Hello, " .. e.other:GetCleanName() .. " is it? Have you come to begin some [training]?");
   elseif(e.message:findi("training")) then
       e.self:Say("I can provide you with instructions on how to create a set of beginning [armor], fit for any Shaman of Justice.");
   elseif(e.message:findi("armor")) then
       e.self:Say("During your travels you will no doubt run into danger. It is best to have a sturdy set of armor to protect yourself. Take this Justice Plate Assembly Kit. You will use it to create the various parts of your armor such as [helm], [bracers], [armplates], [boots], [legplates], [gauntlets], and [breastplate]. When you combine components in your kit, make sure they are un-stacked. Let me know what piece you wish to craft and I will give you instruction.");
       e.other:SummonItem(55118); -- Justice Plate Assembly Kit
   elseif(e.message:findi("helm")) then
       e.self:Say("'A helm is it? That is a fairly easy piece to start with. To craft your Helm of Justice, you will need two Small Pieces of Ore, one Gnoll Pup Scalp, and two Bone Chips. You should be able to find most of these items in Everfrost. The ore is most likely sold here in town. Once you have combined these items in your Assembly Kit, take the Helm of Justice Material to a forge along with this mold to create your new helm.");
       e.other:SummonItem(55134); -- Helm of Justice Mold
   elseif(e.message:findi("bracers")) then
       e.self:Say("To craft a Bracer of Justice, collect one Small Piece of Ore, three Bone Chips, and one Ruined Wolf Pelt. Once you have combined these items in your Assembly Kit, take the Bracers of Justice Material to a forge along with this mold to create your new bracers.");
       e.other:SummonItem(55136); -- Bracer of Justice Mold
   elseif(e.message:findi("armplates")) then
       e.self:Say("To craft Armplates of Justice, collect two Small Pieces of Ore, two Polar Bear Skins, and one Patch of Gnoll Fur. Once you have combined these items in your Assembly Kit, take the Armplates of Justice Material to a forge along with this mold to create your new armplates.");
       e.other:SummonItem(55135); -- Armplates of Justice Mold
   elseif(e.message:findi("boots")) then
       e.self:Say("To craft Boots of Justice you must find two Small Pieces of Ore, one Spiderling Legs, and one Polar Bear Skin. Once you have combined these items in your Assembly Kit, take the Boots of Justice Material to a forge along with this mold to create your new boots.");
       e.other:SummonItem(55138); -- Boots of Justice Mold
   elseif(e.message:findi("legplates")) then
       e.self:Say("Legplates of Justice offer great protection to one who is just starting their adventuring career. To craft your legplates you must find one Small Piece of Ore, two Polar Bear Skins, and two Bone Chips. Once you have combined these items in your Assembly Kit, take the Legplates of Justice Material to a forge along with this mold to create your new legplates.");
       e.other:SummonItem(55139); -- Legplates of Justice Mold
   elseif(e.message:findi("gauntlets")) then
       e.self:Say("To craft Gauntlets of Justice, you must collect one Small Piece of Ore, four Bone Chips, and one Polar Bear Skin. Once you have combined these items in your Assembly Kit, take the Gauntlets of Justice Material to a forge along with this mold to create your new gauntlets.");
       e.other:SummonItem(55137); -- Gauntlets of Justice Mold
   elseif(e.message:findi("breastplate")) then
       e.self:Say("The Breastplate of Justice is perhaps the most difficult piece that you will have to construct. To construct your breastplate, you will need to find three Small Pieces of Ore, two Polar Bear Skins, and one Spider Venom Sac. Once you have combined these items in your Assembly Kit, take this Breastplate of Justice Material to a forge along with this mold to create your new breastplate. Once you have completed your breastplate, I have another [task] for you should you feel ready.");
       e.other:SummonItem(55140); -- Breastplate of Justice Mold
   elseif(e.message:findi("task")) then
       e.self:Say("Prove to me that you are ready to move on and continue your training elsewhere. In Everfrost there are many dangers. One danger are the Snow Orc Troopers. Find four Wrath Orc Wristbands from the Snow Orcs in Everfrost and hand them to me. Do so and I will reward you and your training with me will be complete. May The Tribunal watch over you, " .. e.other:GetCleanName() .. ".");
    end
end

function event_trade(e)
    local item_lib = require("items");

    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12223, item2 = 12223, item3 = 12223, item4 = 12223})) then
		e.self:Say("You have done well and learned much during your training. You have made me proud, " .. e.other:GetCleanName() .. ". Take this weapon as a symbol of your dedication and hard work. You have earned it. Your training with me has ended. Farewell.");
        e.other:Faction(327,10); -- shamen of justice
        e.other:Faction(328,1); -- merchants of halas
        e.other:Faction(223,-1); -- circle of unseen hands
        e.other:Faction(336,-1); -- coalition of tradefolk underground
        e.other:Faction(244,-2); -- ebon mask
		e.other:QuestReward(e.self,{itemid = 55126, exp = 50})  -- Cudgel of Justice
    end
    item_lib.return_items(e.self, e.other, e.trade)
end
