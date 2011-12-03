-- Fix quest 11162 Challenge to the Black Flight
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~768 WHERE `entry`=23789; -- Smolderwing

UPDATE `gameobject_template` SET `faction`=1732 WHERE `entry`=195139; -- Portal to Stormwind
UPDATE `gameobject_template` SET `faction`=1735 WHERE `entry`=195140; -- Portal to Orgrimmar

UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128|2 WHERE `entry` IN (18967,18968,19230); -- Dark Assault - Alliance/Horde/Legion Portal - Invisible Stalker

DELETE FROM `gameobject` WHERE `id` IN (195139, 195140);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(164, 195140, 530, 1, 1, -161.3178, 965.4099, 54.29044, 0, 0, 0, 0, 0, 200, 0, 1), -- Portal to Orgrimmar
(170, 195139, 530, 1, 1, -337.4917, 962.6188, 54.28853, 0, 0, 0, 0, 0, 200, 0, 1); -- Portal to Stormwind

UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128|2 WHERE `entry` IN (19871); -- World Trigger (World Trigger (Not Immune NPC))

DELETE FROM `game_event_creature` WHERE `guid` IN (62848,62849) AND `eventEntry`=11;
INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES 
(11, 62848),
(11, 62849);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceEntry`=41058;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(18, 0, 41058, 0, 24, 1, 29625, 0, 0, '', 'Hyldnir Harpoon target Hyldsmeet Proto-Drake'),
(18, 0, 41058, 0, 24, 1, 29754, 0, 0, '', 'Hyldnir Harpoon target Column Ornament');

-- Fix quest Strength of the Tempest
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=29079;
DELETE FROM `smart_scripts` WHERE `entryorguid`=29079 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(29079,0,0,0,9,0,100,0,0,70,2000,6000,11,53062,0,0,0,0,0,18,70,0,0,0,0,0,0,'Shrine of the Tempest - Range cast Lightning Strike'); -- GUESSING, 10% sure that this is the correct spell. Could 51213 Weather Shrine Active Aura

DELETE FROM `spell_scripts` WHERE `id`=53062;
INSERT INTO `spell_scripts` (`id`, `effIndex`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES
(53062, 0, 0, 15, 53067, 2, 0, 0, 0, 0, 0); -- Cast create item spell

UPDATE `creature_template` SET `unit_flags`=32768,`equipment_id`=53 WHERE `entry`=24062; -- Wildervar Miner
UPDATE `creature_template` SET `unit_flags`=33536 WHERE `entry`=24178; -- Shatterhorn

UPDATE `creature_model_info` SET `bounding_radius`=1.25,`combat_reach`=4.375,`gender`=0 WHERE `modelid`=22486; -- Shatterhorn

DELETE FROM `creature_template_addon` WHERE `entry` IN (24062,24178);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(24062,0,1,257,0, NULL), -- Wildervar Miner
(24178,0,3,1,0, '6606'); -- Shatterhorn, Self Visual - Sleep Until Cancelled  (DND)
DELETE FROM `creature_addon` WHERE `guid` IN (120419,120422,106573);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(120419,0,0,0,0,1,''), -- Wildervar Miner, talk
(120422,0,0,0,0,1,''); -- Wildervar Miner, talk

DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;

-- The ram meat spell may only be used if player is inside the mine
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=43209;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(17,0,43209,0,23,4534,0,0,64,'','Place Ram Meat can only be used in Wildervar Mine');

-- Insert missing spell_target_position for Place Ram Meat spell
DELETE FROM `spell_target_position` WHERE `id`=43209;
INSERT INTO `spell_target_position` (`id`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES
(43209,571,2636.288086,-5050.891113,295.537445,5.374982);

-- Shatterhorn SAI
SET @ENTRY := 24178;
SET @SPELL_GROUND_SMASH := 12734; -- Ground Smash
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Shatterhorn - On Aggro - Say Line 0'),
(@ENTRY,0,1,0,0,0,100,0,3000,5000,12000,13000,11,@SPELL_GROUND_SMASH,1,0,0,0,0,2,0,0,0,0,0,0,0,'Shatterhorn - In Combat - Cast Ground Smash'),
(@ENTRY,0,2,0,6,0,100,0,0,0,0,0,41,8000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Shatterhorn - Force Despawn 8 Seconds After Death'),
(@ENTRY,0,3,0,8,0,0,0,43209,0,0,0,19,0x300,1,0,0,0,0,1,0,0,0,0,0,0,0,'Shatterhorn - On Place Meat spellhit remove unit flags'),
(@ENTRY,0,4,0,8,0,0,0,43209,0,0,0,28,6606,1,0,0,0,0,1,0,0,0,0,0,0,0,'Shatterhorn - On Place Meat spellhit remove sleep aura'),
(@ENTRY,0,5,0,8,0,0,0,43209,0,0,0,91,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Shatterhorn - On Place Meat spellhit remove byte1 3');

-- Text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'%s wakes up from the smell of fresh meat!',16,0,100,15,0,0,'Shatterhorn on aggro line and roar at same time');

/* Target is null, can't use event_scripts
-- Event send by Place Ram Meat spell
DELETE FROM `event_scripts` WHERE `id`=15739;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES
(15739, 2, 14, 6606, 0, 0, 0, 0, 0, 0),
(15739, 3, 5, 0x6+0x35, 0x300, 0, 0, 0, 0, 0);
*/

-- Fix quest What Illidan Wants, Illidan Gets...
-- Make the npc_text entries work properly
DELETE FROM `gossip_menu` WHERE `entry` IN (8336,8342,8341,8340,8339,8338) AND `text_id` IN (10401,10405,10406,10407,10408,10409);
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES 
(8336,10401),
(8342,10405),
(8341,10406),
(8340,10407),
(8339,10408),
(8338,10409);

-- Conditions for gossip menu of quest What Illidan Wants, Illidan Gets...
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=8336;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,8336,0,0,9,10577,0,0,0,'','Only show first gossip if player is on quest What Illidan Wants, Illidan Gets...');

-- Insert options (for players)
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (8336,8342,8341,8340,8339,8338);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`) VALUES
(8336,0,0,'I bring word from Lord Illidan.',1,1,8342),
(8342,0,0,'The cipher fragment is to be moved. Have it delivered to Zuluhed.',1,1,8341),
(8341,0,0,'Perhaps you did not hear me, Ruusk. I am giving you an order from Illidan himself!',1,1,8340),
(8340,0,0,'Very well. I will return to the Black Temple and notify Lord Illidan of your unwillingness to carry out his wishes. I suggest you make arrangements with your subordinates and let them know that you will soon be leaving this world.',1,1,8339),
(8339,0,0,'Do I need to go into all the gory details? I think we are both well aware of what Lord Illidan does with those that would oppose his word. Now, I must be going! Farewell, Ruusk! Forever...',1,1,8338),
(8338,0,0,'Ah, good of you to come around, Ruusk. Thank you and farewell.',1,1,0); -- Here the quest credit is given

-- Commander Ruusk SAI
UPDATE `creature_template` SET `gossip_menu_id`=8336,`AIName`='SmartAI' WHERE `entry`=20563;
DELETE FROM `smart_scripts` WHERE `entryorguid`=20563 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(20563,0,0,1,62,0,100,0,8338,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Commander Ruusk - On Gossip Select - Close Gossip'),
(20563,0,1,0,61,0,100,0,0,0,0,0,26,10577,0,0,0,0,0,7,0,0,0,0,0,0,0,'Commander Ruusk - On Gossip Select (link) - Quest Credit');

SET @ENTRY_FIRJUS := 24213;
SET @ENTRY_JLARBORN := 24215;
SET @ENTRY_YORUS := 24214;
SET @ENTRY_OLUF := 23931;
SET @QUEST := 11300;

-- Summon Firjus on quest accept - this starts the quest
UPDATE `quest_template` SET `StartScript`=@QUEST WHERE `entry`=@QUEST;
DELETE FROM `quest_start_scripts` WHERE `id`=@QUEST;
INSERT INTO `quest_start_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(@QUEST,3,10,@ENTRY_FIRJUS,300000,0,799.653931,-4718.678711,-96.236053,4.992353);

-- Firjus, Jlarborn, Yorus and Oluf SAI
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@ENTRY_FIRJUS,@ENTRY_JLARBORN,@ENTRY_YORUS,@ENTRY_OLUF);
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (@ENTRY_FIRJUS,@ENTRY_JLARBORN,@ENTRY_YORUS,@ENTRY_OLUF);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY_FIRJUS,@ENTRY_JLARBORN,@ENTRY_YORUS,@ENTRY_OLUF) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY_FIRJUS,0,0,0,0,0,100,0,3000,6000,12000,15000,11,15284,0,0,0,0,0,2,0,0,0,0,0,0,0,'Firjus - In Combat - Cleave'),
(@ENTRY_FIRJUS,0,1,0,0,0,100,0,10000,10000,10000,10000,11,43348,0,0,0,0,0,2,0,0,0,0,0,0,0,'Firjus - In Combat - Head Crush'),
(@ENTRY_FIRJUS,0,2,0,6,0,100,1,0,0,0,0,12,@ENTRY_JLARBORN,1,300000,0,0,0,8,0,0,0,799.653931,-4718.678711,-96.236053,4.992353,'Firjus - On Death - Summon Jlarborn'),
(@ENTRY_JLARBORN,0,0,0,0,0,100,1,1000,2000,0,0,11,19131,0,0,0,0,0,2,0,0,0,0,0,0,0,'Jlarborn - In Combat - Shield Charge'),
(@ENTRY_JLARBORN,0,1,0,0,0,100,0,4000,5000,15000,16000,11,12169,0,0,0,0,0,1,0,0,0,0,0,0,0,'Jlarborn - In Combat - Shield Block'),
(@ENTRY_JLARBORN,0,2,0,0,0,100,0,7000,8000,18000,19000,11,38233,0,0,0,0,0,2,0,0,0,0,0,0,0,'Jlarborn - In Combat - Shield Bash'),
(@ENTRY_JLARBORN,0,3,0,0,0,100,0,10000,10000,10000,10000,11,8374,0,0,0,0,0,2,0,0,0,0,0,0,0,'Jlarborn - In Combat - Arcing Smash'),
(@ENTRY_JLARBORN,0,4,0,6,0,100,1,0,0,0,0,12,@ENTRY_YORUS,1,300000,0,0,0,8,0,0,0,799.653931,-4718.678711,-96.236053,4.992353,'Jlarborn - On Death - Summon Yorus'),
(@ENTRY_YORUS,0,0,0,0,0,100,0,3000,6000,12000,15000,11,15284,0,0,0,0,0,2,0,0,0,0,0,0,0,'Yorus - In Combat - Cleave'),
(@ENTRY_YORUS,0,1,0,0,0,100,0,8000,9000,18000,19000,11,41057,0,0,0,0,0,1,0,0,0,0,0,0,0,'Yorus - In Combat - Whirlwind'),
(@ENTRY_YORUS,0,2,0,6,0,100,1,0,0,0,0,12,@ENTRY_OLUF,1,300000,0,0,0,8,0,0,0,799.653931,-4718.678711,-96.236053,4.992353,'Yorus - On Death - Summon Oluf'),
(@ENTRY_OLUF,0,0,0,0,0,100,0,3000,6000,12000,15000,11,15284,0,0,0,0,0,2,0,0,0,0,0,0,0,'Oluf - In Combat - Cleave'),
(@ENTRY_OLUF,0,1,0,0,0,100,0,8000,9000,28000,29000,11,13730,0,0,0,0,0,1,0,0,0,0,0,0,0,'Oluf - In Combat - Demoralizing Shout'),
(@ENTRY_OLUF,0,2,0,0,0,100,0,7000,7000,21000,21000,11,6533,0,0,0,0,0,2,0,0,0,0,0,0,0,'Oluf - In Combat - Net'),
(@ENTRY_OLUF,0,3,0,0,0,100,1,1000,1000,0,0,11,42870,0,0,0,0,0,2,0,0,0,0,0,0,0,'Oluf - In Combat - Throw Harpoon'),
(@ENTRY_OLUF,0,4,0,0,0,100,0,10000,10000,10000,10000,11,41057,0,0,0,0,0,1,0,0,0,0,0,0,0,'Oluf - In Combat - Whirlwind'),
(@ENTRY_OLUF,0,5,0,6,0,100,1,0,0,0,0,50,186640,90000,0,0,0,0,8,0,0,0,799.653931,-4718.678711,-96.236053,4.992353,'Oluf - On Death - Summon Ancient Cipher');

-- Doctor Razorgrin SAI
SET @ENTRY := 25678;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `creature_ai_texts` WHERE `entry`=-767;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Doctor Razorgin - On Aggro - Say Line 0 (random)');
-- Texts
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'Ah, good... more parts!',14,0,100,0,0,0,'Part of the Doctor Razorgin on aggro lines'),
(@ENTRY,0,1,'Clear!',14,0,100,0,0,0,'Part of the Doctor Razorgin on aggro lines'),
(@ENTRY,0,2,'Fresh meat!',14,0,100,0,0,0,'Part of the Doctor Razorgin on aggro lines'),
(@ENTRY,0,3,'I recommened evisceration!',14,0,100,0,0,0,'Part of the Doctor Razorgin on aggro lines'),
(@ENTRY,0,4,'It''s no good... you need more work first.',14,0,100,0,0,0,'Part of the Doctor Razorgin on aggro lines'),
(@ENTRY,0,5,'Live, damn you!',14,0,100,0,0,0,'Part of the Doctor Razorgin on aggro lines'),
(@ENTRY,0,6,'The doctor is in!',14,0,100,0,0,0,'Part of the Doctor Razorgin on aggro lines');

UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`unit_flags`=0x8040,`speed_run`=2.85714,`InhabitType`=`InhabitType`|4 WHERE `entry`=32358; -- Fumblub Gearwind
UPDATE `creature_template` SET `faction_A`=1885,`faction_H`=1885,`unit_flags`=0x8040,`speed_run`=1.28571 WHERE `entry`=32438; -- Syreian the Bonecarver

UPDATE `creature_model_info` SET `bounding_radius`=1.25,`combat_reach`=3.919432,`gender`=1 WHERE `modelid`=27970; -- Syreian the Bonecarver

UPDATE `creature_addon` SET `mount`=25587, `bytes1`=0x3000000 WHERE `guid`=151938; -- Fumblub Gearwind

DELETE FROM `creature_template_addon` WHERE `entry` IN (32358,32438);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(32358,25587,0x3000000,1,0, NULL), -- Fumblub Gearwind
(32438,0,0,2,0, NULL); -- Syreian the Bonecarver

-- Removing obsolete quest 960, which was replaced by quest 961
DELETE FROM `creature_questrelation` WHERE `quest`=960;
DELETE FROM `creature_involvedrelation` WHERE `quest`=960;

DELETE FROM `disables` WHERE `sourceType`=1 AND `entry`=960;
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES
(1, 960, 0, '', '', 'Deprecated quest');

-- Skin loot entry
SET @LibraryLaborer := 29724;
SET @UldarBoss := 29725;
SET @AirStrip := 29726;
SET @ReavandDispo := 29727;
SET @HallsofStone := 29728;
SET @Dirkee := 29729;
SET @Recovery := 29730;
-- Ref Loot Entry
SET @UldarBossRef := 50013;
SET @AirStripRef := 50013+1;
SET @HallsofStoneRef := 50013+2;
SET @ReavandDispoRef := 50013+3;
SET @LibraryLaborerRef := 50013+4;
-- Add loot to the skinning table 
DELETE FROM `skinning_loot_template` WHERE `entry` IN (@Recovery,@Dirkee,@LibraryLaborer,@ReavandDispo,@HallsofStone,@AirStrip,@UldarBoss);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES 
(@Recovery, 41338, 42, 1, 0, 1, 3), -- Sprung Whirlygig
(@Recovery, 41337, 44, 1, 0, 1, 3), -- Whizzed out Gizmo
(@Recovery, 39690, 9, 1, 0, 1, 3), -- Volatile Blasting trigger
(@Recovery, 39681, 4, 1, 0, 2, 4), -- Handfull of copper bolts
(@Recovery, 49050, 0.5, 1, 0, 1, 1), -- jeeves
(@Recovery, 39682, 0.5, 1, 0, 1, 1), -- Overcharged Capacitor
(@Dirkee, 41338, 42, 1, 0, 1, 3), -- Sprung Whirlygig
(@Dirkee, 41337, 44.5, 1, 0, 1, 3), -- Whizzed out Gizmo
(@Dirkee, 39690, 10, 1, 0, 1, 3), -- Volatile Blasting trigger
(@Dirkee, 39681, 3, 1, 0, 2, 4), -- Handfull of copper bolts
(@Dirkee, 49050, 0.5, 1, 0, 1, 1), -- jeeves
(@LibraryLaborer , 1, 100, 1, 0, -@LibraryLaborerRef, 1),
(@ReavandDispo, 1, 100, 1, 0, -@ReavandDispoRef, 1),
(@HallsofStone, 1, 100, 1, 0, -@HallsofStoneRef, 1),
(@AirStrip, 1, 100, 1, 0, -@AirStripRef, 1),
(@UldarBoss, 1, 100, 1, 0, -@UldarBossRef, 1);
-- Add loot to the reference table 
DELETE FROM `reference_loot_template` WHERE `entry` IN (@AirStripRef,@ReavandDispoRef,@LibraryLaborerRef,@HallsofStoneRef,@UldarBossRef);
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES 
(@AirStripRef, 41338, 33, 1, 0, 1, 1), -- Sprung Whirlygig
(@AirStripRef, 41337, 42, 1, 0, 1, 1), -- Whizzed out Gizmo
(@AirStripRef, 39690, 13, 1, 0, 1, 3), -- Volatile Blasting trigger
(@AirStripRef, 39681, 10, 1, 0, 1, 4), -- Handfull of copper bolts
(@AirStripRef, 39686, 1.2, 1, 0, 1, 1), -- Frost steel Tube
(@AirStripRef, 49050, 0.8, 1, 0, 1, 1), -- jeeves
(@ReavandDispoRef, 41338, 40, 1, 0, 1, 3), -- Sprung Whirlygig
(@ReavandDispoRef, 41337, 40, 1, 0, 1, 3), -- Whizzed out Gizmo
(@ReavandDispoRef, 39690, 9.5, 1, 0, 1, 3), -- Volatile Blasting trigger
(@ReavandDispoRef, 39681, 9.5, 1, 0, 2, 4), -- Handfull of copper bolts
(@ReavandDispoRef, 39686, 0.5, 1, 0, 1, 1), -- Frost steel Tube
(@ReavandDispoRef, 49050, 0.5, 1, 0, 1, 1), -- jeeves
(@LibraryLaborerRef, 41338, 43, 1, 0, 1, 3), -- Sprung Whirlygig
(@LibraryLaborerRef, 41337, 42, 1, 0, 1, 3), -- Whizzed out Gizmo
(@LibraryLaborerRef, 39690, 9, 1, 0, 1, 3), -- Volatile Blasting trigger
(@LibraryLaborerRef, 39681, 4, 1, 0, 2, 4), -- Handfull of copper bolts
(@LibraryLaborerRef, 49050, 1, 1, 0, 1, 1), -- jeeves
(@LibraryLaborerRef, 39686, 0.5, 1, 0, 1, 1), -- Frost steel Tube
(@LibraryLaborerRef, 39682, 0.5, 1, 0, 1, 1), -- Overcharged Capacitor
(@HallsofStoneRef, 41338, 43.5, 1, 0, 1, 3), -- Sprung Whirlygig
(@HallsofStoneRef, 41337, 42, 1, 0, 1, 3), -- Whizzed out Gizmo
(@HallsofStoneRef, 39690, 8, 1, 0, 1, 3), -- Volatile Blasting trigger
(@HallsofStoneRef, 39681, 5, 1, 0, 2, 4), -- Handfull of copper bolts
(@HallsofStoneRef, 49050, 0.5, 1, 0, 1, 1), -- jeeves
(@HallsofStoneRef, 39686, 0.5, 1, 0, 1, 1), -- Frost steel Tube
(@HallsofStoneRef, 39682, 0.5, 1, 0, 1, 1), -- Overcharged Capacitor
(@UldarBossRef, 35627, 43, 1, 0, 2, 10), -- Eternal Shadow
(@UldarBossRef, 35624, 42, 1, 0, 4, 10), -- Eternal Earth
(@UldarBossRef, 35623, 43, 1, 0, 2, 6), -- Eternal Air
(@UldarBossRef, 36860, 42, 1, 0, 2, 6), -- Eternal Fire
(@UldarBossRef, 39690, 30, 1, 0, 16, 19), -- Volatile Blasting trigger
(@UldarBossRef, 39686, 26, 1, 0, 2, 3), -- Frost steel Tube
(@UldarBossRef, 39682, 22, 1, 0, 5, 5), -- Overcharged Capacitor
(@UldarBossRef, 39681, 21, 1, 0, 8, 10), -- Handfull of copper bolts
(@UldarBossRef, 49050, 2, 1, 0, 1, 1); -- jeeves

UPDATE `creature_template` SET `skinloot`=@LibraryLaborer WHERE `entry` IN (29389,29724); -- Library Guardian and Mechagnome Laborer
UPDATE `creature_template` SET `skinloot`=@ReavandDispo WHERE `entry` IN (34273,34274,29382); -- Stromforged Reaver and XB-488 Disposalbot
UPDATE `creature_template` SET `skinloot`=@Dirkee WHERE `entry`=32500; -- Dirkee
UPDATE `creature_template` SET `skinloot`=@Recovery WHERE `entry` IN (34267,34268); -- Parts Recovery Technician
UPDATE `creature_template` SET `skinloot`=@AirStrip WHERE `entry` IN (32358,25792,25758,25752,25753,25814,25793); -- Fumblub Gearwind, Scavenge-bot 005-B6, Defendo-tank 66D, Scavenge-bot 004-A8, Sentry-bot 57-K, Fizzcrank Mechagnome, 55-D Collect-a-tron
UPDATE `creature_template` SET `skinloot`=@HallsofStone WHERE `entry` IN (27972,31383,27971,31387); -- Lightning Construct, Unrelenting Construct
UPDATE `creature_template` SET `skinloot`=@UldarBoss WHERE `entry` IN (34332,34106,33113,34003,33293,33885); -- Leviathan Mk II, Flame Leviathan, XT-002 Deconstructor

-- Jormunger Control Orb
DELETE FROM `gameobject` WHERE `id`=192262;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES 
(173, 192262, 571, 1, 0x8, 8497.219, -90.90104, 789.2875, 0.1396245, 0, 0, 0.06975555, 0.9975641, 0, 0, 0);

DELETE FROM `creature` WHERE `id` IN (30301,30322,30300);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(4089, 30301, 571, 1, 0x8, 0, 0, 8497.78, -99.0251, 786.528, 3.01942, 120, 0, 0, 1, 0, 0, 0, 0, 0), -- Tamed Jormungar
(4090, 30322, 571, 1, 0x8, 0, 0, 8505.47, -86.2532, 787.339, 3.28122, 120, 0, 0, 1, 0, 0, 0, 0, 0), -- Earthen Jormungar Handler
(4765, 30322, 571, 1, 0x8, 0, 0, 8502.62, -111.308, 790.176, 3.05433, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(6095, 30322, 571, 1, 0x8, 0, 0, 8498.78, -46.0375, 788.895, 2.53073, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(6096, 30300, 571, 1, 0x8, 0, 0, 8015.63, -126.515, 865.719, 3.39914, 120, 0, 0, 1, 0, 0, 0, 0, 0); -- Iron Colossus

-- Template updates
UPDATE `gameobject_template` SET `flags`=0x4 WHERE `entry`=192262; -- Jormungar Control Orb
UPDATE `creature_template` SET `faction_A`=1771,`faction_H`=1771,`unit_flags`=0x8040,`speed_walk`=2.8,`speed_run`=1.5873 WHERE `entry`=30300; -- Iron Colossus
UPDATE `creature_template` SET `faction_A`=1770,`faction_H`=1770,`npcflag`=0x1,`unit_flags`=0x300,`equipment_id`=1003,`speed_run`=0.99206 WHERE `entry`=30322; -- Earthen Jormungar Handler
UPDATE `creature_template` SET `faction_A`=113,`faction_H`=113,`unit_flags`=0x300,`speed_walk`=6,`speed_run`=2.14286,`VehicleId`=227 WHERE `entry`=30301; -- Tamed Jormungar

-- Model data
UPDATE `creature_model_info` SET `bounding_radius`=3.1,`combat_reach`=50,`gender`=0 WHERE `modelid`=27093; -- Iron Colossus
UPDATE `creature_model_info` SET `bounding_radius`=0.31,`combat_reach`=1,`gender`=0 WHERE `modelid`=26091; -- Earthen Jormungar Handler
UPDATE `creature_model_info` SET `bounding_radius`=1.55,`combat_reach`=5,`gender`=2 WHERE `modelid`=26935; -- Tamed Jormungar

-- Addon data for creature 30300 (Iron Colossus)
DELETE FROM `creature_template_addon` WHERE `entry` IN (30300,30322,30301);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(30300,0,0,1,0, NULL), -- Iron Colossus
(30322,0,0,1,0, NULL), -- Earthen Jormungar Handler
(30301,0,0,1,0, NULL); -- Tamed Jormungar

DELETE FROM `spell_area` WHERE spell=56526;
INSERT INTO `spell_area`(`spell`,`area`,`quest_start`,`quest_start_active`,`quest_end`,`aura_spell`,`racemask`,`gender`,`autocast`) VALUES 
(56526,4436,13007,1,13007,0,0,2,1), -- Snowdrift Plains
(56526,4435,13007,1,13007,0,0,2,1); -- Navirs Cradle

DELETE FROM `spell_dbc` WHERE `Id`=31247;
INSERT INTO `spell_dbc`(`Id`,`Dispel`,`Mechanic`,`Attributes`,`AttributesEx`,`AttributesEx2`,`AttributesEx3`,`AttributesEx4`,`AttributesEx5`,`AttributesEx6`,`AttributesEx7`,`Stances`,`StancesNot`,`Targets`,`CastingTimeIndex`,`AuraInterruptFlags`,`ProcFlags`,`ProcChance`,`ProcCharges`,`MaxLevel`,`BaseLevel`,`SpellLevel`,`DurationIndex`,`RangeIndex`,`StackAmount`,`EquippedItemClass`,`EquippedItemSubClassMask`,`EquippedItemInventoryTypeMask`,`Effect1`,`Effect2`,`Effect3`,`EffectDieSides1`,`EffectDieSides2`,`EffectDieSides3`,`EffectRealPointsPerLevel1`,`EffectRealPointsPerLevel2`,`EffectRealPointsPerLevel3`,`EffectBasePoints1`,`EffectBasePoints2`,`EffectBasePoints3`,`EffectMechanic1`,`EffectMechanic2`,`EffectMechanic3`,`EffectImplicitTargetA1`,`EffectImplicitTargetA2`,`EffectImplicitTargetA3`,`EffectImplicitTargetB1`,`EffectImplicitTargetB2`,`EffectImplicitTargetB3`,`EffectRadiusIndex1`,`EffectRadiusIndex2`,`EffectRadiusIndex3`,`EffectApplyAuraName1`,`EffectApplyAuraName2`,`EffectApplyAuraName3`,`EffectAmplitude1`,`EffectAmplitude2`,`EffectAmplitude3`,`EffectMultipleValue1`,`EffectMultipleValue2`,`EffectMultipleValue3`,`EffectMiscValue1`,`EffectMiscValue2`,`EffectMiscValue3`,`EffectMiscValueB1`,`EffectMiscValueB2`,`EffectMiscValueB3`,`EffectTriggerSpell1`,`EffectTriggerSpell2`,`EffectTriggerSpell3`,`EffectSpellClassMaskA1`,`EffectSpellClassMaskA2`,`EffectSpellClassMaskA3`,`EffectSpellClassMaskB1`,`EffectSpellClassMaskB2`,`EffectSpellClassMaskB3`,`EffectSpellClassMaskC1`,`EffectSpellClassMaskC2`,`EffectSpellClassMaskC3`,`MaxTargetLevel`,`SpellFamilyName`,`SpellFamilyFlags1`,`SpellFamilyFlags2`,`SpellFamilyFlags3`,`MaxAffectedTargets`,`DmgClass`,`PreventionType`,`DmgMultiplier1`,`DmgMultiplier2`,`DmgMultiplier3`,`AreaGroupId`,`SchoolMask`,`Comment`) VALUES
(31247,0,0,256,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,-1,0,0,77,0/*122*/,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,'Silithyst Cap Reward');

UPDATE `creature_template` SET `minlevel`=82, `maxlevel`=82 WHERE `entry`=31674; -- Ingvar the Plunderer (1)

DELETE FROM `player_factionchange_items` WHERE `alliance_id`=48356; -- Wrong entry
 
DELETE FROM `player_factionchange_spells` WHERE `alliance_id` IN (67093,67091,67095,67096,67092,67085,67080,67082,67087,67083,67084,67086,60867,67065,67064,67079,67066);
INSERT INTO `player_factionchange_spells` (`alliance_id`,`horde_id`) VALUES
(67093,67132),
(67091,67130),
(67095,67134),
(67096,67135),
(67092,67131),
(67085,67141),
(67080,67136),
(67082,67138),
(67087,67139),
(67083,67143),
(67084,67140),
(67086,67142),
(60867,60866),
(67065,67147),
(67064,67144),
(67079,67145),
(67066,67146);
 
DELETE FROM `player_factionchange_items` WHERE `alliance_id` IN (47003,47626,44503,47654);
INSERT INTO `player_factionchange_items` (`race_A`,`alliance_id`,`commentA`,`race_H`,`horde_id`,`commentH`) VALUES
(0,47003,'Dawnbreaker Greaves',0,47430,'Dawnbreaker Sabatons'),
(0,47626,'Plans: Sunforged Breastplate',0,47643,'Plans: Sunforged Breastplate'),
(0,44503,'Schematic: Mekgineers Chopper',0,44502,'Schematic: Mechano-Hog'),
(0,47654,'Pattern: Bejeweled Wizards Bracers',0,47639,'Pattern: Bejeweled Wizards Bracers');

SET @ENTRY := 33499; -- Skeletal Woodcutter
SET @QUEST_LOOT := 45080; -- Large Femur
SET @QUEST := 13654; -- There's Something About the Squire
SET @SPELL1 := 63124; -- Incapacitate Maloric
SET @SPELL2 := 63126; -- Search Maloric

-- add quest item to Skeletal Woodcutter
UPDATE `creature_template` SET `lootid`=`entry` WHERE `entry`=@ENTRY;
DELETE FROM `creature_loot_template` WHERE `entry`=@ENTRY;
INSERT INTO `creature_loot_template` VALUES
(@ENTRY,@QUEST_LOOT,-100,1,0,1,1); -- 100% drop

-- set visual effects on the skeletons
DELETE FROM `creature_template_addon` WHERE `entry`=@ENTRY;
INSERT INTO `creature_template_addon` (`entry`,`emote`) VALUES
(@ENTRY,234); -- chopping wood

SET @ENTRY := 33498; -- Maloric
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,23,0,100,0,@SPELL1,1,0,0,81,16777216,0,0,0,0,0,1,0,0,0,0,0,0,0,'Maloric - on Aura: Incapacitate Maloric - set npcflag: Spellclick'),
(@ENTRY,0,1,0,23,0,100,0,@SPELL1,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Maloric - on NoAura: Incapacitate Maloric - set npcflag: none');

-- conditions for Large Femur and Maloric
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceEntry`=@QUEST_LOOT;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=@SPELL2;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(18,0,@QUEST_LOOT,0,24,1,@ENTRY,0,0,'','Item:Large Femur only target Maloric'),
(17,0,@SPELL2,0,9,@QUEST,0,0,0,'','Needs taken Quest 13654 to perform Spell: Search Maloric');

-- cast search Maloric, get quest item, quest completed
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=@ENTRY;
INSERT INTO `npc_spellclick_spells` VALUES
(@ENTRY,@SPELL2,@QUEST,1,@QUEST,2,0,0,0);

-- [Q] Scourgekabob
-- Despawn Mummy Bunny SAI
SET @ENTRY := 27931;
SET @SPELL_CREDIT := 50035;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts`  (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`)  VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,11,@SPELL_CREDIT,0,0,0,0,0,7,0,0,0,0,0,0,0,'Despawn Mummy Bunny - Just Summoned - Quest Credit');

-- Fix an older sql guid
DELETE FROM `gameobject` WHERE `id`=192262; -- Jormunger Control Orb
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES 
(173, 192262, 571, 1, 0x8, 8497.219, -90.90104, 789.2875, 0.1396245, 0, 0, 0.06975555, 0.9975641, 0, 0, 0);

-- Saronite Mine Slave SAI
SET @ENTRY := 31397;
SET @QUEST := 13300;
SET @GOSSIP := 10137;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY,@ENTRY*100);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,62,0,100,0,@GOSSIP,0,0,0,80,@ENTRY*100,0,2,0,0,0,1,0,0,0,0,0,0,0,"Saronite Mine Slave - On Gossip Select - Run Script"),
(@ENTRY*100,9,0,0,0,0,100,1,0,0,0,0,72,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Saronite Mine Slave - On Script - Close Gossip"),
(@ENTRY*100,9,1,0,0,0,100,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Saronite Mine Slave - On Script - Yell Line (random)"),
(@ENTRY*100,9,2,0,0,0,100,1,0,0,0,0,33,31866,0,0,0,0,0,0,0,0,0,0,0,0,0,"Saronite Mine Slave - On Script - Quest Credit"),
(@ENTRY*100,9,3,0,0,0,100,1,0,0,0,0,41,5000,0,0,0,0,0,0,0,0,0,0,0,0,0,"Saronite Mine Slave - On Script - Force Despawn");

-- Texts
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"AHAHAHAHA... you'll join us soon enough!",14,0,100,0,0,0,"Saronite Mine Slave"),
(@ENTRY,0,1,"I don't want to leave! I want to stay here!",14,0,100,0,0,0,"Saronite Mine Slave"),
(@ENTRY,0,2,"NO! You're wrong! The voices in my head are beautiful!",14,0,100,0,0,0,"Saronite Mine Slave"),
(@ENTRY,0,3,"My life for you!",14,0,100,0,0,0,"Saronite Mine Slave"),
(@ENTRY,0,4,"I'm coming, master!",14,0,100,0,0,0,"Saronite Mine Slave");

-- Actual story menu
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=14068;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,14068);

-- Insert option menu
DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`) VALUES
(@GOSSIP,0,0,"Go on, you're free. Get out of here!",1,1,0);

-- Only show gossip if player is on quest Slaves to Saronite
DELETE FROM `conditions` WHERE `SourceGroup`=@GOSSIP AND `ConditionValue1`=@QUEST;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP,0,0,9,@QUEST,0,0,0,'',"Only show first gossip if player is on quest Slaves to Saronite");

-- Prisoners of the Grimtotems
UPDATE `gameobject_template` SET `ScriptName`='go_blackhoof_cage'/*,`data2`=30000*/ WHERE `entry`=186287;
UPDATE `quest_template` SET `ReqSpellCast1`=0 WHERE `entry`=11145;
DELETE FROM `creature_text` WHERE `entry`=23720;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(23720,0,0,"Thank you! There's no telling what those brutes would've done to me.",12,0,100,18,0,0,"Theramore Prisoner");

-- Electromental SAI
SET @ENTRY := 21729;
SET @SPELL_LIGHTNING_BOLT := 37273;
SET @SPELL_MAGNETO_COLLECTOR := 37136;
SET @SPELL_ELECTROMENTAL_VISUAL := 37248;
SET @SPELL_SUMMON_ELECTROMENTAL := 37264;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,0,0,0,0,11,@SPELL_ELECTROMENTAL_VISUAL,1,0,0,0,0,1,0,0,0,0,0,0,0,"Electromental - Out Of Combat - Cast Power Converters: Electromental Visual"),
(@ENTRY,0,1,0,0,0,100,0,1000,2000,2400,3800,11,@SPELL_LIGHTNING_BOLT,1,0,0,0,0,2,0,0,0,0,0,0,0,"Electromental - In Combat - Cast Lightning Bolt"),
(@ENTRY,0,2,0,8,0,100,0,@SPELL_MAGNETO_COLLECTOR,0,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Electromental - on spellhit - increment event phase'),
(@ENTRY,0,3,0,6,1,100,0,0,0,0,0,33,21731,0,0,0,0,0,7,0,0,0,0,0,0,0,'Electromental - on death during phase 1 - give quest credit');

-- Insert spell
DELETE FROM `spell_dbc` WHERE `Id`=@SPELL_SUMMON_ELECTROMENTAL;
INSERT INTO `spell_dbc`(`Id`,`Dispel`,`Mechanic`,`Attributes`,`AttributesEx`,`AttributesEx2`,`AttributesEx3`,`AttributesEx4`,`AttributesEx5`,`Stances`,`StancesNot`,`Targets`,`CastingTimeIndex`,`AuraInterruptFlags`,`ProcFlags`,`ProcChance`,`ProcCharges`,`MaxLevel`,`BaseLevel`,`SpellLevel`,`DurationIndex`,`RangeIndex`,`StackAmount`,`EquippedItemClass`,`EquippedItemSubClassMask`,`EquippedItemInventoryTypeMask`,`Effect1`,`Effect2`,`Effect3`,`EffectDieSides1`,`EffectDieSides2`,`EffectDieSides3`,`EffectRealPointsPerLevel1`,`EffectRealPointsPerLevel2`,`EffectRealPointsPerLevel3`,`EffectBasePoints1`,`EffectBasePoints2`,`EffectBasePoints3`,`EffectMechanic1`,`EffectMechanic2`,`EffectMechanic3`,`EffectImplicitTargetA1`,`EffectImplicitTargetA2`,`EffectImplicitTargetA3`,`EffectImplicitTargetB1`,`EffectImplicitTargetB2`,`EffectImplicitTargetB3`,`EffectRadiusIndex1`,`EffectRadiusIndex2`,`EffectRadiusIndex3`,`EffectApplyAuraName1`,`EffectApplyAuraName2`,`EffectApplyAuraName3`,`EffectAmplitude1`,`EffectAmplitude2`,`EffectAmplitude3`,`EffectMultipleValue1`,`EffectMultipleValue2`,`EffectMultipleValue3`,`EffectMiscValue1`,`EffectMiscValue2`,`EffectMiscValue3`,`EffectMiscValueB1`,`EffectMiscValueB2`,`EffectMiscValueB3`,`EffectTriggerSpell1`,`EffectTriggerSpell2`,`EffectTriggerSpell3`,`EffectSpellClassMaskA1`,`EffectSpellClassMaskA2`,`EffectSpellClassMaskA3`,`EffectSpellClassMaskB1`,`EffectSpellClassMaskB2`,`EffectSpellClassMaskB3`,`EffectSpellClassMaskC1`,`EffectSpellClassMaskC2`,`EffectSpellClassMaskC3`,`MaxTargetLevel`,`SpellFamilyName`,`SpellFamilyFlags1`,`SpellFamilyFlags2`,`SpellFamilyFlags3`,`MaxAffectedTargets`,`DmgClass`,`PreventionType`,`DmgMultiplier1`,`DmgMultiplier2`,`DmgMultiplier3`,`AreaGroupId`,`SchoolMask`,`Comment`) VALUES
(@SPELL_SUMMON_ELECTROMENTAL,0,0,256,0,0,0,0,0,0,0,0,1,0,0,101,0,0,0,0,26,1,0,-1,0,0,28,0,0,1,0,0,0,0,0,0,0,0,0,0,0,18,38,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,@ENTRY,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,'Power Converters: Summon Electromental');

-- Fix quest 12166: The Liquid Fire Of Elune
SET @SPELL := 46770;
SET @VISUAL := 47972;
SET @ITEM := 36956;
SET @ELK := 26616;
SET @GRIZZLY := 26643;
SET @ELKDUMMY = 27111;
SET @GRIZZLYDUMMY = 27112;

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@ELK, @GRIZZLY);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ELK,@GRIZZLY) AND `source_type`=0;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (2661601,2661602,2661603,2664301,2664302,2664303);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@GRIZZLY,0,0,1,8,0,100,0x01,@SPELL,0,0,0,33,@GRIZZLYDUMMY,0,0,0,0,0,7,0,0,0,0,0,0,0,'Rabid Grizzly - On spell hit - Give kill credit for quest 12166'),
(@GRIZZLY,0,1,0,61,0,100,1,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Rabid Grizzly - Despawn after 5 seconds'),
(@ELK,0,0,1,8,0,100,0x01,@SPELL,0,0,0,33,@ELKDUMMY,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Blighted Elk - On spell hit - Give kill credit for quest 12166'),
(@ELK,0,1,0,61,0,100,1,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Blighted Elk - Despawn after 5 secondes');
 
-- Fix the quest item to allow it to only target the two quest NPCs
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceEntry`=@ITEM;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(18,0,@ITEM,0,24,2,@GRIZZLY,0,0,'','Item Elune Liquid Fire target Rabid Grizzly (dead)'),
(18,0,@ITEM,0,24,2,@ELK,0,0,'','Item Elune Liquid Fire target Blighted Elk (dead)');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=46770;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(46770, 47972, 1, 'Liquid Fire of Elune');

UPDATE `creature_template` SET `baseattacktime`=2000,`unit_flags`=`unit_flags`|0x8040,`equipment_id`=1014 WHERE `entry` IN (35309,35310); -- Argent Lightwielder
UPDATE `creature_template` SET `baseattacktime`=2000,`unit_flags`=`unit_flags`|0x8040,`equipment_id`=279 WHERE `entry` IN (35307,35308); -- Argent Priestess
UPDATE `creature_template` SET `baseattacktime`=1500,`unit_flags`=`unit_flags`|0x140,`equipment_id`=1926 WHERE `entry` IN (35451,35490); -- The Black Knight

UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1.5,`gender`=1 WHERE `modelid`=29763; -- Argent Lightwielder
UPDATE `creature_model_info` SET `bounding_radius`=0.208,`combat_reach`=1.5,`gender`=1 WHERE `modelid`=29761; -- Argent Priestess
UPDATE `creature_model_info` SET `bounding_radius`=0.766,`combat_reach`=3,`gender`=0 WHERE `modelid`=29837; -- The Black Knight

DELETE FROM `creature_template_addon` WHERE `entry` IN (35309,35307,35451);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(35309,0,0,1,0, NULL), -- Argent Lightwielder
(35307,0,0,1,0, NULL), -- Argent Priestess
(35451,0,0,1,0, NULL); -- The Black Knight

-- Related to last commit:
UPDATE `creature_model_info` SET `bounding_radius`=1.222,`combat_reach`=3,`gender`=0 WHERE `modelid`=23966; -- Rabid Grizzly
UPDATE `creature_model_info` SET `bounding_radius`=0.98,`combat_reach`=0.98,`gender`=0 WHERE `modelid`=23952; -- Blighted Elk
DELETE FROM `creature_template_addon` WHERE `entry` IN (26616,26643);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(26616,0,0,1,0, NULL), -- Blighted Elk
(26643,0,0,1,0, NULL); -- Rabid Grizzly

-- [Q] In the Name of Loken
-- Gavrock SAI
SET @ENTRY := 26420;
SET @QUEST := 12204;
SET @GOSSIP := 9485;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY,@ENTRY*100);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,62,0,100,0,@GOSSIP,0,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gavrock - On Gossip Select - Run Script"),
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Gavrock - On Script - Close Gossip"),
(@ENTRY*100,9,1,0,0,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gavrock - On Script - Remove Gossip & Quest Flags"),
(@ENTRY*100,9,2,0,0,0,100,0,5000,5000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gavrock - On Script - Say Text 0"),
(@ENTRY*100,9,3,0,0,0,100,0,10000,10000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gavrock - On Script - Say Text 1"),
(@ENTRY*100,9,4,0,0,0,100,0,15000,15000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gavrock - On Script - Say Text 2"),
(@ENTRY*100,9,5,0,0,0,100,0,0,0,0,0,33,@ENTRY,0,0,0,0,0,7,0,0,0,0,0,0,0,"Gavrock - On Script - Quest Credit"),
(@ENTRY*100,9,6,0,0,0,100,0,0,0,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gavrock - On Script - Add Gossip & Quest Flags");

-- NPC talk text insert from sniff
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Ah, yes. Loken is well known to me.",12,0,100,0,0,0,"Gavrock"),
(@ENTRY,1,0,"It is he who commands the sons of iron in their war against us.",12,0,100,0,0,0,"Gavrock"),
(@ENTRY,2,0,"From his hiding place, he oversees their preparations for war with the goal of exterminating the stone giants!",12,0,100,0,0,0,"Gavrock");

-- Add gossip_menu_option condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`) VALUES
(15,@GOSSIP,0,9,@QUEST);

-- Hugh Glass SAI
SET @ENTRY := 26484;
SET @QUEST := 12204;
SET @GOSSIP := 9484;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY,@ENTRY*100);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,62,0,100,0,@GOSSIP,0,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hugh Glass - On Gossip Select - Run Script"),
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Hugh Glass - On Script - Close Gossip"),
(@ENTRY*100,9,1,0,0,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hugh Glass - On Script - Remove Gossip & Quest Flags"),
(@ENTRY*100,9,2,0,0,0,100,0,5000,5000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hugh Glass - On Script - Say Text 0"),
(@ENTRY*100,9,3,0,0,0,100,0,10000,10000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hugh Glass - On Script - Say Text 1"),
(@ENTRY*100,9,5,0,0,0,100,0,0,0,0,0,33,@ENTRY,0,0,0,0,0,7,0,0,0,0,0,0,0,"Hugh Glass - On Script - Quest Credit"),
(@ENTRY*100,9,6,0,0,0,100,0,0,0,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hugh Glass - On Script - Add Gossip & Quest Flags");

DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP AND `id`=0;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(@GOSSIP, 0, 0, 'Calm down, I want to ask you about the Iron Dwarves and Loken.', 1, 1, 0, 0, 0, 0, NULL);

-- NPC talk text insert from sniff
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`TEXT`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"He's out to get me, too! I'd be careful around here if I was you, traveler. You never know which tree he's hiding behind!",12,0,100,0,0,0,"Hugh Glass"),
(@ENTRY,1,0,"That's not something Limpy Joe would ask! But yeah, I know Loken.",12,0,100,0,0,0,"Hugh Glass");

-- Add gossip_menu_option condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`) VALUES
(15,@GOSSIP,0,9,@QUEST);

-- [Q] The Dreghood Elder
SET @ENTRY_AYLAAN := 20679;
SET @ENTRY_AKORU := 20678;
SET @ENTRY_MOROD := 20677;

-- Aylaan the Waterwalker - Akoru the Firecaller - Morod the Windstirrer SAI
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@ENTRY_AKORU,@ENTRY_AYLAAN,@ENTRY_MOROD);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY_AKORU,@ENTRY_AYLAAN,@ENTRY_MOROD);
INSERT INTO `smart_scripts`  (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`)  VALUES
(@ENTRY_AYLAAN,0,0,0,62,0,100,0,8161,0,0,0,33,@ENTRY_AYLAAN,0,0,0,0,0,7,0,0,0,0,0,0,0,"Aylaan the Waterwalker - On Gossip Select - Quest Credit The Dreghood Elders"),
(@ENTRY_AYLAAN,0,1,0,62,0,100,0,8161,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Aylaan the Waterwalker - On gossip option select - Close gossip"),
(@ENTRY_AKORU,0,0,0,62,0,100,0,8163,0,0,0,33,@ENTRY_AKORU,0,0,0,0,0,7,0,0,0,0,0,0,0,"Akoru the Firecaller - On Gossip Select - Quest Credit The Dreghood Elders"),
(@ENTRY_AKORU,0,1,0,62,0,100,0,8163,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Akoru the Firecaller - On gossip option select - Close gossip"),
(@ENTRY_MOROD,0,0,0,62,0,100,0,8162,0,0,0,33,@ENTRY_MOROD,0,0,0,0,0,7,0,0,0,0,0,0,0,"Morod the Windstirrer - On Gossip Select - Quest Credit The Dreghood Elders"),
(@ENTRY_MOROD,0,1,0,62,0,100,0,8162,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Morod the Windstirrer - On gossip option select - Close gossip");

-- Only show first gossip if player is on quest The Dreghood Elders
DELETE FROM `conditions` WHERE `SourceGroup` IN (8161,8163,8162) AND `ConditionValue1` IN (10368);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,8161,0,0,9,10368,0,0,0,'',"Only show gossip if player is on quest The Dreghood Elders"),
(15,8163,0,0,9,10368,0,0,0,'',"Only show gossip if player is on quest The Dreghood Elders"),
(15,8162,0,0,9,10368,0,0,0,'',"Only show gossip if player is on quest The Dreghood Elders");

-- [Q] The Warm-Up
-- Kirgaraak SAI
SET @ENTRY := 29352;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;


DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
DELETE FROM smart_scripts WHERE source_type=9 AND entryorguid=@ENTRY*100;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`, `event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`, `target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,0,0,5,0,0,80,@ENTRY*100,0,2,0,0,0,1,0,0,0,0,0,0,0,'Kirgaraak - At 5% HP - Run Script'),
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,33,30221,0,0,0,0,0,7,0,0,0,0,0,0,0,'Kirgaraak - On Script - Quest Credit'),
(@ENTRY*100,9,1,0,0,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kirgaraak - On Script - Make Friendly'),
(@ENTRY*100,9,2,0,0,0,100,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kirgaraak - On Script - Evade'),
(@ENTRY*100,9,3,0,0,0,100,0,10000,10000,0,0,2,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kirgaraak - On Script - Reset Faction');

UPDATE `creature_template` SET `exp`=0 WHERE `entry`=24921; -- Cosmetic Trigger - LAB

UPDATE `creature_model_info` SET `bounding_radius`=2,`combat_reach`=7,`gender`=0 WHERE `modelid`=26202; -- Kirgaraak

DELETE FROM `creature_template_addon` WHERE `entry` IN (@ENTRY,29918,24921);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@ENTRY,0,0,1,0, NULL), -- Kirgaraak
(29918,0,0,1,0, NULL), -- Warbear Matriarch
(24921,0,0,1,0, NULL); -- Cosmetic Trigger - LAB

-- Not working correctly. It will work when spells get fixed
-- 1) Can't have more than one 54324 in the same target. 2) That aura gets removed when target enters in combat and it shouldn't
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=24921;
DELETE FROM `smart_scripts` WHERE `entryorguid` BETWEEN -104008 AND -103996 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(-103996, 0, 0, 0, 1, 0, 0, 1, 500, 500, 0, 0, 11, 54324, 0, 0, 0, 0, 0, 11, @ENTRY, 60, 0, 0, 0, 0, 0, 'Cosmetic Trigger - LAB (Brunnhildar Village) - Cast Cosmetic Chains at Kirgaraak'),
(-103997, 0, 0, 0, 1, 0, 0, 1, 500, 500, 0, 0, 11, 54324, 0, 0, 0, 0, 0, 11, @ENTRY, 60, 0, 0, 0, 0, 0, 'Cosmetic Trigger - LAB (Brunnhildar Village) - Cast Cosmetic Chains at Kirgaraak'),
(-103998, 0, 0, 0, 1, 0, 0, 1, 500, 500, 0, 0, 11, 54324, 0, 0, 0, 0, 0, 11, @ENTRY, 60, 0, 0, 0, 0, 0, 'Cosmetic Trigger - LAB (Brunnhildar Village) - Cast Cosmetic Chains at Kirgaraak'),
(-103999, 0, 0, 0, 1, 0, 0, 1, 500, 500, 0, 0, 11, 54324, 0, 0, 0, 0, 0, 11, @ENTRY, 60, 0, 0, 0, 0, 0, 'Cosmetic Trigger - LAB (Brunnhildar Village) - Cast Cosmetic Chains at Kirgaraak'),
(-104000, 0, 0, 0, 1, 0, 0, 1, 500, 500, 0, 0, 11, 54324, 0, 0, 0, 0, 0, 11, @ENTRY, 60, 0, 0, 0, 0, 0, 'Cosmetic Trigger - LAB (Brunnhildar Village) - Cast Cosmetic Chains at Kirgaraak'),
(-104001, 0, 0, 0, 1, 0, 0, 1, 500, 500, 0, 0, 11, 54324, 0, 0, 0, 0, 0, 11, @ENTRY, 60, 0, 0, 0, 0, 0, 'Cosmetic Trigger - LAB (Brunnhildar Village) - Cast Cosmetic Chains at Kirgaraak'),
(-104002, 0, 0, 0, 1, 0, 0, 1, 500, 500, 0, 0, 11, 54324, 0, 0, 0, 0, 0, 11, @ENTRY, 60, 0, 0, 0, 0, 0, 'Cosmetic Trigger - LAB (Brunnhildar Village) - Cast Cosmetic Chains at Kirgaraak'),
(-104003, 0, 0, 0, 1, 0, 0, 1, 500, 500, 0, 0, 11, 54324, 0, 0, 0, 0, 0, 11, @ENTRY, 60, 0, 0, 0, 0, 0, 'Cosmetic Trigger - LAB (Brunnhildar Village) - Cast Cosmetic Chains at Kirgaraak'),
(-104004, 0, 0, 0, 1, 0, 0, 1, 500, 500, 0, 0, 11, 54324, 0, 0, 0, 0, 0, 11, @ENTRY, 60, 0, 0, 0, 0, 0, 'Cosmetic Trigger - LAB (Brunnhildar Village) - Cast Cosmetic Chains at Kirgaraak'),
(-104005, 0, 0, 0, 1, 0, 0, 1, 500, 500, 0, 0, 11, 54324, 0, 0, 0, 0, 0, 11, @ENTRY, 60, 0, 0, 0, 0, 0, 'Cosmetic Trigger - LAB (Brunnhildar Village) - Cast Cosmetic Chains at Kirgaraak'),
(-104006, 0, 0, 0, 1, 0, 0, 1, 500, 500, 0, 0, 11, 54324, 0, 0, 0, 0, 0, 11, @ENTRY, 60, 0, 0, 0, 0, 0, 'Cosmetic Trigger - LAB (Brunnhildar Village) - Cast Cosmetic Chains at Kirgaraak'),
(-104007, 0, 0, 0, 1, 0, 0, 1, 500, 500, 0, 0, 11, 54324, 0, 0, 0, 0, 0, 11, @ENTRY, 60, 0, 0, 0, 0, 0, 'Cosmetic Trigger - LAB (Brunnhildar Village) - Cast Cosmetic Chains at Kirgaraak'),
(-104008, 0, 0, 0, 1, 0, 0, 1, 500, 500, 0, 0, 11, 54324, 0, 0, 0, 0, 0, 11, @ENTRY, 60, 0, 0, 0, 0, 0, 'Cosmetic Trigger - LAB (Brunnhildar Village) - Cast Cosmetic Chains at Kirgaraak');

-- Quest:The Armor's Secrets (12980)
DELETE FROM `creature` WHERE `id`=30190;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(6337,30190,571,1,1,0,0,8256.75,-433.488,970.583,4.223697,300,0,0,1,0,0,0,0,0);

-- Anvil and Metel bars
DELETE FROM `gameobject` WHERE `id` IN (192125,192128);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(177,192125,571,1,1,8262.05,-430.288,968.272,0,0,0,-0.861628,0.507539,120,0,1),
(183,192125,571,1,1,8231.716,-451.452576,968.368835,-3.10665226,0,0,0,0,120,0,1),
(181,192128,571,1,1,8281.357,-432.069,970.723,-2.844883,0,0,-0.9890156,0.1478114,120,0,1),
(188,192128,571,1,1,8233.997,-434.379456,970.722961,-2.07693934,0,0,0,0,120,0,1),
(190,192128,571,1,1,8243.935,-429.880981,970.722961,-1.08210289,0,0,0,0,120,0,1),
(194,192128,571,1,1,8246.777,-424.707367,970.722961,-1.16936862,0,0,0,0,120,0,1),
(197,192128,571,1,1,8264.213,-432.40332,975.778564,1.134463,0,0,0,0,120,0,1);

-- Template updates
UPDATE `creature_template` SET `npcflag`=`npcflag`|1,`speed_run`=0.99206 WHERE `entry`=30190; -- Attendant Tock
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=30170; -- Mechagnome Attendant

-- Addon data
DELETE FROM `creature_template_addon` WHERE `entry` IN (30190,30170);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(30190,0,0,1,0,NULL), -- Mechagnome Attendant
(30170,0,7,1,0, NULL); -- Attendant Tock

SET @ENTRY=30190;
UPDATE `creature_template` SET `gossip_menu_id`=9880, `AIName`='SmartAI' WHERE entry=@ENTRY;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9880;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(9880,0,0,'I found this strange armor plate. Can you tell me more about it?',1,1,0,0,0,0, '');

DELETE FROM `gossip_menu` WHERE `entry`=9880;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(9880,13703);

DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=@ENTRY*100;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,62,0,100,0,9880,0,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Attendant Tock - Start Script'),
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,83,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Attendant Tock - Remove Gossip Flag'),
(@ENTRY*100,9,1,0,0,0,100,0,0,0,0,0,72,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Attendant Tock - Close Gossip'),
(@ENTRY*100,9,2,0,0,0,100,0,0,0,0,0,50,192132,77000,0,0,0,0,8,0,0,0,8262.029,-430.0284,974.1605,-2.757613, 'Attendant Tock - Summon Armor'),
(@ENTRY*100,9,3,0,0,0,100,0,4000,4000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Attendant Tock - Speach 0'),
(@ENTRY*100,9,4,0,0,0,100,0,5000,5000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Attendant Tock - Speach 1'),
(@ENTRY*100,9,5,0,0,0,100,0,4000,4000,0,0,69,0,0,0,0,0,0,8,0,0,0,8262.029,-430.0284,976.1391,1.6, 'Attendant Tock - Move'), -- Move
(@ENTRY*100,9,6,0,0,0,100,0,15000,15000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Attendant Tock - Speach 2'),
(@ENTRY*100,9,7,0,0,0,100,0,6000,6000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Attendant Tock - Speach 3'),
(@ENTRY*100,9,8,0,0,0,100,0,7000,7000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Attendant Tock - Speach 4'),
(@ENTRY*100,9,9,0,0,0,100,0,7000,7000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Attendant Tock - Speach 5'),
(@ENTRY*100,9,10,0,0,0,100,0,6000,6000,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Attendant Tock - Speach 6'),
(@ENTRY*100,9,11,0,0,0,100,0,5000,5000,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Attendant Tock - Speach 7'),
(@ENTRY*100,9,12,0,0,0,100,0,6000,6000,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Attendant Tock - Speach 8'),
(@ENTRY*100,9,13,0,0,0,100,0,0,0,0,0,69,0,0,0,0,0,0,1,0,0,0,8256.75,-433.488,970.583,4.223697, 'Attendant Tock - Move Home'),
(@ENTRY*100,9,14,0,0,0,100,0,6000,6000,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Attendant Tock - Speach 9'),
(@ENTRY*100,9,15,0,0,0,100,0,0,0,0,0,33,30190,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Attendant Tock - Quest Credit'),
(@ENTRY*100,9,16,0,0,0,100,0,0,0,0,0,82,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Attendant Tock - Add Gossip Flag');

DELETE FROM `creature_text` WHERE `entry`=30190;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(30190,0,0,'Metallic specimen of foreign origin detected.',12,0,100,0,5,0, 'Attendant Tock'),
(30190,1,0,'Beginning analysis...',12,0,100,0,0,0, 'Attendant Tock'),
(30190,2,0,'Specimen identified as an alloy of saronite and iron.',12,0,100,0,0,0, 'Attendant Tock'),
(30190,3,0,'The ore used in this sample originated deep wihin the crust of Azeroth and was recently unearthed.',12,0,100,275,0,0, 'Attendant Tock'),
(30190,4,0,'The saronite in this sample is nearly pure. Ores like this do not occur naturally on the surface of Azeroth.',12,0,100,0,0,0, 'Attendant Tock'),
(30190,5,0,'This ore can only have been created by a powerful, malevolent force. Attempting to access databanks for more information...',12,0,100,1,0,0, 'Attendant Tock'),
(30190,6,0,'Access denied?!',12,0,100,6,0,0, 'Attendant Tock'),
(30190,7,0,'Further information can only be accessed from the archives within Ulduar, by order of Keeper Loken.',12,0,100,1,0,0, 'Attendant Tock'),
(30190,8,0,'But one thing is for certain: this plate''s size, thickness, and bolt holes point to a use as armor for a colossal structure.',12,0,100,1,0,0, 'Attendant Tock'),
(30190,9,0,'Directive completed. Returning TO standby mode.',12,0,100,1,0,0, 'Attendant Tock');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=9880;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,9880,0,0,9,12980,0,0,0, '', 'The Armor''s Secrets');

-- Quest: No Where to Run (12261)
-- SAI for Destructive Ward
SET @ENTRY :=27430;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=@ENTRY*100;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,80,@ENTRY*100,0,2,0,0,0,1,0,0,0,0,0,0,0, 'Destructive Ward - On spawn Start Script'),
(@ENTRY*100,9,0,0,0,0,100,0,2000,2000,0,0,11,48715,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Destructive Ward - Summon Smoldering Skeleton'),
(@ENTRY*100,9,1,0,0,0,100,0,15000,15000,0,0,11,48715,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Destructive Ward - Summon Smoldering Skeleton'),
(@ENTRY*100,9,2,0,0,0,100,0,1000,1000,0,0,11,48735,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Destructive Ward - Destructive Ward Powerup'),
(@ENTRY*100,9,3,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Destructive Ward - Raid Emote'),
(@ENTRY*100,9,4,0,0,0,100,0,0,0,0,0,11,48733,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Destructive Ward - Destructive Pulse'),
(@ENTRY*100,9,5,0,0,0,100,0,15000,15000,0,0,11,48718,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Destructive Ward - Summon Smoldering Construct'),
(@ENTRY*100,9,6,0,0,0,100,0,15000,15000,0,0,11,48718,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Destructive Ward - Summon Smoldering Construct'),
(@ENTRY*100,9,7,0,0,0,100,0,1000,1000,0,0,11,48735,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Destructive Ward - Destructive Ward Powerup'),
(@ENTRY*100,9,8,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Destructive Ward - Raid Emote'),
(@ENTRY*100,9,9,0,0,0,100,0,0,0,0,0,11,48733,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Destructive Ward - Destructive Pulse'),
(@ENTRY*100,9,10,0,0,0,100,0,25000,25000,0,0,11,48715,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Destructive Ward - Summon Smoldering Skeleton'),
(@ENTRY*100,9,11,0,0,0,100,0,0,0,0,0,11,48715,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Destructive Ward - Summon Smoldering Skeleton'),
(@ENTRY*100,9,12,0,0,0,100,0,0,0,0,0,11,48718,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Destructive Ward - Summon Smoldering Construct'),
(@ENTRY*100,9,13,0,0,0,100,0,2000,2000,0,0,11,48735,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Destructive Ward - Destructive Ward Powerup'),
(@ENTRY*100,9,14,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Destructive Ward - Raid Emote'),
(@ENTRY*100,9,15,0,0,0,100,0,0,0,0,0,11,48734,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Destructive Ward - Destructive Barrage'),
(@ENTRY*100,9,16,0,0,0,100,0,1000,1000,0,0,11,48734,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Destructive Ward - Destructive Barrage'),
(@ENTRY*100,9,17,0,0,0,100,0,1000,1000,0,0,11,48734,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Destructive Ward - Destructive Barrage'),
(@ENTRY*100,9,18,0,0,0,100,0,0,0,0,0,11,52409,0,0,0,0,0,23,0,0,0,0,0,0,0, 'Destructive Ward - Destructive Ward Kill Credit'),
(@ENTRY*100,9,19,0,0,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Destructive Ward - Despawn');

DELETE FROM `creature_text` WHERE `entry`=27430;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(27430,0,0, 'The Destructive Ward gains in power.',41,0,100,0,0,0, 'Destructive Ward'),
(27430,1,0, 'The Destructive Ward is fully charged!',41,0,100,0,0,0, 'Destructive Ward');

-- Template update
UPDATE `creature_template` SET `exp`=2,`minlevel`=73,`maxlevel`=73,`unit_flags`=`unit_flags`|4|256,`speed_run`=1, RegenHealth=0 WHERE `entry`=27430; -- Destructive Ward

-- Model data
UPDATE `creature_model_info` SET `bounding_radius`=1,`combat_reach`=1,`gender`=2 WHERE `modelid`=25167; -- Destructive Ward
UPDATE `creature_model_info` SET `bounding_radius`=0.945,`combat_reach`=0.945,`gender`=0 WHERE `modelid`=23951; -- Snowfall Elk

-- Addon data
DELETE FROM `creature_template_addon` WHERE `entry` IN (27430,26615);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(26615,0,0,1,0, NULL), -- Snowfall Elk
(27430,0,0,1,0, NULL); -- Destructive Ward

-- [Q] Brother Against Brother
-- Lakka SAI
SET @ENTRY := 18956;
SET @QUEST := 10097;
SET @GOSSIP := 7868;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY,@ENTRY*100) AND `source_type` IN (0,9);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,62,0,100,0,@GOSSIP,0,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lakka - On Gossip Select - Run Script"),
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Lakka - On Script - Close Gossip"),
(@ENTRY*100,9,1,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Lakka - On Script - Say Text 0"), -- Target_type_action_invoker because of <name>
(@ENTRY*100,9,2,0,0,0,100,0,0,0,0,0,33,@ENTRY,0,0,0,0,0,7,0,0,0,0,0,0,0,"Lakka - On Script - Quest Credit"),
(@ENTRY*100,9,3,0,0,0,100,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lakka - On Script - Despawn");

-- NPC talk text insert
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Thank you for freeing me, $N! I'm going to make my way to Shattrath!",12,0,100,0,0,0,"Lakka");

-- Add gossip_menu_option condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`) VALUES
(15,@GOSSIP,0,9,@QUEST);

-- Make Fjola drop two items from her loot table
-- 10 Normal
UPDATE `creature_loot_template` SET `maxcount`=2 WHERE `entry`=34497 AND `item`=2;
UPDATE `creature_loot_template` SET `maxcount`=2 WHERE `entry`=34497 AND `item`=1;
-- 25 Normal
UPDATE `creature_loot_template` SET `maxcount`=2 WHERE `entry`=35350 AND `item`=2;
UPDATE `creature_loot_template` SET `maxcount`=2 WHERE `entry`=35350 AND `item`=1;
-- 10 Heroic
UPDATE `creature_loot_template` SET `maxcount`=2 WHERE `entry`=35351 AND `item`=2;
UPDATE `creature_loot_template` SET `maxcount`=2 WHERE `entry`=35351 AND `item`=1;
-- 25 Herioc
UPDATE `creature_loot_template` SET `maxcount`=2 WHERE `entry`=35352 AND `item`=2;
UPDATE `creature_loot_template` SET `maxcount`=2 WHERE `entry`=35352 AND `item`=1;

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = -58600;

DELETE FROM `creature_text` WHERE `entry` IN (36597,38995,38579,36823,39217);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(36597,0,0,'So the Light''s vaunted justice has finally arrived? Shall I lay down Frostmourne and throw myself at your mercy, Fordring?',14,0,0,0,0,17349,'The Lich King - SAY_LK_INTRO_1'),
(36597,1,0,'You''ll learn of that first hand. When my work is complete, you will beg for mercy -- and I will deny you. Your anguished cries will be testament to my unbridled power...',14,0,0,22,0,17350,'The Lich King - SAY_LK_INTRO_2'),
(36597,2,0,'I''ll keep you alive to witness the end, Fordring. I would not want the Light''s greatest champion to miss seeing this wretched world remade in my image.',14,0,0,0,0,17351,'The Lich King - SAY_LK_INTRO_3'),
(36597,3,0,'Come then champions, feed me your rage!',14,0,0,0,0,0,'The Lich King - SAY_LK_AGGRO'),
(36597,4,0,'I will freeze you from within until all that remains is an icy husk!',14,0,0,0,0,17369,'The Lich King - SAY_LK_REMORSELESS_WINTER'),
(36597,5,0,'Watch as the world around you collapses!',14,0,0,0,0,17370,'The Lich King - SAY_LK_QUAKE'),
(36597,6,0,'Val''kyr, your master calls!',14,0,0,0,0,17373,'The Lich King - SAY_LK_SUMMON_VALKYR'),
(36597,7,0,'Frostmourne hungers...',14,0,0,0,0,17366,'The Lich King - SAY_LK_HARVEST_SOUL'),
(36597,8,0,'Argh... Frostmourne, obey me!',14,0,0,0,0,17367,'The Lich King - SAY_LK_FROSTMOURNE_ESCAPE'),
(36597,9,0,'Frostmourne feeds on the soul of your fallen ally!',14,0,0,0,0,17368,'The Lich King - SAY_LK_FROSTMOURNE_KILL'),
(36597,10,0,'Hope wanes!',14,0,0,0,0,17363,'The Lich King - SAY_LK_KILL'),
(36597,10,1,'The end has come!',14,0,0,0,0,17364,'The Lich King - SAY_LK_KILL'),
(36597,11,0,'Face now your tragic end!',14,0,0,0,0,17365,'The Lich King - SAY_LK_BERSERK'),
(36597,12,0,'%s begins to cast Defile!',41,0,0,0,0,0,'The Lich King - EMOTE_DEFILE_WARNING'),
(36597,13,0,'|TInterface\\Icons\\ability_creature_disease_02.blp:16|tYou have been infected by |cFFCF00FFNecrotic Plague!|r',42,0,0,0,0,0,'The Lich King - EMOTE_NECROTIC_PLAGUE_WARNING'),
(36597,14,0,'No questions remain unanswered. No doubts linger. You ARE Azeroth''s greatest champions. You overcame every challenge I laid before you. My mightiest servants have fallen before your relentless onslaught... your unbridled fury...',14,0,0,0,0,17353,'The Lich King - SAY_LK_OUTRO_1'),
(36597,15,0,'Is it truly the righteousness that drives you? I wonder...',14,0,0,0,0,17354,'The Lich King - SAY_LK_OUTRO_2'),
(36597,16,0,'You trained them well, Fordring. You delivered the greatest fighting force this world has ever known... right into my hands -- exactly as I intended. You shall be rewarded for your unwitting sacrifice.',14,0,0,0,0,17355,'The Lich King - SAY_LK_OUTRO_3'),
(36597,17,0,'Watch now as I raise them from the dead to become masters of the Scourge. They will shroud this world in chaos and destruction. Azeroth''s fall will come at their hands -- and you will be the first to die.',14,0,0,0,0,17356,'The Lich King - SAY_LK_OUTRO_4'),
(36597,18,0,'I delight in the irony...',14,0,0,0,0,17357,'The Lich King - SAY_LK_OUTRO_5'),
(36597,19,0,'Impossible...',14,0,0,0,0,17358,'The Lich King - SAY_LK_OUTRO_6'),
(36597,20,0,'Now I stand, the lion before the lambs... and they do not fear.',14,0,0,0,0,17361,'The Lich King - SAY_LK_OUTRO_7'),
(36597,21,0,'They cannot fear.',14,0,0,0,0,17362,'The Lich King - SAY_LK_OUTRO_8'),
(38995,0,0,'We''ll grant you a swift death, Arthas. More than can be said for the thousands you''ve tortured and slain.',14,0,0,0,0,17390,'Highlord Tirion Fordring - SAY_TIRION_INTRO_1'),
(38995,1,0,'So be it. Champions, attack!',14,0,0,0,0,17391,'Highlord Tirion Fordring - SAY_TIRION_INTRO_2'),
(38995,2,0,'LIGHT, GRANT ME ONE FINAL BLESSING. GIVE ME THE STRENGTH... TO SHATTER THESE BONDS!',14,0,0,0,0,17392,'Highlord Tirion Fordring - SAY_TIRION_OUTRO_1'),
(38995,3,0,'No more, Arthas! No more lives will be consumed by your hatred!',14,0,0,0,0,17393,'Highlord Tirion Fordring - SAY_TIRION_OUTRO_2'),
(38579,0,0,'Free at last! It is over, my son. This is the moment of reckoning.',14,0,0,1,0,17397,'Terenas Menethil - SAY_TERENAS_OUTRO_1'),
(38579,1,0,'Rise up, champions of the Light!',14,0,0,0,0,17398,'Terenas Menethil - SAY_TERENAS_OUTRO_2'),
(36823,0,0,'You have come to bring Arthas to justice? To see the Lich King destroyed?',14,0,0,0,0,17394,'Terenas Menethil - SAY_TERENAS_INTRO_1'),
(36823,1,0,'First, you must escape Frostmourne''s hold, or be damned as I am; trapped within this cursed blade for all eternity.',14,0,0,0,0,17395,'Terenas Menethil - SAY_TERENAS_INTRO_2'),
(36823,2,0,'Aid me in destroying these tortured souls! Together we will loosen Frostmourne''s hold and weaken the Lich King from within!',14,0,0,0,0,17396,'Terenas Menethil - SAY_TERENAS_INTRO_3'),
(39217,0,0,'You have come to bring Arthas to justice? To see the Lich King destroyed?',14,0,0,0,0,17394,'Terenas Menethil - SAY_TERENAS_INTRO_1'),
(39217,1,0,'First, you must escape Frostmourne''s hold, or be damned as I am; trapped within this cursed blade for all eternity.',14,0,0,0,0,17395,'Terenas Menethil - SAY_TERENAS_INTRO_2');

-- Text corrections
DELETE FROM `creature_text` WHERE `entry`=36627 AND `groupid` IN (4,9);
DELETE FROM `creature_text` WHERE `entry`=36678 AND `groupid`=9;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(36627,4,0,'|TInterface\\Icons\\spell_shadow_unstableaffliction_2.blp:16|t%s begins to cast |cFFFF0000Unstable Ooze Explosion!|r',41,0,0,0,0,0,'Rotface - EMOTE_UNSTABLE_EXPLOSION'),
(36627,9,0,'|TInterface\\Icons\\ability_creature_disease_02.blp:16|tYou have |cFF00FF00Mutated Infection!|r',42,0,0,0,0,0,'Rotface - EMOTE_MUTATED_INFECTION'),
(36678,9,0,'|TInterface\\Icons\\inv_misc_herb_evergreenmoss.blp:16|t%s cast |cFF00FF00Malleable Goo!|r',41,0,0,0,0,0,'Professor Putricide - EMOTE_MALLEABLE_GOO');

UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.71429,`exp`=2,`minlevel`=83,`maxlevel`=83,`faction_A`=974,`faction_H`=974,`unit_flags`=768,`dynamicflags`=0,`equipment_id`=2425,`baseattacktime`=1500 WHERE `entry` IN (36597,39166,39167,39168); -- The Lich King
UPDATE `creature_template` SET `exp`=2,`unit_class`=2 WHERE `entry`=38995; -- Highlord Tirion Fordring
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=0.428571,`exp`=2,`minlevel`=80,`maxlevel`=80,`faction_A`=14,`faction_H`=14,`dynamicflags`=0 WHERE `entry` IN (36633,39305,39306,39307); -- Ice Sphere
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.42857,`exp`=2,`minlevel`=83,`maxlevel`=83,`faction_A`=14,`faction_H`=14,`dynamicflags`=0 WHERE `entry`=36701; -- Raging Spirit
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=0.428571,`exp`=2,`minlevel`=80,`maxlevel`=80,`faction_A`=14,`faction_H`=14,`dynamicflags`=0,`unit_flags`=33554944 WHERE `entry`=38757; -- Defile
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=80,`exp`=2,`faction_A`=14,`faction_H`=14,`speed_walk`=2,`speed_run`=1.71429,`unit_flags`=33554944,`dynamicflags`=0,`VehicleId`=532,`InhabitType`=1|4 WHERE `entry` IN (36609,39120,39121,39122); -- Val'kyr Shadowguard
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.71429,`exp`=2,`minlevel`=83,`maxlevel`=83,`faction_A`=35,`faction_H`=35,`unit_flags`=33554944,`dynamicflags`=0,`VehicleId`=531,`InhabitType`=1|4,`flags_extra`=0 WHERE `entry`=36598; -- Strangulate Vehicle
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=0.428571,`exp`=2,`minlevel`=80,`maxlevel`=80,`faction_A`=14,`faction_H`=14,`unit_flags`=33554944,`dynamicflags`=0,`flags_extra`=128 WHERE `entry`=38584; -- Frostmourne Trigger
UPDATE `creature_template` SET `speed_walk`=2.8,`speed_run`=1,`exp`=2,`minlevel`=80,`maxlevel`=80,`faction_A`=14,`faction_H`=14,`unit_flags`=32832,`dynamicflags`=0,`flags_extra`=256,`InhabitType`=1|4 WHERE `entry` IN (37799,39284,39285,39286); -- Vile Spirit
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1,`exp`=2,`minlevel`=80,`maxlevel`=80,`faction_A`=1665,`faction_H`=1665,`unit_flags`=32832,`dynamicflags`=0,`flags_extra`=0,`equipment_id`=2475 WHERE `entry` IN (36823,38579,39217); -- Terenas Menethil
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128 WHERE `entry`=24648; -- Invisible Stalker (Scale x2)
UPDATE `creature_template` SET `difficulty_entry_1`=39287,`difficulty_entry_2`=39288,`difficulty_entry_3`=39289 WHERE `entry`=39190; -- Wicked Spirit
UPDATE `creature_template` SET `speed_walk`=2.8,`speed_run`=1,`exp`=2,`minlevel`=80,`maxlevel`=80,`faction_A`=14,`faction_H`=14,`unit_flags`=32832,`dynamicflags`=0,`flags_extra`=256,`InhabitType`=1|4 WHERE `entry` IN (39190,39287,39288,39289); -- Wicked Spirit
UPDATE `creature_template` SET `exp`=2,`minlevel`=83,`maxlevel`=83,`faction_A`=14,`faction_H`=14,`dynamicflags`=0,`flags_extra`=256 WHERE `entry`=36824; -- Spirit Warden
UPDATE `creature_template` SET `exp`=2,`minlevel`=83,`maxlevel`=83,`faction_A`=14,`faction_H`=14,`dynamicflags`=0,`flags_extra`=128 WHERE `entry`=39137; -- Shadow Trap
UPDATE `creature_template` SET `exp`=2,`minlevel`=80,`maxlevel`=80,`faction_A`=14,`faction_H`=14,`InhabitType`=1|4,`flags_extra`=`flags_extra`|128 WHERE `entry`=39189; -- Spirit Bomb

-- HACK, Unit::_IsValidAttackTarget returns false because of UNIT_FLAG_OOC_NOT_ATTACKABLE flag
UPDATE `creature_template` SET `unit_flags`=0x02000000 WHERE `entry`=36171;

UPDATE `creature_model_info` SET `combat_reach`=5.5 WHERE `modelid`=30721; -- The Lich King
UPDATE `creature_model_info` SET `gender`=0 WHERE `modelid`=31286; -- Highlord Tirion Fordring

DELETE FROM `creature` WHERE `guid`=202865;
DELETE FROM `creature_addon` WHERE `guid`=150211;
INSERT INTO `creature_addon` (`guid`,`bytes1`,`auras`) VALUES
(150211,1,'72846 73220 73878'); -- The Lich King

DELETE FROM `creature_template_addon` WHERE `entry` IN (39137,36609,39120,39121,39122,36598,37799,39284,39285,39286,39190,39287,39288,39289,36823,38579,39217,39189);
INSERT INTO `creature_template_addon` (`entry`,`bytes1`,`auras`) VALUES
(39137,0,'73530'),
(36609,50331648,''), -- Val'kyr Shadowguard
(39120,50331648,''), -- Val'kyr Shadowguard
(39121,50331648,''), -- Val'kyr Shadowguard
(39122,50331648,''), -- Val'kyr Shadowguard
(36598,50331648,''), -- Strangulate Vehicle
(37799,50331648,''), -- Vile Spirit
(39284,50331648,''), -- Vile Spirit
(39285,50331648,''), -- Vile Spirit
(39286,50331648,''), -- Vile Spirit
(39190,50331648,''), -- Wicked Spirit
(39287,50331648,''), -- Wicked Spirit
(39288,50331648,''), -- Wicked Spirit
(39289,50331648,''), -- Wicked Spirit
(36823,0,'72372'), -- Terenas Menethil
(38579,0,'72372'), -- Terenas Menethil
(39217,0,'72372'), -- Terenas Menethil
(39189,0,'73572'); -- Spirit Bomb

UPDATE `gameobject` SET `rotation3`=1,`animprogress`=255,`spawntimesecs`=604800 WHERE `guid` IN (100056,100061,100064);
UPDATE `gameobject` SET `rotation2`=1,`animprogress`=255,`spawntimesecs`=604800 WHERE `guid` IN (100057,100058,100059,100060,100062);
UPDATE `gameobject` SET `rotation3`=1,`animprogress`=255,`spawntimesecs`=-604800 WHERE `guid`=100063;

UPDATE `gameobject_template` SET `faction`=1375,`flags`=32 WHERE `entry`=202438; -- Lavaman Pillars (Unchained)
UPDATE `gameobject_template` SET `faction`=1375,`flags`=32 WHERE `entry`=202188; -- Doodad_Icecrown_ThroneFrostyWind01
UPDATE `gameobject_template` SET `faction`=1375,`flags`=32 WHERE `entry`=202189; -- Doodad_Icecrown_ThroneFrostyEdge01

DELETE FROM `gameobject` WHERE `id`=202438;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`position_x`,`position_y`,`position_z`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(100488,202438,631,15,425.0885,-2123.311,858.6748,1,-604800,255,1);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (71614,70338,73785,73786,73787,68981,74270,74271,74272,72262,71440,76379,74086,72595,73650,72679,74318,74319,74320,73028,74321,74322,74323,73582,71809,71811,72431,72405,72429,73159);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,71614,0,18,1,38995,0,0, '', 'Ice Lock - target Highlord Tirion Fordring'),
(13,0,70338,0,18,1,0,0,0, '', 'Necrotic Plague - target player'),
(13,0,70338,0,18,1,37698,0,0, '', 'Necrotic Plague - target Shambling Horror'),
(13,0,70338,0,18,1,37695,0,0, '', 'Necrotic Plague - target Drudge Ghoul'),
(13,0,73785,0,18,1,0,0,0, '', 'Necrotic Plague - target player'),
(13,0,73785,0,18,1,37698,0,0, '', 'Necrotic Plague - target Shambling Horror'),
(13,0,73785,0,18,1,37695,0,0, '', 'Necrotic Plague - target Drudge Ghoul'),
(13,0,73786,0,18,1,0,0,0, '', 'Necrotic Plague - target player'),
(13,0,73786,0,18,1,37698,0,0, '', 'Necrotic Plague - target Shambling Horror'),
(13,0,73786,0,18,1,37695,0,0, '', 'Necrotic Plague - target Drudge Ghoul'),
(13,0,73787,0,18,1,0,0,0, '', 'Necrotic Plague - target player'),
(13,0,73787,0,18,1,37698,0,0, '', 'Necrotic Plague - target Shambling Horror'),
(13,0,73787,0,18,1,37695,0,0, '', 'Necrotic Plague - target Drudge Ghoul'),
(13,0,68981,0,18,0,202141,0,0, '', 'Remorseless Winter - target Doodad_IceShard_standing02'),
(13,0,68981,0,18,0,202142,0,0, '', 'Remorseless Winter - target Doodad_IceShard_standing01'),
(13,0,68981,0,18,0,202143,0,0, '', 'Remorseless Winter - target Doodad_IceShard_standing03'),
(13,0,68981,0,18,0,202144,0,0, '', 'Remorseless Winter - target Doodad_IceShard_standing04'),
(13,0,74270,0,18,0,202141,0,0, '', 'Remorseless Winter - target Doodad_IceShard_standing02'),
(13,0,74270,0,18,0,202142,0,0, '', 'Remorseless Winter - target Doodad_IceShard_standing01'),
(13,0,74270,0,18,0,202143,0,0, '', 'Remorseless Winter - target Doodad_IceShard_standing03'),
(13,0,74270,0,18,0,202144,0,0, '', 'Remorseless Winter - target Doodad_IceShard_standing04'),
(13,0,74271,0,18,0,202141,0,0, '', 'Remorseless Winter - target Doodad_IceShard_standing02'),
(13,0,74271,0,18,0,202142,0,0, '', 'Remorseless Winter - target Doodad_IceShard_standing01'),
(13,0,74271,0,18,0,202143,0,0, '', 'Remorseless Winter - target Doodad_IceShard_standing03'),
(13,0,74271,0,18,0,202144,0,0, '', 'Remorseless Winter - target Doodad_IceShard_standing04'),
(13,0,74272,0,18,0,202141,0,0, '', 'Remorseless Winter - target Doodad_IceShard_standing02'),
(13,0,74272,0,18,0,202142,0,0, '', 'Remorseless Winter - target Doodad_IceShard_standing01'),
(13,0,74272,0,18,0,202143,0,0, '', 'Remorseless Winter - target Doodad_IceShard_standing03'),
(13,0,74272,0,18,0,202144,0,0, '', 'Remorseless Winter - target Doodad_IceShard_standing04'),
(13,0,72262,0,18,1,22515,0,0, '', 'Quake - target World Trigger'),
(13,0,71440,0,18,1,36597,0,0, '', 'Harvest Soul - target The Lich King'),
(13,0,76379,0,18,1,36597,0,0, '', 'Harvest Soul - target The Lich King'),
(13,0,74086,0,18,1,0,0,0, '', 'Destroy Soul - target player'),
(13,0,72595,0,18,1,0,0,0, '', 'Restore Soul - target player'),
(13,0,73650,0,18,1,0,0,0, '', 'Restore Soul - target player'),
(13,0,72679,0,18,1,36597,0,0, '', 'Harvested Soul - target The Lich King'),
(13,0,74318,0,18,1,36597,0,0, '', 'Harvested Soul - target The Lich King'),
(13,0,74319,0,18,1,36597,0,0, '', 'Harvested Soul - target The Lich King'),
(13,0,74320,0,18,1,36597,0,0, '', 'Harvested Soul - target The Lich King'),
(13,0,73028,0,18,1,36597,0,0, '', 'Harvested Soul - target The Lich King'),
(13,0,74321,0,18,1,36597,0,0, '', 'Harvested Soul - target The Lich King'),
(13,0,73650,0,18,1,36597,0,0, '', 'Harvested Soul - target The Lich King'),
(13,0,74323,0,18,1,36597,0,0, '', 'Harvested Soul - target The Lich King'),
(13,0,73582,0,18,1,39190,0,0, '', 'Trigger Vile Spirit (Inside, Heroic) - target Wicked Spirit'),
(13,0,71809,0,18,1,36597,0,0, '', 'Jump - target The Lich King'),
(13,0,71811,0,18,1,36597,0,0, '', 'Jump - target The Lich King'),
(13,0,72431,0,18,1,0,0,0, '', 'Jump - target player'),
(13,0,72405,0,18,1,38995,0,0, '', 'Broken Frostmourne - target Highlord Tirion Fordring'),
(13,0,72429,0,18,1,0,0,0, '', 'Mass Resurrection - target player'),
(13,0,73159,0,18,1,0,0,0, '', 'Play Movie - target player');

DELETE FROM `spell_target_position` WHERE `id` IN (70860,72546,73655);
INSERT INTO `spell_target_position` (`id`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES
(70860,631,529.302,-2124.49, 840.857,3.1765), -- Frozen Throne Teleport
(72546,631,514.000,-2523.00,1050.990,3.1765), -- Harvest Soul (normal mode)
(73655,631,495.708,-2523.76,1050.990,3.1765); -- Harvest Soul (heroic mode)

DELETE FROM `spell_area` WHERE `spell`=74276;
INSERT INTO `spell_area` (`spell`,`area`,`autocast`) VALUES
(74276,4910,1); -- In Frostmourne Room

DELETE FROM `disables` WHERE `entry` IN (12825,13246,13247,13244,13245,13342,13309,13362,13311,12823,13163,13164,13243,12764,12909,12826,13103,13136,13137,13138,12818) AND `sourceType`=4;
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (12825,13246,13247,13244,13245,13342,13309,13362,13311,12823,13163,13164,13243,12764,12909,12826,13103,13136,13137,13138,12818);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(12825,12,2,0,''), -- Bane of the Fallen King
(13246,11,0,0,'achievement_been_waiting_long_time'), -- Been Waiting a Long Time for This (10 player)
(13246,12,0,0,''), -- Been Waiting a Long Time for This (10 player)
(13247,11,0,0,'achievement_been_waiting_long_time'), -- Been Waiting a Long Time for This (10 player) Heroic
(13247,12,2,0,''), -- Been Waiting a Long Time for This (10 player) Heroic
(13244,11,0,0,'achievement_been_waiting_long_time'), -- Been Waiting a Long Time for This (25 player)
(13244,12,1,0,''), -- Been Waiting a Long Time for This (25 player)
(13245,11,0,0,'achievement_been_waiting_long_time'), -- Been Waiting a Long Time for This (25 player) Heroic
(13245,12,3,0,''), -- Been Waiting a Long Time for This (25 player) Heroic
(13342,12,0,0,''), -- Lich King 10-player bosses killed
(13309,12,0,0,''), -- Lich King 10-player raids completed (final boss killed)
(13362,12,1,0,''), -- Lich King 25-player bosses killed
(13311,12,1,0,''), -- Lich King 25-player raids completed (final boss killed)
(12823,11,0,0,'achievement_neck_deep_in_vile'), -- Neck-Deep in Vile (10 player)
(12823,12,0,0,''), -- Neck-Deep in Vile (10 player)
(13163,11,0,0,'achievement_neck_deep_in_vile'), -- Neck-Deep in Vile (10 player) Heroic
(13163,12,2,0,''), -- Neck-Deep in Vile (10 player) Heroic
(13164,11,0,0,'achievement_neck_deep_in_vile'), -- Neck-Deep in Vile (25 player)
(13164,12,1,0,''), -- Neck-Deep in Vile (25 player)
(13243,11,0,0,'achievement_neck_deep_in_vile'), -- Neck-Deep in Vile (25 player) Heroic
(13243,12,3,0,''), -- Neck-Deep in Vile (25 player) Heroic
(12764,12,0,0,''), -- The Frozen Throne (10 player)
(12909,12,1,0,''), -- The Frozen Throne (25 player)
(12826,12,3,0,''), -- The Light of Dawn
(13103,12,0,0,''), -- Victories over the Lich King (Icecrown 10 player)
(13136,12,1,0,''), -- Victories over the Lich King (Icecrown 25 player)
(13137,12,2,0,''), -- Victories over the Lich King (Heroic Icecrown 10 player)
(13138,12,3,0,''), -- Victories over the Lich King (Heroic Icecrown 25 player)
(12818,12,3,0,''); -- Realm First! Fall of the Lich King

UPDATE `creature_template` SET `ScriptName`='boss_the_lich_king' WHERE `entry`=36597;
UPDATE `creature_template` SET `ScriptName`='npc_tirion_fordring_tft' WHERE `entry`=38995;
UPDATE `creature_template` SET `ScriptName`='npc_shambling_horror_icc' WHERE `entry`=37698;
UPDATE `creature_template` SET `ScriptName`='npc_raging_spirit' WHERE `entry`=36701;
UPDATE `creature_template` SET `ScriptName`='npc_valkyr_shadowguard' WHERE `entry`=36609;
UPDATE `creature_template` SET `ScriptName`='npc_strangulate_vehicle' WHERE `entry`=36598;
UPDATE `creature_template` SET `ScriptName`='npc_terenas_menethil' WHERE `entry` IN (36823,38579,39217); -- not difficulty_entries
UPDATE `creature_template` SET `ScriptName`='npc_spirit_warden' WHERE `entry`=36824;
UPDATE `creature_template` SET `ScriptName`='npc_spirit_bomb' WHERE `entry`=39189;
UPDATE `creature_template` SET `ScriptName`='npc_broken_frostmourne' WHERE `entry`=38584;

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_the_lich_king_infest';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_the_lich_king_necrotic_plague';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_the_lich_king_necrotic_plague_jump';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_the_lich_king_shadow_trap_visual';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_the_lich_king_shadow_trap_periodic';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_the_lich_king_quake';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_the_lich_king_ice_burst_target_search';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_the_lich_king_raging_spirit';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_the_lich_king_defile';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_the_lich_king_summon_into_air';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_the_lich_king_soul_reaper';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_the_lich_king_valkyr_target_search';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_the_lich_king_eject_all_passengers';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_the_lich_king_cast_back_to_caster';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_the_lich_king_life_siphon';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_the_lich_king_vile_spirits';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_the_lich_king_vile_spirits_visual';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_the_lich_king_vile_spirit_move_target_search';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_the_lich_king_vile_spirit_damage_target_search';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_the_lich_king_harvest_soul';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_the_lich_king_lights_favor';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_the_lich_king_soul_rip';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_the_lich_king_restore_soul';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_the_lich_king_in_frostmourne_room';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_the_lich_king_summon_spirit_bomb';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_the_lich_king_trigger_vile_spirit';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_the_lich_king_jump';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_the_lich_king_jump_remove_aura';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_the_lich_king_mass_resurrection';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_the_lich_king_play_movie';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(70541,'spell_the_lich_king_infest'),
(73779,'spell_the_lich_king_infest'),
(73780,'spell_the_lich_king_infest'),
(73781,'spell_the_lich_king_infest'),
(70337,'spell_the_lich_king_necrotic_plague'),
(73912,'spell_the_lich_king_necrotic_plague'),
(73913,'spell_the_lich_king_necrotic_plague'),
(73914,'spell_the_lich_king_necrotic_plague'),
(70338,'spell_the_lich_king_necrotic_plague_jump'),
(73785,'spell_the_lich_king_necrotic_plague_jump'),
(73786,'spell_the_lich_king_necrotic_plague_jump'),
(73787,'spell_the_lich_king_necrotic_plague_jump'),
(73530,'spell_the_lich_king_shadow_trap_visual'),
(74282,'spell_the_lich_king_shadow_trap_periodic'),
(72262,'spell_the_lich_king_quake'),
(69110,'spell_the_lich_king_ice_burst_target_search'),
(69200,'spell_the_lich_king_raging_spirit'),
(72754,'spell_the_lich_king_defile'),
(73708,'spell_the_lich_king_defile'),
(73709,'spell_the_lich_king_defile'),
(73710,'spell_the_lich_king_defile'),
(69037,'spell_the_lich_king_summon_into_air'),
(70497,'spell_the_lich_king_summon_into_air'),
(73579,'spell_the_lich_king_summon_into_air'),
(74300,'spell_the_lich_king_summon_into_air'),
(69409,'spell_the_lich_king_soul_reaper'),
(73797,'spell_the_lich_king_soul_reaper'),
(73798,'spell_the_lich_king_soul_reaper'),
(73799,'spell_the_lich_king_soul_reaper'),
(69030,'spell_the_lich_king_valkyr_target_search'),
(68576,'spell_the_lich_king_eject_all_passengers'),
(74445,'spell_the_lich_king_cast_back_to_caster'),
(68984,'spell_the_lich_king_cast_back_to_caster'),
(73488,'spell_the_lich_king_life_siphon'),
(73782,'spell_the_lich_king_life_siphon'),
(73783,'spell_the_lich_king_life_siphon'),
(73784,'spell_the_lich_king_life_siphon'),
(70498,'spell_the_lich_king_vile_spirits'),
(70499,'spell_the_lich_king_vile_spirits_visual'),
(70501,'spell_the_lich_king_vile_spirit_move_target_search'),
(70534,'spell_the_lich_king_vile_spirit_damage_target_search'),
(68980,'spell_the_lich_king_harvest_soul'),
(74325,'spell_the_lich_king_harvest_soul'),
(74296,'spell_the_lich_king_harvest_soul'),
(74297,'spell_the_lich_king_harvest_soul'),
(69382,'spell_the_lich_king_lights_favor'),
(69397,'spell_the_lich_king_soul_rip'),
(72595,'spell_the_lich_king_restore_soul'),
(73650,'spell_the_lich_king_restore_soul'),
(74276,'spell_the_lich_king_in_frostmourne_room'),
(74302,'spell_the_lich_king_summon_spirit_bomb'),
(74341,'spell_the_lich_king_summon_spirit_bomb'),
(74342,'spell_the_lich_king_summon_spirit_bomb'),
(74343,'spell_the_lich_king_summon_spirit_bomb'),
(73582,'spell_the_lich_king_trigger_vile_spirit'),
(71811,'spell_the_lich_king_jump'),
(72431,'spell_the_lich_king_jump_remove_aura'),
(72429,'spell_the_lich_king_mass_resurrection'),
(73159,'spell_the_lich_king_play_movie');

/*
Approximate damage of NPCs before armor reduction
75k-90k - The Lich King
25k-30k - Shambling Horror
3.5-5k - Drudge Ghoul
30k-40k - Raging Spirit
10k-12k - Spirit Warden
10k-12k - Terenas Menethil

Multipliers
1.2 = 10H/25N
1.5 = 25H
*/

UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=150 WHERE `entry`=36597; -- The Lich King 10N
UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=180 WHERE `entry`=39167; -- The Lich King 25N
UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=180 WHERE `entry`=39168; -- The Lich King 10H
UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=225 WHERE `entry`=39169; -- The Lich King 25H

UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=50 WHERE `entry`=37698; -- Shambling Horror 10N
UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=60 WHERE `entry`=39299; -- Shambling Horror 25N
UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=60 WHERE `entry`=39300; -- Shambling Horror 10H
UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=75 WHERE `entry`=39301; -- Shambling Horror 25H

UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=7 WHERE `entry`=37695; -- Drudge Ghoul 10N
UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=8.4 WHERE `entry`=39309; -- Drudge Ghoul 25N
UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=8.4 WHERE `entry`=39310; -- Drudge Ghoul 10H
UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=10.5 WHERE `entry`=39311; -- Drudge Ghoul 25H

UPDATE `creature_template` SET `difficulty_entry_1`=39302,`difficulty_entry_2`=39303,`difficulty_entry_3`=39304 WHERE `entry`=36701; -- Raging Spirit
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.42857,`exp`=2,`minlevel`=83,`maxlevel`=83,`faction_A`=14,`faction_H`=14,`dynamicflags`=0 WHERE `entry` IN (39302,39303,39304); -- Raging Spirit
UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=60 WHERE `entry`=36701; -- Raging Spirit 10N
UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=72 WHERE `entry`=39302; -- Raging Spirit 25N
UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=72 WHERE `entry`=39303; -- Raging Spirit 10H
UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=90 WHERE `entry`=39304; -- Raging Spirit 25H

UPDATE `creature_template` SET `difficulty_entry_1`=39296 WHERE `entry`=36824; -- Spirit Warden
UPDATE `creature_template` SET `minlevel`=83,`maxlevel`=83,`exp`=2,`faction_A`=14,`faction_H`=14,`flags_extra`=256 WHERE `entry`=39296; -- Spirit Warden (1)
UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=20 WHERE `entry`=36824; -- Spirit Warden 10N
UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=20 WHERE `entry`=39296; -- Spirit Warden 25N

UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=20 WHERE `entry`=36823; -- Terenas Menethil

-- Pathing for Conquest Hold Berserker Entry: 27500
SET @NPC := 105857;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2721.081,`position_y`=-1832.136,`position_z`=4.838899 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2710.015,-1832.177,4.838899,0,0,0,100,0),
(@PATH,2,2700.421,-1833.964,4.838899,0,0,0,100,0),
(@PATH,3,2693.419,-1835.334,4.867931,0,0,0,100,0),
(@PATH,4,2700.177,-1834.009,4.838899,0,0,0,100,0),
(@PATH,5,2710.015,-1832.177,4.838899,0,0,0,100,0),
(@PATH,6,2721.081,-1832.136,4.838899,0,0,0,100,0),
(@PATH,7,2732.511,-1831.47,4.838899,0,0,0,100,0),
(@PATH,8,2737.419,-1830.768,4.838899,0,0,0,100,0),
(@PATH,9,2732.511,-1831.47,4.838899,0,0,0,100,0),
(@PATH,10,2721.081,-1832.136,4.838899,0,0,0,100,0);
-- Pathing for Conquest Hold Berserker Entry: 27500
SET @NPC := 105821;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2738.191,`position_y`=-1784.905,`position_z`=5.87062 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2734.5,-1775.514,6.962903,0,0,0,100,0),
(@PATH,2,2738.191,-1784.905,5.87062,0,0,0,100,0),
(@PATH,3,2741.883,-1793.762,5.804742,0,0,0,100,0),
(@PATH,4,2746.422,-1807.012,5.22166,0,0,0,100,0),
(@PATH,5,2748.496,-1816.049,5.223536,0,0,0,100,0),
(@PATH,6,2750.136,-1823.419,5.425339,0,0,0,100,0),
(@PATH,7,2748.496,-1816.049,5.223536,0,0,0,100,0),
(@PATH,8,2746.422,-1807.012,5.22166,0,0,0,100,0),
(@PATH,9,2741.883,-1793.762,5.804742,0,0,0,100,0),
(@PATH,10,2738.191,-1784.905,5.87062,0,0,0,100,0);
-- Pathing for Conquest Hold Berserker Entry: 27500
SET @NPC := 105859;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2753.638,`position_y`=-1895.846,`position_z`=5.03679 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2754.177,-1888.177,5.087607,0,0,0,100,0),
(@PATH,2,2754.56,-1879.827,5.126619,0,0,0,100,0),
(@PATH,3,2754.854,-1867.842,5.131936,0,0,0,100,0),
(@PATH,4,2754.627,-1856.456,5.450566,0,0,0,100,0),
(@PATH,5,2753.946,-1848.716,5.450566,0,0,0,100,0),
(@PATH,6,2751.545,-1837.476,5.39562,0,0,0,100,0),
(@PATH,7,2753.931,-1848.54,5.450566,0,0,0,100,0),
(@PATH,8,2754.627,-1856.456,5.450566,0,0,0,100,0),
(@PATH,9,2754.854,-1867.842,5.131936,0,0,0,100,0),
(@PATH,10,2754.56,-1879.827,5.126619,0,0,0,100,0),
(@PATH,11,2754.177,-1888.177,5.087607,0,0,0,100,0),
(@PATH,12,2753.638,-1895.846,5.03679,0,0,0,100,0);
-- Pathing for Conquest Hold Berserker Entry: 27500
SET @NPC := 105810;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2805.754,`position_y`=-1824.487,`position_z`=10.76279 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2811.704,-1833.185,11.26279,0,0,0,100,0),
(@PATH,2,2825.015,-1839.888,11.25652,0,0,0,100,0),
(@PATH,3,2811.704,-1833.185,11.26279,0,0,0,100,0),
(@PATH,4,2805.754,-1824.487,10.76279,0,0,0,100,0),
(@PATH,5,2806.472,-1815.43,10.76279,0,0,0,100,0),
(@PATH,6,2806.509,-1806.167,10.63779,0,0,0,100,0),
(@PATH,7,2806.472,-1815.43,10.76279,0,0,0,100,0),
(@PATH,8,2805.754,-1824.487,10.76279,0,0,0,100,0);
-- Pathing for Conquest Hold Berserker Entry: 27500
SET @NPC := 105750;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2691.886,`position_y`=-1764.669,`position_z`=9.601107 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2681.84,-1768.02,9.601107,0,0,0,100,0),
(@PATH,2,2691.886,-1764.669,9.601107,0,0,0,100,0),
(@PATH,3,2705.537,-1760.065,9.601107,0,0,0,100,0),
(@PATH,4,2714.329,-1758.981,9.601107,0,0,0,100,0),
(@PATH,5,2705.537,-1760.065,9.601107,0,0,0,100,0),
(@PATH,6,2691.886,-1764.669,9.601107,0,0,0,100,0);
-- Pathing for Conquest Hold Berserker Entry: 27500
SET @NPC := 105854;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2683.998,`position_y`=-1873.36,`position_z`=14.20639 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2681.924,-1863.327,14.19665,0,0,0,100,0),
(@PATH,2,2691.357,-1860.246,13.94065,0,0,0,100,0),
(@PATH,3,2705.164,-1860.508,13.85815,0,0,0,100,0),
(@PATH,4,2706.999,-1867.629,13.94356,0,0,0,100,0),
(@PATH,5,2702.301,-1873.661,13.86975,0,0,0,100,0),
(@PATH,6,2690.931,-1875.133,13.94601,0,0,0,100,0),
(@PATH,7,2683.998,-1873.36,14.20639,0,0,0,100,0);

-- Pathing for Westfall Brigade Marine Entry: 27501
SET @NPC := 105933;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2670.551,`position_y`=-2010.984,`position_z`=18.17214 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2673.404,-2006.613,18.2068,0,0,0,100,0),
(@PATH,2,2670.639,-2010.848,18.17313,0,0,0,100,0),
(@PATH,3,2667.047,-2016.413,18.20223,0,0,0,100,0),
(@PATH,4,2670.551,-2010.984,18.17214,0,0,0,100,0);
-- Pathing for Westfall Brigade Marine Entry: 27501
SET @NPC := 105932;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2633.481,`position_y`=-1987.501,`position_z`=8.764043 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2632.814,-1993.635,8.538836,0,0,0,100,0),
(@PATH,2,2638.163,-1998.093,8.282835,0,0,0,100,0),
(@PATH,3,2643.552,-2000.655,8.280496,0,0,0,100,0),
(@PATH,4,2646.837,-1997.753,8.30875,0,0,0,100,0),
(@PATH,5,2649.113,-1994.113,8.310638,0,0,0,100,0),
(@PATH,6,2649.836,-1989.002,8.284628,0,0,0,100,0),
(@PATH,7,2645.433,-1984.703,8.336969,0,0,0,100,0),
(@PATH,8,2638.931,-1981.989,8.592985,0,0,0,100,0),
(@PATH,9,2633.481,-1987.501,8.764043,0,0,0,100,0);

-- Missing spawn for Purkom "Venture Coin Vendor" Horde
DELETE FROM `creature` WHERE `id`=27730;
DELETE FROM `creature` WHERE `guid`=107018 AND `id`=27511;
INSERT INTO creature (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES
(107018,27730,571,1,1,0,0,2492.467,-1839.655,11.72851,5.532694,120,0,0,1,0,0);

-- Rogue Voidwalkers Shouldn't have weapons
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=16974;

-- Add Missing Spawn
DELETE FROM `creature` WHERE `guid` IN (13425,13426,13427,13428,14241);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES
-- Bubb Lazarr
(13425,27628,571,1,1,0,0,2404.771,-1823.437,1.99793,5.078908,300,0,0,1,0,0),
-- Rocket Propelled Warhead
(13426,27593,571,1,1,0,0,2394.92358,-1832.18921,-1.69907868,2.687807,300,0,0,1,0,0),
(13427,27593,571,1,1,0,0,2396.13013,-1829.49475,-1.6780616,2.75762,300,0,0,1,0,0),
(13428,27593,571,1,1,0,0,2397.40283,-1826.75,-1.65229559,2.72271371,300,0,0,1,0,0),
(14241,27593,571,1,1,0,0,2398.62329,-1824.14063,-1.66098964,2.740167,300,0,0,1,0,0);

-- Template updates Rocket Propelled Warhead
UPDATE `creature_template` SET `npcflag`=`npcflag`|16777216,`InhabitType`=4,`unit_flags`=`unit_flags`|16384,`speed_walk`=12,`speed_run`=4.28571 WHERE `entry`=27593;

UPDATE `creature_model_info` SET `bounding_radius`=0.534723,`combat_reach`=3.5,`gender`=2 WHERE `modelid`=26611; -- Rocket Propelled Warhead

DELETE FROM `creature_template_addon` WHERE `entry`=27593;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(27593,0,0,1,0, NULL); -- Rocket Propelled Warhead

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=27593;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `quest_start`, `quest_start_active`, `quest_end`, `cast_flags`, `aura_required`, `aura_forbidden`, `user_type`) VALUES
(27593, 49177, 0, 0, 0, 1, 0, 0, 0); -- Ride Rocket Propelled Warhead

-- Fix requirements for Element 115 from Nayd
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=4 AND `SourceEntry`=37664;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(4, 24095, 37664, 0, 9, 12433, 0, 0, 0, '', 'Element 115 - Seeking Solvent'),
(4, 24095, 37664, 1, 9, 12434, 0, 0, 0, '', 'Element 115 - Always Seeking Solvent'),
(4, 24095, 37664, 2, 9, 12443, 0, 0, 0, '', 'Element 115 - Seeking Solvent'),
(4, 24095, 37664, 3, 9, 12446, 0, 0, 0, '', 'Element 115 - Always Seeking Solvent'),
(4, 24095, 37664, 4, 9, 12437, 0, 0, 0, '', 'Element 115 - Riding the Red Rocket A'),
(4, 24095, 37664, 5, 9, 12432, 0, 0, 0, '', 'Element 115 - Riding the Red Rocket H');
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`=100 WHERE `entry`=24095 AND `item`=37664;

-- Add some missing Azure Scalebane Spawns to crystalsong Forest
DELETE FROM `creature` WHERE `guid` IN (6499,6627,7630,10504,12599,12954,13423,13424);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`unit_flags`,`dynamicflags`) VALUES
(6499,31402,571,1,1,0,0,5220.886,591.7798,187.861328,4.866286,180,10,0,1,0,1,0,0),
(6627,31402,571,1,1,0,0,5344.32,595.7,183.07399,4.99164152,180,10,0,1,0,1,0,0),
(7630,31402,571,1,1,0,0,5411.67773,623.1622,178.355133,0.87266463,180,10,0,1,0,1,0,0),
(10504,31402,571,1,1,0,0,5434.40332,783.9654,182.770508,0.5726554,180,10,0,1,0,1,0,0),
(12599,31402,571,1,1,0,0,5464.40771,716.290344,171.820313,2.65290046,180,10,0,1,0,1,0,0),
(12954,31402,571,1,1,0,0,5573.34326,862.8543,161.738586,1.48352981,180,10,0,1,0,1,0,0),
(13423,31402,571,1,1,0,0,5659.52734,987.839844,174.5677,0.314159274,180,0,0,1,0,0,570688256,32),
(13424,31402,571,1,1,0,0,5660.18652,1028.454,174.562653,2.79252672,180,0,0,1,0,0,570688256,32);
-- Addons for dead appearance
DELETE FROM `creature_addon` WHERE `guid` IN (13423,13424);
INSERT INTO `creature_addon` (`guid`,`bytes2`,`auras`) VALUES
(13423,1,29266),
(13424,1,29266);
UPDATE `creature_model_info` SET `bounding_radius`=0.465,`combat_reach`=1.5,`gender`=0 WHERE `modelid`=25195; -- Azure Scalebane
DELETE FROM `creature_template_addon` WHERE `entry`=31402;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(31402,0,0,1,0, NULL); -- Azure Scalebane

DELETE FROM `spell_script_names` WHERE `spell_id`=40121;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES (40121,'spell_dru_swift_flight_passive');

DELETE FROM `command` WHERE `name` = 'ticket reset';
INSERT INTO `command` (`name`, `security`, `help`) VALUES 
('ticket reset', 3, 'Syntax: .ticket reset\nRemoves all closed tickets and resets the counter, if no pending open tickets are existing.');
DELETE FROM `trinity_string` WHERE `entry` IN(2027,2028);
INSERT INTO `trinity_string` (`entry`, `content_default`) VALUES 
('2027', 'There are pending open tickets, please close them first!'),
('2028', 'All closed tickets were deleted and counter is reseted to |cffff00ff 1|r');
