function event_enter_zone(e)
    if e.self:GetClass() == Class.BARD then
        local qglobals = eq.get_qglobals(e.self)
        if qglobals["bard15"] == "5" then
            local entity_list = eq.get_entity_list()
            if not entity_list:IsMobSpawnedByNpcTypeID(20027) and not entity_list:IsMobSpawnedByNpcTypeID(20028) and not entity_list:IsMobSpawnedByNpcTypeID(20029) then
                eq.spawn2(20027, 140, 0, 1157, 537, 131, 490)
            end
        end
	elseif e.self:GetClass() == Class.DRUID then
		local qglobals = eq.get_qglobals(e.self)
        if qglobals["druid_epic"] == "7" then	
				local entity_list = eq.get_entity_list()
				if not entity_list:IsMobSpawnedByNpcTypeID(20036) then
					eq.spawn2(20036, 0, 0, -696.6,-523.8,-33,78)
				end
		end
    end
end

function event_loot(e)
	if e.self:GetClass() == Class.DRUID and e.item:GetID() == 62862 then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["druid_epic"] == "7") then
			if(qglobals["druid_chest_kith"] == nil ) then
				eq.spawn2(20040,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- a chest (Epic 1.5)
				eq.set_global("druid_chest_kith","1",5,"F");
			end
		else
			return 1;
		end
	end
end

