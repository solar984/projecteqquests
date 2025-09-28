-- items: 55268

function event_say(e)
	if(e.other:HasItem(40900)) then
		if(e.message:findi("hail")) then
			e.self:Say("Greetings! I see you have a fabulous Satchel of Abu-Kar in your possession. You are very lucky indeed to own such a wondrous item! I can however introduce to you a way to make it even better! Are you [interested]?");
		elseif(e.message:findi("interested")) then
			e.self:Say("By gathering some items from the recently discovered dungeons around Norrath, your satchel can be upgraded to hold more items and become even more efficient. Journey to the Adventurer's Camp in the East Commonlands and talk to Kayci Strahtin. Take this note to him. It details the very difficult process of upgrading your satchel. Do not worry however. You need no knowledge of how to upgrade it yourself. My friends will assist you if you can gather the appropriate components. Stop by again some time! Safe travels.");
			e.other:SummonItem(55268); -- Kizpi's Note
		end
	end
end
