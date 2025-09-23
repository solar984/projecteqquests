-- 15044 - Althele at #loc -1592, -3657, -17 - to start corruptor/reaver spawns for fleshbound tome

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, friend. Beautiful is what I would call such a day normally but lately? I sense that something is [out of balance].");
	elseif(e.message:findi("balance")) then
		if(e.other:Class() == "Ranger") then
			e.self:Say("I don't know for certain what is wrong. It feels like the start of a cold, a sort of tickling at the back of Norrath's throat, if I may make such a poor metaphor. In much the same way that I can sense that you have wielded the power of nature, probably in the form of the weapons known as Swiftwind and Earthcaller, I can sense a power of illness creeping upon the land. Please, if you come across anything suspicious bring it to me. I am worried, this does not feel like a natural sickness to me. Go with the blessing of the Mother and the speed of the Storm, my child.");
		elseif(e.other:Class() == "Druid") then
			e.self:Say("I am certain that you would sense it too, had you been so blessed as to be without sight. My sense of the life of Norrath is greatly heightened without the hindrance of vision. As I can sense that you have at your call the power of the lands, perhaps in the form of the Nature Walkers Scimitar. I can feel an unnatural illness creeping about the edges of Norrath. Please, if you come across anything suspicious bring it to me. I am worried about this cold sickness that I can almost taste. Go with the blessing of the Mother and the speed of the Storm, my child.");
		else
			e.self:Say("I sense something foreboding, young one, but you should think nothing of it. The sons and daughters of nature will be able to deal with this problem.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20448})) then
		e.self:Emote("looks at the coin and nods gravely at you as she slips it into a fold of her clothing. 'I see. The story of this coin speaks much to me as do the words you have given me. Telin sent word that you would arrive. The tidings you bring are ill indeed. Here, take this amulet and find Sionae. She is nearby. We will speak more on this matter when all are present.'");
		e.other:QuestReward(e.self,{itemid = 20450}); -- Braided Grass Amulet
		eq.unique_spawn(15178,0,0,-1595,-2595,4,127); -- NPC: Sionae
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 62810})) then -- Sickly Maiden's Hair
		e.self:Say("This plant has an illness that I have never sensed before.' Althele pauses in thought for a moment. 'You are a hunter, so I shall put your skills to work. First, take this to Corun in Surefall. He is an expert on animal illnesses. Then put your hunting skills to work and see if you can capture any animals that may have eaten this plant. Corun will want to see them to help him discover what the sickness is.");
		e.other:QuestReward(e.self,{itemid = 62811}); -- Tuft of Sickly Maiden's Hair
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20452})) then
		e.self:Emote("hands the book to Tholris who reads through it with lines of concern etched on his face, then whispers into her ear. 'Dire news, indeed. This cannot be allowed. I must keep this book but you, " .. e.other:GetCleanName() .. ", must not allow Innoruuk to seed the land with his hatred and filth. You have only just begun your quest. The path you are guided upon will be difficult, if not impossible, but someone must finish it. Please, take this, read of it, follow its instructions. Tunare bless your path and Karana watch over you.");
		e.other:QuestReward(e.self,0,0,0,0,18959,100000); 		-- Earth Stained Note
		eq.depop(15178);
		eq.depop(15167);
		eq.depop(15170);
		eq.depop_with_timer(15043);
		eq.depop_with_timer(15042);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Great mother of life and father of sky, growth and spirit, Tunare and Karana. Innoruuk once again schemes and we have failed in our duties to protect our land. We give your powers in sacrifice fo ryour help. Heed our call and send us your wisdom.");
	end
end
