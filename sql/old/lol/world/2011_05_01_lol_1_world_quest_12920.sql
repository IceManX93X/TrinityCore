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












