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