local items = {}

function items.check_turn_in(npc, trade, trade_check,keepitems, text, emote)
	keepitems = keepitems or 1;	
	
	local required_items = 0;
	if(text ~= nil or emote ~= nil) then
		for i = 1, 4 do
			local key = "item" .. i;
			if(trade_check[key] ~= nil and trade_check[key] ~= 0) then
				if(keepitems == 0 or (keepitems == 1 and not npc:GetQuestLoot(trade_check[key]))) then
					required_items = required_items + 1;
				end
			end
		end

		eq.debug("".. npc:GetCleanName() .. " requires " .. required_items .. " more items for this handin.", 2);
	end
	
	local trade_return = {};
	for key, value in pairs(trade) do
		trade_return[key] = value;
	end

    local accepted = false;
	if(keepitems == 1) then
		-- Add all the items handed to us that the NPC needs to its loottable
		local founditem = false;
		for a = 1, 4 do
			local add = trade_return["item" .. a];
			local itemid = 0;
			for b = 1, 4 do
				local curkey = "item" .. b;
				if(add ~= nil and add.valid and trade_check[curkey] ~= nil and trade_check[curkey] ~= 0) then
					if(trade_check[curkey] == add:GetID()) then
						eq.debug("Item " .. add:GetID() .. " added to QUEST loot.", 2);
						npc:AddQuestLoot(add:GetID());
						trade_return["item" .. a] = nil;
						founditem = true;
                        accepted = true;
						itemid = 0;

						if(text ~= nil or emote ~= nil) then
							required_items = required_items - 1;
							if(required_items ~= 0) then
								if(text ~= nil) then
									npc:Say("" .. text .. "");
								elseif(emote ~= nil) then
									npc:Emote("" .. emote .. "");
								end
							end
						end

						break;
					else
						itemid = add:GetID();
					end
				end
			end
			if(npc:Charmed() and itemid > 1000 and not npc:GetPetLoot(itemid) and not npc:GetQuestLoot(itemid)) then
				eq.debug("Item " .. itemid .. " added to PET loot.", 2);
				npc:AddPetLoot(itemid);
			end
		end
		-- The npc was handed an item it doesn't need.
		if(not founditem and trade_check["copper"] == nil and trade_check["silver"] == nil and trade_check["gold"] == nil and trade_check["platinum"] == nil) then
            if(accepted) then
                eq.debug("NPC was handed an item it doesn't need, but also received valid items.", 2);
            end
			return false;
		end
	end	
	
	--Main loops. First loop iterates though the quest items (item1, item2, etc.) The second loop iterates
	--through the items handed to the NPC, comapring them to the item in the first loop.
	for i = 1, 4 do
		local key = "item" .. i;
		if(trade_check[key] ~= nil and trade_check[key] ~= 0) then
			local found = false;
			for j = 1, 4 do
				-- This compares the items handed to the NPC with what is specified in the quest.
				local inst = trade_return["item" .. j];
					if(inst ~= nil and inst.valid) then
					local itemid = inst:GetID();
					
					if(trade_check[key] == itemid) then
						if(keepitems == 0) then
							trade_return["item" .. j] = ItemInst();
						end
						found = true;
						
						if(keepitems == 0 and text ~= nil) then
							required_items = required_items - 1;
							if(required_items ~= 0) then
								npc:Say("" .. text .. "");
							end
						end

						break;
					end
				end
			end
			
			if(not found) then
				if(keepitems == 1) then 
					-- This compares the items in the NPC's loottable with what is specified in the quest.
					local hasitem = npc:GetQuestLoot(trade_check[key]);
					if(hasitem) then
						found = true;											
					else
						eq.debug("An item the NPC requires (" .. trade_check[key] .. ") was not handed to them and is not in their loot.", 2);
						return false;
					end
				else
					eq.debug("(Non-MQ) An item the NPC requires (" .. trade_check[key] .. ") was not handed to them.", 2);
					return false;
				end
			end
		end
	end

	-- Setup clean variables for count check and delete.
	local item1 = trade_check["item1"];
	local item2 = trade_check["item2"];
	local item3 = trade_check["item3"];
	local item4 = trade_check["item4"];
	if(trade_check["item1"] == nil) then
		item1 = 0;
	end
	if(trade_check["item2"] == nil) then
		item2 = 0;
	end
	if(trade_check["item3"] == nil) then
		item3 = 0;
	end
	if(trade_check["item4"] == nil) then
		item4 = 0;
	end
		
	if(keepitems == 1) then
		-- If the quest requires multiple of the same item, this counts up the NPC's loottable items for us.
		local count = npc:HasRequiredQuestLoot(item1, item2, item3, item4);
		if(not count) then
			eq.debug("The NPC does not have the required number of items it needs.", 2);
			return false;
		end
	end
	
	--convert our money into copper then check that we have enough then convert change back
	local trade_check_money = 0;
	local return_money = 0;
	
	if(trade_check["platinum"] ~= nil and trade_check["platinum"] ~= 0) then
		trade_check_money = trade_check_money + (trade_check["platinum"] * 1000);
	end
	
	if(trade_check["gold"] ~= nil and trade_check["gold"] ~= 0) then
		trade_check_money = trade_check_money + (trade_check["gold"] * 100);
	end
	
	if(trade_check["silver"] ~= nil and trade_check["silver"] ~= 0) then
		trade_check_money = trade_check_money + (trade_check["silver"] * 10);
	end
	
	if(trade_check["copper"] ~= nil and trade_check["copper"] ~= 0) then
		trade_check_money = trade_check_money + trade_check["copper"];
	end
	
	return_money = return_money + trade_return["platinum"] * 1000 + trade_return["gold"] * 100;
	return_money = return_money + trade_return["silver"] * 10 + trade_return["copper"];
	
	if(return_money < trade_check_money) then
		return false;
	else
		return_money = return_money - trade_check_money;
	end
	
	--replace trade with trade_return
	trade.item1 = trade_return.item1;
	trade.item2 = trade_return.item2;
	trade.item3 = trade_return.item3;
	trade.item4 = trade_return.item4;
	
	if(keepitems == 1) then
		npc:DeleteQuestLoot(item1, item2, item3, item4);
	end	
	
	trade.platinum = math.floor(return_money / 1000);
	return_money = return_money - (trade.platinum * 1000);
	
	trade.gold = math.floor(return_money / 100);
	return_money = return_money - (trade.gold * 100);
	
	trade.silver = math.floor(return_money / 10);
	return_money = return_money - (trade.silver * 10);
	
	trade.copper = return_money;
	return true;
end

function items.return_items(npc, client, trade, text)
	if ( type(text) == "boolean" and text == false ) then
		text = "";
	end
	local returned = false;

	-- Handin table for source
	local return_data = {};
	for i = 1, 4 do
		local inst = trade["item" .. i];
		if(inst ~= nil and inst.valid) then
			local is_attuned = 0;
			if inst:IsInstNoDrop() then
				is_attuned = 1;
			end

			-- remove delivered task items from return for this slot
			local return_count = inst:RemoveTaskDeliveredItems()

			if(eq.is_disc_tome(inst:GetID()) and npc:GetClass() >= 19 and npc:GetClass() < 36) then
				if(client:GetClass() == npc:GetClass() - 19) then
					client:TrainDisc(inst:GetID());
				else
					return_data[#return_data+1] = string.format("%d|%d|%d", inst:GetID(), inst:GetCharges(), is_attuned);
					npc:Say(string.format("You are not a member of my guild. I will not train you!"));
					if return_count > 0 then
						client:PushItemOnCursor(inst);
						returned = true;
					end
				end
			
			local itemid = inst:GetID();
			elseif(not npc:GetQuestLoot(itemid)) then
			
				if (npc:Charmed()) then
					if (itemid > 1000 and not npc:GetPetLoot(itemid)) then
						eq.debug("Item " .. itemid .. " added to PET loot.", 2);
						npc:AddPetLoot(itemid);
					end
				else
					return_data[#return_data+1] = string.format("%d|%d|%d", inst:GetID(), inst:GetCharges(), is_attuned);
					if return_count > 0 then
						client:PushItemOnCursor(inst);
						returned = true;
					end
					
					if (npc:CanTalk()) then
						if (not text) then
							npc:Say("I have no need for this item " .. client:GetCleanName() .. ", you can have it back.");
						elseif (text ~= "") then
							npc:Say(text);
						end
					end
					eq.debug("Handing back an item it doesn't need (" .. itemid .. ").", 2);
					returned = true;
				end
			elseif return_count > 0 then
				return_data[#return_data+1] = string.format("%d|%d|%d", inst:GetID(), inst:GetCharges(), is_attuned);
				client:PushItemOnCursor(inst);
				if (npc:CanTalk()) then
					if (not text) then
						npc:Say("I have no need for this item " .. client:GetCleanName() .. ", you can have it back.");
					elseif (text ~= "") then
						npc:Say(text);
					end
				end
			end
		end
	end

	if(npc:Charmed()) then
		eq.debug("NPC is a charmed pet, it does not return items.", 2);
		return returned;
	end

	client:SetEntityVariable("RETURN_ITEMS", items.get_handin_items_serialized(return_data))
	
	local money = false;
	if(trade.platinum ~= 0) then
		returned = true;
		money = true;
	end
	
	if(trade.gold ~= 0) then
		returned = true;
		money = true;
	end
	
	if(trade.silver ~= 0) then
		returned = true;
		money = true;
	end
	
	if(trade.copper ~= 0) then
		returned = true;
		money = true;
	end
	
	if money then
		client:SetEntityVariable("RETURN_MONEY", string.format("%d|%d|%d|%d", trade.copper, trade.silver, trade.gold, trade.platinum));
		client:AddMoneyToPP(trade.copper, trade.silver, trade.gold, trade.platinum, true);
	end

	eq.send_player_handin_event();
	
	return returned;
end

function items.return_bot_items(bot, client, trade, text)
	text = text or true;
	local returned = false;
	for i = 1, 8 do
		local inst = trade["item" .. i];
		if (inst.valid) then
			client:PushItemOnCursor(inst);
			returned = true;
		end
	end
	
	local money = false;
	if (trade.platinum ~= 0) then
		returned = true;
		money = true;
	end
	
	if (trade.gold ~= 0) then
		returned = true;
		money = true;
	end
	
	if (trade.silver ~= 0) then
		returned = true;
		money = true;
	end
	
	if (trade.copper ~= 0) then
		returned = true;
		money = true;
	end
	
	if (money) then
		client:AddMoneyToPP(trade.copper, trade.silver, trade.gold, trade.platinum, true);
	end

	if (text and returned) then
		bot:OwnerMessage("I have no need for this, you can have it back.")
	end
	
	return returned;
end

function items.check_bot_turn_in(trade, trade_check)
	--create trade_return table == trade
	--shallow copy
	local trade_return = {};
	for key, value in pairs(trade) do
		trade_return[key] = value;
	end
	
	--for every item in trade_check check trade_return
		--if item exists in trade_return then 
			--remove that item from trade_return
		--else
			--failure
	for i = 1, 8 do
		local key = "item" .. i;
		if(trade_check[key] ~= nil and trade_check[key] ~= 0) then
			local found = false;
			for j = 1, 8 do
				local inst = trade_return["item" .. j];			
				if(inst.valid and trade_check[key] == inst:GetID()) then
					trade_return["item" .. j] = ItemInst();
					found = true;
					break;
				end
			end
			
			if(not found) then
				return false;
			end
		end
	end
	
	--convert our money into copper then check that we have enough then convert change back
	local trade_check_money = 0;
	local return_money = 0;
	
	if(trade_check["platinum"] ~= nil and trade_check["platinum"] ~= 0) then
		trade_check_money = trade_check_money + (trade_check["platinum"] * 1000);
	end
	
	if(trade_check["gold"] ~= nil and trade_check["gold"] ~= 0) then
		trade_check_money = trade_check_money + (trade_check["gold"] * 100);
	end
	
	if(trade_check["silver"] ~= nil and trade_check["silver"] ~= 0) then
		trade_check_money = trade_check_money + (trade_check["silver"] * 10);
	end
	
	if(trade_check["copper"] ~= nil and trade_check["copper"] ~= 0) then
		trade_check_money = trade_check_money + trade_check["copper"];
	end
	
	return_money = return_money + trade_return["platinum"] * 1000 + trade_return["gold"] * 100;
	return_money = return_money + trade_return["silver"] * 10 + trade_return["copper"];
	
	if(return_money < trade_check_money) then
		return false;
	else
		return_money = return_money - trade_check_money;
	end
	
	--replace trade with trade_return
	trade.item1 = trade_return.item1;
	trade.item2 = trade_return.item2;
	trade.item3 = trade_return.item3;
	trade.item4 = trade_return.item4;
	trade.item5 = trade_return.item5;
	trade.item6 = trade_return.item6;
	trade.item7 = trade_return.item7;
	trade.item8 = trade_return.item8;
	
	trade.platinum = math.floor(return_money / 1000);
	return_money = return_money - (trade.platinum * 1000);
	
	trade.gold = math.floor(return_money / 100);
	return_money = return_money - (trade.gold * 100);
	
	trade.silver = math.floor(return_money / 10);
	return_money = return_money - (trade.silver * 10);
	
	trade.copper = return_money;
	return true;
end

function items.get_handin_items_serialized(handin_table)
	return table.concat(handin_table, ",")
end
	
return items;