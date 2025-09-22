function event_spawn(e)
  eq.debug(e.self:GetCleanName() .. " spawned");
  eq.set_timer("despawn", 60 * 1000);
end

function event_combat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
			eq.debug(e.self:GetCleanName() .. " joined combat - pausing the despawn timer.");
		end
	else
		eq.resume_timer("depop");
		eq.debug(e.self:GetCleanName() .. " left combat - continue the despawn timer.");
	end
end

function event_timer(e)
  if (e.timer == "despawn") then
    eq.debug(e.self:GetCleanName() .. " despawning.");
    eq.stop_timer(e.timer);
    eq.depop();
  end
end

