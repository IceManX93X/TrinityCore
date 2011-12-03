-- Fix Quest 10526 The Thunderspike

UPDATE `gameobject_template` SET `questItem1`=0,`data5`=1,`AIName`='' WHERE `entry`=184729;
UPDATE `gameobject` SET `spawntimesecs`=60 WHERE `id`=184729;

-- remove SAI from GO
DELETE FROM `smart_scripts` WHERE entryorguid = 184729 AND source_type = 1;
DELETE FROM `smart_scripts` WHERE entryorguid = 18472900 AND source_type = 9;

UPDATE `creature_template` SET `AIName`='SmartAI',`faction_A`=16,`faction_H`= 16 WHERE `entry`=21319;
DELETE FROM `smart_scripts` WHERE entryorguid = 21319 AND source_type = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(21319,0,0,0,2,0,100,0,0,70,12000,12000,11,35491,2,0,0,0,0,1,0,0,0,0,0,0,0,'Gor Grimgut - Below 70% HP - Cast Furious Rage'),
(21319,0,1,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Gor Grimgut - On Summon - Start Attack');

DELETE FROM `event_scripts` WHERE `id`=13685;
INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(13685,1,10,21319,60000,0,1317.65,6679.41,-19.6,0.97);