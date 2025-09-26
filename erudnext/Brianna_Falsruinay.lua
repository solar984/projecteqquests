function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Hello Traveler, I am afraid I don't recognize you to be a local around these parts although I could have been buried in my work. I have been quite busy since [Elisi] turned up missing.");
   elseif(e.message:findi("Elisi")) then
        e.self:Say("Elisi Nasin is a very well known enchanter and courier from Erudin. It is part of her trade to travel to Qeynos and share knowledge with the residents of the Order of Three. She often travels once or twice a month to deliver and pick up her most recent workings. However, she still has not returned from her most recent [travel]. We fear the worst for her; pirates have been rampant around these parts lately. We should send [someone to Qeynos] soon but have not had the time to do so.");
   elseif(e.message:findi("travel Qeynos")) then 
        e.self:Say("Your offer is quite gracious Tuppen, I do have a good feeling about you. If you wish to help us figure out what has happened to Elisi please travel to Qeynos. I believe the person she used to exchange magic with was named Jalorin. He is a member of the Order of Three so you should be able to find him there. Present him with this medal so that he may know you are sent from us. Please return to me if you should discover anything about Elisi's disappearance.");
		e.other:SummonItem(21971);  -- Tarnished Erudin Medal
   elseif(e.message:findi("willing to help")) then
        e.self:Say("Very well $name, please take this note to Jalorin. I would like him to provide us with some of Elisi's scrolls that she has brought him recently. If he can't provide you with the scrolls I have listed here then I believe he is withholding some information and we could alert the Qeynos council of Jalorin's possible involvement.");
		e.other:SummonItem(21969);  -- Note From Brianna
	end
end

function event_trade(e)
    local item_lib = require("items");

    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 21699})) then
         e.self:Say("Jalorin gave this to you? This is quite odd because this is not Elisi's handwriting and there is clearly something wrong. I really do think for some reason that Jalorin is involved so if you are [still willing to help] I would like you to help me find out if he is being truthful. I must warn you though, if Jalorin is in fact involved with her disappearance this could get dangerous.");
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 21970})) then
         e.self:Say("Oh yes something is extremely wrong. It is at least good news that you have disposed of Jalorin. I knew he had to be involved in this one way or another. This map appears to have some dull writing on it but I cannot make it out correctly. While you were gone, my husband reminded me that Elisi always wore her medallion given to her by her mother and her guards carried the finest blade ever presented to a Sentinel of Erudin. If you could find 3 of these guardian blades along with Elisi's medallion I believe that we could come to a conclusion on Elisi's whereabouts. The sad news is that if you should recover these items there is no doubt in my mind that she is dead because she would never give up her medallion willingly. Oh and here is the map you took from Jalorin, I have no use for it.");
		e.other:QuestReward(e.self,{itemid = 21970});  -- Faded Map of the Sea
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 21698, item2 = 21697, item3 = 21697, item4 = 21697})) then
         e.self:Say("This is a sad day indeed. Thank you for your valorous deeds, $name. Please accept this along with our gratitude for finding out what became of Elisi.");
		e.other:QuestReward(e.self,{itemid = 61001});  -- Runed Brooch of Erudin
    end
    item_lib.return_items(e.self, e.other, e.trade)
end