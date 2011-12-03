-- Spawn NPC 'Lunk-tusk'
DELETE FROM `creature` WHERE `id` = 25233;
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(25233, 571, 1, 1, 0, 0, 1230.3, -3348.47, 203.701, 3.16548, 300, 0, 0, 9291, 0, 0, 0, 0, 0, 0);
-- set NPC sit
DELETE FROM `creature_template_addon` WHERE `entry` = 25233;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
(25233, 0, 0, 1, 4097, 0, NULL);