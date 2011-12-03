-- Fix Engineering Loot for Flame Leviathan, XT-002
SET @ENTRY  :=100012;
UPDATE `creature_template` SET `type_flags`=`type_flags`|32768,`skinloot`=@ENTRY WHERE `entry` IN (33113,34003,33293,33885);
DELETE FROM `skinning_loot_template` WHERE `entry` IN (@ENTRY);
INSERT INTO `skinning_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,35627,63,1,0,2,10), -- Eternal Shadow
(@ENTRY,35624,37,1,0,4,10), -- Eternal Earth
(@ENTRY,36860,36,1,0,2,6),  -- Eternal Fire
(@ENTRY,35623,34,1,0,2,6),  -- Eternal Air
(@ENTRY,36916,43,1,0,4,13), -- Cobalt Bar
(@ENTRY,36913,42,1,0,4,10), -- Saronite Bar
(@ENTRY,39682,27,1,0,4,6),  -- Overcharged Capacitor
(@ENTRY,39681,25,1,0,8,10), -- Handful of Cobalt Bolts
(@ENTRY,39683,23,1,0,2,3),  -- Froststeel Tube
(@ENTRY,39690,23,1,0,16,19),-- Volatile Blasting Trigger
(@ENTRY,37663,14,1,0,1,2),  -- Titansteel Bar
(@ENTRY,49050,10,1,0,1,1),  -- Schematic: Jeeves
(@ENTRY,44499,3,1,0,1,1),   -- Salvaged Iron Golem Parts
(@ENTRY,44501,3,1,0,2,4),   -- Goblin-machined Piston
(@ENTRY,44500,3,1,0,1,1);   -- Elementium-plated Exhaust Pipe