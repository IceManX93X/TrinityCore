-- Fix Quest 11887 'Emergency Supplies'
SET @NPC    :=25841; -- Fizzcrank Recon Pilot
SET @Gossip :=21248;
SET @Text   :=12489;

DELETE FROM `npc_text` WHERE `ID`=@Text;
INSERT INTO `npc_text` (`ID`,`text0_0`,`text0_1`,`lang0`,`prob0`,`em0_0`,`em0_1`,`em0_2`,`em0_3`,`em0_4`,`em0_5`,`text1_0`,`text1_1`,`lang1`,`prob1`,`em1_0`,`em1_1`,`em1_2`,`em1_3`,`em1_4`,`em1_5`,`text2_0`,`text2_1`,`lang2`,`prob2`,`em2_0`,`em2_1`,`em2_2`,`em2_3`,`em2_4`,`em2_5`,`text3_0`,`text3_1`,`lang3`,`prob3`,`em3_0`,`em3_1`,`em3_2`,`em3_3`,`em3_4`,`em3_5`,`text4_0`,`text4_1`,`lang4`,`prob4`,`em4_0`,`em4_1`,`em4_2`,`em4_3`,`em4_4`,`em4_5`,`text5_0`,`text5_1`,`lang5`,`prob5`,`em5_0`,`em5_1`,`em5_2`,`em5_3`,`em5_4`,`em5_5`,`text6_0`,`text6_1`,`lang6`,`prob6`,`em6_0`,`em6_1`,`em6_2`,`em6_3`,`em6_4`,`em6_5`,`text7_0`,`text7_1`,`lang7`,`prob7`,`em7_0`,`em7_1`,`em7_2`,`em7_3`,`em7_4`,`em7_5`,`WDBVerified`) VALUES
(12489,'This recon pilot did not survive his squadron"s crash.','',0,1,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,11723);

DELETE FROM `gossip_menu` WHERE `text_id`=@Text;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(@Gossip,@Text);

DELETE FROM `gossip_menu_option` WHERE `menu_id`=@Gossip;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES 
(@Gossip,0,0,'Search the body for the pilot"s emergency toolkit.',1,1,0,0,0,0,0,'');

DELETE FROM `smart_scripts` WHERE `entryorguid`=@NPC AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@NPC,0,0,1,62,0,100,0,@Gossip,0,0,0,11,46362,0,0,0,0,0,7,0,0,0,0,0,0,0,'Fizzcrank Recon Pilot - On gossip option select - cast spell'),
(@NPC,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Fizzcrank Recon Pilot - On gossip option select - close gossip'),
(@NPC,0,2,0,11,0,100,0,0,0,0,0,81,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fizzcrank Recon Pilot - On spawn - set gossip flag'),
(@NPC,0,3,4,8,0,100,0,46362,0,0,0,11,46362,0,0,0,0,0,7,0,0,0,0,0,0,0,'Fizzcrank Recon Pilot - On spellhit - cast spell on envoker'),
(@NPC,0,4,0,61,0,100,0,0,0,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fizzcrank Recon Pilot - On spellhit - set phase 1'),
(@NPC,0,5,0,1,1,100,0,3000,3000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fizzcrank Recon Pilot - OOC - wait 3 sec despawn (Phase 1)');