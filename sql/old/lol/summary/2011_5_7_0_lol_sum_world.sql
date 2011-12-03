DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=61920;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,61920,18,1,32857),
(13,61920,18,1,32867),
(13,61920,18,1,32927);

-- Fix Quest 'Catching up with Brann' #12920
SET @Brann  = 29579;
SET @Quest  = 12920;
UPDATE `creature_template` SET `gossip_menu_id` = @Brann, `npcflag` = `npcflag` | 1, `AIName` = 'SmartAI' WHERE `entry` = @Brann;
-- creature text
DELETE FROM `creature_text` WHERE `entry` = @Brann;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(@Brann,1,0,"I... I can understand you now! Well, now that we can talk to each other, you have some explaining to do!",0,0,100,1,0,0,'Brann Bronzebeard text1'),
(@Brann,2,0,"How did you get my communicator from the Explorers' League?",0,0,100,1,5,0,'Brann Bronzebeard text2'),
(@Brann,3,0,"If the Explorers' League sent men, I didn't see any trace of them. I found your note buried in a camp overrun by iron dwarves.",0,0,100,1,0,0,'Player text3'),
(@Brann,4,0,"You have my thanks for dispatching the iron dwarves. But why would the Horde have an interest in me?",0,0,100,1,0,0,'Brann Bronzebeard text4'),
(@Brann,5,0,"A scout found the remains of your journal in Thor Modan. We've been looking for you ever since.",0,0,100,1,0,0,'Player text5'),
(@Brann,6,0,"That wouldn't be Scout Vor'takh, would it? Even I know of his reputation for ruthlessness. He means to abduct me, then?",0,0,100,1,0,0,'Brann Bronzebeard text6'),
(@Brann,7,0,"If you've seen the journal, then you know what I've been discovering. The titans' own creations are at war with each other!",0,0,100,1,0,0,'Brann Bronzebeard text7'),
(@Brann,8,0,"Loken and his iron dwarf minions have ousted the Earthen from Ulduar and taken over the city.",0,0,100,1,0,0,'Brann Bronzebeard text8'),
(@Brann,9,0,"If we spend our time and strength fighting with each other, Loken will use Ulduar's resources to destroy both Horde and Alliance.",0,0,100,1,0,0,'Brann Bronzebeard text9'),
(@Brann,10,0,"Speak to the commander at your post, lad, and persuade him to abandon Vor'takh's foolish plan.",0,0,100,1,0,0,'Brann Bronzebeard text10');
-- gossip_menu_option
DELETE FROM `gossip_menu_option` WHERE `menu_id` = @Brann;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES
(@Brann,0,0,"Do you understand me? We should be able to understand each other now.",1,1,0,0,0,0,0,'');
-- SmartAI
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` = @Brann;
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid` = @Brann*100;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@Brann,0,0,0,62,0,100,0,@Brann,0,0,0,80,@Brann*100,0,0,0,0,0,1,0,0,0,0,0,0,0,'on gossip select - start script1'),
-- script1
(@Brann*100,9,0,0,0,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'turn off gossip & questgiver flag'),
(@Brann*100,9,1,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,23,0,0,0,0,0,0,0,'turn to invoker'),
(@Brann*100,9,2,0,0,0,100,0,1000,1000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'say text1'),
(@Brann*100,9,3,0,0,0,100,0,4000,4000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'say text2'),
(@Brann*100,9,4,0,0,0,100,0,6000,6000,0,0,84,3,0,0,0,0,0,7,0,0,0,0,0,0,0,'player say text3'),
(@Brann*100,9,5,0,0,0,100,0,9000,9000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,'say text4'),
(@Brann*100,9,6,0,0,0,100,0,7000,7000,0,0,84,5,0,0,0,0,0,7,0,0,0,0,0,0,0,'player say text5'),
(@Brann*100,9,7,0,0,0,100,0,6000,6000,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,'say text6'),
(@Brann*100,9,8,0,0,0,100,0,7000,7000,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,'say text7'),
(@Brann*100,9,9,0,0,0,100,0,8000,8000,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'say text8'),
(@Brann*100,9,10,0,0,0,100,0,6000,6000,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0,'say text9'),
(@Brann*100,9,11,0,0,0,100,0,9000,9000,0,0,1,10,0,0,0,0,0,1,0,0,0,0,0,0,0,'say text10'),
(@Brann*100,9,12,0,0,0,100,0,3000,3000,0,0,33,@Brann,0,0,0,0,0,7,0,0,0,0,0,0,0,'give quest credit'),
(@Brann*100,9,13,0,0,0,100,0,0,0,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'turn on gossip & questgiver flag');
-- conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = @Brann;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15,@Brann,0,0,9,@Quest,0,0,0,'', 'show gossip menu option if player has quest 12920');













-- Fix Creature Loot of Rar Elite Mobs in Nordend
-- source: www.old.wowhead.de
UPDATE `creature_template` SET `lootid` = 32357 WHERE `entry` = 32357;  -- Old Crystalbark
UPDATE `creature_template` SET `lootid` = 32358 WHERE `entry` = 32358;  -- Fumblub Gearwind
UPDATE `creature_template` SET `lootid` = 32361 WHERE `entry` = 32361;  -- Icehorn
UPDATE `creature_template` SET `lootid` = 32400 WHERE `entry` = 32400;  -- Tukemuth
UPDATE `creature_template` SET `lootid` = 32409 WHERE `entry` = 32409;  -- Crazed Indu'le Survivor
UPDATE `creature_template` SET `lootid` = 32417 WHERE `entry` = 32417;  -- Scarlet Highlord Daion
UPDATE `creature_template` SET `lootid` = 32517 WHERE `entry` = 32517;  -- Loque'nahak
UPDATE `creature_template` SET `lootid` = 32485 WHERE `entry` = 32485;  -- King Krush
UPDATE `creature_template` SET `lootid` = 32481 WHERE `entry` = 32481;  -- Aotona
UPDATE `creature_template` SET `lootid` = 32377 WHERE `entry` = 32377;  -- Perobas the Bloodthirster
UPDATE `creature_template` SET `lootid` = 32386 WHERE `entry` = 32386;  -- Vigdis die Kriegsmaid
UPDATE `creature_template` SET `lootid` = 32398 WHERE `entry` = 32398;  -- King Ping
UPDATE `creature_template` SET `lootid` = 32422 WHERE `entry` = 32422;  -- Grocklar
UPDATE `creature_template` SET `lootid` = 32429 WHERE `entry` = 32429;  -- Seething Hate
UPDATE `creature_template` SET `lootid` = 32438 WHERE `entry` = 32438;  -- Syreian the Bonecarver
UPDATE `creature_template` SET `lootid` = 38453 WHERE `entry` = 38453;  -- Arcturis
UPDATE `creature_template` SET `lootid` = 32447 WHERE `entry` = 32447;  -- Zul'drak Sentinel
UPDATE `creature_template` SET `lootid` = 32471 WHERE `entry` = 32471;  -- Griegen
UPDATE `creature_template` SET `lootid` = 32475 WHERE `entry` = 32475;  -- Terror Spinner
UPDATE `creature_template` SET `lootid` = 33776 WHERE `entry` = 33776;  -- Gondria
UPDATE `creature_template` SET `lootid` = 32630 WHERE `entry` = 32630;  -- Vyragosa
UPDATE `creature_template` SET `lootid` = 32500 WHERE `entry` = 32500;  -- Dirkee
UPDATE `creature_template` SET `lootid` = 32491 WHERE `entry` = 32491;  -- Time-Lost Proto Drake
UPDATE `creature_template` SET `lootid` = 35189 WHERE `entry` = 35189;  -- Skoll
UPDATE `creature_template` SET `lootid` = 32501 WHERE `entry` = 32501;  -- High Thane Jorfus
UPDATE `creature_template` SET `lootid` = 32495 WHERE `entry` = 32495;  -- Hildana Deathstealer
UPDATE `creature_template` SET `lootid` = 32487 WHERE `entry` = 32487;  -- Putridus the Ancient
-- Loot
DELETE FROM `creature_loot_template` WHERE `entry` IN 
(32357,32358,32361,32400,32409,32417,32517,32485,32481,32377,32386,32398,32422,32429,32438,38453,32447,32471,32475,33776,32630,32500,32491,35189,32501,32495,32487);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
-- Old Crystalbark
(32357,44649,99,1,0,1,1),
(32357,44663,97,1,0,1,1),
-- Fumblub Gearwind
(32358,44666,99,1,0,1,1),
(32358,44663,98,1,0,1,1),
-- Icehorn
(32361,44667,100,1,0,1,1),
(32361,44663,98,1,0,1,1),
-- Tukemuth
(32400,44673,99,1,0,1,1),
(32400,44663,92,1,0,1,1),
(32400,42104,-33,1,0,1,1),
-- Crazed Indu'le Survivor
(32409,44672,99,1,0,1,1),
(32409,44663,96,1,0,1,1),
-- Scarlet Highlord Daion
(32417,44671,99,1,0,1,1),
(32417,44663,97,1,0,1,1),
-- Loque'nahak
(32517,44688,73,1,0,1,1),
(32517,44687,26,1,0,1,1),
(32517,44663,98,1,0,1,1),
-- King Krush
(32485,44683,99,1,0,1,1),
(32485,44663,96,1,0,1,1),
-- Aotona
(32481,44691,99,1,0,1,1),
(32481,44663,97,1,0,1,1),
-- Perobas the Bloodthirster
(32377,44669,100,1,0,1,1),
(32377,44663,97,1,0,1,1),
-- Vigdis die Kriegsmaid
(32386,44670,99,1,0,1,1),
(32386,44663,98,1,0,1,1),
-- King Ping
(32398,44668,100,1,0,1,1),
(32398,44663,97,1,0,1,1),
-- Grocklar
(32422,44675,98,1,0,1,1),
(32422,44663,94,1,0,1,1),
-- Seething Hate
(32429,44674,99,1,0,1,1),
(32429,44663,96,1,0,1,1),
-- Syreian the Bonecarver
(32438,44676,98,1,0,1,1),
(32438,44663,97,1,0,1,1),
-- Arcturis
(38453,51958,99,1,0,1,1),
(38453,44663,98,1,0,1,1),
-- Zul'drak Sentinel
(32447,44677,98,1,0,1,1),
(32447,44663,95,1,0,1,1),                                 
-- Griegen
(32471,44686,98,1,0,1,1),
(32471,44663,96,1,0,1,1),
-- Terror Spinner
(32475,44685,100,1,0,1,1),
(32475,44663,97,1,0,1,1),
-- Gondria
(33776,46324,99,1,0,1,1),
(33776,44663,98,1,0,1,1),
-- Vyragosa
(32630,44732,99,1,0,1,1),
(32630,44663,96,1,0,1,1),
-- Dirkee
(32500,44681,89,1,0,1,1),
(32500,44708,10,1,0,1,1),
(32500,44663,94,1,0,1,1),
-- Time-Lost Proto Drake
(32491,44682,99,1,0,1,1),
(32491,44663,99,1,0,1,1),
(32491,44168,99,1,0,1,1),
-- Skoll
(35189,49227,98,1,0,1,1),
(35189,44663,99,1,0,1,1),
-- High Thane Jorfus
(32501,44695,99,1,0,1,1),
(32501,44663,96,1,0,1,1),
(32501,41989,-33,1,0,1,1),
-- Hildana Deathstealer
(32495,44697,99,1,0,1,1),
(32495,44663,96,1,0,1,1),
-- Putridus the Ancient
(32487,44696,98,1,0,1,1),
(32487,44663,93,1,0,1,1);
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
(192181,1,0,0,64,0,100,0,0,0,0,0,80,19218100,0,2,0,0,0,1,0,0,0,0,0,0,0, 'On use start script'),
(19218100,9,0,0,0,0,100,0,1000,1000,0,0,12,30299,1,60000,0,0,0,8,0,0,0,7312.130,-710.919,791.610,4.643, 'Summon Overseer Narvir'),
(19218100,9,1,0,0,0,100,0,0,0,0,0,75,56485,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Cyclone the invoker'),
(19218100,9,2,0,0,0,100,0,27000,27000,0,0,33,30299,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Give quest credit');

DELETE FROM `creature_text` WHERE `entry`=30299;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(30299,0,0,'You didn\'t think that I was going to let you walk in here and take the Heart of the Storm, did you?',0,0,100,6,0,0,'Narvir text 0'),
(30299,1,0,'You may have killed Valduran, but that will not stop me from completing the colossus.',0,0,100,274,0,0,'Narvir text 1');
-- -------------------------------------------------------------------------------------
-- SAI for NPC's with Quests 'The Magical Kingdom of Dalaran' Quests #12794#12791#12796
-- -------------------------------------------------------------------------------------
-- Image of Archmage Aethas Sunreaver
UPDATE `creature_template`SET `AIName` = 'SmartAI', `gossip_menu_id` = 9513, `npcflag` = 3, `ScriptName` = '' WHERE `entry` IN (26471,29155,29159,29160,29162);
UPDATE `creature_template`SET `AIName` = 'SmartAI', `gossip_menu_id` = 9511, `npcflag` = 3, `ScriptName` = '' WHERE `entry` IN (26673,23729,27158,29158,29161);
UPDATE `creature_template`SET `AIName` = 'SmartAI', `gossip_menu_id` = 9780, `npcflag` = 3, `ScriptName` = '' WHERE `entry` = 29169;
-- gossip_menu_option
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (9513,9511,9780);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES
(9513,0,0,'I am ready to be teleported to Dalaran.',1,1,0,0,0,0,0,''),
(9511,0,0,'I am ready to be teleported to Dalaran.',1,1,0,0,0,0,0,''),
(9780,0,0,'I am ready to be teleported to Dalaran.',1,1,0,0,0,0,0,'');
-- SAI
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (26471,29155,29159,29160,29162,26673,23729,27158,29158,29161,29169) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
-- HORDE --
-- Image of Archmage Aethas Sunreaver
(26471,0,0,1,62,0,100,0,9513,0,0,0,85,53360,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(26471,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip'),
(26471,0,2,0,20,0,100,0,12066,0,0,0,28,47391,0,0,0,0,0,7,0,0,0,0,0,0,0,'on QuestReward 12066 - Remove:Ley Line Information'),
(26471,0,3,0,20,0,100,0,12084,0,0,0,28,47473,0,0,0,0,0,7,0,0,0,0,0,0,0,'on QuestReward 12084 - Remove:Ley Line Information'),
(26471,0,4,0,20,0,100,0,12110,0,0,0,28,47636,0,0,0,0,0,7,0,0,0,0,0,0,0,'on QuestReward 12110 - Remove:Ley Line Information'),
-- Magistrix Kaelana
(29155,0,0,1,62,0,100,0,9513,0,0,0,85,53360,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(29155,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip'),
-- Magister Varenthas
(29159,0,0,1,62,0,100,0,9513,0,0,0,85,53360,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(29159,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip'),
-- Magistrix Phaelista
(29160,0,0,1,62,0,100,0,9513,0,0,0,85,53360,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(29160,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip'),
-- Magister Tyr'ganal
(29162,0,0,1,62,0,100,0,9513,0,0,0,85,53360,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(29162,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip'),
-- ALLIANCE --
-- Image of Archmage Modera
(26673,0,0,1,62,0,100,0,9511,0,0,0,85,53360,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(26673,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip'),
(26673,0,2,0,20,0,100,0,12065,0,0,0,28,47391,0,0,0,0,0,7,0,0,0,0,0,0,0,'on QuestReward 12065 - Remove:Ley Line Information'),
(26673,0,3,0,20,0,100,0,12083,0,0,0,28,47473,0,0,0,0,0,7,0,0,0,0,0,0,0,'on QuestReward 12083 - Remove:Ley Line Information'),
(26673,0,4,0,20,0,100,0,12107,0,0,0,28,47636,0,0,0,0,0,7,0,0,0,0,0,0,0,'on QuestReward 12107 - Remove:Ley Line Information'),
-- Baron Ulrik von Stromhearth
(23729,0,0,1,62,0,100,0,9511,0,0,0,85,53360,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(23729,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip'),
-- Vas the Unstable
(27158,0,0,1,62,0,100,0,9511,0,0,0,85,53360,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(27158,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip'),
-- Magister Dath'omere
(29158,0,0,1,62,0,100,0,9511,0,0,0,85,53360,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(29158,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip'),
-- Magistrix Haelenai
(29161,0,0,1,62,0,100,0,9511,0,0,0,85,53360,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(29161,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip'),
-- NEUTRAL --
-- Magister Teronus III
(29169,0,0,1,62,0,100,0,9780,0,0,0,85,53360,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(29169,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip');
-- Conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` IN (9513,9511,9780);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15,9513,0,0,28,12791,0,0,0,'','show Gossip - if Player has Quest 12791 completed'),
(15,9511,0,0,28,12794,0,0,0,'','show Gossip - if Player has Quest 12794 completed'),
(15,9780,0,0,28,12796,0,0,0,'','show Gossip - if Player has Quest 12796 completed'),
(15,9513,0,0,2,39740,1,0,0,'','show Gossip - if Player has Item: Kirin Tor Signet'),
(15,9511,0,0,2,39740,1,0,0,'','show Gossip - if Player has Item: Kirin Tor Signet'),
(15,9780,0,0,2,39740,1,0,0,'','show Gossip - if Player has Item: Kirin Tor Signet');
DELETE FROM `spell_script_names` WHERE `spell_id`=64381;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(64381, 'spell_strength_of_the_pack');

-- Fix Quest 10526 The Thunderspike

UPDATE `gameobject_template` SET `data5`=1, `AIName`= 'SmartGameObjectAI' WHERE `entry` =184729;

UPDATE `gameobject` SET `spawntimesecs` = 30 WHERE `id` = 184729;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 21319;

DELETE FROM `smart_scripts` WHERE entryorguid = 184729 AND source_type = 1;
DELETE FROM `smart_scripts` WHERE entryorguid = 18472900 AND source_type = 9;
DELETE FROM `smart_scripts` WHERE entryorguid = 21319 AND source_type = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(184729,1,0,0,64,0,100,0,0,0,0,0,80,18472900,0,2,0,0,0,1,0,0,0,0,0,0,0, 'on Gossip Hello - Start Timed Actionlist'),
(18472900, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 12, 21319, 1, 60000, 0, 0, 0, 8, 0, 0, 0, 1315.9, 6690.4, -18.5, 0, 'on Gossip Hello - Summon Gor Grimgut'),

(21319,0,0,0,2,0,100,0,0,70,12000,12000,11,35491,2,0,0,0,0,1,0,0,0,0,0,0,0,'Below 70% HP - Cast Furious Rage');

DELETE FROM `spell_group` WHERE `spell_id` IN (61887,63486);
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (61887,63486);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(61887,61883,2, 'Lightning Tendrils - Visual'),
(63486,61883,2, 'Lightning Tendrils - Visual');

UPDATE `reference_loot_template` SET `item`=40549 WHERE `entry`=34175 AND `item`=40547;

-- ----------------------------------------------
-- Fix Quest 'Projection and Plans' #12060 #12061
-- ----------------------------------------------
-- Restore original Projections and Plans Kill Bunny & add SmartAI
DELETE FROM `creature_template` WHERE `entry`=27853;
INSERT INTO `creature_template` (`entry`,`difficulty_entry_1`,`difficulty_entry_2`,`difficulty_entry_3`,`KillCredit1`,`KillCredit2`,`modelid1`,`modelid2`,`modelid3`,`modelid4`,`name`,`subname`,`IconName`,`gossip_menu_id`,`minlevel`,`maxlevel`,`exp`,`faction_A`,`faction_H`,`npcflag`,`speed_walk`,`speed_run`,`scale`,`rank`,`mindmg`,`maxdmg`,`dmgschool`,`attackpower`,`dmg_multiplier`,`baseattacktime`,`rangeattacktime`,`unit_class`,`unit_flags`,`dynamicflags`,`family`,`trainer_type`,`trainer_spell`,`trainer_class`,`trainer_race`,`minrangedmg`,`maxrangedmg`,`rangedattackpower`,`type`,`type_flags`,`lootid`,`pickpocketloot`,`skinloot`,`resistance1`,`resistance2`,`resistance3`,`resistance4`,`resistance5`,`resistance6`,`spell1`,`spell2`,`spell3`,`spell4`,`spell5`,`spell6`,`spell7`,`spell8`,`PetSpellDataId`,`VehicleId`,`mingold`,`maxgold`,`AIName`,`MovementType`,`InhabitType`,`Health_mod`,`Mana_mod`,`Armor_mod`,`RacialLeader`,`questItem1`,`questItem2`,`questItem3`,`questItem4`,`questItem5`,`questItem6`,`movementId`,`RegenHealth`,`equipment_id`,`mechanic_immune_mask`,`flags_extra`,`ScriptName`,`WDBVerified`) VALUES
(27853,0,0,0,0,0,1126,17612,0,0,'Projections and Plans Kill Credit Bunny','','',0,1,1,0,35,35,0,1,1.14286,1,0,2,2,0,24,1,2000,0,1,33555200,8,0,0,0,0,0,1,1,0,10,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'SmartAI',0,7,1,1,1,0,0,0,0,0,0,0,0,1,0,0,128,'',12340);
-- UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=27853;
-- SAI
DELETE FROM `smart_scripts` WHERE `entryorguid`=27853 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(27853,0,0,0,1,0,100,0,1000,1000,1000,1000,11,49731,0,0,0,0,0,1,0,0,0,0,0,0,0,'Projections and Plans Kill Credit Bunny - OOC - Cast Projections and Plans: Kill Credit on self');
-- -----------------------------------------------------------------------------
-- TempFix Quests:
-- 'The Focus on the Beach' #12065 #12066
-- 'Atop the Woodlands' #12083 #12084
-- 'The End of the Line' #12107 #12110
-- Workaround (no Spellhits on Bunny??? and receive no Spellchannel from Bunny)
-- -----------------------------------------------------------------------------
-- define spell links
DELETE FROM `spell_linked_spell` WHERE `spell_effect` IN (47390,47472,47635);
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(47374,47390,0,'The Focus on the Beach - Quest Credit'),
(47469,47472,0,'Atop The Woodlands - Quest Credit'),
(47634,47635,0,'The End of The Line - Quest Credit');

-- 'The End of the Line' - 2nd Objective - The End of the Line Area Trigger Kill Credit Bunny
-- Restore original The End of the Line Area Trigger Kill Credit Bunny & add SmartAI
DELETE FROM `creature_template` WHERE `entry`=26889;
INSERT INTO `creature_template` (`entry`,`difficulty_entry_1`,`difficulty_entry_2`,`difficulty_entry_3`,`KillCredit1`,`KillCredit2`,`modelid1`,`modelid2`,`modelid3`,`modelid4`,`name`,`subname`,`IconName`,`gossip_menu_id`,`minlevel`,`maxlevel`,`exp`,`faction_A`,`faction_H`,`npcflag`,`speed_walk`,`speed_run`,`scale`,`rank`,`mindmg`,`maxdmg`,`dmgschool`,`attackpower`,`dmg_multiplier`,`baseattacktime`,`rangeattacktime`,`unit_class`,`unit_flags`,`dynamicflags`,`family`,`trainer_type`,`trainer_spell`,`trainer_class`,`trainer_race`,`minrangedmg`,`maxrangedmg`,`rangedattackpower`,`type`,`type_flags`,`lootid`,`pickpocketloot`,`skinloot`,`resistance1`,`resistance2`,`resistance3`,`resistance4`,`resistance5`,`resistance6`,`spell1`,`spell2`,`spell3`,`spell4`,`spell5`,`spell6`,`spell7`,`spell8`,`PetSpellDataId`,`VehicleId`,`mingold`,`maxgold`,`AIName`,`MovementType`,`InhabitType`,`Health_mod`,`Mana_mod`,`Armor_mod`,`RacialLeader`,`questItem1`,`questItem2`,`questItem3`,`questItem4`,`questItem5`,`questItem6`,`movementId`,`RegenHealth`,`equipment_id`,`mechanic_immune_mask`,`flags_extra`,`ScriptName`,`WDBVerified`) VALUES
(26889,0,0,0,0,0,1126,17612,0,0,'The End of the Line Area Trigger Kill Credit Bunny','','',0,1,1,0,35,35,0,1,1.14286,1,0,2,2,0,24,1,2000,0,1,33555200,8,0,0,0,0,0,1,1,0,10,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'SmartAI',0,7,1,1,1,0,0,0,0,0,0,0,0,1,0,0,128,'',12340);
-- UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=26889;

-- create KillCredit spell - using empty spell ID - (template of spell from DBC:Projections and Plans: Kill Credit #49731 was useful)
DELETE FROM `spell_dbc` WHERE `id`=47639;
INSERT INTO `spell_dbc` (`Id`,`Attributes`,`AttributesEx`,`AttributesEx2`,`AttributesEx3`,`AttributesEx4`,`AttributesEx5`,`EffectImplicitTargetA1`,`EffectImplicitTargetB1`,`CastingTimeIndex`,`ProcChance`,`EquippedItemClass`,`Effect1`,`EffectRadiusIndex1`,`EffectMiscValue1`,`Comment`) VALUES
(47639,0x29000100,0x420,0x4004,0x10000040,0x80,0x60008,22,7,1,101,-1,134,10,26889,'The End of the Line Area Trigger Kill Credit');

-- SAI
DELETE FROM `smart_scripts` WHERE `entryorguid`=26889 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(26889,0,0,0,1,0,100,0,1000,1000,1000,1000,11,47639,0,0,0,0,0,1,0,0,0,0,0,0,0,'The End of the Line Area Trigger Kill Credit Bunny - Cast The End of the Line Area Trigger Kill Credit on self');
DELETE FROM `spell_script_names` WHERE `spell_id` IN (63025, 64233);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(63025, 'spell_gravity_bomb_targeting'),
(64233, 'spell_gravity_bomb_targeting');

-- Salvaged Demolisher Mechanic Seat spellclick
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=33167;
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`quest_start`,`quest_start_active`,`quest_end`,`cast_flags`,`aura_required`,`aura_forbidden`,`user_type`)
VALUES (33167,62309,0,0,0,1,0,0,0);

