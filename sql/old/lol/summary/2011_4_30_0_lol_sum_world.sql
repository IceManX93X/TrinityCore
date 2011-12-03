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
-- Fix Multiple Spawn of Saragosa (26231) -> Remove Item (35690) on summon Saragosa 
UPDATE creature_template SET AIName = 'SmartAI' WHERE entry = 26231;
-- remove item on summon creature
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 26231;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(26231,0,0,0,54,0,100,0,0,0,0,0,57,35690,1,0,0,0,0,7,0,0,0,0,0,0,0,'on spawn Saragosa - remove Item:Arcane Power Focus from player');
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
UPDATE `creature_template` SET `gossip_menu_id` = @Brann, `npcflag` = 1, `minlevel` = 80, `maxlevel` = 80, `exp` = 2, `mindmg` = 422, `maxdmg` = 586, `attackpower` = 642, `dmg_multiplier` = 7.5, `minrangedmg` = 345, `maxrangedmg` = 509, `rangedattackpower` = 103, `AIName` = 'SmartAI' WHERE `entry` = @Brann;
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
-- captive proto-drake
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=29708;
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`quest_start`,`quest_start_active`,`quest_end`,`cast_flags`,`aura_required`,`aura_forbidden`,`user_type`)
VALUES (29708,55028,12856,1,12856,1,0,0,0);

-- Fix Blessing of Kings and Blessing of Sanctuary Stacking each other
SET @BoS    = 20911; -- Blessing of Sanctuary
SET @BoK    = 20217; -- Blessing of Kings
SET @GBoK   = 25898; -- Greater Blessing of Kings
SET @GBoS   = 25899; -- Greater Blessing of Sanctuary
SET @BoFK   = 72586; -- Blessing of Forgotten Kings 
DELETE FROM `spell_group` WHERE `id` = 5000;
DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 5000;
DELETE FROM `spell_linked_spell` WHERE `spell_effect` IN (-@BoS,-@BoK,-@GBoK,-@GBoS,-@BoFK);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
-- Remove BoS
(@BoK,-@BoS,1,'Target - Remove: Blessing of Sanctuary on Spellhit: Blessing of Kings'),
(@GBoK,-@BoS,1,'Target - Remove: Blessing of Sanctuary on Spellhit: Greater Blessing of Kings'),
(@GBoS,-@BoS,1,'Target - Remove: Blessing of Sanctuary on Spellhit: Greater Blessing of Sanctuary'),
(@BoFK,-@BoS,1,'Target - Remove: Blessing of Sanctuary on Spellhit: Blessing of Forgotten Kings'),
-- Remove BoK
(@BoS,-@BoK,1,'Target - Remove: Blessing of Kings on Spellhit: Blessing of Sanctuary'),
(@GBoK,-@BoK,1,'Target - Remove: Blessing of Kings on Spellhit: Greater Blessing of Kings'),
(@GBoS,-@BoK,1,'Target - Remove: Blessing of Kings on Spellhit: Greater Blessing of Sanctuary'),
(@BoFK,-@BoK,1,'Target - Remove: Blessing of Kings on Spellhit: Blessing of Forgotten Kings'), 
-- Remove GBoK
(@BoS,-@GBoK,1,'Target - Remove: Greater Blessing of Kings on Spellhit: Blessing of Sanctuary'),
(@BoK,-@GBoK,1,'Target - Remove: Greater Blessing of Kings on Spellhit: Blessing of Kings'),
(@GBoS,-@GBoK,1,'Target - Remove: Greater Blessing of Kings on Spellhit: Greater Blessing of Sanctuary'),
(@BoFK,-@GBoK,1,'Target - Remove: Greater Blessing of Kings on Spellhit: Blessing of Forgotten Kings'), 
-- Remove GBoS
(@BoS,-@GBoS,1,'Target - Remove: Greater Blessing of Sanctuary on Spellhit: Blessing of Sanctuary'),
(@BoK,-@GBoS,1,'Target - Remove: Greater Blessing of Sanctuary on Spellhit: Blessing of Kings'),
(@GBoK,-@GBoS,1,'Target - Remove: Greater Blessing of Sanctuary on Spellhit: Greater Blessing of Kings'),
(@BoFK,-@GBoS,1,'Target - Remove: Greater Blessing of Sanctuary on Spellhit: Blessing of Forgotten Kings'), 
-- Remove BoFK
(@BoS,-@BoFK,1,'Target - Remove: Blessing of Forgotten Kings on Spellhit: Blessing of Sanctuary'),
(@BoK,-@BoFK,1,'Target - Remove: Blessing of Forgotten Kings on Spellhit: Blessing of Kings'),
(@GBoK,-@BoFK,1,'Target - Remove: Blessing of Forgotten Kings on Spellhit: Greater Blessing of Kings'),
(@GBoS,-@BoFK,1,'Target - Remove: Blessing of Forgotten Kings on Spellhit: Greater Blessing of Sanctuary');
-- Fix some Quest Reputation Rewards #9266#9267#9268
UPDATE `quest_template` SET `RewRepFaction1` = 87, `RewRepFaction2` = 577, `RewRepFaction3` = 0, `RewRepFaction4` = 0, `RewRepFaction5` = 0, `RewRepValue1` = 0, `RewRepValue2` = 0, `RewRepValue3` = 0, `RewRepValue4` = 0, `RewRepValue5` = 0, `RewRepValueId1` = -7, `RewRepValueId2` = 7, `RewRepValueId3` = 0, `RewRepValueId4` = 0, `RewRepValueId5` = 0 WHERE `entry` = 9266;
UPDATE `quest_template` SET `RewRepFaction1` = 87, `RewRepFaction2` = 470, `RewRepFaction3` = 0, `RewRepFaction4` = 0, `RewRepFaction5` = 0, `RewRepValue1` = 0, `RewRepValue2` = 0, `RewRepValue3` = 0, `RewRepValue4` = 0, `RewRepValue5` = 0, `RewRepValueId1` = -7, `RewRepValueId2` = 7, `RewRepValueId3` = 0, `RewRepValueId4` = 0, `RewRepValueId5` = 0 WHERE `entry` = 9267; 
UPDATE `quest_template` SET `RewRepFaction1` = 87, `RewRepFaction2` = 369, `RewRepFaction3` = 0, `RewRepFaction4` = 0, `RewRepFaction5` = 0, `RewRepValue1` = 0, `RewRepValue2` = 0, `RewRepValue3` = 0, `RewRepValue4` = 0, `RewRepValue5` = 0, `RewRepValueId1` = -7, `RewRepValueId2` = 7, `RewRepValueId3` = 0, `RewRepValueId4` = 0, `RewRepValueId5` = 0 WHERE `entry` = 9268; 
DELETE FROM `spell_script_names` WHERE `spell_id`=64597;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(64597, 'spell_cosmic_smash_missile_target');

DELETE FROM `reference_loot_template` WHERE `entry`=34122 AND `lootmode`=4;
DELETE FROM `creature_loot_template` WHERE `entry`=32867 AND `lootmode`=4;

UPDATE `creature_loot_template` SET `lootmode`=1 WHERE `entry` IN (32867,32927) AND `lootmode`=2;

DELETE FROM `creature_loot_template` WHERE `entry`=32867 AND `groupid`=1;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(32867,45447,0,1,1,1,1),
(32867,45448,0,1,1,1,1),
(32867,45449,0,1,1,1,1),
(32867,45455,0,1,1,1,1),
(32867,45456,0,1,1,1,1);

-- -------------------------------------------------------------------------------------
-- SAI for NPC's with Quests 'The Magical Kingdom of Dalaran' Quests #12794#12791#12796
-- -------------------------------------------------------------------------------------
-- Image of Archmage Aethas Sunreaver
UPDATE `creature_template`SET `AIName` = 'SmartAI', `gossip_menu_id` = 9780, `npcflag` = 3, `ScriptName` = '' WHERE `entry` IN (26471,29155,29159,29160,29162,26673,23729,27158,29158,29161,29169);
-- gossip_menu_option
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 9780;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`) VALUES
(9780,0,0,'I am ready to be teleported to Dalaran.',1,1,0,0,0,0,0,'');
-- SAI
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (26471,29155,29159,29160,29162,26673,23729,27158,29158,29161,29169) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
-- HORDE --
-- Image of Archmage Aethas Sunreaver
(26471,0,0,1,62,0,100,0,9780,0,0,0,11,54620,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(26471,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip'),
(26471,0,2,0,20,0,100,0,12066,0,0,0,28,47391,0,0,0,0,0,7,0,0,0,0,0,0,0,'on QuestReward 12066 - Remove:Ley Line Information'),
(26471,0,3,0,20,0,100,0,12084,0,0,0,28,47473,0,0,0,0,0,7,0,0,0,0,0,0,0,'on QuestReward 12084 - Remove:Ley Line Information'),
(26471,0,4,0,20,0,100,0,12110,0,0,0,28,47636,0,0,0,0,0,7,0,0,0,0,0,0,0,'on QuestReward 12110 - Remove:Ley Line Information'),
-- Magistrix Kaelana
(29155,0,0,1,62,0,100,0,9780,0,0,0,11,54620,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(29155,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip'),
-- Magister Varenthas
(29159,0,0,1,62,0,100,0,9780,0,0,0,11,54620,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(29159,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip'),
-- Magistrix Phaelista
(29160,0,0,1,62,0,100,0,9780,0,0,0,11,54620,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(29160,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip'),
-- Magister Tyr'ganal
(29162,0,0,1,62,0,100,0,9780,0,0,0,11,54620,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(29162,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip'),
-- ALLIANCE --
-- Image of Archmage Modera
(26673,0,0,1,62,0,100,0,9780,1,0,0,11,54620,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(26673,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip'),
(26673,0,2,0,20,0,100,0,12065,0,0,0,28,47391,0,0,0,0,0,7,0,0,0,0,0,0,0,'on QuestReward 12065 - Remove:Ley Line Information'),
(26673,0,3,0,20,0,100,0,12083,0,0,0,28,47473,0,0,0,0,0,7,0,0,0,0,0,0,0,'on QuestReward 12083 - Remove:Ley Line Information'),
(26673,0,4,0,20,0,100,0,12107,0,0,0,28,47636,0,0,0,0,0,7,0,0,0,0,0,0,0,'on QuestReward 12107 - Remove:Ley Line Information'),
-- Baron Ulrik von Stromhearth
(23729,0,0,1,62,0,100,0,9780,1,0,0,11,54620,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(23729,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip'),
-- Vas the Unstable
(27158,0,0,1,62,0,100,0,9780,1,0,0,11,54620,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(27158,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip'),
-- Magister Dath'omere
(29158,0,0,1,62,0,100,0,9780,1,0,0,11,54620,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(29158,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip'),
-- Magistrix Haelenai
(29161,0,0,1,62,0,100,0,9780,1,0,0,11,54620,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(29161,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip'),
-- NEUTRAL --
-- Magister Teronus III
(29169,0,0,1,62,0,100,0,9780,2,0,0,11,54620,2,0,0,0,0,7,0,0,0,0,0,0,0,'on Gossip Select - Cast Teleport Dalaran'),
(29169,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close Gossip');
-- Conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 9780;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15,9780,0,0,28,12791,0,0,0,'','show Gossip - if Player has Quest 12791 completed'),
(15,9780,1,0,28,12794,0,0,0,'','show Gossip - if Player has Quest 12794 completed'),
(15,9780,2,0,28,12796,0,0,0,'','show Gossip - if Player has Quest 12796 completed'),
(15,9780,0,0,2,39740,1,0,0,'','show Gossip - if Player has Item: Kirin Tor Signet'),
(15,9780,1,0,2,39740,1,0,0,'','show Gossip - if Player has Item: Kirin Tor Signet'),
(15,9780,2,0,2,39740,1,0,0,'','show Gossip - if Player has Item: Kirin Tor Signet');
-- Quest 'Heated Battle' #12416 #12448 - Reduce Spawntimesecs
-- 27685 -- Frigid Ghoul Attacker
-- 27686 -- Frigid Geist Attacker
UPDATE `creature` SET `spawntimesecs` = 30 WHERE `id` IN (27685,27686);
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
UPDATE `creature_template`SET `AIName` = 'SmartAI', `unit_flags` = 2, `flags_extra` = 0 WHERE `entry` = 26889;
-- SAI
DELETE FROM `smart_scripts` WHERE `entryorguid` = 26889 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(26889,0,0,0,10,0,100,0,1,25,1000,1000,33,26889,0,0,0,0,0,7,0,0,0,0,0,0,0,'on LOS  - call Creature Killed');
UPDATE `creature_loot_template` SET `item`=45857, `lootmode`=1 WHERE `entry` IN (33692,33693) AND `lootmode`=2;
UPDATE `creature_loot_template` SET `lootmode`=1 WHERE `entry`=33693 AND `lootmode`=4;

DELETE FROM spell_linked_spell where spell_trigger=50032;
INSERT INTO spell_linked_spell VALUES
(50032,50035,0,"Scourged Troll Mummy Kill Credit");
