function event_death_complete(e)
	local rand = math.random(4);
	if(rand == 1) then
		eq.spawn2(2023,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	end
	if(rand == 2) then
		eq.spawn2(2023,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(2023,0,0,e.self:GetX() + 1,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	end
	if(rand == 3) then
		eq.spawn2(2023,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(2023,0,0,e.self:GetX()+1,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(2023,0,0,e.self:GetX()-1,e.self:GetY()+1,e.self:GetZ(),e.self:GetHeading());
	end
	if(rand == 4) then
		eq.spawn2(2023,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(2023,0,0,e.self:GetX()+1,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(2023,0,0,e.self:GetX()-1,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(2023,0,0,e.self:GetX()+1,e.self:GetY()+1,e.self:GetZ(),e.self:GetHeading());
	end
end