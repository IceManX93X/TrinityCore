-- Add passive Flag to various Ulduar triggers
UPDATE creature_template SET unit_flags = unit_flags|512 WHERE entry IN (
33054, -- Thorim Trap Bunny
33500, -- Vezax Bunny
33575, -- Channel Stalker Freya
33661, -- Armsweep Stalker Kologarn
34188, -- Razorscale Devouring Flame Stalker
34189, -- Razorscale Devouring Flame Stalker (heroic)
34098, -- Auriaya Seeping Essence Stalker
34174  -- Auriaya Seeping Essence Stalker (heroic)
);

-- Remove NON_SELECTABLE from Clockwork Mechanic
UPDATE creature_template SET unit_flags = unit_flags &~ 33554432 WHERE entry = 34184;