UPDATE `creature_template` SET `lootid`=34920 WHERE `entry`=34920;

DELETE FROM `creature_loot_template` WHERE `entry`=34920 AND `item`=46889;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(34920,46889,-100,1,0,1,1); -- Jormungar Egg Sac

SET @HONEST_MAX :=30464;
SET @GOSSIP     :=10144;

DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@GOSSIP,0,0,'Please, loan me a Gryphon.',1,1,0,0,0,0,NULL),    -- Alliance
(@GOSSIP,1,0,'Please, loan me a Wind Rider.',1,1,0,0,0,0,NULL); -- Horde

UPDATE `creature_template` SET `npcflag`=`npcflag`|1,`gossip_menu_id`=@GOSSIP,`AIName`='SmartAI',`ScriptName`='' WHERE `entry`=@HONEST_MAX;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@HONEST_MAX;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@HONEST_MAX,0,0,2,62,0,100,0,@GOSSIP,0,0,0,11,60127,2,0,0,0,0,7,0,0,0,0,0,0,0,'"Honest" Max - on Gossip select - cast: Loaned Gryphon Reins Force Cast'),      -- Alliance
(@HONEST_MAX,0,1,2,62,0,100,0,@GOSSIP,1,0,0,11,60129,2,0,0,0,0,7,0,0,0,0,0,0,0,'"Honest" Max - on Gossip select - cast: Loaned Wind Rider Reins Force Cast'),   -- Horde
(@HONEST_MAX,0,2,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'"Honest" Max - on Gossip select - close Gossip');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP,0,0,6,469,0,0,0,'','Gossip Option requires Alliance Player'),
(15,@GOSSIP,0,0,27,77,3,0,0,'','Gossip Option requires Level 77 or higher'),
(15,@GOSSIP,0,0,25,34091,0,0,0,'','Gossip Option requires No Artisan Riding'),
(15,@GOSSIP,0,0,25,54197,0,0,0,'','Gossip Option requires No Cold Weather Flying'),
(15,@GOSSIP,1,0,6,67,0,0,0,'','Gossip Option requires Horde Player'),
(15,@GOSSIP,1,0,27,77,3,0,0,'','Gossip Option requires Level 77 or higher'),
(15,@GOSSIP,1,0,25,34091,0,0,0,'','Gossip Option requires No Artisan Riding'),
(15,@GOSSIP,1,0,25,54197,0,0,0,'','Gossip Option requires No Cold Weather Flying');
-- Fix Quest 'Waking Legends' #8447
SET @REMULOS    :=11832;
SET @MALFURION  :=17949;
SET @QUEST      := 8447;
SET @SPELL1     :=25004; -- Throw Nightmare Object
SET @SPELL2     :=52096; -- Cosmetic Teleport Effect from sniff (for Malfurion on summon)

UPDATE `quest_template` SET `RewRepValueId1`=8 WHERE `entry` IN (8446,@QUEST); -- Fix some Reputation Reward

DELETE FROM `creature_text` WHERE `entry` IN (@REMULOS,@MALFURION);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@REMULOS,0,0,'Come, $N. The lake is around the bend.',12,0,100,1,0,0,'Keeper Remulos - say Text 0'),
(@REMULOS,1,0,'Stand near me, $N. I will protect you should anything go wrong.',12,0,100,1,0,0,'Keeper Remulos - say Text 1'),
(@REMULOS,2,0,'Malfurion!',12,0,100,5,0,0,'Keeper Remulos - say Text 2'),
(@REMULOS,3,0,'It was shrouded in nightmares, Malfurion. What is happening in the Dream? What could cause such atrocities?',12,0,100,6,0,0,'Keeper Remulos - say Text 3'),
(@REMULOS,4,0,'I sensed as much, Malfurion. Dark days loom ahead.',12,0,100,1,0,0,'Keeper Remulos - say Text 4'),
(@REMULOS,5,0,'You have been gone too long, Malfurion. Peace between the Children of Azeroth has become tenuous at best. What of my father? Of your brother? Have you any news?',12,0,100,6,0,0,'Keeper Remulos - say Text 5'),
(@REMULOS,6,0,'Farewell, old friend... Farewell...',12,0,100,1,0,0,'Keeper Remulos - say Text 6'),
(@REMULOS,7,0,'Let us return to the grove, mortal.',12,0,100,1,0,0,'Keeper Remulos - say Text 7'),

(@MALFURION,0,0,'Remulos, old friend. It is good to see you once more. I knew the message would find its way to you – one way or another.',12,0,100,1,0,0,'Malfurion Stormrage - say Text 0'),
(@MALFURION,1,0,'I fear for the worst, old friend. Within the Dream we fight a new foe, born of an ancient evil. Ysera''s noble brood has fallen victim to the old whisperings. It seems as if the Nightmare has broken through the realm to find a new host on Azeroth.',12,0,100,1,0,0,'Malfurion Stormrage - say Text 1'),
(@MALFURION,2,0,'Aye Remulos, prepare the mortal races.',12,0,100,1,0,0,'Malfurion Stormrage - say Text 2'),
(@MALFURION,3,0,'Cenarius fights at my side. Illidan sits atop his throne in Outland – brooding. I''m afraid that the loss to Arthas proved to be his breaking point. Madness has embraced him, Remulos. He replays the events in his mind a thousand times per day, but in his mind, he is the victor and Arthas is utterly defeated. He is too far gone, old friend. I fear that the time may soon come that our bond is tested and it will not be as it was at the Well in Zin-Azshari.',12,0,100,1,0,0,'Malfurion Stormrage - say Text 3'),
(@MALFURION,4,0,'Remulos, I am being drawn back... Tyrande... send her my love... Tell her I am safe... Tell her... Tell her I will return... Farewell...',12,0,100,1,0,0,'Malfurion Stormrage - say Text 4');

UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry`=@REMULOS;
UPDATE `creature_template` SET `InhabitType`=4,`AIName`='SmartAI',`ScriptName`='' WHERE `entry`=@MALFURION;

DELETE FROM `creature_template_addon` WHERE `entry`=@MALFURION;
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@MALFURION,0,0,33554432,0,0,'24999'); -- Hover & Malfurion's Shade Aura

DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (@REMULOS,@MALFURION);
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=@REMULOS*100;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- Quests: Hope Within the Emerald Nightmare & The Boon of Remulos
(@REMULOS,0,0,0,62,0,100,0,10215,0,0,0,11,57413,1,0,0,0,0,7,0,0,0,0,0,0,0,'Keeper Remulos - On gossip option select - cast spell'),
(@REMULOS,0,1,2,62,0,100,0,10215,1,0,0,11,57670,1,0,0,0,0,7,0,0,0,0,0,0,0,'Keeper Remulos - On gossip option select - cast spell'),
(@REMULOS,0,2,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Keeper Remulos - On gossip option select - close gossip'),
-- Quest: Waking Legends
(@REMULOS,0,3,4,19,0,100,0,@QUEST,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - on Quest Accept - Turn off Quest Giver & Gossip Flag'),
(@REMULOS,0,4,5,61,0,100,0,0,0,0,0,53,0,@REMULOS,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - on Quest Accept - start WP'),
(@REMULOS,0,5,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - on Quest Accept - say Text 0'),
(@REMULOS,0,6,7,40,0,100,0,5,@REMULOS,0,0,54,83000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - reached WP 5 - pause WP'),
(@REMULOS,0,7,8,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,3.12180,'Keeper Remulos - reached WP5 - set orientation'),
(@REMULOS,0,8,0,61,0,100,0,0,0,0,0,80,@REMULOS*100,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - reached WP 5 - run Script'),
(@REMULOS,0,9,10,40,0,100,0,10,@REMULOS,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - reached WP 10 - Turn on Quest Giver & Gossip Flag'),
(@REMULOS,0,10,0,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,3.909540,'Keeper Remulos - reached WP 10 - set orientation'),
-- Script
(@REMULOS*100,9,0,0,0,0,100,0,2000,2000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - say Text 1'),
(@REMULOS*100,9,1,0,0,0,100,0,3000,3000,0,0,11,@SPELL1,2,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - cast Spell: Throw Nightmare Object to Position'),
(@REMULOS*100,9,2,0,0,0,100,0,4000,4000,0,0,12,@MALFURION,8,0,0,0,0,8,0,0,0,7730.5288,-2318.8596,453.8706,6.14985,'Keeper Remulos - summon Malfurion Stormrage'),
(@REMULOS*100,9,3,0,0,0,100,0,2000,2000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - say Text 2'),
(@REMULOS*100,9,4,0,0,0,100,0,3000,3000,0,0,1,0,0,0,0,0,0,9,@MALFURION,0,30,0,0,0,0,'Malfurion Stormrage - say Text 0'),
(@REMULOS*100,9,5,0,0,0,100,0,6000,6000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - say Text 3'),
(@REMULOS*100,9,6,0,0,0,100,0,7000,7000,0,0,1,1,0,0,0,0,0,9,@MALFURION,0,30,0,0,0,0,'Malfurion Stormrage - say Text 1'),
(@REMULOS*100,9,7,0,0,0,100,0,11000,11000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - say Text 4'),
(@REMULOS*100,9,8,0,0,0,100,0,3500,3500,0,0,1,2,0,0,0,0,0,9,@MALFURION,0,30,0,0,0,0,'Malfurion Stormrage - say Text 2'),
(@REMULOS*100,9,9,0,0,0,100,0,4000,4000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - say Text 5'),
(@REMULOS*100,9,10,0,0,0,100,0,9000,9000,0,0,1,3,0,0,0,0,0,9,@MALFURION,0,30,0,0,0,0,'Malfurion Stormrage - say Text 3'),
(@REMULOS*100,9,11,0,0,0,100,0,19000,19000,0,0,1,4,0,0,0,0,0,9,@MALFURION,0,30,0,0,0,0,'Malfurion Stormrage - say Text 4'),
(@REMULOS*100,9,12,0,0,0,100,0,6000,6000,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - say Text 6'),
(@REMULOS*100,9,13,0,0,0,100,0,2000,2000,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,'Keeper Remulos - say Text 7'),
(@REMULOS*100,9,14,0,0,0,100,0,0,0,0,0,15,@QUEST,0,0,0,0,0,7,0,0,0,0,0,0,0,'Keeper Remulos - give Quest Credit'),
(@REMULOS*100,9,15,0,0,0,100,0,1000,1000,0,0,45,0,1,0,0,0,0,9,@MALFURION,0,30,0,0,0,0,'Keeper Remulos - set data 0 1 to Malfurion Stormrage'),

(@MALFURION,0,0,0,54,0,100,0,0,0,0,0,11,@SPELL2,2,0,0,0,0,1,0,0,0,0,0,0,0,'Malfurion Stormrage - on summon - cast Cosmetic Teleport Effect on self'),
(@MALFURION,0,1,0,38,0,100,0,0,1,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Malfurion Stormrage - on data set 0 1 - despawn');

DELETE FROM `spell_target_position` WHERE `id`=@SPELL1;
INSERT INTO `spell_target_position` (`id`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES 
(@SPELL1,1,7730.5288,-2318.8596,451.34,0);


DELETE FROM `waypoints` WHERE `entry`=@REMULOS;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@REMULOS,1,7828.5752,-2246.8354,463.5159,'Keeper Remulos - WP1'),
(@REMULOS,2,7824.6440,-2279.0273,459.3173,'Keeper Remulos - WP2'),
(@REMULOS,3,7814.1699,-2302.2565,456.2227,'Keeper Remulos - WP3'),
(@REMULOS,4,7787.4604,-2320.9807,454.5470,'Keeper Remulos - WP4'),
(@REMULOS,5,7753.7495,-2319.0832,454.7066,'Keeper Remulos - WP5'),
(@REMULOS,6,7787.4604,-2320.9807,454.5470,'Keeper Remulos - WP6'),
(@REMULOS,7,7814.1699,-2302.2565,456.2227,'Keeper Remulos - WP7'),
(@REMULOS,8,7824.6440,-2279.0273,459.3173,'Keeper Remulos - WP8'),
(@REMULOS,9,7828.5752,-2246.8354,463.5159,'Keeper Remulos - WP9'),
(@REMULOS,10,7848.3,-2216.35,470.888,'Keeper Remulos - WP10 (Home)');
UPDATE `item_template` SET `ScriptName`='item_chime_of_cleansing' WHERE `entry`=39572;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (29033,29018,29034);
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (29033,29018,29034);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- Spirit of Atha
(29033,0,0,0,0,0,100,0,2000,4000,5000,7000,11,3391,2,0,0,0,0,1,0,0,0,0,0,0,0,'Spirit of Atha - IC - cast Trash'),
(29033,0,1,0,0,0,100,0,6000,8000,9000,11000,11,21790,2,0,0,0,0,1,0,0,0,0,0,0,0,'Spirit of Atha - IC - cast Aqua Jet'),
-- Spirit of Ha-Khalan
(29018,0,0,0,4,0,100,0,0,0,0,0,11,50502,2,0,0,0,0,1,0,0,0,0,0,0,0,'Spirit of Ha-Khalan - on Aggro - cast Thick Hide'),
(29018,0,1,0,0,0,100,0,5000,10000,12000,16000,11,34370,2,0,0,0,0,2,0,0,0,0,0,0,0,'Spirit of Ha-Khalan - IC - cast Jagged Tooth Snap'),
(29018,0,2,0,0,0,100,0,3000,5000,7000,11000,11,48287,2,0,0,0,0,2,0,0,0,0,0,0,0,'Spirit of Ha-Khalan - IC - cast Powerful Bite'),
-- Spirit of Koosu
(29034,0,0,0,0,0,100,0,1000,2000,4000,6000,11,21971,2,0,0,0,0,2,0,0,0,0,0,0,0,'Spirit of Koosu - IC - cast Poison Bolt');
UPDATE `creature_template` SET `AIName`='',`ScriptName`='npc_stormwatcher' WHERE `entry`=28877;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=28877;

UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-10 WHERE `item`=39651; -- increase Droppchance of Venture Co. Explosives (1% is to less)

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceEntry`=39651;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(18,0,39651,0,24,2,28877,0,0,'','Venture Co. Explosives only target dead Stormwatcher');
UPDATE `creature_template` SET `AIName`='',`ScriptName`='npc_rejek_first_blood' WHERE `entry` IN (28086,28096,28110,28109);
DELETE FROM `pool_template` WHERE `entry` IN (12000,12001,12002,12003);
INSERT INTO `pool_template` (`entry`,`max_limit`,`description`) VALUES 
(12000,1,'Oracle Soo-nee - Oracle Dailies'),
(12001,1,'Oracle Soo-dow - Oracle Dailies'),
(12002,1,'Rejek - Frenzyheart Tribe Dailies'),
(12003,1,'Vekgar - Frenzyheart Tribe Dailies');

DELETE FROM `pool_quest` WHERE `entry` IN (12735,12736,12737,12726,12761,12762,12705,12758,12734,12741,12732,12703,12760,12759);
INSERT INTO `pool_quest` (`entry`,`pool_entry`,`description`) VALUES 
-- ORACLE
-- Oracle Soo-nee
(12735,12000,'A Cleansing Song / Oracle Daily / Oracle Soo-nee'),
(12736,12000,'Song of Fecundity / Oracle Daily / Oracle Soo-nee'),
(12737,12000,'Song of Reflection / Oracle Daily / Oracle Soo-nee'),
(12726,12000,'Song of Wind and Water / Oracle Daily / Oracle Soo-nee'),
-- Oracle Soo-say
-- 12704|Appeasing the Great Rain Stone|everyday available 
-- Oracle Soo-dow
(12761,12001,'Mastery of the Crystals / Oracle Daily / Oracle Soo-dow'),
(12762,12001,'Power of the Great Ones / Oracle Daily / Oracle Soo-dow'),
(12705,12001,'Will of the Titans / Oracle Daily / Oracle Soo-dow'),
-- FRENZYHEART TRIBE
-- Rejek
(12758,12002,'A Heros''s Headgear / Frenzyheart Tribe Daily / Rejek'),
(12734,12002,'Rejek: First Blood / Frenzyheart Tribe Daily / Rejek'),
(12741,12002,'Strength of the Tempest / Frenzyheart Tribe Daily / Rejek'),
(12732,12002,'The Heartblood''s Strength / Frenzyheart Tribe Daily / Rejek'),
-- Elder Harkek
-- 12702|Chicken Party|everyday available 
-- Vekgar
(12703,12003,'Kartak''s Rampage / Frenzyheart Tribe Daily / Vekgar'),
(12760,12003,'Secret Strength of the Frenzyheart / Frenzyheart Tribe Daily / Vekgar'),
(12759,12003,'Tools of War / Frenzyheart Tribe Daily / Vekgar');
-- correct some Reputation Reward of Oracle & Freanzyheart Quests for Ulduar Content (confirmed by some www.wowhead.com comments)
UPDATE `quest_template` SET `RewRepValueId1`=7 WHERE `entry` IN (12735,12736,12737,12726,12704, 12758,12734,12741,12732,12702);
UPDATE `quest_template` SET `RewRepValue1`=70000 WHERE `entry` IN (12761,12762,12705, 12703,12760,12760);
