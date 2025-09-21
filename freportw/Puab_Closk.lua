-- items: 12369, 18746, 13507, 28055, 12344
function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18746)) then
		e.other:Message(MT.Yellow,"As you get your bearings, a lightly armored man that appears to be in incredible shape turns to greet you. 'Welcome traveller. I am Puab Closk. If you wish to learn the ways of the Ashen Order, read the note in your inventory and hand it to me to begin your training.'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. I am Puab Closk, Master of the Ashen Order.  Our home is your home, friend. Feel free to stay as long as you like.  Learn our ways as many have done in the past.  To fight like the tiger and strike like the cobra are your goals.");
	elseif(e.message:findi("treant fist")) then
		e.self:Say("You desire the treant fists?  I have them and I will offer them to any [skilled monk of the Ashen House].");
	elseif(e.message:findi("who.* clawfist")) then
		if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 100) then
			e.self:Say("Clawfist is a Kerran, a catman. He braved the dangers of Norrath to reach the Ashen Order. He sought knowledge of our disiples. He learned well.");
		elseif(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 0) then
			e.self:Say("I have been watching you, and appreciate the help you've given to the brothers and sisters of the Ashen Order, but I feel that such a vital matter should be left to one of our more trusted members.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("where.* clawfist")) then
		if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 100) then	
			e.self:Say("Clawfist has been banished by the Kerrans of Odus. Where they have sent him I am unsure.");
		elseif(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 0) then
			e.self:Say("I have been watching you, and appreciate the help you've given to the brothers and sisters of the Ashen Order, but I feel that such a vital matter should be left to one of our more trusted members.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("skilled monk.* ashen house")) then
		if(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 100) then
			e.self:Say("Then you shall aid our family. My former pupil [Clawfist] has been banished by his people. You will go to him and hand him this token as proof of your origin. He shall be expecting you.");
			e.other:SummonItem(12369); -- Puab's Token
		elseif(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 0) then
			e.self:Say("I have been watching you, and appreciate the help you've given to the brothers and sisters of the Ashen Order, but I feel that such a vital matter should be left to one of our more trusted members.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18746})) then -- A tattered note
		e.self:Say("Welcome to the house of the Ashen Order. We are a small guild of monks who have devoted our lives to refining our minds, souls, and physical beings to their maximum potential. Please see Brother Torresk as soon as you get a chance. He is in charge of helping our newer members begin their training. Good luck, " .. e.other:GetCleanName() .. ".");
		e.other:Faction(361,100,0); -- Ashen Order
		e.other:Faction(281,15,0); -- Knights of Truth
		e.other:Faction(309,5,0); -- Silent Fist Clan
		e.other:QuestReward(e.self,0,0,0,0,13507,20); -- Torn Cloth Tunic
	elseif(e.other:GetModCharacterFactionLevel(e.self:GetPrimaryFaction()) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12370})) then -- a pawprint
		e.self:Say("You have performed a great service to one who is your brother. Your loyalty shines brightly, as does your skill. Take the treant fists. They are yours now.");
		e.other:Faction(361,20,0); -- Ashen Order
		e.other:Faction(281,3,0); -- Knights of Truth
		e.other:Faction(309,1,0); -- Silent Fist Clan
		e.other:QuestReward(e.self,0,0,0,0,12344,100); -- Treant Fists
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:freportw -- Puab_Closk
