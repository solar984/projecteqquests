-- nilbog

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Brrr... Good to meet another upon this wasteland.  You would not by any chance have any iron rations on you, would you?  If so, I shall heal you in trade.  I am in need of provisions.");
	end
end

function event_aggro(e)
	e.self:Say("Great Tribunal, help me smite this foe!");
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13005})) then -- iron ration
		e.self:Say("Great Tribunal... Give me strength to bind this good person's wounds.");
		e.self:CastSpell(200,e.other:GetID()); -- minor healing
	end
	item_lib.return_items(e.self, e.other, e.trade)
end