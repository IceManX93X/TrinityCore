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