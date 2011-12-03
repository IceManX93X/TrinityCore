DELETE FROM `reference_loot_template` WHERE `entry` IN (34125,34126,34127);
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
-- ilvl 219
('34125','45934','0','1','1','1','1'),
('34125','45935','0','1','1','1','1'),
('34125','45936','0','1','1','1','1'),
('34125','45940','0','1','1','1','1'),
('34125','45941','0','1','1','1','1'),
-- 1 elder alive emblems
('34126','40753','100','2','0','1','1'),
('34126','45624','100','2','0','1','1'),
-- 2 elder alive emblems
('34127','40753','100','4','0','1','1'),
('34127','45624','100','4','0','1','1');

DELETE FROM `gameobject_loot_template` WHERE `entry` IN (27078,27081);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
-- 10 normal
('27078','1','100','1','0','-34125','1'),
('27078','2','100','1','0','-34105','1'),
('27078','4','100','2','0','-34126','1'),
('27078','5','100','4','0','-34127','1'),
('27078','40753','100','1','0','1','1'),
('27078','45087','100','1','0','1','1'),
('27078','45644','0','1','1','1','1'),
('27078','45645','0','1','1','1','1'),
('27078','45646','0','1','1','1','1'),
('27078','46110','100','1','0','1','1'),
-- 10 hard
('27081','1','100','1','0','-34125','1'),
('27081','2','100','1','0','-34105','1'),
('27081','40753','100','1','0','4','4'),
('27081','45624','100','1','0','2','2'),
('27081','45087','100','1','0','1','1'),
('27081','45294','0','1','2','1','1'),
('27081','45644','0','1','1','1','1'),
('27081','45645','0','1','1','1','1'),
('27081','45646','0','1','1','1','1'),
('27081','45788','-100','1','0','1','1'),
('27081','45943','0','1','2','1','1'),
('27081','45945','0','1','2','1','1'),
('27081','45946','0','1','2','1','1'),
('27081','45947','0','1','2','1','1'),
('27081','46110','100','1','0','1','1');

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
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=63322;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,63322,18,1,0);

-- Fix Quest 11887 'Emergency Supplies'
SET @NPC    :=25841; -- Fizzcrank Recon Pilot
SET @Gossip :=21248;
SET @Text   :=12489;

DELETE FROM `npc_text` WHERE `ID`=@Text;
INSERT INTO `npc_text` (`ID`,`text0_0`,`text0_1`,`lang0`,`prob0`,`em0_0`,`em0_1`,`em0_2`,`em0_3`,`em0_4`,`em0_5`,`text1_0`,`text1_1`,`lang1`,`prob1`,`em1_0`,`em1_1`,`em1_2`,`em1_3`,`em1_4`,`em1_5`,`text2_0`,`text2_1`,`lang2`,`prob2`,`em2_0`,`em2_1`,`em2_2`,`em2_3`,`em2_4`,`em2_5`,`text3_0`,`text3_1`,`lang3`,`prob3`,`em3_0`,`em3_1`,`em3_2`,`em3_3`,`em3_4`,`em3_5`,`text4_0`,`text4_1`,`lang4`,`prob4`,`em4_0`,`em4_1`,`em4_2`,`em4_3`,`em4_4`,`em4_5`,`text5_0`,`text5_1`,`lang5`,`prob5`,`em5_0`,`em5_1`,`em5_2`,`em5_3`,`em5_4`,`em5_5`,`text6_0`,`text6_1`,`lang6`,`prob6`,`em6_0`,`em6_1`,`em6_2`,`em6_3`,`em6_4`,`em6_5`,`text7_0`,`text7_1`,`lang7`,`prob7`,`em7_0`,`em7_1`,`em7_2`,`em7_3`,`em7_4`,`em7_5`,`WDBVerified`) VALUES
(@Text,'This recon pilot did not survive his squadron"s crash.','',0,1,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,11723);

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

DELETE FROM `spell_script_names` WHERE `spell_id` IN (63025,64233,63024,64234,63018,65121);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(63024, 'spell_xt002_bomb_select_target'),
(64234, 'spell_xt002_bomb_select_target'),
(63018, 'spell_xt002_bomb_select_target'),
(65121, 'spell_xt002_bomb_select_target');

-- Junk Bot
UPDATE `creature_template` SET `difficulty_entry_1`=34114 WHERE `entry`=33855;
UPDATE `creature_template` SET `faction_A`=16, `faction_H`=16, `dmg_multiplier`=15 WHERE `entry`=34114;

-- Add Reputation gain/loss to High Admiral "Shelly" Jorrik
REPLACE INTO `creature_onkill_reputation` (`creature_id`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES
  (26081, 87, 21, 6, 0, 5, 7, 127, -125, 0);
DELETE FROM `spell_script_names` WHERE `spell_id` IN (62968,65761,62713);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(62968, 'spell_elder_essence_targeting'),
(65761, 'spell_elder_essence_targeting'),
(62713, 'spell_elder_essence_targeting');

-- Add passive Flag to various Ulduar triggers
UPDATE creature_template SET unit_flags = unit_flags|512 WHERE entry IN (
33054, -- Thorim Trap Bunny
33500, -- Vezax Bunny
33575, -- Channel Stalker Freya
33661, -- Armsweep Stalker Kologarn
34188, -- Razorscale Devouring Flame Stalker
34189, -- Razorscale Devouring Flame Stalker (heroic)
34098, -- Auriaya Seeping Essence Stalker
34174  -- Auriaya Seeping Essence Stalker (heroic)
);
DELETE FROM `conditions` WHERE `SourceEntry`=62834 AND `SourceTypeOrReferenceId`=13 AND `ConditionTypeOrReference`=18;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`Comment`) VALUES
(13,62834,18,1,0, 'Boombot Boom - Player target'),
(13,62834,18,1,33343, 'Boombot Boom - Scrapbot target'),
(13,62834,18,1,33344, 'Boombot Boom - Pummeler target'),
(13,62834,18,1,33346, 'Boombot Boom - Boombot target'),
(13,62834,18,1,33329, 'Boombot Boom - Heart of the Deconstructor target'),
(13,62834,18,1,33293, 'Boombot Boom - XT-002 target');

DELETE FROM `conditions` WHERE `SourceEntry`=62711 AND `SourceTypeOrReferenceId`=13 AND `ConditionTypeOrReference`=18;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`Comment`) VALUES
(13,62711,18,1,33118, 'Ingis - Grab');

-- set 25N chopper spells
UPDATE `creature_template` SET `spell1`=62974, `spell2`=62286, `spell3`=62299, `spell4`=64660 WHERE `entry`=34045;

-- longer steelforged defender respawn timer (should not be DB spawned at all?)
UPDATE `creature` SET `spawntimesecs`=1800 WHERE `id`=33236;

UPDATE `creature_template` SET `minlevel`=83, `maxlevel`=83 WHERE `entry`=33909;

DELETE FROM `npc_vendor` WHERE `entry` IN (32381, 24667, 34076, 34058, 33921, 33923, 34087);
/* ##################
#Offset S6 226ilvl Tristia
################## */

INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 40881, 0, 0, 2615);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 40882, 0, 0, 2616);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 40889, 0, 0, 2614);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 40976, 0, 0, 2615);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 40977, 0, 0, 2616);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 40983, 0, 0, 2614);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 41051, 0, 0, 2615);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 41055, 0, 0, 2616);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 41060, 0, 0, 2614);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 41065, 0, 0, 2614);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 41070, 0, 0, 2615);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 41075, 0, 0, 2616);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 41225, 0, 0, 2614);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 41230, 0, 0, 2616);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 41235, 0, 0, 2615);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 41617, 0, 0, 2615);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 41621, 0, 0, 2616);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 41625, 0, 0, 2614);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 41630, 0, 0, 2615);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 41635, 0, 0, 2616);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 41640, 0, 0, 2614);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 41832, 0, 0, 2615);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 41836, 0, 0, 2616);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 41840, 0, 0, 2614);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 41881, 0, 0, 2615);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 41885, 0, 0, 2616);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 41893, 0, 0, 2614);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 41898, 0, 0, 2615);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 41903, 0, 0, 2616);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 41909, 0, 0, 2614);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 42034, 0, 0, 2617);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 42035, 0, 0, 2617);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 42036, 0, 0, 2617);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 42037, 0, 0, 2617);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 42038, 0, 0, 2617);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 42039, 0, 0, 2617);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 42040, 0, 0, 2617);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 42069, 0, 0, 2565);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 42070, 0, 0, 2565);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 42071, 0, 0, 2565);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 42072, 0, 0, 2565);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 42073, 0, 0, 2565);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 42074, 0, 0, 2565);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 42075, 0, 0, 2565);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 42116, 0, 0, 2618);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 42117, 0, 0, 2618);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 42124, 0, 0, 2568);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34076, 0, 46373, 0, 0, 2617);


/* ##################
#Offset S6 226ilvl Doris
################## */

INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 40881, 0, 0, 2615);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 40882, 0, 0, 2616);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 40889, 0, 0, 2614);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 40976, 0, 0, 2615);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 40977, 0, 0, 2616);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 40983, 0, 0, 2614);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41051, 0, 0, 2615);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41055, 0, 0, 2616);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41060, 0, 0, 2614);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41065, 0, 0, 2614);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41070, 0, 0, 2615);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41075, 0, 0, 2616);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41225, 0, 0, 2614);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41230, 0, 0, 2616);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41235, 0, 0, 2615);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41617, 0, 0, 2615);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41621, 0, 0, 2616);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41625, 0, 0, 2614);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41630, 0, 0, 2615);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41635, 0, 0, 2616);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41640, 0, 0, 2614);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41832, 0, 0, 2615);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41836, 0, 0, 2616);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41840, 0, 0, 2614);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41881, 0, 0, 2615);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41885, 0, 0, 2616);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41893, 0, 0, 2614);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41898, 0, 0, 2615);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41903, 0, 0, 2616);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 41909, 0, 0, 2614);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42034, 0, 0, 2617);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42035, 0, 0, 2617);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42036, 0, 0, 2617);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42037, 0, 0, 2617);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42038, 0, 0, 2617);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42039, 0, 0, 2617);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42040, 0, 0, 2617);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42069, 0, 0, 2565);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42070, 0, 0, 2565);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42071, 0, 0, 2565);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42072, 0, 0, 2565);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42073, 0, 0, 2565);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42074, 0, 0, 2565);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42075, 0, 0, 2565);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42116, 0, 0, 2618);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42117, 0, 0, 2618);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 42126, 0, 0, 2568);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34058, 0, 46373, 0, 0, 2617);

/* ############
#S6 Set und T1 Waffen
############# */

INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 40787, 0, 0, 2692);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 40788, 0, 0, 2692);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 40789, 0, 0, 2692);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 40807, 0, 0, 2621);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 40808, 0, 0, 2621);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 40809, 0, 0, 2621);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 40826, 0, 0, 2677);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 40827, 0, 0, 2677);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 40828, 0, 0, 2677);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 40847, 0, 0, 2340);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 40848, 0, 0, 2340);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 40849, 0, 0, 2340);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 40866, 0, 0, 2470);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 40868, 0, 0, 2470);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 40869, 0, 0, 2470);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 40907, 0, 0, 2692);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 40927, 0, 0, 2621);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 40933, 0, 0, 2677);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 40939, 0, 0, 2340);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 40963, 0, 0, 2470);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 40992, 0, 0, 2692);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 40993, 0, 0, 2692);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41001, 0, 0, 2621);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41007, 0, 0, 2621);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41013, 0, 0, 2677);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41019, 0, 0, 2677);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41027, 0, 0, 2340);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41033, 0, 0, 2340);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41038, 0, 0, 2470);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41044, 0, 0, 2470);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41081, 0, 0, 2692);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41087, 0, 0, 2692);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41137, 0, 0, 2621);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41143, 0, 0, 2621);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41151, 0, 0, 2677);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41157, 0, 0, 2677);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41199, 0, 0, 2340);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41205, 0, 0, 2340);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41211, 0, 0, 2470);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41217, 0, 0, 2470);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41275, 0, 0, 2470);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41281, 0, 0, 2470);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41287, 0, 0, 2621);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41293, 0, 0, 2621);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41298, 0, 0, 2340);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41304, 0, 0, 2340);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41310, 0, 0, 2692);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41316, 0, 0, 2692);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41321, 0, 0, 2677);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41327, 0, 0, 2677);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41650, 0, 0, 2692);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41655, 0, 0, 2340);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41661, 0, 0, 2692);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41667, 0, 0, 2340);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41672, 0, 0, 2677);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41678, 0, 0, 2677);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41683, 0, 0, 2470);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41715, 0, 0, 2470);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41767, 0, 0, 2621);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41773, 0, 0, 2621);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41854, 0, 0, 2677);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41859, 0, 0, 2692);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41864, 0, 0, 2340);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41869, 0, 0, 2470);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41874, 0, 0, 2621);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41915, 0, 0, 2677);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41921, 0, 0, 2692);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41927, 0, 0, 2340);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41934, 0, 0, 2470);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41940, 0, 0, 2621);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41946, 0, 0, 2677);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41953, 0, 0, 2692);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41959, 0, 0, 2340);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41965, 0, 0, 2470);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41971, 0, 0, 2621);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41993, 0, 0, 2677);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 41998, 0, 0, 2692);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42005, 0, 0, 2340);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42011, 0, 0, 2470);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42017, 0, 0, 2621);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42209, 0, 0, 2624);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42228, 0, 0, 2626);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42233, 0, 0, 2626);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42243, 0, 0, 2624);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42249, 0, 0, 2626);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42256, 0, 0, 2626);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42261, 0, 0, 2624);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42266, 0, 0, 2626);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42271, 0, 0, 2626);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42276, 0, 0, 2624);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42281, 0, 0, 2626);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42286, 0, 0, 2624);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42291, 0, 0, 2626);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42318, 0, 0, 2623);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42323, 0, 0, 2623);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42328, 0, 0, 2623);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42333, 0, 0, 2623);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42347, 0, 0, 2624);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42353, 0, 0, 2624);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42364, 0, 0, 2623);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42385, 0, 0, 2623);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42391, 0, 0, 2623);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42451, 0, 0, 2384);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42486, 0, 0, 2623);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42491, 0, 0, 2623);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42496, 0, 0, 2623);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42503, 0, 0, 2384);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42514, 0, 0, 2384);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42520, 0, 0, 2384);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42526, 0, 0, 2626);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42532, 0, 0, 2626);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42538, 0, 0, 2626);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42560, 0, 0, 2628);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42565, 0, 0, 2628);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42571, 0, 0, 2628);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42579, 0, 0, 2384);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42584, 0, 0, 2384);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42589, 0, 0, 2384);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42598, 0, 0, 2384);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42603, 0, 0, 2384);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42608, 0, 0, 2384);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42615, 0, 0, 2384);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42621, 0, 0, 2384);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 42853, 0, 0, 2384);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 44421, 0, 0, 2623);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 44422, 0, 0, 2623);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 45706, 0, 0, 2596);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33921, 0, 45983, 0, 0, 2636);

/* #####################
#S5 Set Update ilvl 200
################### */

INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 40781, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 40782, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 40783, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 40801, 0, 0, 2958);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 40802, 0, 0, 2958);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 40803, 0, 0, 2958);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 40819, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 40820, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 40821, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 40840, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 40841, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 40842, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 40859, 0, 0, 2960);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 40860, 0, 0, 2960);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 40861, 0, 0, 2960);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 40904, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 40925, 0, 0, 2958);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 40931, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 40937, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 40961, 0, 0, 2960);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 40988, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 40989, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 40999, 0, 0, 2958);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41005, 0, 0, 2958);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41011, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41017, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41025, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41031, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41036, 0, 0, 2960);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41042, 0, 0, 2960);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41079, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41085, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41135, 0, 0, 2958);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41141, 0, 0, 2958);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41149, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41155, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41162, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41203, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41209, 0, 0, 2960);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41215, 0, 0, 2960);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41273, 0, 0, 2960);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41279, 0, 0, 2960);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41284, 0, 0, 2958);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41291, 0, 0, 2958);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41296, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41302, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41308, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41314, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41319, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41325, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41648, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41653, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41659, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41665, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41670, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41676, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41681, 0, 0, 2960);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41713, 0, 0, 2960);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41765, 0, 0, 2958);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41771, 0, 0, 2958);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41852, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41857, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41862, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41867, 0, 0, 2960);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41872, 0, 0, 2958);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41913, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41919, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41925, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41931, 0, 0, 2960);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41938, 0, 0, 2958);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41944, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41950, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41957, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41963, 0, 0, 2960);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41969, 0, 0, 2958);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 41991, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 42001, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 42003, 0, 0, 2964);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 42009, 0, 0, 2960);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 42015, 0, 0, 2958);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (33923, 0, 45706, 0, 0, 2596);

/* ################
#S6 T2 Waffen
################# */

INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34087, 0, 45937, 0, 0, 2942);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34087, 0, 45938, 0, 0, 2942);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34087, 0, 45939, 0, 0, 2942);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34087, 0, 45948, 0, 0, 2942);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34087, 0, 45949, 0, 0, 2942);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34087, 0, 45950, 0, 0, 2942);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34087, 0, 45951, 0, 0, 2942);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34087, 0, 45952, 0, 0, 2942);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34087, 0, 45953, 0, 0, 2942);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34087, 0, 45954, 0, 0, 2942);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34087, 0, 45955, 0, 0, 2942);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34087, 0, 45956, 0, 0, 2942);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34087, 0, 45957, 0, 0, 2697);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34087, 0, 45958, 0, 0, 2697);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34087, 0, 45959, 0, 0, 2697);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34087, 0, 45960, 0, 0, 2697);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34087, 0, 45961, 0, 0, 2677);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34087, 0, 45962, 0, 0, 2677);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34087, 0, 45963, 0, 0, 2677);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34087, 0, 45964, 0, 0, 2677);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34087, 0, 45965, 0, 0, 2677);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34087, 0, 45966, 0, 0, 2677);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34087, 0, 45967, 0, 0, 2677);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34087, 0, 45968, 0, 0, 2677);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34087, 0, 45969, 0, 0, 2697);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34087, 0, 45970, 0, 0, 2696);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (34087, 0, 45971, 0, 0, 2696);



/*##########
#Epic2 Offset  Hauptmann Klagehammer
##########*/

-- Schuhe Ilvl 213 PvP Epic2 erhältlich bei  Hauptmann Klagehammer
INSERT INTO npc_vendor (entry, item, ExtendedCost) VALUES
(32381, 41634, 2256),
(32381, 41620, 2256),
(32381, 41835, 2256),
(32381, 41884, 2256),
(32381, 41054, 2256),
(32381, 40975, 2256),
(32381, 41229, 2256),
(32381, 40880, 2256),
(32381, 41074, 2256);

-- Hals Ilvl 213 PvP Epic2 erhältlich bei  Hauptmann Klagehammer
INSERT INTO npc_vendor (entry, item, ExtendedCost) VALUES
(32381, 42030, 2257),
(32381, 42032, 2257),
(32381, 42033, 2257),
(32381, 42031, 2257),
(32381, 42027, 2257),
(32381, 42028, 2257),
(32381, 42029, 2257);

-- Gurt Ilvl 213 PvP Epic2 erhältlich bei  Hauptmann Klagehammer
INSERT INTO npc_vendor (entry, item, ExtendedCost) VALUES
(32381, 41629, 2403),
(32381, 41616, 2403),
(32381, 41831, 2403),
(32381, 40974, 2403),
(32381, 41880, 2403),
(32381, 41048, 2403),
(32381, 40879, 2403),
(32381, 41234, 2403),
(32381, 41069, 2403),
(32381, 41897, 2403);

-- Ring Ilvl 213 PvP Epic2 erhältlich bei  Hauptmann Klagehammer
INSERT INTO npc_vendor (entry, item, ExtendedCost) VALUES
(32381, 42114, 2257),
(32381, 42115, 2257);

-- Umhang Ilvl 213 PvP Epic2 erhältlich bei  Hauptmann Klagehammer
INSERT INTO npc_vendor (entry, item, ExtendedCost) VALUES
(32381, 42064, 2257),
(32381, 42066, 2257),
(32381, 42062, 2257),
(32381, 42065, 2257),
(32381, 42068, 2257),
(32381, 42067, 2257),
(32381, 42063, 2257);


-- Armschienen Ilvl 213 PvP Epic2 erhältlich bei  Hauptmann Klagehammer
INSERT INTO npc_vendor (entry, item, ExtendedCost) VALUES
(32381, 41639, 2262),
(32381, 41624, 2262),
(32381, 41839, 2262),
(32381, 40982, 2262),
(32381, 41059, 2262),
(32381, 41224, 2262),
(32381, 41064, 2262),
(32381, 40888, 2262),
(32381, 41908, 2262),
(32381, 41892, 2262);

-- Battlemaster's Trinkets Ilvl 213 PvP Epic2 erhältlich bei  Hauptmann Klagehammer
INSERT INTO npc_vendor (entry, item, ExtendedCost) VALUES
(32381, 42128, 2403),
(32381, 42130, 2403),
(32381, 42132, 2403),
(32381, 42131, 2403),
(32381, 42129, 2403);

/*##########
#Epic2 Offset Unteroffizier Donnerhorn
##########*/

-- Schuhe Ilvl 213 PvP Epic2 erhältlich bei Unteroffizier Donnerhorn
INSERT INTO npc_vendor (entry, item, ExtendedCost) VALUES
(24667, 41634, 2256),
(24667, 41620, 2256),
(24667, 41835, 2256),
(24667, 41884, 2256),
(24667, 41054, 2256),
(24667, 40975, 2256),
(24667, 41229, 2256),
(24667, 40880, 2256),
(24667, 41074, 2256);

-- Hals Ilvl 213 PvP Epic2 erhältlich bei Unteroffizier Donnerhorn
INSERT INTO npc_vendor (entry, item, ExtendedCost) VALUES
(24667, 42030, 2257),
(24667, 42032, 2257),
(24667, 42033, 2257),
(24667, 42031, 2257),
(24667, 42027, 2257),
(24667, 42028, 2257),
(24667, 42029, 2257);

-- Gurt Ilvl 213 PvP Epic2 erhältlich bei Unteroffizier Donnerhorn
INSERT INTO npc_vendor (entry, item, ExtendedCost) VALUES
(24667, 41629, 2403),
(24667, 41616, 2403),
(24667, 41831, 2403),
(24667, 40974, 2403),
(24667, 41880, 2403),
(24667, 41048, 2403),
(24667, 40879, 2403),
(24667, 41234, 2403),
(24667, 41069, 2403),
(24667, 41897, 2403);

-- Ring Ilvl 213 PvP Epic2 erhältlich bei Unteroffizier Donnerhorn
INSERT INTO npc_vendor (entry, item, ExtendedCost) VALUES
(24667, 42114, 2257),
(24667, 42115, 2257);

-- Umhang Ilvl 213 PvP Epic2 erhältlich bei Unteroffizier Donnerhorn
INSERT INTO npc_vendor (entry, item, ExtendedCost) VALUES
(24667, 42064, 2257),
(24667, 42066, 2257),
(24667, 42062, 2257),
(24667, 42065, 2257),
(24667, 42068, 2257),
(24667, 42067, 2257),
(24667, 42063, 2257);


-- Armschienen Ilvl 213 PvP Epic2 erhältlich bei Unteroffizier Donnerhorn
INSERT INTO npc_vendor (entry, item, ExtendedCost) VALUES
(24667, 41639, 2262),
(24667, 41624, 2262),
(24667, 41839, 2262),
(24667, 40982, 2262),
(24667, 41059, 2262),
(24667, 41224, 2262),
(24667, 41064, 2262),
(24667, 40888, 2262),
(24667, 41908, 2262),
(24667, 41892, 2262);

-- Battlemaster's Trinkets Ilvl 213 PvP Epic2 erhältlich bei Unteroffizier Donnerhorn
INSERT INTO npc_vendor (entry, item, ExtendedCost) VALUES
(24667, 42128, 2403),
(24667, 42130, 2403),
(24667, 42132, 2403),
(24667, 42131, 2403),
(24667, 42129, 2403);

