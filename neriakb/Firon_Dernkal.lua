-- Firon_Dernkal.pl
-- Charm of the Brotherhood

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well met $name. What exactly is it I can do for you? You must excuse me if there are no pressing matters, I have a very important [lieutenant] to track down. He has been missing for quite some time now.");
	elseif(e.message:findi("lieutenant")) then
		e.self:Say("Ah yes of course the one I speak of is none other than Gerod Yalronsan, he is one of the finest warriors to ever serve the brotherhood. He was recently promoted to official courier of the brotherhood. He has most recently been tasked with the responsibility to take documents to and from Mistmoore. Most notably our battle strategies that are very dangerous if they end up in the wrong hands. I do not know what has become of him and I have grown worried. Would you be [willing to help me locate Gerod].");
	elseif(e.message:findi("willing to help you locate Gerod")) then
		e.self:Say("Very well then. Allow me to gather my thoughts about what he was to pick up and drop off this trip. Ah yes of course, he was to report to Eirod Haerod with our latest plans for the attack on Kelethin with the help of Clan Crushbone. If you wished to find his whereabouts visiting her would probably be a good place to start. Bring this symbol, so that she will know we have sent you.");
		e.other:SummonItem(21972); -- Symbol of the Brotherhood
	elseif(e.message:findi("keepsake")) then
		e.self:Say("Well those would be his be his war medals of course. He was presented with a 4 of them for his service to the Brotherhood. I sure hope you do not find them because if you do, he is surely dead. I hope to hear good news from you soon Vatglut. Please return to me should you find his medallions so I can bring the news to the brotherhood.");
	end
end

function event_trade(e)
    local item_lib = require("items");

    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 21974})) then -- Sealed War Documents
		e.self:Say("It is good to see you back $name. I am glad that you could turn up some information on Gerod. Now let me have a look at these. There seems to be some kind of an encrypted message in these documents and it appears to be written by Gerod. I cannot make it out completely but I believe it says something about a Rok. Please take this to whomever you can to try and make some sense of Gerods scribbling. As always, if you find anything that might belong to Gerod please return it to me. I do know of one specific [keepsake] he carries.");
		e.other:QuestReward(e.self,{itemid = 21974});-- Sealed War Documents...he hands them right back, to no purpose currently known.
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 21975, item2 = 21976, item3 = 21977, item4 = 21978})) then -- Bronze Medallion of Service, Silver Medallion of Service, Golden Medallion of Service, Platinum Medallion of Service
		e.self:Say("This is terrible news most definitely. I do not know how this could have happened. Gerod was one of the most skilled weapon masters that the Brotherhood has ever seen. I do certainly appreciate your work and dedication to this matter, please take this charm as a token of my appreciation.");
		e.other:QuestReward(e.self,{itemid = 61002});-- Charm of the Brotherhood
    end
    item_lib.return_items(e.self, e.other, e.trade)
end
