-- Fix Quest 'Get the Key' #12949 - add Quest Invisibility to Instructor Hroegar
-- add Quest Invisibility to Instructor Hroegar
DELETE FROM `creature_template_addon` WHERE `entry` = 29915;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
(29915,0,0,0,4097,0,'56058 0'); -- apply aura - Get the Key: Instructor Hroegar's Invisibility
-- on quest #12949 apply aura - Savage Ledge: See Instructor Hroegar's Invisibility
DELETE FROM `spell_area` WHERE `spell` = 56057;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_start_active`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`) VALUES 
(56057,4497,12949,1,12949,0,0,2,1);
-- QUEST 12998 "The Heart of the Storm"
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=192181;
UPDATE `creature_template` SET `AIName`='SmartAI', `faction_H`=1954, `faction_A`=1954, `unit_flags`=768, `equipment_id`=749, `flags_extra`=2 WHERE `entry`=30299;

-- Spawn GO
DELETE FROM `gameobject` WHERE `id` = 192181;
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(192181,571,1,1,7308.97,-727.868,791.609,1.56851,0,0,0.706299,0.707914,300,0,1);

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (30299,3029900,192181,19218100);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- Overseer Narvir script
(30299,0,0,0,25,0,100,0,0,0,0,0,80,3029900,0,2,0,0,0,1,0,0,0,0,0,0,0, 'On summon Overseer Narvir start script'),
(3029900,9,0,0,0,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Set react passive'),
(3029900,9,1,0,0,0,100,0,500,500,0,0,69,0,0,0,0,0,0,8,0,0,0,7313.045,-726.853,791.610,0, 'Walk to the Heart of the Storm'),
(3029900,9,2,0,0,0,100,0,6500,6500,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.437, 'Set orientation'),
(3029900,9,3,0,0,0,100,0,2000,2000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Overseer Narvir say text 0'),
(3029900,9,4,0,0,0,100,0,5000,5000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Overseer Narvir say text 1'),
(3029900,9,5,0,0,0,100,0,6000,6000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,3.334, 'Set orientation'),
(3029900,9,6,0,0,0,100,0,500,500,0,0,17,133,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Loot the heart'),
(3029900,9,7,0,0,0,100,0,5000,5000,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Stop looting'),
(3029900,9,8,0,0,0,100,0,1500,1500,0,0,5,463,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Disappear emote'),
(3029900,9,9,0,0,0,100,0,500,500,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Despawn'),
-- Heart of the Storm script
(192181,1,0,0,64,0,100,0x01,0,0,0,0,80,19218100,0,2,0,0,0,1,0,0,0,0,0,0,0, 'On use start script'),
(19218100,9,0,0,0,0,100,0,1000,1000,0,0,12,30299,1,60000,0,0,0,8,0,0,0,7312.130,-710.919,791.610,4.643, 'Summon Overseer Narvir'),
(19218100,9,1,0,0,0,100,0,0,0,0,0,75,56485,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Cyclone the invoker'),
(19218100,9,2,0,0,0,100,0,27000,27000,0,0,33,30299,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Give quest credit');

DELETE FROM `creature_text` WHERE `entry`=30299;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(30299,0,0,'You didn\'t think that I was going to let you walk in here and take the Heart of the Storm, did you?',0,0,100,6,0,0,'Narvir text 0'),
(30299,1,0,'You may have killed Valduran, but that will not stop me from completing the colossus.',0,0,100,274,0,0,'Narvir text 1');
-- Quest 11895 "Master the Storm", Quest 11896 "Weakness to Lightning", Quest 11907 "The Sub-Chieftains" and Quest 11788 "Lefty Loosey, Righty Tighty"
DELETE FROM `creature` WHERE `id`=26048;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(107478,26048,571,1,1,16988,0,3410.110,4128.981,18.054,5.699,60,0,0,8982,3155,0,0,0,0,0);

DELETE FROM `gameobject` WHERE `id` IN (188109,187987);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(188898,187987,571,1,1,3793.746,4805.559,-12.185,5.667,0,0,0,1,300,100,1),
(188899,188109,571,1,1,3791.950,4804.803,-12.158,4.571,0,0,0,1,300,100,1);

UPDATE `creature_template` SET `AIName`='SmartAI', `npcflag`=`npcflag` | 16777216 WHERE `entry`=26048;
UPDATE `creature_template` SET `unit_flags`=4, `AIName`='SmartAI' WHERE `entry`=26045;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=25752;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=25753;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=25758;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=25792;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=26048;
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`quest_start`,`quest_start_active`,`quest_end`,`cast_flags`,`aura_required`,`aura_forbidden`,`user_type`) VALUES
(26048,74772,11895,1,0,0,0,0,0);

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (26048,2604800,26045,25752,25753,25758,25792);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(26048,0,0,0,8,0,100,0,74772,0,0,0,80,2604800,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On spellhit start script'),
(2604800,9,0,0,60,0,100,0,0,0,0,0,12,26045,1,60000,0,1,0,8,0,0,0,3399.917,4135.566,18.054,5.699, 'Summon Storm Tempest'),
(2604800,9,1,0,60,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Despawn'),
(26045,0,0,0,25,0,100,0,0,0,0,0,11,35487,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On summon Storm Tempest cast Lightning Cloud'),
(26045,0,1,0,4,0,100,0,0,0,60000,60000,1,0,0,0,0,0,0,2,0,0,0,0,0,0,0, 'On aggro Storm Tempest say text'),
(26045,0,2,0,0,0,100,0,0,0,4000,5000,11,15659,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Storm Tempest cast Chain Lightning'),
(26045,0,3,0,0,0,50,0,0,0,3000,4000,11,31272,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Storm Tempest cast Wind Shock'),
(26045,0,4,0,6,0,100,0,0,0,0,0,85,46424,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On death apply Master the Storm'),
(25752,0,0,0,8,0,100,0,46432,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On spellhit set phase 1'),
(25752,0,1,0,6,1,100,0,0,0,0,0,33,26082,0,0,0,0,0,1,0,0,0,0,0,0,0, 'If killed in phase 1 give quest credit'),
(25752,0,2,0,25,0,100,0,0,0,0,0,28,46432,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On respawn remove aura'),
(25753,0,0,0,8,0,100,0,46432,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On spellhit set phase 1'),
(25753,0,1,0,6,1,100,0,0,0,0,0,33,26082,0,0,0,0,0,1,0,0,0,0,0,0,0, 'If killed in phase 1 give quest credit'),
(25753,0,2,0,25,0,100,0,0,0,0,0,28,46432,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On respawn remove aura'),
(25758,0,0,0,8,0,100,0,46432,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On spellhit set phase 1'),
(25758,0,1,0,6,1,100,0,0,0,0,0,33,26082,0,0,0,0,0,1,0,0,0,0,0,0,0, 'If killed in phase 1 give quest credit'),
(25758,0,2,0,25,0,100,0,0,0,0,0,28,46432,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On respawn remove aura'),
(25792,0,0,0,8,0,100,0,46432,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On spellhit set phase 1'),
(25792,0,1,0,6,1,100,0,0,0,0,0,33,26082,0,0,0,0,0,1,0,0,0,0,0,0,0, 'If killed in phase 1 give quest credit'),
(25792,0,2,0,25,0,100,0,0,0,0,0,28,46432,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On respawn remove aura');

DELETE FROM `creature_text` WHERE `entry`=26045;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(26045,0,0,'You will not defeat me, puny $R!',0,0,100,0,0,0, 'Storm Tempest text');

DELETE FROM `spell_scripts` WHERE `id` IN (46550);
INSERT INTO `spell_scripts` (`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(46550,0,0,14,46424,0,0,0,0,0,0);
-- Instructor Hroegar Flag and Loot Fix
UPDATE `creature_template` SET `mingold` = 1111, `maxgold` = 3333 , `faction_A` = 14 , `faction_H` = 14, `lootid` = 29915 WHERE `entry` = 29915;
-- Loot
DELETE FROM `creature_loot_template` WHERE `entry` = 29915;
INSERT INTO `creature_loot_template` VALUES
(29915,43297,1,1,0,1,1),     -- Damaged Necklace
(29915,41843,-99,1,0,1,1),   -- Key to Vaelen's Chains
(29915,43089,98,1,0,1,1),    -- Vrykul Bones
(29915,33470,23,1,0,1,4),    -- Frostweave Cloth
(29915,43852,14,1,0,1,1),    -- Thick Fur Clothing Scraps
(29915,43851,14,1,0,1,1),    -- Fur Clothing Scraps
(29915,33454,4,1,0,1,1),     -- Salted Venison
(29915,33445,3,1,0,1,1),     -- Honeymint Tea
(29915,42422,14,1,0,1,1),    -- Jotunheim Cage Key
(29915,33447,1.9,1,0,1,1);   -- Runic Healing Potion 
-- Fix Quest 'Forging the Keystone' #13285 
-- (Workaround - Missing Symboleffects)
SET @Brann  = 31810;
SET @Voice  = 31814;
SET @Quest  = 13285;
SET @PAura  = 60963; -- See Quest Brann Bronzebeard (TOI)
-- creatures to spawn
DELETE FROM `creature` WHERE `id` IN (@Voice,@Brann);
INSERT INTO `creature`(`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(@Brann,571,1,1,0,0,7848.97,-1392.95,1534.06,6.02204,120,0,0,132,0,0,0,0,0,0),
(@Voice,571,1,1,0,0,7859.68,-1396.07,1534.06,5.99062,300,0,0,42,0,0,0,0,0,0);
-- update creature_template
UPDATE `creature_template` SET `AIName` = 'SmartAI', `flags_extra` = `flags_extra`| 128 WHERE `entry` = @Voice;
UPDATE `creature_template` SET `npcflag` = 1, `minlevel` = 80, `maxlevel` = 80, `exp` = 2, `mindmg` = 422, `maxdmg` = 586, `attackpower` = 642, `dmg_multiplier` = 7.5, `minrangedmg` = 345, `maxrangedmg` = 509, `rangedattackpower` = 103, `AIName` = 'SmartAI' WHERE `entry` = @Brann;
-- set Brann invisible without questactivity
DELETE FROM `creature_template_addon` WHERE `entry` = @Brann;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
(@Brann,0,0,0,4097,0, '49414 0'); -- add Aura: Generic Quest Invisibility 1
-- on quest #13285 active - player see Brann at Temple of Invention
DELETE FROM `spell_area` WHERE `spell` = @PAura;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_start_active`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`) VALUES 
(@PAura,4466,13285,1,13285,0,0,2,1);
-- creature text
DELETE FROM `creature_text` WHERE `entry` IN (@Voice,@Brann);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@Brann,1,0,"Right. Let's see if we can finish this keystone.",0,0,100,1,0,0,'Brann Bronzebeard - TempleOfInnovation - text1'),
(@Brann,2,0,"The keystone is completed! We've done it, $n!",0,0,100,1,5,0,'Brann Bronzebeard - TempleOfInnovation - text2'),
(@Brann,3,0,"Who knows what secrets await within Ulduar's archives? I'm off to discover them. Thank you again for your help, $n. Without it, I'd still be searching for that key.",0,0,100,1,0,0,'Brann Bronzebeard - TempleOfInnovation - text3'),
(@Voice,1,0,"Welcome, Brann Bronzebeard. I am all that remains of this temple's guardian.",0,0,100,1,0,0,'A Distant Voice - TempleOfInnovation - text1'),
(@Voice,2,0,"You have proven yourself as an explorer and seeker of knowledge.",0,0,100,1,0,0,'A Distant Voice - TempleOfInnovation - text2'),
(@Voice,3,0,"You have been a steadfast ally of the Earthen.",0,0,100,1,0,0,'A Distant Voice - TempleOfInnovation - text3'),
(@Voice,4,0,"You and your companions have proven yourselves in combat and in the pursuit of keystone.",0,0,100,1,0,0,'A Distant Voice - TempleOfInnovation - text4'),
(@Voice,5,0,"Your motives are pure. The keystone's parts shall be reunited. Go to Ulduar and learn the answers to your questions, Brann Bronzebeard.",0,0,100,1,0,0,'A Distant Voice - TempleOfInnovation - text5');
-- npc_text
DELETE FROM `npc_text` WHERE `ID` = @Brann;
INSERT INTO `npc_text` (`ID`,`text0_0`,`text0_1`,`lang0`,`prob0`,`em0_0`,`em0_1`,`em0_2`,`em0_3`,`em0_4`,`em0_5`,`text1_0`,`text1_1`,`lang1`,`prob1`,`em1_0`,`em1_1`,`em1_2`,`em1_3`,`em1_4`,`em1_5`,`text2_0`,`text2_1`,`lang2`,`prob2`,`em2_0`,`em2_1`,`em2_2`,`em2_3`,`em2_4`,`em2_5`,`text3_0`,`text3_1`,`lang3`,`prob3`,`em3_0`,`em3_1`,`em3_2`,`em3_3`,`em3_4`,`em3_5`,`text4_0`,`text4_1`,`lang4`,`prob4`,`em4_0`,`em4_1`,`em4_2`,`em4_3`,`em4_4`,`em4_5`,`text5_0`,`text5_1`,`lang5`,`prob5`,`em5_0`,`em5_1`,`em5_2`,`em5_3`,`em5_4`,`em5_5`,`text6_0`,`text6_1`,`lang6`,`prob6`,`em6_0`,`em6_1`,`em6_2`,`em6_3`,`em6_4`,`em6_5`,`text7_0`,`text7_1`,`lang7`,`prob7`,`em7_0`,`em7_1`,`em7_2`,`em7_3`,`em7_4`,`em7_5`,`WDBVerified`) VALUES
(@Brann, '<Brann looks at you expectantly.>','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,1);
-- gossip_menu
DELETE FROM `gossip_menu` WHERE `entry`= @Brann;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(@Brann,@Brann);
-- gossip_menu_option
DELETE FROM `gossip_menu_option` WHERE `menu_id` = @Brann;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@Brann,0,0,"I'm ready, Brann. Let's make the keystone.",1,1,0,0,0,0,0,'');
-- waypoints
DELETE FROM `waypoints` WHERE `entry` = @Brann;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(@Brann,1,7848.97,-1392.95,1534.06,'ToI Brann Bronzebeard wp1'),
(@Brann,2,7859.68,-1396.07,1534.06,'ToI Brann Bronzebeard wp2'),
(@Brann,3,7800.47,-1409.72,1534.56,'ToI Brann Bronzebeard wp3');
-- SmartAI
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` = @Brann;
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid` IN (@Brann*100,@Brann*100+1);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@Brann,0,0,0,62,0,100,0,@Brann,0,0,0,80,@Brann*100,0,0,0,0,0,1,0,0,0,0,0,0,0,'on gossip select - start script1'),
(@Brann,0,1,2,40,0,100,0,2,@Brann,0,0,54,35000,0,0,0,0,0,1,0,0,0,0,0,0,0,'reached wp2 - pause'),
(@Brann,0,2,0,61,0,100,0,0,0,0,0,80,@Brann*100+1,0,0,0,0,0,1,0,0,0,0,0,0,0,'start script2'),
(@Brann,0,3,0,40,0,100,0,3,@Brann,0,0,55,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,'stop at wp3 - after 3sec despawn'),
-- script1
(@Brann*100,9,0,0,0,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'turn off gossip flag'),
(@Brann*100,9,1,0,0,0,100,0,1000,1000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'say text1'),
(@Brann*100,9,2,0,0,0,100,0,1000,1000,0,0,53,0,@Brann,0,0,0,0,1,0,0,0,0,0,0,0,'wp start'),
-- script2
(@Brann*100+1,9,0,0,0,0,100,0,0,0,0,0,5,467,0,0,0,0,0,1,0,0,0,0,0,0,0,'emote mining'),
(@Brann*100+1,9,1,0,0,0,100,0,2000,2000,0,0,1,1,0,0,0,0,0,9,@Voice,0,10,0,0,0,0,'Voice say text1'),
(@Brann*100+1,9,2,0,0,0,100,0,5000,5000,0,0,1,2,0,0,0,0,0,9,@Voice,0,10,0,0,0,0,'Voice say text2'),
(@Brann*100+1,9,3,0,0,0,100,0,5000,5000,0,0,1,3,0,0,0,0,0,9,@Voice,0,10,0,0,0,0,'Voice say text3'),
(@Brann*100+1,9,4,0,0,0,100,0,5000,5000,0,0,1,4,0,0,0,0,0,9,@Voice,0,10,0,0,0,0,'Voice say text4'),
(@Brann*100+1,9,5,0,0,0,100,0,5000,5000,0,0,1,5,0,0,0,0,0,9,@Voice,0,10,0,0,0,0,'Voice say text5'),
(@Brann*100+1,9,6,0,0,0,100,0,5000,5000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Brann say text2'),
(@Brann*100+1,9,7,0,0,0,100,0,0,0,0,0,33,@Brann,0,0,0,0,0,7,0,0,0,0,0,0,0,'give quest credit'),
(@Brann*100+1,9,8,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,3.33754,'turn'),
(@Brann*100+1,9,9,0,0,0,100,0,5000,5000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Brann say text3'),
(@Brann*100+1,9,10,0,0,0,100,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'set run');
-- conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = @Brann;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15,@Brann,0,0,9,@Quest,0,0,0,'', 'show gossip menu option if player has quest 13285');
UPDATE `creature_template` SET `faction_A`=14, `faction_H`=14, `unit_flags`=6, `InhabitType`=7, `AIName`='SmartAI', `flags_extra`=130 WHERE `entry`=33104;
UPDATE `creature_template` SET `unit_flags`=512, `flags_extra`=130 WHERE `entry`=33105;

DELETE FROM `smart_scripts` WHERE `entryorguid`=33104;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33104,0,0,0,1,0,100,3,4000,4000,0,0,11,62304,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Algalon Asteroid - Cast Cosmic Smash 10N'),
(33104,0,1,0,1,0,100,5,4000,4000,0,0,11,64597,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Algalon Asteroid - Cast Cosmic Smash 25N');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (62304,64597);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13, 62304, 18, 1, 33105),
(13, 64597, 18, 1, 33105);

DELETE FROM `spell_script_names` WHERE `spell_id` IN (62301,64598,62293,62295,62311,64596);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(62301, 'spell_cosmic_smash'),
(64598, 'spell_cosmic_smash'),
(62293, 'spell_cosmic_smash_summon_trigger'),
(62295, 'spell_cosmic_smash_summon_target'),
(62311, 'spell_cosmic_smash_dmg'),
(64596, 'spell_cosmic_smash_dmg');

UPDATE `instance_encounters` SET `creditType`=0, `creditEntry`=26632 WHERE `entry` IN (375,376);

DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=9118;
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(9118,5,61716,0,''),
(9118,6,543,0,''),
(9118,16,181,0,'');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=61716;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(61716,61719,2, 'Rabbit Costume - trigger Easter Lay Noblegarden Egg Aura');

UPDATE `creature_template` SET `ScriptName`='npc_spring_rabbit' WHERE `entry`=32791;
UPDATE `achievement_criteria_data` SET `value1`=186 WHERE `criteria_id`=9199 AND `type`=6;

UPDATE `quest_template` SET `RewOrReqMoney`=58000, `RewMoneyMaxLevel`=99300 WHERE `entry` IN (13100,13103);

-- ----------------------------------------------
-- Fix Quest 'Projection and Plans' #12060 #12061
-- ----------------------------------------------
-- Projections and Plans Kill Bunny
UPDATE `creature_template` SET `AIName` = 'SmartAI', `unit_flags` = 2, `flags_extra` = 0 WHERE entry = 27853;
-- SAI
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 27853;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(27853,0,0,0,10,0,100,0,1,30,1000,1000,11,49731,2,0,0,0,0,7,0,0,0,0,0,0,0,'on LOS - give quest credit');
-- -----------------------------------------------------------------------------------------------------
-- Fix Quest 'Out of Body Experience' #12327
-- Workaround - NPC's doesn't say text's (Invisibility???) - Arugal levitating???
-- -----------------------------------------------------------------------------------------------------
SET @Arug       = 27620;    -- Shade of Arugal
SET @Vala       = 27619;    -- Valanar
SET @Ther       = 27624;    -- Theraldis
SET @Kele       = 27618;    -- Keleseth
SET @Athe       = 27616;    -- Atherann    
SET @Channel    = 49128;    -- Arugal Event Channel
SET @NPCAura    = 49130;    -- Arugal Event Invisibility 
SET @PAura      = 49097;    -- Out of Body Experience Invisibility + Detection + Teleport Silverpine
SET @Teleb      = 49098;    -- Quest Credit??? + Teleport back
SET @QCredit    = 49131;    -- Out of Body Experience Quest Credit
SET @Bunny      = 27622;    -- Arugal Rotation Bunny
-- ------------------------------------------------------------------------------------------------------
-- update creature_templates
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `AIName` = 'SmartAI' ,`unit_flags` = `unit_flags` | 2 WHERE entry IN (@Arug,@Vala,@Ther,@Kele,@Athe);
UPDATE `creature_template` SET `InhabitType` = 4 WHERE entry = @Arug;
UPDATE `creature_template` SET `AIName` = 'SmartAI', `unit_flags` = 2, `flags_extra` = 0, `InhabitType` = 7, `type_flags` = 1024 WHERE entry = @Bunny;
-- spawn Creatures
DELETE FROM `creature` WHERE `id` IN (@Arug,@Vala,@Ther,@Kele,@Athe,@Bunny);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@Arug,0,1,1,0,0,-463.526,1499.51,20.4721,1.55035,300,0,0,10635,0,0,0,0,0,0),
(@Athe,0,1,1,0,0,-458.712,1504.8,16.9815,3.93558,300,0,0,29820,0,0,0,0,0,0),
(@Kele,0,1,1,0,0,-471.433,1500.51,18.4603,0.024287,300,0,0,28830,0,0,0,0,0,0),
(@Vala,0,1,1,0,0,-462.81,1491.7,17.2292,1.65734,300,0,0,96100,3309,0,0,0,0,0),
(@Ther,0,1,1,0,0,-472.925,1495.71,18.3354,0.577431,300,0,0,28830,0,0,0,0,0,0),
(@Bunny,0,1,1,0,0,-463.526,1499.51,20.4721,4.4418,300,0,0,10635,0,0,0,0,0,0);
-- Cast: Teleport back on AuraRemove: Out of Body Experience 
DELETE FROM `spell_linked_spell` WHERE `spell_effect` = @Teleb;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES 
(-@PAura,@Teleb,0,'on Remove Out of Body Experience - Tele back');
-- define Teleport Destinations
DELETE FROM `spell_target_position` WHERE `id` IN (@PAura,@Teleb);
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES 
(@PAura,0,-465.413,1496.71,17.379,1.068),       -- Silverpine Forrest
(@Teleb,571,3842.16,-3428.43,293.105,1.8776);   -- Grizzly Hills
-- creature_text
DELETE FROM `creature_text` WHERE `entry` IN (@Vala,@Ther);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(@Vala,0,0,"Rise, Arugal! The power of the Lich King commands you!",0,0,100,0,0,0,'Prince Valanar at SilverpineForrest - say text'),
(@Ther,0,0,"Yes... he shall suit our needs perfectly. Have him sent to Solstice Village when you're ready. Arthas will not be pleased if we fall behind schedule.",0,0,100,0,0,0,'Prince Theraldis at SilverpineForrest - say text');
-- Auras
DELETE FROM `creature_template_addon` WHERE `entry` IN (@Arug,@Vala,@Ther,@Kele,@Athe,@Bunny);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
(@Ther,0,10721,0,4097,0,'49130 0 49130 1'), -- Theraldis add Mount: Purple Skeletal Warhorse
(@Vala,0,0,0,4097,0,'49130 0 49130 1'),
(@Kele,0,0,0,4097,0,'49130 0 49130 1'),
(@Athe,0,0,0,4097,0,'49130 0 49130 1'),
(@Arug,0,0,0,4097,26,'49130 0 49130 1'),
(@Bunny,0,0,0,4097,0,'49130 0 49130 1');
-- SAI
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (@Arug,@Vala,@Ther,@Kele,@Athe,@Bunny);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = @Bunny*100;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
-- Valanar
(@Vala,0,0,0,11,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Valanar - set passive on spawn'),
(@Vala,0,1,0,1,0,100,1,1000,1000,1000,1000,11,@Channel,2,0,0,0,0,11,@Bunny,15,0,0,0,0,0, 'Valanar cast Channelspell at Arugal'),
(@Vala,0,2,0,38,0,100,0,0,1,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Valanar - on dataset 0 1 - say text'),
-- Keleseth
(@Kele,0,0,0,11,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keleseth - set passive on spawn'),
(@Kele,0,1,0,1,0,100,1,1000,1000,1000,1000,11,@Channel,2,0,0,0,0,11,@Bunny,15,0,0,0,0,0, 'Keleseth cast Channelspell at Arugal'),
-- Atherann
(@Athe,0,0,0,11,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Atherann - set passiv on spawn'),
(@Athe,0,1,0,1,0,100,1,1000,1000,1000,1000,11,@Channel,2,0,0,0,0,11,@Bunny,15,0,0,0,0,0, 'Atherann cast Channelspell at Arugal'),
-- Theraldis
(@Ther,0,0,0,11,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Theraldis - set passive on spawn'),
(@Ther,0,1,0,38,0,100,0,0,1,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Theraldis - on dataset 0 1 - say text'),
-- Arugal                                             
(@Arug,0,0,0,11,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Arugal - set passive on spawn'),
-- Arugal Rotation Bunny
(@Bunny,0,0,0,10,0,100,0,1,15,1000,1000,80,@Bunny*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'on LOS - start script'),
(@Bunny*100,9,0,0,0,0,100,0,3000,3000,0,0,45,0,1,0,0,0,0,9,@Vala,15,0,0,0,0,0, 'Valanar - setdata 0 1'),
(@Bunny*100,9,1,0,0,0,100,0,5000,5000,0,0,45,0,1,0,0,0,0,9,@Ther,15,0,0,0,0,0, 'Theraldis - setdata 0 1'),
(@Bunny*100,9,2,0,0,0,100,0,5000,5000,0,0,11,@QCredit,2,0,0,0,0,7,0,0,0,0,0,0,0, 'give cuest credit');


-- Fix Multiple Spawn of Saragosa (26231) on ItemUse (35690- spell 46793) 
UPDATE creature_template SET AIName = 'SmartAI' WHERE entry = 26231;
-- remove item on summon creature
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 26231;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(26231,0,0,0,54,0,100,0,0,0,0,0,57,35690,1,0,0,0,0,7,0,0,0,0,0,0,0,'on spawn Saragosa - remove Item:Arcane Power Focus from player');