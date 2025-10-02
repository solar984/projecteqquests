function event_click_door(e)
	local id = e.door:GetDoorID();

	if ( id == 1 ) then
		eq.get_entity_list():GetDoorsByDoorID(2):ForceOpen(e.self);
		eq.get_entity_list():GetDoorsByDoorID(49):ForceOpen(e.self);
	elseif ( id == 2 ) then
		eq.get_entity_list():GetDoorsByDoorID(1):ForceOpen(e.self);
		eq.get_entity_list():GetDoorsByDoorID(49):ForceOpen(e.self);
	elseif ( id == 49 ) then
		eq.get_entity_list():GetDoorsByDoorID(1):ForceOpen(e.self);
		eq.get_entity_list():GetDoorsByDoorID(2):ForceOpen(e.self);
	end
end

function event_enter_zone(e)
	local level = e.self:GetLevel();
	local zoneid = eq.get_zone_id();
	local qglobals = eq.get_qglobals(e.self);

  	if(level >= 15 and qglobals.Wayfarer == nil and e.self:GetStartZone() == zoneid and eq.is_lost_dungeons_of_norrath_enabled()) then
    		e.self:Message(MT.Yellow, "A mysterious voice whispers to you, 'Kwilrz Vn`Ycxa has just joined the Wayfarers Brotherhood and has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
  	end
end
