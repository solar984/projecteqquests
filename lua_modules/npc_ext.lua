function NPC:ForeachHateList(func, cond)
	cond = cond or function(ent, hate, damage, frenzy) return true end;
	local lst = self:GetHateList();
	for ent in lst.entries do
		local cv = cond(ent.ent, ent.hate, ent.damage, ent.frenzy);
		if(cv) then
			func(ent.ent, ent.hate, ent.damage, ent.frenzy);
		end
	end
end

function NPC:CountHateList(cond)
	cond = cond or function(ent, hate, damage, frenzy) return true end;
	local lst = self:GetHateList();
	local ret = 0;
	for ent in lst.entries do
		local cv = cond(ent.ent, ent.hate, ent.damage, ent.frenzy);
		if(cv) then
			ret = ret + 1;
		end
	end
	
	return ret;
end

function NPC:RandomRoam(maxx,maxy,maxz,los)
	maxz = maxz or 15;
	los = los or 5;

	if not self:IsEngaged() then
		local curx = self:GetX();
		local cury = self:GetY();
		local origx = self:GetSpawnPointX() or 0;
		local origy = self:GetSpawnPointY() or 0;
		local origz = self:GetSpawnPointZ() or 0;
		local guardx = self:GetGuardPointX() or 0;
		local guardy = self:GetGuardPointY() or 0;

		if curx == guardx and cury == guardy then
			local randomx = math.random(maxx) + 1;
			local randomy = math.random(maxy) + 1;
			local posx = origx + randomx;
			local posy = origy + randomy;
			local negx = origx - randomx;
			local negy = origy - randomy;
			local newx, newy = 0;
			if posx > negx then -- Flip order
				newx = math.random(negx, posx);
			else
				newx = math.random(posx,negx);
			end

			if posy > negy then -- Flip order
				newy = math.random(negy, posy);
			else
				newy = math.random(posy,negy);
			end
			local newz = self:FindGroundZ(newx,newy, 5) + 1;

			if newz > -999999 and origz > (newz - maxz + 1) and origz < (newz + maxz - 1) then
				local loscheck = self:CheckLoSToLoc(newx, newy, newz, los);
				if loscheck then
					self:MoveTo(newx,newy,newz,-1,true);
				end
			end
		end
	end
end

function NPC:CastedSpellFinished(spell_id, target) -- note, we do have a server side function (not exported) called this too ...
	self:SendBeginCast(spell_id, 0);
	self:SpellFinished(spell_id, target);
end

function NPC:GetClientsInProximity(distance)
	local clients = {}
	local client_list = eq.get_entity_list():GetClientList()
	for client in client_list.entries do
		if client.valid and self:CalculateDistance(client:GetX(), client:GetY(), client:GetZ()) <= distance then
			clients[#clients+1] = client
		end
	end
	return clients
end


-- Check the ground around the NPC for a dropped item and destroy it.  Returns true if object found
function NPC:CheckGround(range)
	
	local id, ix, iy, iz;
	local sx, sy, sz = self:GetX(), self:GetY(), self:GetZ();

	local olist = eq.get_entity_list():GetObjectList();
	range = tonumber(range) or 25;
	
	for obj in olist.entries do
	
		ix, iy, iz = obj:GetX(), obj:GetY(), obj:GetZ();
		if ( obj:GetItemID() > 0
			and ix - sx < range and ix - sx > -range
			and iy - sy < range and iy - sy > -range
			and iz - sz < range and iz - sz > -range
		) then
			obj:DepopWithTimer();
			return true;
		end
	end
	return false;
end
