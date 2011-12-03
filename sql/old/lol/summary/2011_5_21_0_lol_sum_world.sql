-- trigger Electrical Charge on Meltdown
DELETE FROM `spell_script_names` WHERE `spell_id`=61889;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(61889, 'spell_meltdown');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (64224,64225);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,64224,18,1,32934),
(13,64225,18,1,32934);

-- Fix Loot of 'Captain Shely' NPC#27232 - should drop: Captain Shely's Rutters (37305) instead of: Apothecary's Burning Water (37304)
UPDATE `creature_loot_template` SET `item`=37305 WHERE `entry`=27232 AND `item`=37304;
UPDATE `creature_template` SET `ScriptName`='npc_captain_brandon_zuldrak' WHERE `entry`=28042;

UPDATE `creature_template` SET `ScriptName`='npc_kologarn_arm' WHERE `entry` IN (32933,32934);

UPDATE `creature_template` SET `flags_extra`=`flags_extra`|2 WHERE `entry`=33661;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `ConditionValue2`=0 AND `SourceEntry` IN (63317,64021);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`Comment`) VALUES
(13,63317,18,1,0,'Flame Breath - Players'),
(13,64021,18,1,0,'Flame Breath - Players');

-- clear spawn
DELETE FROM `creature` WHERE `guid`=135475;
DELETE FROM `creature_addon` WHERE `guid`=135475;

-- GO scriptname
UPDATE `gameobject_template` SET `ScriptName`='go_blackened_urn' WHERE `entry`=194092;

-- Fix Quest 'Blood Oath of the Horde' #11983
SET @NPC1    :=      26179; -- Taunka'le Refugee 1
SET @NPC2    :=      26184; -- Taunka'le Refugee 2
SET @Quest   :=      11983;
SET @Item    :=      35784; -- Blood Oath of the Horde (Quest Item)
SET @Gossip0 :=      50010; -- gossip_menu_id -> 4 required
SET @Gossip1 := @Gossip0+1;
SET @Gossip2 := @Gossip0+2;
SET @Gossip3 := @Gossip0+3;
-- npc_text from sniff
SET @G0Text  :=      12611; 
SET @G1Text  :=      12618;
SET @G2Text  :=      12619;
SET @G3Text  :=      12620;
-- -------------------------
UPDATE `creature_template` SET `AIName`='SmartAI',`gossip_menu_id`=@Gossip0,`npcflag`=`npcflag`|1 WHERE `entry` IN (@NPC1,@NPC2);
-- -------------------------
DELETE FROM `npc_text` WHERE `ID` IN (@G0Text,@G1Text,@G2Text,@G3Text);
INSERT INTO `npc_text` (`ID`,`text0_0`,`text0_1`,`lang0`,`prob0`,`em0_0`,`em0_1`,`em0_2`,`em0_3`,`em0_4`,`em0_5`,`text1_0`,`text1_1`,`lang1`,`prob1`,`em1_0`,`em1_1`,`em1_2`,`em1_3`,`em1_4`,`em1_5`,`text2_0`,`text2_1`,`lang2`,`prob2`,`em2_0`,`em2_1`,`em2_2`,`em2_3`,`em2_4`,`em2_5`,`text3_0`,`text3_1`,`lang3`,`prob3`,`em3_0`,`em3_1`,`em3_2`,`em3_3`,`em3_4`,`em3_5`,`text4_0`,`text4_1`,`lang4`,`prob4`,`em4_0`,`em4_1`,`em4_2`,`em4_3`,`em4_4`,`em4_5`,`text5_0`,`text5_1`,`lang5`,`prob5`,`em5_0`,`em5_1`,`em5_2`,`em5_3`,`em5_4`,`em5_5`,`text6_0`,`text6_1`,`lang6`,`prob6`,`em6_0`,`em6_1`,`em6_2`,`em6_3`,`em6_4`,`em6_5`,`text7_0`,`text7_1`,`lang7`,`prob7`,`em7_0`,`em7_1`,`em7_2`,`em7_3`,`em7_4`,`em7_5`,`WDBVerified`) VALUES
(@G0Text,"There is nothing left for us here.", "There is nothing left for us here.",1,1,0,0,0,0,0,0,"My family was slaughtered without mercy. Even the young.","My family was slaughtered without mercy. Even the young.",1,1,0,0,0,0,0,0,"May the Lich King burn in hellfire for what he has called down upon this land.","May the Lich King burn in hellfire for what he has called down upon this land.",1,1,0,0,0,0,0,0,"We are a people without a home to call our own now.","We are a people without a home to call our own now.",1,1,0,0,0,0,0,0,"The Scourge are a fearless machine set to bring about the end of all life on this world.","The Scourge are a fearless machine set to bring about the end of all life on this world.",1,1,0,0,0,0,0,0,"The one that they call Hellscream might be our only hope.","The one that they call Hellscream might be our only hope.",1,1,0,0,0,0,0,0,"Only the Horde can save us now.", "Only the Horde can save us now.",1,1,0,0,0,0,0,0,"","",0,0,0,0,0,0,0,0,12340),
(@G1Text,"Will the Horde grant me the chance to battle the Scourge?","Will the Horde grant me the chance to battle the Scourge?",0,1,0,6,0,0,0,0,"","",0,0,0,0,0,0,0,0,"","",0,0,0,0,0,0,0,0,"","",0,0,0,0,0,0,0,0,"","",0,0,0,0,0,0,0,0,"","",0,0,0,0,0,0,0,0,"","",0,0,0,0,0,0,0,0,"","",0,0,0,0,0,0,0,0,12340),
(@G2Text,"To avenge my people, to drive out the blight that has engulfed our land - I will take your oath. I will pledge all that I have and all that I am to the Horde.","To avenge my people, to drive out the blight that has engulfed our land - I will take your oath. I will pledge all that I have and all that I am to the Horde.",0,1,0,1,0,1,0,0,"","",0,0,0,0,0,0,0,0,"","",0,0,0,0,0,0,0,0,"","",0,0,0,0,0,0,0,0,"","",0,0,0,0,0,0,0,0,"","",0,0,0,0,0,0,0,0,"","",0,0,0,0,0,0,0,0,"","",0,0,0,0,0,0,0,0,12340),
(@G3Text,"Lok'tar ogar! Victory or death - it is these words that bind me to the Horde. For they are the most sacred and fundamental of truths to any warrior of the Horde.$B$BI give my flesh and blood freely to the Warchief. I am the instrument of my Warchief's desire. I am a weapon of my Warchief's command.$B$BFrom this moment until the end of days I live and die - FOR THE HORDE!","Lok'tar ogar! Victory or death - it is these words that bind me to the Horde. For they are the most sacred and fundamental of truths to any warrior of the Horde.$B$BI give my flesh and blood freely to the Warchief. I am the instrument of my Warchief's desire. I am a weapon of my Warchief's command.$B$BFrom this moment until the end of days I live and die - FOR THE HORDE!",1,1,0,5,0,1,0,66,"","",0,0,0,0,0,0,0,0,"","",0,0,0,0,0,0,0,0,"","",0,0,0,0,0,0,0,0,"","",0,0,0,0,0,0,0,0,"","",0,0,0,0,0,0,0,0,"","",0,0,0,0,0,0,0,0,"","",0,0,0,0,0,0,0,0,12340);
-- -------------------------
DELETE FROM `gossip_menu` WHERE `text_id` IN (@G0Text,@G1Text,@G2Text,@G3Text);
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(@Gossip0,@G0Text),
(@Gossip1,@G1Text),
(@Gossip2,@G2Text),
(@Gossip3,@G3Text);
-- -------------------------
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (@Gossip0,@Gossip1,@Gossip2,@Gossip3);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@Gossip0,0,0,"Worry no more, taunka. The Horde will save and protect you and your people, but first you must swear allegiance to the Warchief by taking the blood oath of the Horde.",1,1,@Gossip1,0,0,0,0,''),
(@Gossip1,0,0,"Yes, taunka. Retribution is a given right of all members of the Horde.",1,1,@Gossip2,0,0,0,0,''),
(@Gossip2,0,0,"Then repeat after me: Lok'tar ogar! Victory or death - it is these words that bind me to the Horde. For they are the most sacred and fundamental of truths to any warrior of the Horde. I give my flesh and blood freely to the Warchief. I am the instrument of my Warchief's desire. I am a weapon of my Warchief's command. From this moment until the end of days I live and die - For the Horde!",1,1,@Gossip3,0,0,0,0,''),
(@Gossip3,0,0,"For the Horde! Arm yourself from the crates that surround us and report to Agmar's Hammer, east of here. Your first trial as a member of the Horde is to survive the journey. Lok'tar ogar!",1,1,0,0,0,0,0,'');
-- -------------------------
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (@NPC1,@NPC2);
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid` IN (@NPC1*100,@NPC2*100);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NPC1,0,0,0,62,0,100,0,@Gossip3,0,0,0,80,@NPC1*100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Taunka'le Refugee - on gossip select - start script"),
(@NPC1*100,9,0,0,0,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"turn off gossip & set npcflag 0"),
(@NPC1*100,9,1,0,0,0,100,0,0,0,0,0,33,26179,0,0,0,0,0,7,0,0,0,0,0,0,0,"give kill credit"),
(@NPC1*100,9,2,0,0,0,100,0,60000,60000,60000,60000,81,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"after 60sec - turn on gossip & set npcflag 1"),          
-- -------------------------
(@NPC2,0,0,0,62,0,100,0,@Gossip3,0,0,0,80,@NPC2*100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Taunka'le Refugee - on gossip select - start script"),
(@NPC2*100,9,0,0,0,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"turn off gossip & set npcflag 0"),
(@NPC2*100,9,1,0,0,0,100,0,0,0,0,0,33,26179,0,0,0,0,0,7,0,0,0,0,0,0,0,"give kill credit"),
(@NPC2*100,9,2,0,0,0,100,0,60000,60000,60000,60000,81,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"after 60sec - turn on gossip & set npcflag 1");
-- -------------------------
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@Gossip0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@Gossip0,0,0,9,@Quest,0,0,0,'','show gossip option if player has quest 11983 taken'),
(15,@Gossip0,0,0,2,@Item,1,0,0,'','show gossip option if player has Item: Blood Oath of the Horde');
UPDATE `creature_template` SET `ScriptName`='mob_natural_bomb' WHERE `entry`=34129;
UPDATE `gameobject_template` SET `ScriptName`='' WHERE `entry`=194902;

UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128 WHERE `entry` IN (33906,33907);

DELETE FROM `gameobject` WHERE `guid` IN (400005,400006);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(400005,194565,603,2,1,559.119,-140.505,391.517,2.28638,0,0,0,1,180,255,1),
(400006,194565,603,2,1,606.229,-136.721,391.897,-2.9845,0,0,0,1,180,255,1);

UPDATE `gameobject` SET `spawnMask`=3 WHERE `guid` IN (56042,56068);
UPDATE `creature` SET `spawnMask`=3 WHERE `id`=33233;

-- FiX: get lost quest items on gossip with conditions
-- +-----------------+
-- |creature_template|
-- +-----------------+
UPDATE creature_template SET AIName = 'SmartAI' WHERE entry IN (21772,21774,21769,21773,28518,26117,24186,24273,22127,28138,29937,29650);
UPDATE creature_template SET gossip_menu_id = 21772, npcflag = npcflag | 1 WHERE entry = 21772;       -- Chief Apothecary Hildagard
UPDATE creature_template SET gossip_menu_id = 21774, npcflag = npcflag | 1 WHERE entry = 21774;       -- Zorus the Judicator
UPDATE creature_template SET gossip_menu_id = 21769, npcflag = npcflag | 1 WHERE entry = 21769;       -- Overlord Or'barokh
UPDATE creature_template SET gossip_menu_id = 21773, npcflag = npcflag | 1 WHERE entry = 21773;       -- Thane Yoregar
UPDATE creature_template SET gossip_menu_id =  9709, npcflag = npcflag | 1 WHERE entry = 28518;       -- Stefan Vadu
UPDATE creature_template SET gossip_menu_id =  9253, npcflag = npcflag | 1 WHERE entry = 26117;       -- Raelorasz
UPDATE creature_template SET gossip_menu_id =  8908, npcflag = npcflag | 1 WHERE entry = 24186;       -- Sage Mistwalker
UPDATE creature_template SET gossip_menu_id =  8918, npcflag = npcflag | 1 WHERE entry = 24273;       -- Watcher Moonleaf
UPDATE creature_template SET gossip_menu_id = 22127, npcflag = npcflag | 1 WHERE entry = 22127;       -- Wildlord Antelarion
UPDATE creature_template SET gossip_menu_id = 28138, npcflag = npcflag | 1 WHERE entry = 28138;       -- Elder Harkek
UPDATE creature_template SET gossip_menu_id = 29937, npcflag = npcflag | 1 WHERE entry = 29937;       -- Moteha Windkind
UPDATE creature_template SET gossip_menu_id = 9929, npcflag = npcflag | 1 WHERE entry = 29650;        -- Archaeologist Andorin 
-- +-----------+
-- |gossip_menu|
-- +-----------+
DELETE FROM gossip_menu WHERE entry IN (21772,21774,21769,21773,9709,9253,8908,8918,22127,28138,29937,9929);
INSERT INTO gossip_menu VALUES
(21772,1),      -- Chief Apothecary Hildagard
(21774,1),      -- Zorus the Judicator
(21769,1),      -- Overlord Or'barokh
(21773,1),      -- Thane Yoregar
(9709,13270),   -- Stefan Vadu
(9253,12592),   -- Raelorasz
(8908,11756),   -- Sage Mistwalker
(8918,11858),   -- Watcher Moonleaf
(22127,1),      -- Wildlord Anterarion
(28138,1),      -- Elder Harkek
(29937,1),      -- Moteha Windkind
(9929,1);       -- Archaeologist Andorin
-- +------------------+
-- |gossip_menu_option|
-- +------------------+
DELETE FROM gossip_menu_option WHERE menu_id IN (21772,21774,21769,21773,9709,9253,8908,8918,22127,28138,29937,9929);
INSERT INTO gossip_menu_option VALUES
-- Chief Apothecary Hildagard
(21772,0,0,'Please, give me a new Spectrecles.',1,1,0,0,0,0,0,''),
-- Zorus the Judicator
(21774,0,0,'Please, give me a new Spectrecles.',1,1,0,0,0,0,0,''),
-- Overlord Or'barokh
(21769,0,0,'Please, give me a new Kor´kron Flare Gun.',1,1,0,0,0,0,0,''),
-- Thane Yoregar
(21773,0,0,'Please, give me a new Wildhammer Flare Gun.',1,1,0,0,0,0,0,''),
-- Stefan Vadu
(9709,0,0,'Please, give me a new Ensorcelled Choker.',1,1,0,0,0,0,0,''),
(9709,1,0,'Please, give me a new Ensorcelled Choker.',1,1,0,0,0,0,0,''),
(9709,2,0,'Please, give me a new Ensorcelled Choker.',1,1,0,0,0,0,0,''),
(9709,3,0,'Please, give me a new Ensorcelled Choker.',1,1,0,0,0,0,0,''),
(9709,4,0,'Please, give me a new Ensorcelled Choker.',1,1,0,0,0,0,0,''),
-- Raelorasz
(9253,0,0,'What is the cause of this conflict?',1,1,9283,0,0,0,0,''),
(9253,1,0,'Please, give me a new Augmented Arcane Prison.',1,1,0,0,0,0,0,''),
-- Sage Mistwalker (H)
(8908,0,0,'Please, give me a new Worg Disguise.',1,1,0,0,0,0,0,''),
(8908,1,0,'Please, give me a new Worg Disguise.',1,1,0,0,0,0,0,''),
-- Watcher Moonleaf (A)
(8918,0,0,'Please, give me a new Worg Disguise.',1,1,0,0,0,0,0,''),
(8918,1,0,'Please, give me a new Worg Disguise.',1,1,0,0,0,0,0,''),
-- Wildlord Anterarion
(22127,0,0,'Please, give me a new Felsworn Gas Mask.',1,1,0,0,0,0,0,''),
(22127,1,0,'Please, give me a new Felsworn Gas Mask.',1,1,0,0,0,0,0,''),
-- Elder Harkek
(28138,0,0,'Please, give me a new Goregek´s Shackles.',1,1,0,0,0,0,0,''),
-- Brann's Communicator
(29937,0,0,'Please, give me a new Brann´s Communicator.',1,1,0,0,0,0,0,''),
(9929,0,0,'Please, give me a new Brann´s Communicator.',1,1,0,0,0,0,0,'');
-- +---------+
-- | SmartAI |
-- +---------+
DELETE FROM smart_scripts WHERE source_type= 0 AND id IN (100,101) AND entryorguid IN (21772,21774,21769,21773,28518,26117,24186,24273,22127,28138,29937,29650);
INSERT INTO smart_scripts VALUES
-- Spectrecles (H)
(21772,0,100,1,62,0,100,0,21772,0,0,0,11,37700,0x02,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - cast create Spectrecles to invoker'),
(21772,0,101,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - close gossip'),
-- Spectrecles (A)
(21774,0,100,1,62,0,100,0,21774,0,0,0,11,37700,0x02,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - cast create Spectrecles to invoker'),
(21774,0,101,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - close gossip'),
-- Kor´kron Flare Gun
(21769,0,100,1,62,0,100,0,21769,0,0,0,56,31108,1,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - add Kor´kron Flare Gun to invoker'),
(21769,0,101,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - close gossip'),
-- Wildhammer Flare Gun
(21773,0,100,1,62,0,100,0,21773,0,0,0,56,31310,1,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - add Wildhammer Flare Gun to invoker'),
(21773,0,101,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - close gossip'),
-- Ensorcelled Choker
(28518,0,100,1,62,0,100,0,9709,0,0,0,56,38699,1,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - add Ensorcelled Choker to invoker'),
(28518,0,101,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - close gossip'),
-- Augmented Arcane Prison
(26117,0,100,1,62,0,100,0,9253,1,0,0,11,46764,0x02,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - cast create Augmented Arcane Prison to invoker'),
(26117,0,101,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - close gossip'),
-- Worg Disguise (H)
(24186,0,100,1,62,0,100,0,8908,0,0,0,11,43379,0x02,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - cast create Worg Disguise to invoker'),
(24186,0,101,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - close gossip'),
-- Worg Disguise (A)
(24273,0,100,1,62,0,100,0,8918,0,0,0,11,43379,0x02,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - cast create Worg Disguise to invoker'),
(24273,0,101,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - close gossip'),
-- Felsworn Gas Mask
(22127,0,100,1,62,0,100,0,22127,0,0,0,11,39101,0x02,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - cast create Felsworn Gas Mask to invoker'),
(22127,0,101,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - close gossip'),
-- Goregek's Shackles
(28138,0,100,1,62,0,100,0,28138,0,0,0,11,52542,0x02,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - cast create Goregek´s Shackles to invoker'),
(28138,0,101,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - close gossip'),
-- Brann's Communicator(H)
(29937,0,100,1,62,0,100,0,29937,0,0,0,56,40971,1,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - add Brann´s Communicator to invoker'),
(29937,0,101,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - close gossip'),
-- Brann's Communicator(A)
(29650,0,100,1,62,0,100,0,9929,0,0,0,56,40971,1,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - add Brann´s Communicator to invoker'),
(29650,0,101,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - close gossip');
-- +----------+
-- |Conditions|
-- +----------+
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 15 AND SourceGroup IN (21772,21774,21769,21773,9709,9253,8918,8908,22127,28138,29937,9929);
INSERT INTO conditions VALUES
-- Augmented Arcane Prison
(15,9253,1,0,8,11943,0,0,0,'','show gossip menu option if player has quest 11943 rewarded'),
-- Kor´kron Flare Gun
(15,21769,0,0,8,10750,0,0,0,'','show gossip menu option if player has quest 10750 rewarded'),
-- Spectrecles (Horde)
(15,21772,0,0,8,10625,0,0,0,'','show gossip menu option if player has quest 10625 rewarded'),
-- Spectrecles (Alliance)
(15,21774,0,0,8,10643,0,0,0,'','show gossip menu option if player has quest 10643 rewarded'),
-- Wildhammer Flare Gun
(15,21773,0,0,8,10772,0,0,0,'','show gossip menu option if player has quest 10772 rewarded'),
-- Ensorcelled Choker
(15,9709,0,0,9,12661,0,0,0,'','show gossip menu option if player has quest 12661'),
(15,9709,1,0,9,12669,0,0,0,'','show gossip menu option if player has quest 12669'),
(15,9709,2,0,9,12677,0,0,0,'','show gossip menu option if player has quest 12677'),
(15,9709,3,0,9,12676,0,0,0,'','show gossip menu option if player has quest 12676'),
(15,9709,4,0,9,12713,0,0,0,'','show gossip menu option if player has quest 12713'),
-- Worg Disguise (A)
(15,8918,0,0,28,11325,0,0,0,'','show gossip menu option if player has quest 11325'),
(15,8918,1,0,8,11325,0,0,0,'','show gossip menu option if player has quest 11325 rewarded'),
-- Worg Disguise (H)
(15,8908,0,0,28,11323,0,0,0,'','show gossip menu option if player has quest completed 11323'),
(15,8908,1,0,8,11323,0,0,0,'','show gossip menu option if player has quest 11323 rewarded'),
-- Felsworn Gas Mask
(15,22127,0,0,28,10819,0,0,0,'','show gossip menu option if player has quest completed 10819'),
(15,22127,1,0,8,10819,0,0,0,'','show gossip menu option if player has quest 10819 rewarded'),
-- Goregek´s Shackles
(15,28138,0,0,8,12528,0,0,0,'','show gossip menu option if player has quest 12528 rewarded'),
-- Brann's Communicator
(15,29937,0,0,8,12910,0,0,0,'','show gossip menu option if player has quest 12910 rewarded'),
(15,9929,0,0,8,12855,0,0,0,'','show gossip menu option if player has quest 12855 rewarded');
-- try to fix DK Ability: Heartstrike - Calculate default attack power coefficient. (`ap_bonus`= -1)
DELETE FROM `spell_bonus_data` WHERE `entry`=55050;
INSERT INTO `spell_bonus_data` (`entry`,`direct_bonus`,`dot_bonus`,`ap_bonus`,`ap_dot_bonus`,`comments`) VALUES 
(55050,0,0,-1,0,'Death Knight - Heartstrike');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (30541,30571,30631,30657);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,30541,18,1,17454),
(13,30571,18,1,0),
(13,30631,18,1,0),
(13,30657,18,1,17257);

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=30658;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(30658,30571,0, 'Magtheridon - Trigger Quake Knockback');

DELETE FROM `creature` WHERE `guid` BETWEEN 90978 AND 90982;
DELETE FROM `creature_addon` WHERE `guid` BETWEEN 90978 AND 90982;
DELETE FROM `creature_linked_respawn` WHERE `guid` BETWEEN 90978 AND 90982;

-- try to fix DK Ability: Heartstrike - Calculate default attack power coefficient. (`ap_bonus`= -1)
DELETE FROM `spell_bonus_data` WHERE `entry`=55050;
INSERT INTO `spell_bonus_data` (`entry`,`direct_bonus`,`dot_bonus`,`ap_bonus`,`ap_dot_bonus`,`comments`) VALUES 
(55050,0,0,-1,0,'Death Knight - Heartstrike');
-- Shadow Crash
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=63277;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(63277,65269,2, 'Shadow Crash - Haste and reduced Mana cost');

-- remove npc 33838, should be spawned by spell 63774
DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=33838);
DELETE FROM `creature` WHERE `id`=33838;

-- Spawn High Admiral "Shelly" Jorrik at Newman's Landing
SET @guid = 230000;
SET @jelly = 26081;
SET @jelly_spawn = 3600; -- need random spawntimes...
SET @bruis = 4624;
SET @bruis_spawn = 300;

-- set correct faction (taken from Booty Bay Bruiser)
UPDATE `creature_template` SET `faction_A` = 121, `faction_H` = 121 WHERE `entry` = @jelly;

DELETE FROM `creature` WHERE `id` = @jelly;
REPLACE INTO creature (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@guid+0, @jelly, 0, 1, 1, 0, 0, -6377.893555, 1268.393433, 7.187962, 2.230113, @jelly_spawn, 0, 0, 3072, 0, 0, 0, 0, 0, 0),
(@guid+1, @bruis, 0, 1, 1, 0, 0, -6368.949707, 1270.554443, 7.187644, 2.257602, @bruis_spawn, 0, 0,16960, 0, 0, 0, 0, 0, 0),
(@guid+2, @bruis, 0, 1, 1, 0, 0, -6381.295898, 1259.823486, 7.187644, 2.289018, @bruis_spawn, 0, 0,16960, 0, 0, 0, 0, 0, 0);
-- restore old spell_bonus_data of Ability: Death and Decay (Deathknight)
DELETE FROM `spell_bonus_data` WHERE `entry`=52212;
INSERT INTO `spell_bonus_data` (`entry`,`direct_bonus`,`dot_bonus`,`ap_bonus`,`ap_dot_bonus`,`comments`) VALUES 
(52212,0,-1,0.0475,-1,'Death Knight - Death and Decay'); 
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
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (62942,62466);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13, 62942, 18, 1, 33110),
(13, 62942, 18, 1, 32874),
(13, 62942, 18, 1, 32872),
(13, 62942, 18, 1, 32875),
(13, 62466, 18, 1, 32780);

