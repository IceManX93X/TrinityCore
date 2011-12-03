-- Fix Rubble Stalker Kologarn Aggroing after combat
UPDATE `creature_template` SET `unit_Flags` = `unit_flags`|512 WHERE `entry` IN (
33809, -- Rubble Stalker Kologarn
33942, -- Rubble Stalker Kologarn (heroic)
33571, -- Ulduar Gauntlet Generator
34159  -- Ulduar Gauntlet Generator (small radius)
);
