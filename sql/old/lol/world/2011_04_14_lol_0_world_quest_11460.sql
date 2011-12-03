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
