UPDATE `creature_template` SET `unit_flags` = `unit_flags` &~1 WHERE `unit_flags` & 1;
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (57294,57399);
INSERT INTO `spell_linked_spell` VALUES
(57294,59690,2,'Well Fed - Well Fed (DND)'),
(57399,59699,2,'Well Fed - Well Fed (DND)');

DELETE FROM `spell_group` WHERE `spell_id` IN (59690,59699);

-- Sets SmartAI for Mechagnomes
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=25814;

-- Says for Mechagnomes
DELETE FROM `creature_text` WHERE `entry`=25814;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(25814,1,1, 'We are Mechagnome...resistance is futile.',12,0,0,0,0,0, ''),
(25814,1,2, 'The flesh is weak. We will make you better, stronger...faster.',12,0,0,0,0,0, ''),
(25814,1,3, 'We can decurse you, we have the technology.',12,0,0,0,0,0, '');

-- Mechagnome SAI
-- NOTE: Mechagnome SAI required for Horde quest Souls of the Decursed 
DELETE FROM `smart_scripts` WHERE `entryorguid`=25814 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(25814,0,0,0,4,0,100,0,0,0,0,0,1,1,10000,0,0,0,0,0,0,0,0,0,0,0,0, 'Fizzcrank Mechagnome - Chance Say on Aggro'),
(25814,0,1,0,8,0,100,0,45980,0,0,0,33,25773,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Fizzcrank Mechagnome - Killcredit on spellhit - Recursive'),
(25814,0,2,0,8,0,100,0,46485,0,0,0,33,26096,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Fizzcrank Mechagnome - Killcredit on spellhit - Souls of the Decursed');
-- (25814,0,2,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fizzcrank Mechagnome - On Re-Cursive Transmatter Injection spellhit despawn self'),

-- Links item spell to spawn spell
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=45980;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (45980,46022,0, 'Re-Cursive quest');

-- Despawn Mechagnome after spellcast (Mechagnome would not despawn using SAI resulting in possibility of multiple uses of item for credit)
DELETE FROM `spell_scripts` WHERE `id`=45980;
INSERT INTO `spell_scripts` (`id`, `effIndex`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES
(45980,0,1,18,0,0,0,0,0,0,0);

-- FOR SURVIVOR

-- Sets smartAI for Fizzcrank Survivor
UPDATE `creature_template` SET `AIName` ='SmartAI' WHERE `entry`=25773;

-- Says for Fizzcrank Survivor
DELETE FROM `creature_text` WHERE `entry`=25773;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(25773,0,1, 'I survived and I''m flesh again!',12,0,0,0,0,0, ''),
(25773,0,2, 'But... but... I was perfect!',12,0,0,0,0,0, ''),
(25773,0,3, 'Where am I? Who are you? What''s that strange feeling?',12,0,0,0,0,0, ''),
(25773,0,4, 'I''m flesh and blood again! Thank you!',12,0,0,0,0,0, '');

-- Random says, Teleport spell effect & despawn
DELETE FROM `smart_scripts` WHERE `entryorguid`=25773 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(25773,0,0,0,1,0,100,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 'Fizzcrank Survivor - On spawn talk'),
(25773,0,1,0,1,0,100,1,5000,5000,5000,5000,11,41232,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fizzcrank Survivor - OOC Cast spell'),
(25773,0,2,0,1,0,100,0,5000,5000,5000,5000,41,2000,0,0,0,0,0,0,0,0,0,0,0,0,0, 'Fizzcrank Survivor - OOC Force despawn');

-- Remove Eventai and Eventai says
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (25814,25773);
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-533,-534,-535);

UPDATE `creature_template` SET `exp`=0,`speed_run`=0.78571 WHERE `entry`=28239; -- Arcane Beam
DELETE FROM `creature_template_addon` WHERE `entry`=28239;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(28239,0,0,1,0, '51019'); -- Arcane Beam

UPDATE `gameobject_template` SET `WDBVerified`=12340 WHERE `entry`=179545;
DELETE FROM `gameobject` WHERE `id` IN (179545,179485);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(6,179545,429,1,1,116.135,638.836,-48.467,-0.785397,0,0,0,1,7200,255,1),
(159,179485,429,1,1,558.806,550.065,-25.4008,3.14159,0,0,0,1,180,255,1);

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`IN (65686, 65684, 67222, 67176, 67223, 67177, 67224, 67178);
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES 
(65686, -65684, 2, 'Remove Dark Essence 10M'), 
(65684, -65686, 2, 'Remove Light Essence 10M'),
(67222, -67176, 2, 'Remove Dark essence 10M H'),
(67176, -67222, 2, 'Remove Light essence 10M H'),
(67223, -67177, 2, 'Remove Dark essence 25M'),
(67177, -67223, 2, 'Remove Light essence 25M'),
(67224, -67178, 2, 'Remove Dark essence 25M H'),
(67178, -67224, 2, 'Remove Light essence 25M H');

-- Orgrimmar: Hidden Enemies (5727)
SET @Gossip=21272;

DELETE FROM `gossip_menu` WHERE `text_id` IN (4513,4533,4534,4535,4536);
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(3701,4513), -- 1st
(@Gossip+0,4533), -- 2nd
(@Gossip+1,4534), -- 3rd
(@Gossip+2,4535), -- 4th
(@Gossip+3,4536); -- last
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (3701,@Gossip+0,@Gossip+1,@Gossip+2,@Gossip+3);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(3701,0,0, 'You may speak frankly, Neeru...' ,1,1,@Gossip+0,0,0,0,NULL),
(@Gossip+0,0,0, 'It is good to see the Burning Blade is taking over where the Shadow Council once failed.' ,1,1,@Gossip+1,0,0,0,NULL),
(@Gossip+1,0,0, 'So the Searing Blade is expendable?' ,1,1,@Gossip+2,0,0,0,NULL),
(@Gossip+2,0,0, 'If there is anything you would have of me...' ,1,1,@Gossip+3,0,0,0,NULL); -- Must Link to Final Action Menu as well

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=3216; -- Neeru Fireblade
DELETE FROM `smart_scripts` WHERE `entryorguid`=3216 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(3216, 0, 0, 0, 62, 0, 100, 0, @Gossip+2, 0, 0, 0, 15, 5727, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Neeru Fireblade - On gossip select give Hidden Enemies quest completed');

UPDATE `quest_template` SET `SpecialFlags`=`SpecialFlags`|2 WHERE `entry`=5727; -- Hidden Enemies (quest completable by external event)
-- Conditions so gossips don't show up if the player doesn't have the item
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=3701;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=14 AND `SourceGroup` BETWEEN @Gossip+0 AND @Gossip+3;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,3701,0,0,2,14544,1,0,0,'', 'Neeru Fireblade: Quest Hidden Enemies gossip option - requires item Lieutenant''s Insignia'),
(14,@Gossip+0,4533,0,2,14544,1,0,0, '', 'Neeru Fireblade: Quest Hidden Enemies gossip 1 - requires item Lieutenant''s Insignia'),
(14,@Gossip+1,4534,0,2,14544,1,0,0, '', 'Neeru Fireblade: Quest Hidden Enemies gossip 2 - requires item Lieutenant''s Insignia'),
(14,@Gossip+2,4535,0,2,14544,1,0,0, '', 'Neeru Fireblade: Quest Hidden Enemies gossip 3 - requires item Lieutenant''s Insignia'),
(14,@Gossip+3,4536,0,2,14544,1,0,0, '', 'Neeru Fireblade: Quest Hidden Enemies gossip 4 - requires item Lieutenant''s Insignia');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=66512;
INSERT INTO `spell_linked_spell` VALUES
(66512, 66510, 0, 'Summon Deep Jormungar on Pound Drum');
 
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceGroup`=0 AND `SourceEntry`=66512;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 0, 66512, 0, 18, 0, 195308, 0, 0, '', 'Pound Drum: Target Mysterious Snow Mound'),
(13, 0, 66512, 0, 18, 0, 195309, 0, 0, '', 'Pound Drum: Target Mysterious Snow Mound');

-- Morbent Fel SAI
SET @ENTRY := 1200;
SET @SPELL_SACRED_CLEANSING := 8913;
SET @SPELL_TOUCH_OF_DEATH := 3108;
SET @SPELL_PRESENCE_OF_DEATH := 3109;
SET @SPELL_UNHOLY_SHIELD := 8909;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,0,0,0,0,11,@SPELL_UNHOLY_SHIELD,0,0,0,0,0,1,0,0,0,0,0,0,0,"Morbent Fel - Out Of Combat - Cast Unholy Shield"),
(@ENTRY,0,1,0,8,0,100,0,@SPELL_SACRED_CLEANSING,0,0,0,36,24782,0,0,0,0,0,1,0,0,0,0,0,0,0,"Morbent Fel - On Spellhit - Update Template"),
(@ENTRY,0,2,0,0,0,100,0,0,0,24000,24000,11,@SPELL_TOUCH_OF_DEATH,0,0,0,0,0,2,0,0,0,0,0,0,0,"Morbent Fel - In Combat - Cast Touch of Death"),
(@ENTRY,0,3,0,0,0,100,0,0,0,3700,13300,11,@SPELL_PRESENCE_OF_DEATH,0,0,0,0,0,2,0,0,0,0,0,0,0,"Morbent Fel - In Combat - Cast Presence of Death"),
(@ENTRY,0,4,0,2,0,100,1,0,15,0,0,28,@SPELL_UNHOLY_SHIELD,1,0,0,0,0,1,0,0,0,0,0,0,0,"Morbent Fel - At 15% HP - Remove Unholy Shield");

DELETE FROM `creature` WHERE `id`=25589;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES
(2017,25589,571,1,1,0,0,4464.63,5378.07,-15.2737,6.05299,600,0,0,1,0,0);
DELETE FROM `creature_template_addon` WHERE `entry`=25589;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(25589,0,1,1,0, ''); -- sitting

DELETE FROM `script_texts` WHERE `npc_entry`=27654 AND `entry` BETWEEN -1578016 AND -1578005;
INSERT INTO `script_texts` (`npc_entry`, `entry`, `content_default`, `sound`, `type`, `comment`) VALUES
(27654, -1578005, 'The prisoners shall not go free! The word of Malygos is law!', 13594, 1, 'SAY_AGGRO'),
(27654, -1578006, 'A fitting punishment!', 13602, 1, 'SAY_KILL_1'),
(27654, -1578007, 'Sentence: executed!', 13603, 1, 'SAY_KILL_2'),
(27654, -1578008, 'Another casualty of war!', 13604, 1, 'SAY_KILL_3'),
(27654, -1578009, 'The war... goes on.', 13605, 1, 'SAY_DEATH'),
(27654, -1578010, 'It is too late to run!', 13598, 1, 'SAY_PULL_1'),
(27654, -1578011, 'Gather ''round....', 13599, 1, 'SAY_PULL_2'),
(27654, -1578012, 'None shall escape!', 13600, 1,  'SAY_PULL_3'),
(27654, -1578013, 'I condemn you to death!', 13601, 1, 'SAY_PULL_4'),
(27654, -1578014, 'Tremble, worms!', 13595, 1,  'SAY_STOMP_1'),
(27654, -1578015, 'I will crush you!', 13596, 1, 'SAY_STOMP_2'),
(27654, -1578016, 'Can you fly?', 13597, 1, 'SAY_STOMP_3');

SET @Gossip=21276;
SET @Azuregos=15481; -- Spirit of Azuregos
SET @Item=20949; -- Magical Ledger
UPDATE `creature_template` SET `gossip_menu_id`=@Gossip, `AIName`='SmartAI' WHERE `entry`=@Azuregos;

DELETE FROM `gossip_menu` WHERE (`entry` BETWEEN @Gossip AND @Gossip+12) AND `text_id` IN (7881,7901,7885,7886,7887,7888,7889,7890,7891,7892,7893,7894,7895,7896,7897);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(@Gossip+00, 7881), -- gossip if no quest nor item
(@Gossip+00, 7901), -- gossip if item
(@Gossip+00, 7885), -- 01
(@Gossip+01, 7886), -- 02
(@Gossip+02, 7887), -- 03
(@Gossip+03, 7888), -- 04
(@Gossip+04, 7889), -- 05
(@Gossip+05, 7890), -- 06
(@Gossip+06, 7891), -- 07
(@Gossip+07, 7892), -- 08
(@Gossip+08, 7893), -- 09
(@Gossip+09, 7894), -- 10
(@Gossip+10, 7895), -- 11
(@Gossip+11, 7896), -- 12
(@Gossip+12, 7897); -- 13

DELETE FROM `gossip_menu_option` WHERE `menu_id` BETWEEN @Gossip AND @Gossip + 14;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`) VALUES
(@Gossip+00,0,'How did you know? I mean, yes... Yes I am looking for that shard. Do you have it?',1,1,@Gossip+01),
(@Gossip+01,0,'Alright. Where?',1,1,@Gossip+02),
(@Gossip+02,0,'By Bronzebeard''s... um, beard! What are you talking about?',1,1,@Gossip+03),
(@Gossip+03,0,'Fish? You gave a piece of what could be the key to saving all life on Kalimdor to a fish?',1,1,@Gossip+04),
(@Gossip+04,0,'A minnow? The oceans are filled with minnows! There could be a hundred million million minnows out there!',1,1,@Gossip+05),
(@Gossip+05,0,'...',1,1,@Gossip+06),
(@Gossip+06,0,'You put the piece on a minnow and placed the minnow somewhere in the waters of the sea between here and the Eastern Kingdoms? And this minnow has special powers?',1,1,@Gossip+07),
(@Gossip+07,0,'You''re insane.',1,1,@Gossip+08),
(@Gossip+08,0,'I''m all ears.',1,1,@Gossip+09),
(@Gossip+09,0,'Come again.',1,1,@Gossip+10),
(@Gossip+10,0,'Ok, let me get this straight. You put the scepter entrusted to your Flight by Anachronos  on a minnow of your own making and now you expect me to build an... an arcanite buoy or something... to force your minnow out of hiding? AND potentially incur the wrath of an Elemental Lord? Did I miss anything? Perhaps I am to do this without any clothes on, during a solar eclipse, on a leap year?',1,1,@Gossip+11),
(@Gossip+11,0,'FINE! And how, dare I ask, am I supposed to acquire an arcanite buoy?',1,1,@Gossip+12),
(@Gossip+12,0,'But...',1,1,0);

DELETE FROM `creature_text` WHERE `entry`=@Azuregos;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(@Azuregos, 0, 0, 'I SAID GOOD BYE!', 12, 0, 100, 1, 0, 0, 'Spirit of Azuregos');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` BETWEEN @Gossip+0 AND @Gossip+2;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`Comment`) VALUES
(14,@Gossip+0,7901,0,2,@Item,1, 'Spirit of Azuregos - show gossip 7901 if player has item Magical Ledger'),
(14,@Gossip+0,7885,0,14,8575,0, 'Spirit of Azuregos - show gossip 7885 if player does not have quest Azuregos''s Magical Ledger'),
(14,@Gossip+0,7885,0,8,8555,0, 'Spirit of Azuregos - show gossip 7885 if player has quest The Charge of the Dragonflights rewarded'),
(14,@Gossip+0,7881,0,14,8555,0, 'Spirit of Azuregos - show gossip 7881 if player does not have quest The Charge of the Dragonflights'),
(15,@Gossip+0,0,0,26,@Item,1, 'Spirit of Azuregos - show gossip option if player does not have item Magical Ledger'),
(15,@Gossip+0,0,0,14,8575,0, 'Spirit of Azuregos - show gossip option if player does not have quest Azuregos''s Magical Ledger'),
(15,@Gossip+0,0,0,8,8555,0, 'Spirit of Azuregos - show gossip option if player has quest The Charge of the Dragonflights rewarded');

DELETE FROM `smart_scripts` WHERE `entryorguid`=@Azuregos AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@Azuregos, 0, 0, 0, 62, 0, 100, 0, @Gossip+11, 0, 0, 0, 56, @Item, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Spirit of Azuregos - On gossip select 11 give item'),
(@Azuregos, 0, 1, 2, 62, 0, 100, 0, @Gossip+12, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Spirit of Azuregos - On gossip select 12 close gossip'),
(@Azuregos, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Spirit of Azuregos - Link 2 say');

-- Not related
UPDATE `game_event` SET `start_time`='2011-12-04 00:01:00' WHERE `eventEntry`=4;

SET @GUID = 209102;

-- add creatures
DELETE FROM `creature` WHERE `id` IN (28601, 28602) AND `map`=1;
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES
(@GUID+00,28601, 1, -6027.13, -1249.12, -146.765, 0.0407544),
(@GUID+01,28602, 1, -6165.74, -1250.34, -162.183, 3.16428),
(@GUID+02,28602, 1, -6118.16, -1258.77, -143.281, 3.17606),
(@GUID+03,28602, 1, -6118.18, -1241.33, -143.281, 3.12169),
(@GUID+04,28602, 1, -6104.87, -1256.41, -143.281, 3.04315),
(@GUID+05,28602, 1, -6104.56, -1243.58, -143.281, 3.07064),
(@GUID+06,28602, 1, -6067.35, -1243.76, -143.481, 3.17274),
(@GUID+07,28602, 1, -6067.17, -1255.45, -143.430, 3.15703),
(@GUID+08,28602, 1, -6038.16, -1243.56, -146.897, 3.15153),
(@GUID+09,28602, 1, -6036.82, -1255.32, -146.901, 3.19238),
(@GUID+10,28602, 1, -6042.26, -1249.25, -146.887, 3.19238);

-- add weapons to creatures
DELETE FROM `creature_equip_template` WHERE `entry`=2476;
INSERT INTO `creature_equip_template` VALUES 
(2476, 7714, 0, 0);

-- correct creature_template
UPDATE `creature_template` SET `faction_A` = 2080, `faction_H` = 2080, `lootid` = `entry` WHERE `entry` IN (28601, 28602);
UPDATE `creature_template` SET `equipment_id` = 1803 WHERE `entry`=28601;
UPDATE `creature_template` SET `equipment_id` = 2476 WHERE `entry`=28601;

-- create questloot
DELETE FROM `creature_loot_template` WHERE `entry`=28601;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(28601, 38708, -100, 1, 0, 1, 1);

UPDATE `instance_template` SET `allowMount`=1 WHERE `map`=531; -- Allow mount in AQ40
UPDATE `instance_template` SET `allowMount`=1 WHERE `map`=631; -- Allow mount in ICC

-- Fix to Spell targets for Ignis adds
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=62343;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=62488;
INSERT INTO `conditions`(`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,62343,0,18,1,33121,0,0, '', 'Heat to Iron Construct'),
(13,0,62488,0,18,1,33121,0,0, '', 'Activate Construct to iron Construct');
 
-- Burn Secondary Effect from Vehicles
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=65044;
INSERT INTO `conditions`(`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,65044,1,18,1,34234,0,0, '', 'Flames to Runeforged Sentry'),
(13,0,65044,2,18,1,33236,0,0, '', 'Flames to Steelforged Defender'),
(13,0,65044,3,18,1,33572,0,0, '', 'Flames to Steelforged Defender'),
(13,0,65044,4,18,1,33237,0,0, '', 'Flames to Ulduar Colossus'),
(13,0,65044,5,18,1,33189,0,0, '', 'Flames to Liquid pyrite'),
(13,0,65044,6,18,1,33090,0,0, '', 'Flames to Pool of Tar'),
(13,0,65044,7,18,1,34161,0,0, '', 'Flames to Mechanostriker 54-A');
 
-- Burn Secondary Effect from Vehicles
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=65045;
INSERT INTO `conditions`(`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,65045,1,18,1,34234,0,0, '', 'Flames to Runeforged Sentry'),
(13,0,65045,2,18,1,33236,0,0, '', 'Flames to Steelforged Defender'),
(13,0,65045,3,18,1,33572,0,0, '', 'Flames to Steelforged Defender'),
(13,0,65045,4,18,1,33237,0,0, '', 'Flames to Ulduar Colossus'),
(13,0,65045,5,18,1,33189,0,0, '', 'Flames to Liquid pyrite'),
(13,0,65045,6,18,1,33090,0,0, '', 'Flames to Pool of Tar'),
(13,0,65045,7,18,1,34161,0,0, '', 'Flames to Mechanostriker 54-A');
 
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=62911;
INSERT INTO `conditions`(`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,62911,0,18,1,33365,0,0, '', 'Thorim\'s Hammer to Thorim\'s Hammer');
 
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=62906;
INSERT INTO `conditions`(`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,62906,0,18,1,33367,0,0, '', 'Freya\'s Ward to Freya\'s Ward');
 
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=62705;
INSERT INTO `conditions`(`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,62705,1,18,1,33060,0,0, '', 'Auto-repair to Salvaged Siege Engine'),
(13,0,62705,2,18,1,33067,0,0, '', 'Auto-repair to Salvaged Siege Turret'),
(13,0,62705,3,18,1,33062,0,0, '', 'Auto-repair to Salvaged Chopper'),
(13,0,62705,4,18,1,33109,0,0, '', 'Auto-repair to Salvaged Demolisher'),
(13,0,62705,5,18,1,33167,0,0, '', 'Auto-repair to Salvaged Demolisher Mechanic Seat');
 
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=63294;
INSERT INTO `conditions`(`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,63294,0,18,1,33367,0,0, '', 'Freya Dummy Blue to Freya\'s Ward');
 
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=63295;
INSERT INTO `conditions`(`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,63295,0,18,1,33367,0,0, '', 'Freya Dummy Green to Freya\'s Ward');
 
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=63292;
INSERT INTO `conditions`(`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,63292,0,18,1,33367,0,0, '', 'Freya Dummy Yellow to Freya\'s Ward');

-- Template updates
UPDATE `creature_template` SET `dynamicflags`=`dynamicflags`&~8 WHERE `entry`=33059; -- Wrecked Demolisher
UPDATE `creature_template` SET `exp`=0 WHERE `entry`=33666; -- Demolisher Engineer Blastwrench
UPDATE `creature_template` SET `dynamicflags`=`dynamicflags`&~8 WHERE `entry`=33063; -- Wrecked Siege Engine
UPDATE `creature_template` SET `npcflag`=`npcflag`|16777216 WHERE `entry`=33067; -- Salvaged Siege Turret
UPDATE `creature_template` SET `VehicleId`=387 WHERE `entry`=33113; -- Flame Leviathan
UPDATE `creature_template` SET `exp`=0 WHERE `entry`=33143; -- Overload Control Device
UPDATE `creature_template` SET `exp`=0,`npcflag`=`npcflag`|16777216,`unit_flags`=`unit_flags`|33571584 WHERE `entry`=33139; -- Flame Leviathan Turret
UPDATE `creature_template` SET `dynamicflags`=`dynamicflags`|12 WHERE `entry`=33216; -- Mechagnome Pilot
UPDATE `creature_template` SET `dynamicflags`=`dynamicflags`|12 WHERE `entry`=33572; -- Steelforged Defender
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|33280 WHERE `entry`=33186; -- Razorscale
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=34120; -- Brann's Flying Machine
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.42857 WHERE `entry`=33118; -- Ignis the Furnace Master
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|33554688 WHERE `entry`=33121; -- Iron Construct
 
-- Model data
UPDATE `creature_model_info` SET `bounding_radius`=5,`combat_reach`=1,`gender`=2 WHERE `modelid`=25870; -- Salvaged Chopper
UPDATE `creature_model_info` SET `bounding_radius`=0.6,`combat_reach`=1,`gender`=1 WHERE `modelid`=28787; -- Razorscale
UPDATE `creature_model_info` SET `bounding_radius`=0.62,`combat_reach`=1,`gender`=0 WHERE `modelid`=29185; -- Ignis the Furnace Master
 
-- Addon data
DELETE FROM `creature_template_addon` WHERE `entry` IN (33114,33142,33143,33139,33189,33216,33572,33090,33186,33287,33259,34120,
23033,34086,33118,33210,33121,34085,33816);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(33114,0,0,257,0, NULL), -- Flame Leviathan Seat
(33142,0,0,1,0, NULL), -- Leviathan Defense Turret
(33143,0,0,1,0, NULL), -- Overload Control Device
(33139,0,0,1,0, NULL), -- Flame Leviathan Turret
(33189,0,0,1,0, NULL), -- Liquid Pyrite
(33216,0,0,1,0, NULL), -- Mechagnome Pilot
(33572,0,0,1,0, NULL), -- Steelforged Defender
(33090,0,0,1,0, NULL),-- Pool of Tar
(33186,0,50331648,1,0, NULL), -- Razorscale
(33816,0,0,1,375, NULL), -- Expedition Defender
(33287,0,0,1,0, NULL), -- Expedition Engineer
(33259,0,0,1,375, NULL), -- Expedition Trapper
(34120,0,50331648,1,0, NULL), -- Brann's Flying Machine
(23033,0,0,1,0, NULL), -- Invisible Stalker (Floating)
(34086,0,33554432,1,0, NULL), -- Magma Rager
(33118,0,0,1,0, NULL), -- Ignis the Furnace Master
(33210,0,0,1,0, NULL), -- Expedition Commander
(33121,0,0,1,0, NULL), -- Iron Construct
(34085,0,0,1,0, NULL); -- Forge Construct

DELETE FROM `spell_dbc` WHERE `Id`=37794;
INSERT INTO `spell_dbc` (`Id`,`Dispel`,`Mechanic`,`Attributes`,`AttributesEx`,`AttributesEx2`,`AttributesEx3`,`AttributesEx4`,`AttributesEx5`,`AttributesEx6`,`AttributesEx7`,`Stances`,`StancesNot`,`Targets`,`CastingTimeIndex`,`AuraInterruptFlags`,`ProcFlags`,`ProcChance`,`ProcCharges`,`MaxLevel`,`BaseLevel`,`SpellLevel`,`DurationIndex`,`RangeIndex`,`StackAmount`,`EquippedItemClass`,`EquippedItemSubClassMask`,`EquippedItemInventoryTypeMask`,`Effect1`,`Effect2`,`Effect3`,`EffectDieSides1`,`EffectDieSides2`,`EffectDieSides3`,`EffectRealPointsPerLevel1`,`EffectRealPointsPerLevel2`,`EffectRealPointsPerLevel3`,`EffectBasePoints1`,`EffectBasePoints2`,`EffectBasePoints3`,`EffectMechanic1`,`EffectMechanic2`,`EffectMechanic3`,`EffectImplicitTargetA1`,`EffectImplicitTargetA2`,`EffectImplicitTargetA3`,`EffectImplicitTargetB1`,`EffectImplicitTargetB2`,`EffectImplicitTargetB3`,`EffectRadiusIndex1`,`EffectRadiusIndex2`,`EffectRadiusIndex3`,`EffectApplyAuraName1`,`EffectApplyAuraName2`,`EffectApplyAuraName3`,`EffectAmplitude1`,`EffectAmplitude2`,`EffectAmplitude3`,`EffectMultipleValue1`,`EffectMultipleValue2`,`EffectMultipleValue3`,`EffectMiscValue1`,`EffectMiscValue2`,`EffectMiscValue3`,`EffectMiscValueB1`,`EffectMiscValueB2`,`EffectMiscValueB3`,`EffectTriggerSpell1`,`EffectTriggerSpell2`,`EffectTriggerSpell3`,`EffectSpellClassMaskA1`,`EffectSpellClassMaskA2`,`EffectSpellClassMaskA3`,`EffectSpellClassMaskB1`,`EffectSpellClassMaskB2`,`EffectSpellClassMaskB3`,`EffectSpellClassMaskC1`,`EffectSpellClassMaskC2`,`EffectSpellClassMaskC3`,`MaxTargetLevel`,`SpellFamilyName`,`SpellFamilyFlags1`,`SpellFamilyFlags2`,`SpellFamilyFlags3`,`MaxAffectedTargets`,`DmgClass`,`PreventionType`,`DmgMultiplier1`,`DmgMultiplier2`,`DmgMultiplier3`,`AreaGroupId`,`SchoolMask`,`Comment`)VALUES
(37794,0,0,384,0,0,1048576,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,21,1,0,-1,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,56,0,0,0,0,0,0,0,0,16963,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,'Transform Infernal');

-- Template updates
UPDATE `creature_template` SET `unit_flags`=0,`AIName`='SmartAI' WHERE `entry`=21419; -- Infernal Attacker
UPDATE `creature_model_info` SET `bounding_radius`=1.3545,`combat_reach`=3,`gender`=2 WHERE `modelid`=20577; -- Infernal Attacker
UPDATE `creature_template_addon` SET `bytes1`=0,`bytes2`=1,`mount`=0,`emote`=0,`auras`=NULL WHERE `entry`=21419; -- Infernal Attacker

DELETE FROM `smart_scripts` WHERE `entryorguid`=21419 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(21419, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 11, 37794, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Infernal Attacker - On spawn cast Transform Infernal on self');

DELETE FROM `event_scripts` WHERE `id` IN (16929,17084);
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES
-- H
(16929, 3, 10, 25742, 360000, 0, 3533.64, 4535.52, -12.9953, 3.47514), -- Alluvion
(16929, 10, 8, 25742, 0, 0, 0, 0, 0, 0), -- KC
(16929, 3, 10, 25629, 360000, 0, 3511.96, 4527.18, -12.9949, 0.357893), -- Kryxix
-- A
(17084, 3, 10, 25794, 360000, 0, 3533.64, 4535.52, -12.9953, 3.47514), -- Shake-n-Quake 5000
(17084, 10, 8, 25794, 0, 0, 0, 0, 0, 0), -- KC
(17084, 3, 10, 25629, 360000, 0, 3511.96, 4527.18, -12.9949, 0.357893); -- Kryxix

UPDATE `creature` SET `spawnMask`=1 WHERE `guid` IN (1102,85587) AND `id` IN (22237,17318);
DELETE FROM `game_event_creature` WHERE `eventEntry`=7 AND `guid`=1102;
INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES
(7,1102); -- Loirea Galerunner - Lunar Festival

-- Fix Startup Errors
UPDATE `creature_template` SET `exp`=0,`npcflag`=`npcflag`|16777216,`unit_flags`=`unit_flags`|33571584 WHERE `entry`=34111;
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (33139,34111);
INSERT INTO `npc_spellclick_spells`(`npc_entry`,`spell_id`,`quest_start`,`quest_start_active`,`quest_end`,`cast_flags`,`aura_required`,`aura_forbidden`,`user_type`) VALUES
(34111,46598,0,0,0,1,0,0,0),
(33139,46598,0,0,0,1,0,0,0);
 
-- Added Burn to Vehicles for Hard mode Mechanics
-- Thanks to horn for the reminder
-- Burn Secondary Effect from Vehicles
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (65044,65045);
INSERT INTO `conditions`(`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,65044,1,18,1,34234,0,0, '', 'Flames to Runeforged Sentry'),
(13,0,65044,2,18,1,33236,0,0, '', 'Flames to Steelforged Defender'),
(13,0,65044,3,18,1,33572,0,0, '', 'Flames to Steelforged Defender'),
(13,0,65044,4,18,1,33237,0,0, '', 'Flames to Ulduar Colossus'),
(13,0,65044,5,18,1,33189,0,0, '', 'Flames to Liquid pyrite'),
(13,0,65044,6,18,1,33090,0,0, '', 'Flames to Pool of Tar'),
(13,0,65044,7,18,1,34161,0,0, '', 'Flames to Mechanostriker 54-A'),
(13,0,65044,8,18,1,33062,0,0, '', 'Flames to Salvaged Chopper'),
(13,0,65044,9,18,1,34045,0,0, '', 'Flames to Salvaged Chopper'),
(13,0,65044,10,18,1,33109,0,0, '', 'Flames to Salvaged Demolisher'),
(13,0,65044,11,18,1,33060,0,0, '', 'Flames to Salvaged Salvaged Siege Engine'),
-- Burn Secondary Effect from Vehicles
(13,0,65045,1,18,1,34234,0,0, '', 'Flames to Runeforged Sentry'),
(13,0,65045,2,18,1,33236,0,0, '', 'Flames to Steelforged Defender'),
(13,0,65045,3,18,1,33572,0,0, '', 'Flames to Steelforged Defender'),
(13,0,65045,4,18,1,33237,0,0, '', 'Flames to Ulduar Colossus'),
(13,0,65045,5,18,1,33189,0,0, '', 'Flames to Liquid pyrite'),
(13,0,65045,6,18,1,33090,0,0, '', 'Flames to Pool of Tar'),
(13,0,65045,7,18,1,34161,0,0, '', 'Flames to Mechanostriker 54-A'),
(13,0,65045,8,18,1,33062,0,0, '', 'Flames to Salvaged Chopper'),
(13,0,65045,9,18,1,34045,0,0, '', 'Flames to Salvaged Chopper'),
(13,0,65045,10,18,1,33109,0,0, '', 'Flames to Salvaged Demolisher'),
(13,0,65045,11,18,1,33060,0,0, '', 'Flames to Salvaged Salvaged Siege Engine');

SET @GUID = 209113;
DELETE FROM `creature` WHERE `id` IN (30395,30446,30450,30454);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`) VALUES
(@GUID+00, 30395, 571, 1, 1, 8348.89, -2509.48, 1147.37, 3.7001, 120, 0),
(@GUID+01, 30446, 571, 1, 1, 8253.4, -2566.37, 1149.7, 0.0698132, 120, 0),
(@GUID+02, 30446, 571, 1, 1, 8281.26, -2612.78, 1150.66, 0.349066, 120, 0),
(@GUID+03, 30446, 571, 1, 1, 8283.91, -2585.09, 1149.51, 5.00909, 120, 0),
(@GUID+04, 30446, 571, 1, 1, 8300.43, -2564.86, 1153.59, 0.261799, 120, 0),
(@GUID+05, 30446, 571, 1, 1, 8310.22, -2550.68, 1153.69, 1.91986, 120, 0),
(@GUID+06, 30446, 571, 1, 1, 8331.42, -2502.39, 1140.05, 4.53786, 120, 0),
(@GUID+07, 30446, 571, 1, 1, 8354.63, -2549.88, 1148.54, 4.95674, 120, 0),
(@GUID+08, 30446, 571, 1, 1, 8361.87, -2526.85, 1141.39, 3.68264, 120, 0),
(@GUID+09, 30446, 571, 1, 1, 8382.5, -2549.35, 1145.97, 3.82227, 120, 0),
(@GUID+10, 30446, 571, 1, 1, 8393.97, -2540.06, 1131.91, 5.07891, 120, 0),
(@GUID+24, 30454, 571, 1, 1, 8289.31, -2602.48, 1151.42, 1.95477, 120, 0),
(@GUID+25, 30454, 571, 1, 1, 8294.61, -2589.08, 1150.63, 1.39626, 120, 0),
(@GUID+26, 30454, 571, 1, 1, 8300.51, -2596.84, 1151.87, 3.9619, 120, 0),
(@GUID+27, 30454, 571, 1, 1, 8303.38, -2521.44, 1154.39, 5.07891, 120, 0),
(@GUID+28, 30454, 571, 1, 1, 8312.52, -2561.31, 1152.03, 4.72984, 120, 0),
(@GUID+29, 30454, 571, 1, 1, 8314.11, -2500.82, 1143.3, 1.6057, 120, 0),
(@GUID+30, 30454, 571, 1, 1, 8317.65, -2573.94, 1151.43, 3.03687, 120, 0),
(@GUID+31, 30454, 571, 1, 1, 8336.79, -2502.89, 1133.36, 5.41052, 120, 0),
(@GUID+32, 30454, 571, 1, 1, 8342.26, -2505.45, 1134.28, 4.01426, 120, 0),
(@GUID+33, 30454, 571, 1, 1, 8351.38, -2508.96, 1135.07, 0.244346, 120, 0),
(@GUID+34, 30454, 571, 1, 1, 8381.3, -2529.69, 1133.36, 4.62512, 120, 0),
(@GUID+35, 30454, 571, 1, 1, 8387.79, -2527.25, 1135.03, 4.53786, 120, 0),
(@GUID+36, 30454, 571, 1, 1, 8393.11, -2548.1, 1143.71, 1.72788, 120, 0),
(@GUID+37, 30454, 571, 1, 1, 8398.62, -2526.46, 1134.62, 3.80482, 120, 0),
(@GUID+38, 30454, 571, 1, 1, 8401.63, -2539.44, 1132.53, 1.39626, 120, 0),
(@GUID+39, 30454, 571, 1, 1, 8406.36, -2532.98, 1131.75, 2.04204, 120, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@GUID+11, 30450, 571, 1, 1, 8259.18, -2570.82, 1149.61, 1.56682, 120, 5, 1),
(@GUID+12, 30450, 571, 1, 1, 8264.03, -2566.79, 1149.61, 2.96147, 120, 5, 1),
(@GUID+13, 30450, 571, 1, 1, 8284.46, -2601.7, 1150.49, 5.66794, 120, 5, 1),
(@GUID+14, 30450, 571, 1, 1, 8292.88, -2572.04, 1146.46, 1.3252, 120, 5, 1),
(@GUID+15, 30450, 571, 1, 1, 8298.51, -2592.29, 1150.48, 0.513648, 120, 5, 1),
(@GUID+16, 30450, 571, 1, 1, 8306.36, -2524.83, 1152.22, 2.29176, 120, 5, 1),
(@GUID+17, 30450, 571, 1, 1, 8313.22, -2565.91, 1150.88, 0.739577, 120, 5, 1),
(@GUID+18, 30450, 571, 1, 1, 8334.5, -2519.78, 1138.3, 5.60389, 120, 5, 1),
(@GUID+19, 30450, 571, 1, 1, 8336.27, -2512.15, 1135.11, 3.55008, 120, 5, 1),
(@GUID+20, 30450, 571, 1, 1, 8350.84, -2544.52, 1147.52, 5.8518, 120, 5, 1),
(@GUID+21, 30450, 571, 1, 1, 8365.42, -2533.72, 1132.69, 5.61117, 120, 5, 1),
(@GUID+22, 30450, 571, 1, 1, 8377.27, -2545.82, 1140.66, 2.91336, 120, 5, 1),
(@GUID+23, 30450, 571, 1, 1, 8396.34, -2529.92, 1131.82, 1.30778, 120, 5, 1);

UPDATE `creature_template` SET `npcflag`=3,`gossip_menu_id`=9906 WHERE `entry`=30395; -- Chieftain Swiftspear
UPDATE `creature_template` SET `InhabitType`=7 WHERE `entry`=30446; -- Frostfloe Rift
UPDATE `creature_template` SET `MovementType`=1 WHERE `entry`=30450; -- Wailing Winds
UPDATE `creature_template` SET `InhabitType`=7,`flags_extra`=`flags_extra`|128 WHERE `entry`=30454; -- Frostfloe Deep Stalker

UPDATE `creature_model_info` SET `bounding_radius`=0.6076385,`combat_reach`=2.625,`gender`=0 WHERE `modelid`=27004; -- Chieftain Swiftspear
UPDATE `creature_model_info` SET `bounding_radius`=0.5,`combat_reach`=1,`gender`=2 WHERE `modelid`=27617; -- Wailing Winds

DELETE FROM `creature_template_addon` WHERE `entry` IN (30395,30446,30450,30454);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(30395,0,0,1,0, NULL), -- Chieftain Swiftspear
(30446,0,0x3000000,1,0, NULL), -- Frostfloe Rift
(30450,0,0,1,0, NULL), -- Wailing Winds
(30454,0,0x3000000,1,0, NULL); -- Frostfloe Deep Stalker

DELETE FROM `gossip_menu` WHERE `entry`=9906 AND `text_id`=13776;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(9906, 13776);

-- Quest 12983 "Last of Her Kind"

-- Add Injured Icemaw Matriarch
DELETE FROM `creature` WHERE `id`=29563;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(152124,29563,571,1,1,0,0,7335.381,-2055.097,764.3585,3.368485,120,0,0,1,0,0,0,0,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|16777216 WHERE `entry`=29563; -- Injured Icemaw Matriarch
-- SAI for Harnessed Icemaw Matriarch
SET @ENTRY := 30468;
UPDATE `creature_template` SET `AIName`='SmartAI', `faction_A`=35, `faction_H`=35 WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,27,0,100,0,0,0,0,0,53,1,@ENTRY,0,12983,0,0,1,0,0,0,0,0,0,0, 'Harnessed Icemaw Matriarch - On Passenger - Start WP movement'),
(@ENTRY,0,1,0,40,0,100,0,1,@ENTRY,0,0,18,130,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harnessed Icemaw Matriarch - Reach Waypoint - Make Unatackable'),
(@ENTRY,0,2,0,40,0,100,0,50,@ENTRY,0,0,33,29563,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Harnessed Icemaw Matriarch - Reach Waypoint - Quest Credit'),
(@ENTRY,0,3,0,40,0,100,0,51,@ENTRY,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harnessed Icemaw Matriarch - Reach Waypoint - Despawn');
-- Waypoints for Harnessed Icemaw Matriarch
DELETE FROM `waypoints` WHERE `entry`=30468;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(30468,1,7339.617,-2058.659,764.919,'Harnessed Icemaw Matriarch'),
(30468,2,7338.267,-2064.381,765.3577,'Harnessed Icemaw Matriarch'),
(30468,3,7335.772,-2073.805,767.4077,'Harnessed Icemaw Matriarch'),
(30468,4,7327.591,-2087.35,770.8978,'Harnessed Icemaw Matriarch'),
(30468,5,7319.448,-2095.41,773.6814,'Harnessed Icemaw Matriarch'),
(30468,6,7305.165,-2107.299,774.3261,'Harnessed Icemaw Matriarch'),
(30468,7,7275.178,-2114.627,775.6678,'Harnessed Icemaw Matriarch'),
(30468,8,7258.999,-2116.149,778.5131,'Harnessed Icemaw Matriarch'),
(30468,9,7241.648,-2119.356,777.7652,'Harnessed Icemaw Matriarch'),
(30468,10,7226.729,-2115.936,777.3341,'Harnessed Icemaw Matriarch'),
(30468,11,7208.441,-2115.223,770.9512,'Harnessed Icemaw Matriarch'),
(30468,12,7198.355,-2115.354,767.3314,'Harnessed Icemaw Matriarch'),
(30468,13,7193.219,-2115.251,765.6339,'Harnessed Icemaw Matriarch'),
(30468,14,7188.855,-2117.307,763.8766,'Harnessed Icemaw Matriarch'),
(30468,15,7177.065,-2123.511,762.9337,'Harnessed Icemaw Matriarch'),
(30468,16,7163.708,-2131.039,762.1168,'Harnessed Icemaw Matriarch'),
(30468,17,7146.599,-2130.739,762.0986,'Harnessed Icemaw Matriarch'),
(30468,18,7127.765,-2130.799,760.3064,'Harnessed Icemaw Matriarch'),
(30468,19,7130.188,-2108.955,761.6824,'Harnessed Icemaw Matriarch'),
(30468,20,7122.738,-2087.617,763.7275,'Harnessed Icemaw Matriarch'),
(30468,21,7114.396,-2070.318,765.9775,'Harnessed Icemaw Matriarch'),
(30468,22,7101.815,-2051.608,765.8251,'Harnessed Icemaw Matriarch'),
(30468,23,7091.483,-2031.099,765.8953,'Harnessed Icemaw Matriarch'),
(30468,24,7087.403,-2012.366,767.2703,'Harnessed Icemaw Matriarch'),
(30468,25,7081.406,-1985.07,767.9617,'Harnessed Icemaw Matriarch'),
(30468,26,7073.832,-1961.028,769.3597,'Harnessed Icemaw Matriarch'),
(30468,27,7068.839,-1934.135,775.7347,'Harnessed Icemaw Matriarch'),
(30468,28,7064.366,-1916.702,781.6978,'Harnessed Icemaw Matriarch'),
(30468,29,7070.385,-1906.559,785.4976,'Harnessed Icemaw Matriarch'),
(30468,30,7079.504,-1899.025,787.0339,'Harnessed Icemaw Matriarch'),
(30468,31,7085.339,-1887.627,788.9089,'Harnessed Icemaw Matriarch'),
(30468,32,7067.585,-1884.709,793.0339,'Harnessed Icemaw Matriarch'),
(30468,33,7041.699,-1884.614,797.4276,'Harnessed Icemaw Matriarch'),
(30468,34,7029.2,-1871.599,803.4189,'Harnessed Icemaw Matriarch'),
(30468,35,7025.071,-1858.876,811.2399,'Harnessed Icemaw Matriarch'),
(30468,36,7018.791,-1838.968,820.2399,'Harnessed Icemaw Matriarch'),
(30468,37,7011.697,-1814.383,820.7299,'Harnessed Icemaw Matriarch'),
(30468,38,7009.096,-1791.501,820.7303,'Harnessed Icemaw Matriarch'),
(30468,39,7017.041,-1758.968,819.6544,'Harnessed Icemaw Matriarch'),
(30468,40,7013.258,-1723.917,819.8597,'Harnessed Icemaw Matriarch'),
(30468,41,6995.103,-1720.753,820.1116,'Harnessed Icemaw Matriarch'),
(30468,42,6975.483,-1722.112,820.7366,'Harnessed Icemaw Matriarch'),
(30468,43,6959.883,-1724.389,820.5955,'Harnessed Icemaw Matriarch'),
(30468,44,6941.025,-1720.429,820.5955,'Harnessed Icemaw Matriarch'),
(30468,45,6920.026,-1709.558,820.7527,'Harnessed Icemaw Matriarch'),
(30468,46,6902.995,-1697.53,820.6683,'Harnessed Icemaw Matriarch'),
(30468,47,6886.746,-1682.953,820.2584,'Harnessed Icemaw Matriarch'),
(30468,48,6867.681,-1684.361,819.8834,'Harnessed Icemaw Matriarch'),
(30468,49,6847.065,-1695.642,819.9857,'Harnessed Icemaw Matriarch'),
(30468,50,6824.819,-1701.835,820.6398,'Harnessed Icemaw Matriarch'),
(30468,51,6824.819,-1701.835,820.5497,'Harnessed Icemaw Matriarch');

-- Phasing Spell
DELETE FROM `spell_area` WHERE `spell`=55857 AND `area`=4455;
INSERT INTO `spell_area`(`spell`,`area`,`quest_start`,`quest_start_active`,`quest_end`,`aura_spell`,`racemask`,`gender`,`autocast`) VALUES 
(55857,4455,12983,1,12983,0,0,2,1);

-- From Nay:
-- TODO: Respawn the whole cave, lots of shit wrong (phasemasks etc)
UPDATE `creature` SET `phaseMask`=2 WHERE `id`=29563;
DELETE FROM `creature_template_addon` WHERE `entry`=30468;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(30468,0,0,1,0, NULL); -- Harnessed Icemaw Matriarch

UPDATE `gossip_menu_option` SET `option_text`='I seem to have misplaced my Zandalar Madcap''s Mantle. Can you help?' WHERE `menu_id`=21270 AND `id`=0; -- It said: "...Zandalar Madcap's Belt." (Wrong name, that item doesn't exist)
UPDATE `gossip_menu_option` SET `option_text`='I seem to have misplaced my Zandalar Predator''s Mantle. Can you help?' WHERE `menu_id`=21271 AND `id`=2; -- It said: "...Zandalar Predator's Tunic." (Wrong name, that item doesn't exist)
UPDATE `gossip_menu_option` SET `option_text`='I seem to have misplaced my Maelstrom''s Tendril. Can you help?' WHERE `menu_id`=21271 AND `id`=4; -- It said: "... Malestrom's Tendril." (Typo)
UPDATE `gossip_menu_option` SET `option_text`='I seem to have misplaced my Maelstrom''s Tendril. Can you help?' WHERE `menu_id`=21271 AND `id`=5; -- It said: "... Malestrom's Tendril." (Typo)
UPDATE `gossip_menu_option` SET `option_text`='I seem to have misplaced my Maelstrom''s Tendril. Can you help?' WHERE `menu_id`=21271 AND `id`=6; -- It said: "... Malestrom's Tendril." (Typo)
UPDATE `smart_scripts` SET `comment`='Falthir the Sightless - On gossip select 2 give item Zandalar Madcap''s Mantle' WHERE `entryorguid`=14905 AND `id`=2; -- It said: "...Zandalar Augur''s Belt" (Wrong name, that item doesn't correspond with rouge class)

-- Quest: Tomb of the Lightbringer, make Anchorite Truuen speak Common not Draconic
UPDATE `script_texts` SET `language`=7 WHERE `comment` LIKE 'npc_anchorite_truuen%' AND `language`=11;

SET @GUID=209153;
DELETE FROM `creature` WHERE `id`=29413;
INSERT INTO `creature` (`guid` ,`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES
(@GUID+0, 29413, 571, 1, 1, 0, 0, 6471.48, -1658.6, 432.644, 5.41462, 600, 0, 0, 1, 0, 0),
(@GUID+1, 29413, 571, 1, 1, 0, 0, 6477.3, -1651.6, 430.185, 5.4107, 600, 0, 0, 1, 0, 0),
(@GUID+2, 29413, 571, 1, 1, 0, 0, 6492.54, -1648.41, 429.39, 5.2222, 600, 0, 0, 1, 0, 0),
(@GUID+3, 29413, 571, 1, 1, 0, 0, 6512.8, -1621.17, 428.168, 6.19609, 600, 0, 0, 1, 0, 0),
(@GUID+4, 29413, 571, 1, 1, 0, 0, 6489.6, -1624.66, 428.328, 2.01384, 600, 0, 0, 1, 0, 0),
(@GUID+5, 29413, 571, 1, 1, 0, 0, 6426.13, -1605.26, 422.576, 1.22452, 600, 0, 0, 1, 0, 0),
(@GUID+6, 29413, 571, 1, 1, 0, 0, 6430.89, -1604.5, 423.222, 0.949627, 600, 0, 0, 1, 0, 0),
(@GUID+7, 29413, 571, 1, 1, 0, 0, 6386.45, -1599.39, 420.724, 2.33193, 600, 0, 0, 1, 0, 0),
(@GUID+8, 29413, 571, 1, 1, 0, 0, 6375.45, -1593.56, 425.553, 1.04387, 600, 0, 0, 1, 0, 0),
(@GUID+9, 29413, 571, 1, 1, 0, 0, 6696.47, -998.844, 415.433, 2.83458, 600, 0, 0, 1, 0, 0),
(@GUID+10, 29413, 571, 1, 1, 0, 0, 6630.7, -1004.17, 424.376, 2.72462, 600, 0, 0, 1, 0, 0),
(@GUID+11, 29413, 571, 1, 1, 0, 0, 6612.56, -1017.17, 427.344, 3.38043, 600, 0, 0, 1, 0, 0),
(@GUID+12, 29413, 571, 1, 1, 0, 0, 6594.54, -1017.6, 429.443, 2.02955, 600, 0, 0, 1, 0, 0),
(@GUID+13, 29413, 571, 1, 1, 0, 0, 6578.55, -982.887, 434.147, 5.99973, 600, 0, 0, 1, 0, 0),
(@GUID+14, 29413, 571, 1, 1, 0, 0, 6580.09, -997.177, 434.919, 5.56384, 600, 0, 0, 1, 0, 0),
(@GUID+15, 29413, 571, 1, 1, 0, 0, 6596.23, -1008.78, 429.445, 5.69736, 600, 0, 0, 1, 0, 0),
(@GUID+16, 29413, 571, 1, 1, 0, 0, 6594.65, -1049.05, 430.103, 2.46544, 600, 0, 0, 1, 0, 0),
(@GUID+17, 29413, 571, 1, 1, 0, 0, 6570.9, -1050.44, 432.848, 3.76527, 600, 0, 0, 1, 0, 0),
(@GUID+18, 29413, 571, 1, 1, 0, 0, 6533.12, -1075.28, 432.917, 1.53867, 600, 0, 0, 1, 0, 0),
(@GUID+19, 29413, 571, 1, 1, 0, 0, 6536.16, -1078.86, 433.175, 1.54652, 600, 0, 0, 1, 0, 0),
(@GUID+20, 29413, 571, 1, 1, 0, 0, 6536.22, -1076.53, 433.014, 1.54652, 600, 0, 0, 1, 0, 0),
(@GUID+21, 29413, 571, 1, 1, 0, 0, 6534.27, -1076.49, 432.958, 1.54652, 600, 0, 0, 1, 0, 0),
(@GUID+22, 29413, 571, 1, 1, 0, 0, 6534.71, -1073.77, 432.928, 1.54652, 600, 0, 0, 1, 0, 0),
(@GUID+23, 29413, 571, 1, 1, 0, 0, 6538.16, -1076.95, 433.1, 1.55438, 600, 0, 0, 1, 0, 0),
(@GUID+24, 29413, 571, 1, 1, 0, 0, 6536.77, -1073.94, 432.995, 1.46013, 600, 0, 0, 1, 0, 0),
(@GUID+25, 29413, 571, 1, 1, 0, 0, 6538.6, -1075.64, 433.11, 1.49155, 600, 0, 0, 1, 0, 0),
(@GUID+26, 29413, 571, 1, 1, 0, 0, 6621.56, -1078.08, 415.032, 1.05174, 600, 5, 0, 1, 0, 1),
(@GUID+27, 29413, 571, 1, 1, 0, 0, 6641.11, -1093.62, 402.801, 1.36196, 600, 0, 0, 1, 0, 0),
(@GUID+28, 29413, 571, 1, 1, 0, 0, 6610.29, -1279.72, 394.475, 3.31761, 600, 0, 0, 1, 0, 0),
(@GUID+29, 29413, 571, 1, 1, 0, 0, 6599.47, -1270.63, 394.829, 1.10278, 600, 0, 0, 1, 0, 0);

-- Nay:
UPDATE `creature_template_addon` SET `bytes1`=0,`bytes2`=1,`mount`=0,`emote`=233,`auras`=NULL WHERE `entry`=29413;
UPDATE `creature_model_info` SET `bounding_radius`=0.31,`combat_reach`=0,`gender`=0 WHERE `modelid`=27173;
-- Not sure if all  of them should have the emote, check this later.

UPDATE `creature_text` SET `sound`=16825 WHERE `entry`=37129 AND `groupid`=5 AND `id`=0;

UPDATE `creature_template` SET `mechanic_immune_mask`=`mechanic_immune_mask`
|1 -- CHARM
|2 -- DISORIENTED
|4 -- DISARM
|8 -- DISTRACT
|16 -- FEAR
|32 -- GRIP
|64 -- ROOT
|128 -- PACIFY
|256 -- SILENCE
|512 -- SLEEP
|1024 -- SNARE
|2048 -- STUN
|4096 -- FREEZE
|8192 -- KNOCKOUT
|65536 -- POLYMORPH
|131072 -- BANISH
|524288 -- SHACKLE
|4194304 -- TURN
|8388608 -- HORROR
|67108864 -- DAZE
|536870912 -- SAPPED
WHERE `entry` IN
(36597,39166,39167,39168, -- The Lich King
36612,37957,37958,37959, -- Lord Marrowgar
36626,37504,37505,37506, -- Festergut
36627,38390,38549,38550, -- Rotface
36678,38431,38585,38586, -- Professor Putricide
36853,38265,38266,38267, -- Sindragosa
36855,38106,38296,38297, -- Lady Deathwhisper
37813,38402,38582,38583, -- Deathbringer Saurfang
37955,38434,38435,38436, -- Blood-Queen Lana'thel
37970,38401,38784,38785,  -- Prince Valanar
37972,38399,38769,38770, -- Prince Keseleth
37973,38400,38771,38772); -- Prince Taldaram

UPDATE `creature_template` SET `mechanic_immune_mask`=`mechanic_immune_mask`&~2097152 /* INFECTED */ WHERE `entry` IN 
(36626,37504,37505,37506,-- Festergut
36627,38390,38549,38550, -- Rotface
36678,38431,38585,38586); -- Professor Putricide

-- Remove spawns of Perimeter Bunny - they are spawned by spell 54355 used by GO 191502 (Land Mine) 
DELETE FROM `creature` WHERE `id`=29397; 

UPDATE `creature_template` SET `scale`=1 WHERE `entry`=22997;

SET @Gossip = 21289;
SET @NElf = 31111;

DELETE FROM `gossip_menu` WHERE `entry`=@Gossip AND `text_id` IN (15037,15038);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(@Gossip, 15037),
(@Gossip, 15038);

DELETE FROM `gossip_menu_option` WHERE `menu_id`=@Gossip AND `id`=0;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`) VALUES
(@Gossip, 0, 0, 'I believe in you.', 1, 1);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup`=@Gossip;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(14, @Gossip, 15038, 0, 1, 58493, 0, 0, 0, '', 'Mohawk Grenade - aura'),
(14, @Gossip, 15037, 0, 11, 58493, 0, 0, 0, '', 'Mohawk Grenade - no aura'),
(15, @Gossip, 0, 0, 26, 43489, 1, 0, 0, '', 'Mohawk Grenade - no item');

UPDATE `creature_template` SET `gossip_menu_id`=@Gossip,`minlevel`=80,`maxlevel`=80,`npcflag`=`npcflag`|1,`AIName`='SmartAI' WHERE `entry`=@NElf;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@NElf AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@NElf, 0, 0, 1, 62, 0, 100, 0, @Gossip, 0, 0, 0, 11, 69243, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Night Elf Mohawk - On gossip select cast Create Mohawk Grenade'),
(@NElf, 0, 1, 0, 61, 0, 100, 0, @Gossip, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Night Elf Mohawk - Link - close gossip');

DELETE FROM `creature_template_addon` WHERE `entry`=36778;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(36778, 0, 0, 3, 1, 0, NULL); -- sleep

-- Applied immunities to following mechanics:
--  MECHANIC_CHARM
--  MECHANIC_DISORIENTED
--  MECHANIC_DISARM
--  MECHANIC_DISTRACT
--  MECHANIC_FEAR
--  MECHANIC_GRIP
--  MECHANIC_ROOT
--  MECHANIC_SILENCE
--  MECHANIC_SLEEP
--  MECHANIC_SNARE
--  MECHANIC_STUN
--  MECHANIC_FREEZE
--  MECHANIC_KNOCKOUT
--  MECHANIC_POLYMORPH
--  MECHANIC_BANISH
--  MECHANIC_SHACKLE
--  MECHANIC_TURN
--  MECHANIC_HORROR
--  MECHANIC_DAZE
--  MECHANIC_SAPPED

UPDATE `creature_template` SET `mechanic_immune_mask`=617299839 WHERE `entry` IN (
36597,39166,39167,39168, -- The Lich King
36612,37957,37958,37959, -- Lord Marrowgar
36626,37504,37505,37506, -- Festergut
36627,38390,38549,38550, -- Rotface
36678,38431,38585,38586, -- Professor Putricide
36853,38265,38266,38267, -- Sindragosa
36855,38106,38296,38297, -- Lady Deathwhisper
37813,38402,38582,38583, -- Deathbringer Saurfang
37955,38434,38435,38436, -- Blood-Queen Lana'thel
37970,38401,38784,38785, -- Prince Valanar
37972,38399,38769,38770, -- Prince Keseleth
37973,38400,38771,38772); -- Prince Taldaram

SET @GUID := 209102;
SET @NPC_HERENN := 28601;
SET @NPC_DEATHS_HAND_ACOLYTE := 28602;
SET @PATH := @NPC_DEATHS_HAND_ACOLYTE * 10;
SET @OMEGA_RUNE := 38708;

DELETE FROM `creature` WHERE `id` IN (@NPC_HERENN,@NPC_DEATHS_HAND_ACOLYTE);
-- add High Cultist Herenn (28601) 
INSERT INTO `creature` (`guid`,`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`) VALUES
(@GUID+10,@NPC_HERENN,1,-6028.08,-1249.02,-146.7644,3.054326);

-- add Death's Hand Acolyte (28602), genders are random (25342,25343)
INSERT INTO `creature`(`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES
(@GUID,  @NPC_DEATHS_HAND_ACOLYTE,1,1,1,0,0,-6163.63,-1249.54,-159.7329,3.11264,120,0,0,1,0,2),   -- wandering
(@GUID+1,@NPC_DEATHS_HAND_ACOLYTE,1,1,1,0,0,-6083.673,-1249.462,-143.4821,0.01435,120,0,0,1,0,2), -- wandering 
(@GUID+2,@NPC_DEATHS_HAND_ACOLYTE,1,1,1,0,0,-6037.476,-1243.375,-146.8277,5.98647,120,0,0,1,0,0), -- kneeled 
(@GUID+3,@NPC_DEATHS_HAND_ACOLYTE,1,1,1,0,0,-6036.1,-1255.38,-146.8277,1.15191,120,0,0,1,0,0),    -- kneeled 
(@GUID+4,@NPC_DEATHS_HAND_ACOLYTE,1,1,1,0,0,-6065.16,-1256.21,-143.3607,3.10668,120,0,0,1,0,0),
(@GUID+5,@NPC_DEATHS_HAND_ACOLYTE,1,1,1,0,0,-6118.18,-1241.33,-143.281,3.12169,120,0,0,1,0,0),
(@GUID+6,@NPC_DEATHS_HAND_ACOLYTE,1,1,1,0,0,-6104.965,-1243.601,-143.1921,3.12413,120,0,0,1,0,0),
(@GUID+7,@NPC_DEATHS_HAND_ACOLYTE,1,1,1,0,0,-6065.27,-1242.8,-143.3297,3.14159,120,0,0,1,0,0),
(@GUID+8,@NPC_DEATHS_HAND_ACOLYTE,1,1,1,0,0,-6104.698,-1256.314,-143.1921,3.05432,120,0,0,1,0,0),
(@GUID+9,@NPC_DEATHS_HAND_ACOLYTE,1,1,1,0,0,-6121.342,-1258.456,-143.1921,2.9147,120,0,0,1,0,0);

-- update creature_template Death's Hand Acolyte for equipment
UPDATE `creature_template` SET `equipment_id`=815 WHERE `entry`=@NPC_DEATHS_HAND_ACOLYTE;

-- set waypoint id's and visual effects
DELETE FROM `creature_addon` WHERE `guid` IN (@GUID,@GUID+1,@GUID+2,@GUID+3);
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@GUID  ,@PATH,0,1,0,''), 
(@GUID+1,@PATH+20,0,1,0,''), 
(@GUID+2,0,8,0,0,''),       -- kneeling
(@GUID+3,0,8,0,0,'');       -- kneeling

-- pathing Death's Hand Acolyte #1
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-6167.854,-1249.36,-162.6509,0,0,0,100,0),
(@PATH,2,-6154.54,-1249.757,-155.4785,0,0,0,100,0),
(@PATH,3,-6141.45,-1249.3,-147.7103,0,0,0,100,0),
(@PATH,4,-6140.292,-1249.466,-147.2287,0,0,0,100,0),
(@PATH,5,-6138.544,-1249.176,-145.9789,0,0,0,100,0),
(@PATH,6,-6136.085,-1249.64,-143.2982,0,0,0,100,0),
(@PATH,7,-6120.995,-1250.048,-143.2961,0,0,0,100,0),
(@PATH,8,-6133.946,-1250.144,-143.3480,0,0,0,100,0);

-- pathing Death's Hand Acolyte #2
DELETE FROM `waypoint_data` WHERE `id`=@PATH+20;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH+20,1,-6063.011,-1249.407,-143.4293,0,0,0,100,0),
(@PATH+20,2,-6067.342,-1249.435,-143.2057,0,0,0,100,0),
(@PATH+20,3,-6081.293,-1249.456,-143.4746,0,0,0,100,0),
(@PATH+20,4,-6083.673,-1249.462,-143.4821,0,0,0,100,0),
(@PATH+20,5,-6091.368,-1249.619,-143.6254,0,0,0,100,0),
(@PATH+20,6,-6100.618,-1249.619,-143.3754,0,0,0,100,0),
(@PATH+20,7,-6105.942,-1249.782,-143.2761,0,0,0,100,0);

-- SAI for High Cultist Herenn, also add loot and equipment
UPDATE `creature_template` SET `AIName`='SmartAI',`equipment_id`=1803 WHERE `entry`=@NPC_HERENN;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@NPC_HERENN;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@NPC_HERENN,0,0,0,0,0,100,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'High Cultist Herenn - in Combat - Say Text 0');

-- High Cultist Herenn talk text 
DELETE FROM `creature_text` WHERE `entry`=@NPC_HERENN;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@NPC_HERENN,0,0,'Fool! You led us to the only being that could stand up to our armies! You will never bring the Etymidian back to Northrend!',12,0,100,25,0,0,'High Cultist Herenn');

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_warl_ritual_of_doom_effect';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(18541, 'spell_warl_ritual_of_doom_effect');

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_dreamwalker_twisted_nightmares';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(71941, 'spell_dreamwalker_twisted_nightmares');

