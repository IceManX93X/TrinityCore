-- update 25_normal Baron Rivendare immunitys
UPDATE `creature_template` SET `mechanic_immune_mask`=617299803 WHERE `entry`=30600;

-- tempfix quest 3802
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=8888;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=8888;

-- tempfix quest 12984
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~512, `WDBVerified`=1 WHERE `entry`=29368;

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
DELETE FROM smart_scripts WHERE entryorguid IN (21772,21774,21769,21773,28518,26117,24186,24273,22127,28138,29937,29650);
INSERT INTO smart_scripts VALUES
-- Spectrecles (H)
(21772,0,0,1,62,0,100,0,21772,0,0,0,11,37700,0x02,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - cast create Spectrecles to invoker'),
(21772,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - close gossip'),
-- Spectrecles (A)
(21774,0,0,1,62,0,100,0,21774,0,0,0,11,37700,0x02,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - cast create Spectrecles to invoker'),
(21774,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - close gossip'),
-- Kor´kron Flare Gun
(21769,0,0,1,62,0,100,0,21769,0,0,0,56,31108,1,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - add Kor´kron Flare Gun to invoker'),
(21769,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - close gossip'),
-- Wildhammer Flare Gun
(21773,0,0,1,62,0,100,0,21773,0,0,0,56,31310,1,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - add Wildhammer Flare Gun to invoker'),
(21773,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - close gossip'),
-- Ensorcelled Choker
(28518,0,0,1,62,0,100,0,9709,0,0,0,56,38699,1,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - add Ensorcelled Choker to invoker'),
(28518,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - close gossip'),
-- Augmented Arcane Prison
(26117,0,0,1,62,0,100,0,9253,1,0,0,11,46764,0x02,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - cast create Augmented Arcane Prison to invoker'),
(26117,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - close gossip'),
-- Worg Disguise (H)
(24186,0,0,1,62,0,100,0,8908,0,0,0,11,43379,0x02,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - cast create Worg Disguise to invoker'),
(24186,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - close gossip'),
-- Worg Disguise (A)
(24273,0,0,1,62,0,100,0,8918,0,0,0,11,43379,0x02,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - cast create Worg Disguise to invoker'),
(24273,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - close gossip'),
-- Felsworn Gas Mask
(22127,0,0,1,62,0,100,0,22127,0,0,0,11,39101,0x02,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - cast create Felsworn Gas Mask to invoker'),
(22127,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - close gossip'),
-- Goregek's Shackles
(28138,0,0,1,62,0,100,0,28138,0,0,0,11,52542,0x02,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - cast create Goregek´s Shackles to invoker'),
(28138,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - close gossip'),
-- Brann's Communicator(H)
(29937,0,0,1,62,0,100,0,29937,0,0,0,56,40971,1,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - add Brann´s Communicator to invoker'),
(29937,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - close gossip'),
-- Brann's Communicator(A)
(29650,0,0,1,62,0,100,0,9929,0,0,0,56,40971,1,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - add Brann´s Communicator to invoker'),
(29650,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - close gossip');
-- +----------+
-- |Conditions|
-- +----------+
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 15 AND SourceGroup IN (21772,21774,21769,21773,9709,9253,8918,8908,22127,28138,29937,9929);
INSERT INTO conditions VALUES
-- Augmented Arcane Prison
(15,9253,1,0,8,11943,0,0,0,'','show gossip menu option if player has quest 11943 rewarded'),
-- Kor'kron Flare Gun
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
-- Goregek's Shackles
(15,28138,0,0,8,12528,0,0,0,'','show gossip menu option if player has quest 12528 rewarded'),
-- Brann's Communicator
(15,29937,0,0,8,12910,0,0,0,'','show gossip menu option if player has quest 12910 rewarded'),
(15,9929,0,0,8,12855,0,0,0,'','show gossip menu option if player has quest 12855 rewarded');
-- Fix gameobject_loot from GO 'The Thunderspike' #184729 (Quest 10526)
UPDATE `gameobject_template` SET `questItem1`=30435 WHERE `entry`=184729;
-- insert Npcs for Noblegarden in the game_event_creature
DELETE FROM `game_event_creature` WHERE eventEntry = 9 AND guid IN (410012,410013,410014,410015,410016,410017,410018);
INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES 
(9, 410012),
(9, 410013),
(9, 410014),
(9, 410015),
(9, 410016),
(9, 410017),
(9, 410018);
-- tempfix quest 3912
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=9299;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=9299;

-- Fix GameObject #186640 'Ancient Cipher'
DELETE FROM `gameobject_template` WHERE `entry` = 186640;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `AIName`, `ScriptName`, `WDBVerified`) VALUES 
(186640, 3, 6714, 'Ancient Cipher', '', 'Collecting', '', 0, 0, 1, 33545, 0, 0, 0, 0, 0, 43, 22697, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartGameObjectAI', '', 12340);
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=26363;

-- missing pool
DELETE FROM `pool_template` WHERE `entry` BETWEEN 5217 AND 5238;
INSERT INTO `pool_template` (`entry`,`max_limit`,`description`) VALUES
(5217,1,'ZulDrak'),
(5218,1,'ZulDrak'),
(5219,1,'ZulDrak'),
(5220,1,'ZulDrak'),
(5221,1,'ZulDrak'),
(5222,1,'ZulDrak'),
(5223,1,'ZulDrak'),
(5224,1,'ZulDrak'),
(5225,1,'ZulDrak'),
(5226,1,'ZulDrak'),
(5227,1,'ZulDrak'),
(5228,1,'ZulDrak'),
(5229,1,'ZulDrak'),
(5230,1,'ZulDrak'),
(5231,1,'ZulDrak'),
(5232,1,'ZulDrak'),
(5233,1,'ZulDrak'),
(5234,1,'ZulDrak'),
(5235,1,'ZulDrak'),
(5236,1,'ZulDrak'),
(5237,1,'ZulDrak'),
(5238,25,'ZulDrak Mineral MASTER');

-- missing motherpool
DELETE FROM `pool_pool` WHERE `pool_id` BETWEEN 5217 AND 5237;
INSERT INTO `pool_pool` (`pool_id`,`mother_pool`,`chance`,`description`) VALUES
(5217,5238,0,'ZulDrak'),
(5218,5238,0,'ZulDrak'),
(5219,5238,0,'ZulDrak'),
(5220,5238,0,'ZulDrak'),
(5221,5238,0,'ZulDrak'),
(5222,5238,0,'ZulDrak'),
(5223,5238,0,'ZulDrak'),
(5224,5238,0,'ZulDrak'),
(5225,5238,0,'ZulDrak'),
(5226,5238,0,'ZulDrak'),
(5227,5238,0,'ZulDrak'),
(5228,5238,0,'ZulDrak'),
(5229,5238,0,'ZulDrak'),
(5230,5238,0,'ZulDrak'),
(5231,5238,0,'ZulDrak'),
(5232,5238,0,'ZulDrak'),
(5233,5238,0,'ZulDrak'),
(5234,5238,0,'ZulDrak'),
(5235,5238,0,'ZulDrak'),
(5236,5238,0,'ZulDrak'),
(5237,5238,0,'ZulDrak');

-- gobject
DELETE FROM `pool_gameobject` WHERE `pool_entry` BETWEEN 5217 AND 5237;
INSERT INTO `pool_gameobject` (`guid`,`pool_entry`,`chance`,`description`) VALUES

(64922,5217,5,'Saronite'),
(64009,5217,45,'Cobalt, Rich'),
(56158,5217,0,'Cobalt'),

(64954,5218,5,'Saronite'),
(64013,5218,45,'Cobalt, Rich'),
(56185,5218,0,'Cobalt'),

(64956,5219,5,'Saronite'),
(64017,5219,45,'Cobalt, Rich'),
(56186,5219,0,'Cobalt'),

(64972,5220,5,'Saronite'),
(64024,5220,45,'Cobalt, Rich'),
(56187,5220,0,'Cobalt'),

(64980,5221,5,'Saronite'),
(64030,5221,45,'Cobalt, Rich'),
(56188,5221,0,'Cobalt'),

(64981,5222,5,'Saronite'),
(64052,5222,45,'Cobalt, Rich'),
(56189,5222,0,'Cobalt'),

(64982,5223,5,'Saronite'),
(64068,5223,45,'Cobalt, Rich'),
(56190,5223,0,'Cobalt'),

(64986,5224,5,'Saronite'),
(64087,5224,45,'Cobalt, Rich'),
(56191,5224,0,'Cobalt'),

(64987,5225,5,'Saronite'),
(64088,5225,45,'Cobalt, Rich'),
(56192,5225,0,'Cobalt'),

(65000,5226,5,'Saronite'),
(64145,5226,45,'Cobalt, Rich'),
(56211,5226,0,'Cobalt'),

(65001,5227,5,'Saronite'),
(64811,5227,45,'Cobalt, Rich'),
(56238,5227,0,'Cobalt'),

(65002,5228,5,'Saronite'),
(64827,5228,45,'Cobalt, Rich'),
(56239,5228,0,'Cobalt'),

(65034,5229,5,'Saronite'),
(64837,5229,45,'Cobalt, Rich'),
(56529,5229,0,'Cobalt'),

(65035,5230,5,'Saronite'),
(64840,5230,45,'Cobalt, Rich'),
(57962,5230,0,'Cobalt'),

(65039,5231,5,'Saronite'),
(64868,5231,45,'Cobalt, Rich'),
(58107,5231,0,'Cobalt'),

(65050,5232,5,'Saronite'),
(64894,5232,45,'Cobalt, Rich'),
(58108,5232,0,'Cobalt'),

(65057,5233,5,'Saronite'),
(64910,5233,45,'Cobalt, Rich'),
(59284,5233,0,'Cobalt'),

(65075,5234,5,'Saronite'),
(64915,5234,45,'Cobalt, Rich'),
(59539,5234,0,'Cobalt'),

(65096,5235,5,'Saronite'),
(64917,5235,45,'Cobalt, Rich'),
(60171,5235,0,'Cobalt'),

(65097,5236,5,'Saronite'),
(64919,5236,45,'Cobalt, Rich'),
(60178,5236,0,'Cobalt'),

(65109,5237,5,'Saronite'),
(64920,5237,45,'Cobalt, Rich'),
(60450,5237,0,'Cobalt');

-- fix guids 56529,64837,65034 spawned into wall
UPDATE `gameobject` SET `position_x`=5909.37, `position_y`=-1264.63, `position_z`=260.596 WHERE `guid` IN (56529,64837,65034);

-- set spawntime
UPDATE `gameobject` SET `spawntimesecs`=180 WHERE `guid` IN
(66963,66943,66890,
66954,66917,66864,
66948,66909,66856,
64981,64052,56189,
65001,64811,56238,
64954,64013,56185,
65039,64868,58107,
64980,64030,56188,
65057,64910,59284,
65035,64840,57962,
65034,64837,56529,
64972,64024,56187,
66956,66925,66872,
66947,66906,66853,
66949,66910,66857,
66945,66898,66845,
64987,64088,56192,
66958,66934,66881,
65097,64919,60178,
65000,64145,56211,
65002,64827,56239,
65075,64915,59539,
66957,66927,66874,
66959,66937,66884,
64982,64068,56190,
66953,66916,66863,
64956,64017,56186,
64986,64087,56191,
66962,66942,66889,
65050,64894,58108,
66950,66913,66860,
65109,64920,60450,
66961,66939,66886,
66946,66900,66847,
66960,66938,66885,
66952,66915,66862,
66955,66918,66865,
66944,66895,66842,
66964,66933,66891,
65096,64917,60171,
64922,64009,56158,
66951,66914,66861);

UPDATE `gameobject`,`pool_gameobject` SET `gameobject`.`spawntimesecs`=180 
WHERE `gameobject`.`id` IN (189978,189979,189980,189981,191133) AND `gameobject`.`guid`=`pool_gameobject`.`guid`;

-- Fix Required Reputation of Quest 'A Special Thank You' #11091
UPDATE quest_template SET RequiredMinRepValue = 3000 WHERE entry = 11091;
DELETE FROM `spell_group` WHERE `spell_id` IN (59690,59699);
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (57294,57399);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(57294,59690,2, 'Great Feast - Ranged Attack Power and Healing Power'),
(57399,59699,2, 'Fish Feast - Ranged Attack Power and Healing Power');

DELETE FROM `spell_linked_spell` WHERE `spell_effect` IN (62169,-64412);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(64417,62169,2, 'Phase Punch - Trigger Black Hole Dot'),
(62168,62169,2, 'Black Hole - Trigger Black Hole Dot'),
(64417,-64412,1, 'Phase Punch - Remove Phase Punch');

UPDATE `gameobject` SET `phaseMask`=17 WHERE `id` IN (194910,194715,194148);

DELETE FROM `spell_script_names` WHERE `spell_id`=47731;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(47731, 'spell_nexus_critter_targeting');

DELETE FROM `spell_script_names` WHERE `spell_id`=59452;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(59452, 'spell_mojo_volley_targeting');

-- Spawn NPC 'Lunk-tusk'
DELETE FROM `creature` WHERE `id` = 25233;
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(25233, 571, 1, 1, 0, 0, 1230.3, -3348.47, 203.701, 3.16548, 300, 0, 0, 9291, 0, 0, 0, 0, 0, 0);
-- set NPC sit
DELETE FROM `creature_template_addon` WHERE `entry` = 25233;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
(25233, 0, 0, 1, 4097, 0, NULL);
-- Fix Quest 11460 "Trust is Earned" by Nay @TrinityCore.org
-- UPDATE Hidalgo the Master Falconer "Add Excelsior to vehicle and add gossip flag"
UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry` IN (24750,24752);
DELETE FROM `vehicle_template_accessory` WHERE `entry`=24750;
INSERT INTO `vehicle_template_accessory` (`entry`,`accessory_entry`,`seat_id`,`minion`,`description`) VALUES
(24750,24751,0,1, 'Excelsior rides Hidalgo the Master Falconer');
DELETE FROM `creature` WHERE `guid`=88103;
-- add missing text to Hidalgo the Master Falconer and Rock Falcon
DELETE FROM `gossip_menu` WHERE `entry` IN (8998,9007) AND `text_id` IN (12153,12168);
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(8998,12153),(9007,12168);
-- Add gossip_menu condition for 8998 and 9007
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=14 AND `SourceGroup` IN (8998,9007);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=9007;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(14,8998,12185,8,11460,0), -- Must have Quest 11460 rewarded
(14,9007,12168,9,11460,0), -- Must have quest 11460 taken not complete
(15,9007,0,2,34102,1), -- Must have at least 1 count of item 34102
(15,9007,0,9,11460,0); -- Must have quest 11460 taken not complete
-- Creature Gossip_menu_option Update
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (9007) AND `id` IN (0);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(9007,0,0, 'Feed the grub to the Rock Falcon.',1,1,0,0,0,0,0, '');
SET @ENTRY := 24752; -- Rock Falcon SAI
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,62,0,100,0,9007,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'On gossip option Close Gossip'), -- Player needs to cast this on self "not working"
(@ENTRY,0,1,0,61,0,100,0,100,100,100,100,86,44363,0,7,0,0,0,7,0,0,0,0,0,0,0,'Player selfcast spell');

-- Fix Creature Loot of Rar Elite Mobs in Nordend
-- source: www.old.wowhead.de
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
UPDATE `creature_template` SET `ScriptName`='npc_black_hole' WHERE `entry`=32953;
UPDATE `creature_template` SET `ScriptName`='npc_living_constellation' WHERE `entry`=33052;

UPDATE `instance_encounters` SET `creditEntry`=23980 WHERE `entry` IN (575,576);

-- Fix Quest 'The Dreghood Elders' #10368
SET @Quest      = 10368;
SET @Morod      = 20677;
SET @GMorod     = 8162;    -- gossip_menu_id Morod
SET @Akoru      = 20678;
SET @GAkoru     = 8163;    -- gossip_menu_id Akoru
SET @Aylaan     = 20679;
SET @GAylaan    = 8161;    -- gossip_menu_id Aylaan
-- SAI + Gossip Flag + Quest Requirements
UPDATE `creature_template` SET `AIName`= 'SmartAI', `npcflag` = `npcflag`| 1 WHERE `entry` IN (@Morod,@Akoru,@Aylaan);
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = @Aylaan, `ReqCreatureOrGOId2` = @Morod, `ReqCreatureOrGOId3` = @Akoru, `ReqCreatureOrGOCount1` = 1, `ReqCreatureOrGOCount2` = 1,`ReqCreatureOrGOCount3` = 1 WHERE `entry` = @Quest;
-- gossip_menu
DELETE FROM `gossip_menu` WHERE `entry` IN (@GMorod,@GAkoru,@GAylaan);
INSERT INTO `gossip_menu` VALUES
(8161,10103),
(8162,10104),
(8163,10105);
-- gossip_menu_option
DELETE FROM `gossip_menu_option` WHERE `menu_id`IN (@GMorod,@GAkoru,@GAylaan);
INSERT INTO `gossip_menu_option` VALUES
(8161,0,0,'Walk free, elder.  Bring the spirits back to your tribe.',1,1,0,0,0,0,0,''),
(8162,0,0,'Walk free, elder.  Bring the spirits back to your tribe.',1,1,0,0,0,0,0,''),
(8163,0,0,'Walk free, elder.  Bring the spirits back to your tribe.',1,1,0,0,0,0,0,'');
-- Smart AI
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@Morod,@Akoru,@Aylaan);
INSERT INTO `smart_scripts` VALUES
-- Morod
(@Morod,0,0,1,62,0,100,0,@GMorod,0,0,0,33,@Morod,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - call creature killed'),
(@Morod,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - close gossip'),
-- Akoru
(@Akoru,0,0,1,62,0,100,0,@GAkoru,0,0,0,33,@Akoru,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - call creature killed'),
(@Akoru,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - close gossip'),
-- Aylaan
(@Aylaan,0,0,1,62,0,100,0,@GAylaan,0,0,0,33,@Aylaan,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - call creature killed'),
(@Aylaan,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'on gossip select - close gossip');
-- conditions
DELETE FROM `conditions`WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` IN (@GMorod,@GAkoru,@GAylaan);
INSERT INTO `conditions`VALUES
(15,8161,0,0,9,@Quest,0,0,0,'','show gossip menu option if player has quest 10368'),
(15,8162,0,0,9,@Quest,0,0,0,'','show gossip menu option if player has quest 10368'),
(15,8163,0,0,9,@Quest,0,0,0,'','show gossip menu option if player has quest 10368');
-- Fix Quest 'Arzeth's Demise' #10369
SET @Quest      = 10369;
SET @Merciless  = 19354;
SET @Powerless  = 20680;
SET @Spell      = 35460;

UPDATE quest_template SET ReqCreatureOrGOId1 = @Powerless, ReqCreatureOrGOCount1 = 1 WHERE entry = @Quest;
UPDATE creature_template SET AIName = 'SmartAI' WHERE entry = @Merciless;
-- SAI
DELETE FROM smart_scripts WHERE source_type = 0 AND entryorguid = @Merciless;
INSERT INTO smart_scripts VALUES
(@Merciless,0,0,0,8,0,100,0,@Spell,0,0,0,36,@Powerless,0,0,0,0,0,1,0,0,0,0,0,0,0,'on spellhit - change template to Arzeth the Powerless');
## Blessing of Kings & Blessing of Sanctuary Stack Fix
SET @GROUP = 5000;

-- Insert Spells to Stackrules
DELETE FROM `spell_group` WHERE `id` = @GROUP;
INSERT INTO `spell_group` (`id`, `spell_id`) VALUES
 (@GROUP, 20911), -- Blessing of Sanctuary
 (@GROUP, 20217), -- Blessing of Kings
 (@GROUP, 25898), -- Greater Blessing of Kings
 (@GROUP, 25899), -- Greater Blessing of Sanctuary
 (@GROUP, 69378); -- Blessing of Forgotten Kings

-- Set stack rule for group
DELETE FROM `spell_group_stack_rules` WHERE `group_id` = @GROUP;
INSERT INTO `spell_group_stack_rules` (`group_id`, `stack_rule`) VALUES
 (@GROUP, 1);
-- Instructor Hroegar Flag and Loot Fix
UPDATE `creature_template` SET `mingold` = 1111, `maxgold` = 3333 , `faction_A` = 14 , `faction_H` = 14 WHERE `entry` = 29915;
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
