function event_say(e)
    if(e.message:findi("last known area")) then
		e.self:Say("From the information I have gathered the last time she came above ground was somewhere in the middle of the. . . Suddenly as if staring in the face of death Saeko's blue skin turns deathly grey. She looks at you for a moment and begins to cast a spell. That's when you hear a loud chittering behind you.");
		e.self:Emote("begins to cast the gate spell");
		eq.unique_spawn(35016,0,0,544,233,-21,326); -- NPC: #Gargantula
		eq.depop_with_timer();
    end
end

function event_trade(e)
    local item_lib = require("items");

    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 67004})) then
		e.self:Say("So you're the one Sazan sent to help. He must need this venom badly. Tell you what, since I have been here for so long and turned up nothing I will tell you the [last known area] that Gargantula was spotted. She is a crafty beast who uses the sands of this desert to move silently.");
    end
    item_lib.return_items(e.self, e.other, e.trade)
end