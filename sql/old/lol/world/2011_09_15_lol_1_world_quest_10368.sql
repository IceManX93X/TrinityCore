-- Fix Quest 'The Dreghood Elders' #10368
SET @Quest      = 10368;
SET @Morod      = 20677;
SET @GMorod     = 8162;    -- gossip_menu_id Morod
SET @Akoru      = 20678;
SET @GAkoru     = 8163;    -- gossip_menu_id Akoru
SET @Aylaan     = 20679;
SET @GAylaan    = 8161;    -- gossip_menu_id Aylaan
-- SAI + Gossip Flag + Quest Requirements
UPDATE `creature_template` SET `AIName`='SmartAI',`npcflag`=`npcflag`|1 WHERE `entry` IN (@Morod,@Akoru,@Aylaan);
UPDATE `quest_template` SET `ReqCreatureOrGOId1`=@Morod,`ReqCreatureOrGOId2`=@Akoru,`ReqCreatureOrGOId3`=@Aylaan,`ReqCreatureOrGOCount1`=1,`ReqCreatureOrGOCount2`=1,`ReqCreatureOrGOCount3`=1 WHERE `entry`=@Quest;
-- gossip_menu
DELETE FROM `gossip_menu` WHERE `entry` IN (@GMorod,@GAkoru,@GAylaan);
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(@GAylaan,10103),
(@GMorod,10104),
(@GAkoru,10105);
-- gossip_menu_option
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (@GMorod,@GAkoru,@GAylaan);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(8161,0,0,'Walk free, elder.  Bring the spirits back to your tribe.',1,1,0,0,0,0,''),
(8162,0,0,'Walk free, elder.  Bring the spirits back to your tribe.',1,1,0,0,0,0,''),
(8163,0,0,'Walk free, elder.  Bring the spirits back to your tribe.',1,1,0,0,0,0,'');
-- Smart AI
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (@Morod,@Akoru,@Aylaan);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
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
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup` IN (@GMorod,@GAkoru,@GAylaan);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,8161,0,0,9,@Quest,0,0,0,'','show gossip menu option if player has quest 10368'),
(15,8162,0,0,9,@Quest,0,0,0,'','show gossip menu option if player has quest 10368'),
(15,8163,0,0,9,@Quest,0,0,0,'','show gossip menu option if player has quest 10368');