-- Fix Engineering Loot for Ulduar Trash
SET @ENTRY  :=100013;
UPDATE `creature_template` SET `type_flags`=`type_flags`|32768,`skinloot`=@ENTRY WHERE `entry` IN (34183,34214,34193,34220,34267,34268,34269,34270,34271,34272,34273,34274);
DELETE FROM `skinning_loot_template` WHERE `entry` IN (@ENTRY);
INSERT INTO `skinning_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,41338,90,1,0,1,3),  -- Sprung Whirlygig
(@ENTRY,41337,80,1,0,1,3),  -- Whizzed-Out Gizmo
(@ENTRY,39681,25,1,0,2,4),  -- Handful of Cobalt Bolts
(@ENTRY,39690,25,1,0,1,3),  -- Volatile Blasting Trigger
(@ENTRY,39682,17,1,0,1,2),  -- Overcharged Capacitor
(@ENTRY,39683,17,1,0,1,2),  -- Froststeel Tube
(@ENTRY,49050,3,1,0,1,1);   -- Schematic: Jeeves