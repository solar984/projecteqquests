function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Hm, I don't recognize you, but perhaps you are one that has come to help me exact [revenge]?");
    elseif(e.message:findi("revenge")) then
        e.self:Say("Yes, yes! Revenge is what I yearn. I want blood, amphibious blood, in the name of my brother who was killed many moons ago a [slimy swamp dweller]");
    elseif(e.message:findi("slimy swamp dweller")) then
        e.self:Say("You imbecile! Can you not tell by my words that he was killed by the webbed hands of a [froglok!]");
    elseif(e.message:findi("froglok")) then
        e.self:Say("The froglok I want to see dead is Dar Strategist Guib, a cherished froglok in that old troll city. He was in an elite troop of frogloks patrolling the Deserts of Ro during the invasion of Grobb. My brother was part of a small unit of Teir'dal tasked with assessing the capabilities of the Guktans for our king and queen. This Guktan discovered my brother's unit and attacked them. Most fled, but my brother was left behind to die. I need to exact my revenge, and I need to [assassinate] this foul froglok.");
    elseif(e.message:findi("assassinate")) then
        e.self:Say("I don't know. Perhaps you should speak to someone who does things like that for a living, like one of our local assassins. Come back and see me when you have found a way to kill it. Now quit pestering me before I grow angry!");
    end
end

function event_trade(e)
    local item_lib = require("items");

    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 67001}, 0)) then
        e.self:Say("You've done it! I'd thank the gods if I believed in them. Take this stone and it will allow you to travel amongst their ranks as one of them. Once you have infiltrated their city give this poisoned ale to Dar Strategist Guib. When the trolls hear of the strategist's death perhaps we can persuade them to leave our city and reclaim theirs. The stone will only work once so use it wisely. If you somehow make a mistake in using it return it to me and I will imbue it once again.");
		e.other:QuestReward(e.self,{items = {67008,67010}}); -- Item: Froglok Stone, Mug of Poisoned Ale
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 67009}, 0)) then
		e.self:Say("EXCELLENT! This is the best news I've received since those dirty trolls moved in. You have done so well, I may have use for you in the future. For now, I will grant you a spell from my personal library.");
		e.other:QuestReward(e.self,{itemid = 67011}); -- Item: Spell: Illusion Guktan
    end
    item_lib.return_items(e.self, e.other, e.trade)
end
