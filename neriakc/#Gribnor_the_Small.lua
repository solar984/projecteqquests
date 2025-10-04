-- --Gribnor_the_Small
-- Part of illusion:Guktan quest http://everquest.allakhazam.com/db/quest.html?quest=2605
-- Uncharmable, Unmezzable, mitigates slow (mostly successful), enrages, summons.
-- KoS to all except Trolls and Ogres, it seems

function event_death_complete(e)
    eq.unique_spawn(42021,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_spectral_shimmer
end