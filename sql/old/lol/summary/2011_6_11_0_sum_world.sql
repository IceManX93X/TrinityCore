SET @ENTRY := 39946;
UPDATE `creature_template` SET `lootid`=@ENTRY WHERE `entry`=39746;
UPDATE `creature_template` SET `lootid`=@ENTRY+1 WHERE `entry`=39751;
UPDATE `creature_template` SET `lootid`=@ENTRY+2 WHERE `entry`=39747;
DELETE FROM `creature_loot_template` WHERE `entry` BETWEEN @ENTRY AND @ENTRY+2;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,49426,100,1,0,1,1),
(@ENTRY+1,49426,100,1,0,1,1),
(@ENTRY+2,49426,100,1,0,1,1);

DELETE FROM `creature_text` WHERE `entry`=39746; 
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES 
(39746,0,0, 'Alexstrasza has chosen capable allies.... A pity that I must END YOU!',14,0,100,0,0,17512, 'Baltharus the Warborn'),
(39746,1,0, 'You thought you stood a chance?',14,0,50,0,0,17513, 'General Zarithrian'),
(39746,1,1, 'It''s for the best.',14,0,50,0,0,17514, 'General Zarithrian'),
(39746,2,0, 'Turn them to ash, minions!',14,0,100,0,0,17516, 'General Zarithrian'),
(39746,3,0, 'HALION! I...',14,0,100,0,0,17515, 'General Zarithrian');

UPDATE `creature_template` SET `ScriptName`= 'npc_baltharus_the_warborn_clone' WHERE `ScriptName`= 'npc_baltarhus_the_warborn_clone';
UPDATE `creature_template` SET `InhabitType`=3 WHERE `entry`=39794;
UPDATE `creature_template` SET `ScriptName`= 'boss_general_zarithrian' WHERE `entry`=39746;
UPDATE `creature_template` SET `ScriptName`= 'npc_onyx_flamecaller' WHERE `entry`=39814;

-- Fix typo for Nature Bomb Spell in heroic difficulty
UPDATE `spelldifficulty_dbc` SET `spellid1`=64650 WHERE `id`=3250;

DELETE FROM `spell_proc_event` WHERE `entry` IN (53672,54149);

DELETE FROM `spell_proc_event` WHERE `entry` = 33151;

UPDATE `areatrigger_teleport` SET `target_orientation`=2.58 WHERE `id`=4008; -- Fixes AQ20 entrance rotation
UPDATE `areatrigger_teleport` SET `target_orientation`=3.779335 WHERE `id`=503; -- Fixes Stockades exit rotation
UPDATE `areatrigger_teleport` SET `name`= 'Sethekk Halls (Exit)',`target_orientation`=1.65638 WHERE `id`=4399; -- Fixes Sethekk Halls exit rotation and name for trigger
UPDATE `areatrigger_teleport` SET `name`= 'Auchenai Crypts (Exit)',`target_orientation`=4.672236 WHERE `id`=4403; -- Fixes Auchenai Crypts exit rotation and name for trigger

-- Template updates for creature 33346 (XE-321 Boombot)
UPDATE `creature_template` SET `speed_run`=0.42857 WHERE `entry`=33346; -- XE-321 Boombot
-- Addon data for creature 33346 (XE-321 Boombot)
DELETE FROM `creature_template_addon` WHERE `entry`=33346;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(33346,0,0,1,0, NULL); -- XE-321 Boombot

-- Template updates for creature 33344 (XM-024 Pummeller)
-- Addon data for creature 33344 (XM-024 Pummeller)
DELETE FROM `creature_template_addon` WHERE `entry`=33344;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(33344,0,0,1,0, NULL); -- XM-024 Pummeller

-- Template updates for creature 33343 (XS-013 Scrapbot)
UPDATE `creature_template` SET `speed_run`=0.42857 WHERE `entry`=33343; -- XS-013 Scrapbot
-- Addon data for creature 33343 (XS-013 Scrapbot)
DELETE FROM `creature_template_addon` WHERE `entry`=33343;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(33343,0,0,1,0, NULL); -- XS-013 Scrapbot

DELETE FROM `spell_proc_event` WHERE `entry` = 60524;
INSERT INTO `spell_proc_event` VALUES
(60524,0x00,0,0x00000000,0x00000000,0x00000000,0x00000000,0x00010000,0,0,0);

UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128 WHERE `entry`=33050; -- Set trigger flag for Unstable Sun Beam

DELETE FROM `vehicle_template_accessory` WHERE `entry` = 31269;
INSERT INTO `vehicle_template_accessory` VALUES
(31269, 27559, 0, 0, 'Kor''kron Battle Wyvern', 6, 300);
DELETE FROM `creature` WHERE `id` = 27559;
UPDATE `creature_template` SET `InhabitType` = 1 WHERE `entry` = 27559;

UPDATE `creature_template` SET `AIName` = 'ArcherAI' WHERE `AIName` = 'ArchorAI';

