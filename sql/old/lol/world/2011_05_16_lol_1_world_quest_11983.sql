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