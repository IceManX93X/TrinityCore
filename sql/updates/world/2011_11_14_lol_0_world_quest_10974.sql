-- Fix NPC's (20482,22919) - Image of Commander Ameer

-- Image of Commandant Ameer Quest Flag(22919)
UPDATE `creature_template` SET `npcflag` = `npcflag`|2 WHERE `entry`= '22919';

-- Image of Commandant Ameer -Blade's Edge Mountains- Spawn
INSERT IGNORE INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`,`equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`,
`spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
('22919', '530', '1', '1', '0', '2256', '3866.6', '5978.59', '291.792', '3.97902', '300', '0', '0', '6986', '0', '0', '0', '0', '0');

-- Quest accept
DELETE FROM `creature_questrelation` WHERE `id` IN (20482,22919);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES
-- Netherstorm
(20482, 10406),
(20482, 10384),
(20482, 10408),
(20482, 10385),
(20482, 10405),
(20482, 10977),
(20482, 10982),
(20482, 10976),
-- Blade's Edge Mountains
(22919, 10981),
(22919, 10975),
(22919, 10977),
(22919, 10976);

-- Quest reward
DELETE FROM `creature_involvedrelation` WHERE `id` IN (20482,22919); 
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES
-- Netherstorm
(20482, 10406),
(20482, 10384),
(20482, 10408),
(20482, 10981),
(20482, 10385),
(20482, 10975),
(20482, 10405),
(20482, 10974),
(20482, 10977),
(20482, 10339),
(20482, 10982),
(20482, 10976),
-- Blade's Edge Mountains
(22919, 10981),
(22919, 10975),
(22919, 10974),
(22919, 10977),
(22919, 10982),
(22919, 10976);
