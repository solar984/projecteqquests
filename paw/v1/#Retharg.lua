function event_say(e)
	if(e.other:GetFaction(e.self) < 6) then
		if(e.message:findi("hail")) then
			e.self:Say("You must leave this place. As you can see, elementals have invaded our lair! Damn that [Farsoth]");
		elseif(e.message:findi("Farsoth")) then
			e.self:Say("Farsoth is the son of the Ishva Mal. He sought to be leader and opened a portal to the elemental planes. He made a grave mistake however and the elementals that poured through the portal were not to be under his control. We are all doomed now! Grrrr.");
		end
	else
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
	end
end
