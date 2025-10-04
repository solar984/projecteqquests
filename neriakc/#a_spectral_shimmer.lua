-- #a_spectral_shimmer - neriakc
-- Illusion: Guktan, good quest: http://everquest.allakhazam.com/db/quest.html?quest=2605
-- Pop only on death by  neriakc/#Gribnor_the_Small.pl
-- Model is old undead froglok.
-- items: 67014


function event_spawn(e)
	eq.set_timer("despawn",300000); --
end

function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Take this final piece and hurry, my power gets weaker by the moment.");
		e.other:QuestReward(e.self,{itemid = 67014}); -- Tarnished Cross-Guard
		e.self:Emote("fades away.");
		eq.stop_timer("despawn");
		eq.depop();
    end
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	eq.stop_timer("despawn");
	eq.depop();
end
