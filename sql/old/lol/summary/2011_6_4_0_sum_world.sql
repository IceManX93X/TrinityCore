-- SAI for Spore
SET @ENTRY := 16286;
SET @SPELL := 29232;
UPDATE `creature_template` SET `ScriptName`='',`AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,6,0,100,1,0,0,0,0,11,@SPELL,3,0,0,0,0,0,0,0,0,0,0,0,0,'Spore - On Death - Cast Fungal Creep');

DELETE FROM `spell_script_names` WHERE `spell_id` = 50524;

DELETE FROM `areatrigger_scripts` WHERE `entry`=5867;
INSERT INTO `areatrigger_scripts` (`entry`,`ScriptName`) VALUES
(5867, 'at_baltharus_plateau');

UPDATE `creature_template` SET `npcflag`=0,`ScriptName`= 'npc_xerestrasza' WHERE `entry`=40429;
UPDATE `creature_template` SET `mindmg`=497,`maxdmg`=676,`attackpower`=795,`dmg_multiplier`=35,`ScriptName`= 'boss_baltharus_the_warborn' WHERE `entry`=39751;
UPDATE `creature_template` SET `exp`=2,`mindmg`=497,`maxdmg`=676,`attackpower`=795,`dmg_multiplier`=70 WHERE `entry`=39920;

DELETE FROM `creature_text` WHERE `entry` IN (39751,40429); 
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES 
(39751,0,0, 'Your power wanes, ancient one.... Soon you will join your friends.',14,0,100,0,0,17525, 'Baltharus the Warborn'),
(39751,1,0, 'Ah, the entertainment has arrived.',14,0,100,0,0,17520, 'Baltharus the Warborn'),
(39751,2,0, 'Baltharus leaves no survivors!',14,0,100,0,0,17521, 'Baltharus the Warborn'),
(39751,2,1, 'This world has enough heroes.',14,0,100,0,0,17522, 'Baltharus the Warborn'),
(39751,3,0, 'Twice the pain and half the fun.',14,0,100,0,0,17524, 'Baltharus the Warborn'),
(39751,4,1, 'I... didn''t see that coming....',14,0,100,0,0,17523, 'Baltharus the Warborn'),
(40429,0,0, 'Thank you! I could not have held out for much longer.... A terrible thing has happened here.',14,0,100,5,0,17491, 'Sanctum Guardian Xerestrasza'),
(40429,1,0, 'We believed the Sanctum was well-fortified, but we were not prepared for the nature of this assault.',12,0,100,1,0,17492, 'Sanctum Guardian Xerestrasza'),
(40429,2,0, 'The Black dragonkin materialized from thin air, and set upon us before we could react.',12,0,100,1,0,17493, 'Sanctum Guardian Xerestrasza'),
(40429,3,0, 'We did not stand a chance. As my brethren perished around me, I managed to retreat here and bar the entrance.',12,0,100,1,0,17494, 'Sanctum Guardian Xerestrasza'),
(40429,4,0, 'They slaughtered us with cold efficiency, but the true focus of their interest seemed to be the eggs kept here in the Sanctum.',12,0,100,1,0,17495, 'Sanctum Guardian Xerestrasza'),
(40429,5,0, 'The commander of the forces on the ground here is a cruel brute named Zarithrian, but I fear there are greater powers at work.',12,0,100,1,0,17496, 'Sanctum Guardian Xerestrasza'),
(40429,6,0, 'In their initial assault, I caught a glimpse of their true leader, a fearsome full-grown twilight dragon.',12,0,100,1,0,17497, 'Sanctum Guardian Xerestrasza'),
(40429,7,0, 'I know not the extent of their plans, heroes, but I know this:  They cannot be allowed to succeed!',12,0,100,5,0,17498, 'Sanctum Guardian Xerestrasza'),
(40429,8,0, 'Help! I am trapped within this tree!  I require aid!',14,0,100,5,0,17490, 'Sanctum Guardian Xerestrasza');

UPDATE `instance_template` SET `script`= 'instance_ruby_sanctum' WHERE `map`=724;
-- Smart AI for Baltarhus the Warborn Clone
SET @ENTRY   := 39899; -- NPC entry
SET @SPELL1  := 40504;  -- Cleave
SET @SPELL2  := 75125; -- Blade Tempest
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,10000,24000,24000,11,@SPELL1,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Baltarhus the Warborn Clone - Combat - Cast Cleave on victim'),
(@ENTRY,0,1,0,0,0,100,0,18000,25000,24000,26000,11,@SPELL2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Baltarhus the Warborn Clone - Cast Blade Tempest on self');

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_baltharus_enervating_brand';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(74502, 'spell_baltharus_enervating_brand');

UPDATE `creature_template` SET `npcflag`=2 WHERE `entry`=40429;

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (70923,-70923);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(70923,70924,1,'Blood-Queen: Uncontrollable Frenzy damage buff'),
(-70923,-70924,0,'Blood-Queen: Uncontrollable Frenzy remove 10man'),
(-70923,-73015,0,'Blood-Queen: Uncontrollable Frenzy remove 25man');

DELETE FROM `spell_script_names` WHERE `ScriptName`= 'spell_baltharus_enervating_brand_trigger';
INSERT INTO `spell_script_names` VALUES
(74505, 'spell_baltharus_enervating_brand_trigger');

UPDATE `creature_template` SET `ScriptName`='npc_dream_fog' WHERE `entry`=15224;
UPDATE `creature_template` SET `ScriptName`='boss_ysondre' WHERE `entry`=14887;
UPDATE `creature_template` SET `ScriptName`='npc_demented_druid' WHERE `entry`=15260;
UPDATE `creature_template` SET `ScriptName`='boss_ysondre' WHERE `entry`=14887;
UPDATE `creature_template` SET `ScriptName`='boss_lethon' WHERE `entry`=14888;
UPDATE `creature_template` SET `ScriptName`='boss_emeriss' WHERE `entry`=14889;
UPDATE `creature_template` SET `ScriptName`='boss_taerar' WHERE `entry`=14890;
UPDATE `creature_template` SET `ScriptName`='boss_shade_of_taerar' WHERE `entry`=15302;

DELETE FROM `creature_text` WHERE `entry` IN (14887, 14888, 14889, 14890);
INSERT INTO `creature_text`(`entry`,`groupid`,`text`,`type`,`comment`) VALUES
(14887,0,'The strands of LIFE have been severed! The Dreamers must be avenged!',14,'Ysondre - SAY_YSONDRE_AGGRO'),
(14887,1,'Come forth, ye Dreamers - and claim your vengeance!',14,'Ysondre - SAY_YSONDRE_SUMMON_DRUIDS'),
(14888,0,'I can sense the SHADOW on your hearts. There can be no rest for the wicked!',14,'Lethon - SAY_LETHON_AGGRO'),
(14888,1,'Your wicked souls shall feed my power!',14,'Lethon - SAY_LETHON_DRAW_SPIRIT'),
(14889,0,'Hope is a DISEASE of the soul! This land shall wither and die!',14,'Emeriss - SAY_EMERISS_AGGRO'),
(14889,1,'Taste your world\'s corruption!',14,'Emeriss - SAY_EMERISS_CAST_CORRUPTION'),
(14890,0,'Peace is but a fleeting dream! Let the NIGHTMARE reign!',14,'Taerar - SAY_TAERAR_AGGRO'),
(14890,1,'Children of Madness - I release you upon this world!',14,'Taerar - SAY_TAERAR_SUMMON_SHADE');

-- Delete old text-assignment for Ysondre
DELETE FROM `script_texts` WHERE `entry`='-1000360';
DELETE FROM `script_texts` WHERE `entry`='-1000361';
-- Delete old text-assignment for Taerar
DELETE FROM `script_texts` WHERE `entry`='-1000399';
DELETE FROM `script_texts` WHERE `entry`='-1000400';
-- Delete old text-assignment for Emeriss
DELETE FROM `script_texts` WHERE `entry`='-1000401';
DELETE FROM `script_texts` WHERE `entry`='-1000402';

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=74455;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,74455,0,18,1,39747,0,0,'', 'Spell 74455 targets only Saviana Ragefire');

-- Saviana Ragefire
UPDATE `creature_template` SET `InhabitType`=3,`mechanic_immune_mask`=`mechanic_immune_mask`|8388624,`ScriptName`= 'boss_saviana_ragefire' WHERE `entry`=39747;
DELETE FROM `creature_text` WHERE `entry`=39747; 
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES 
(39747,0,0, 'You will sssuffer for this intrusion!',14,0,100,0,0,17528, 'Saviana Ragefire'),
(39747,1,0, 'Burn in the master''s flame!',14,0,100,0,0,17532, 'Saviana Ragefire'),
(39747,2,0, '%s becomes enraged!',16,0,100,0,0,0, 'Saviana Ragefire'),
(39747,3,0, 'Halion will be pleased.',14,0,100,0,0,17530, 'Saviana Ragefire'),
(39747,3,1, 'As it should be....',14,0,100,0,0,17529, 'Saviana Ragefire');

-- Baltharus the Warborn Clone
UPDATE `creature_template` SET `AIName`= '',`ScriptName`= 'npc_baltarhus_the_warborn_clone' WHERE `entry`=39899;
DELETE FROM `smart_scripts` WHERE `entryorguid`=39899;

DELETE FROM `spell_script_names` WHERE `ScriptName`= 'spell_saviana_conflagration_init';
DELETE FROM `spell_script_names` WHERE `ScriptName`= 'spell_saviana_conflagration_throwback';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(74452, 'spell_saviana_conflagration_init'),
(74455, 'spell_saviana_conflagration_throwback');

UPDATE `spell_linked_spell` SET `spell_trigger`=62821 WHERE `spell_trigger`=65280;

UPDATE `creature_template` SET `unit_flags`=4,`flags_extra`=2 where `entry`=33342;

UPDATE `creature_template` SET `unit_flags`=`unit_flags`|0x02000000|0x00000002,`dynamicflags`=0,`faction_A`=50,`faction_H`=50 WHERE `entry`=15224;

DELETE FROM `creature_template_addon` WHERE `entry` = 15224;
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (15224, '24777');

-- Fix faction for Frostwyrm Waterfall Door (door after Sapphiron in Naxxramas)
UPDATE `gameobject_template` SET `faction`=1375 WHERE `entry`=181225;

DELETE FROM `spell_script_names` WHERE `spell_id` = 24778;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES (24778, 'spell_dream_fog_sleep');

UPDATE `spell_bonus_data` SET `direct_bonus` = 0, `ap_bonus` = 0 WHERE `entry` = 25742;

DELETE FROM `spell_script_names` WHERE `ScriptName` IN('spell_gen_av_drekthar_presence','spell_ex_463');
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(463, 'spell_ex_463'),
(45828, 'spell_gen_av_drekthar_presence'),
(45829, 'spell_gen_av_drekthar_presence'),
(45830, 'spell_gen_av_drekthar_presence'),
(45822, 'spell_gen_av_drekthar_presence'),
(45823, 'spell_gen_av_drekthar_presence'),
(45824, 'spell_gen_av_drekthar_presence'),
(45826, 'spell_gen_av_drekthar_presence');

DELETE FROM `spell_proc_event` WHERE `entry` IN (75475,75481);
INSERT INTO `spell_proc_event` (`entry`,`Cooldown`) VALUES
(75475,45),
(75481,45);

UPDATE `game_event` SET `holiday` = 424 WHERE `eventEntry` = 63; -- Kalu'ak Fishing Derby

-- Set proper flags for Flame of Imbel, Flame of Lahassa, Flame of Samha and Flame of Byltan
UPDATE `gameobject_template` SET `flags`=`flags`&~4 WHERE `entry` IN (142185,142187,142186,142188);
-- Set loot template for the gameobjects above
DELETE FROM `gameobject_loot_template` WHERE `entry` IN (6711,6709,6708,6710);
INSERT INTO `gameobject_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(6711,9258,100,1,0,1,1),
(6709,9256,100,1,0,1,1),
(6708,9255,100,1,0,1,1),
(6710,9257,100,1,0,1,1);

-- Set sniffed flag for Bristlelimb Cage
UPDATE `gameobject_template` SET `flags`=32 WHERE `entry`=181714;

DELETE FROM `achievement_criteria_data` WHERE `type` = 6 AND `criteria_id` IN
(5020,5021,5022,5023,5024,5025,5026,5027,5028,5029,5030,5031,5032,5033,5034,5035,5036,5037,5038,5039);
INSERT INTO `achievement_criteria_data` values
(5020,6,1519,0,''),
(5021,6,1537,0,''),
(5022,6,1657,0,''),
(5023,6,1658,0,''),
(5024,6,1659,0,''),
(5025,6,1661,0,''),
(5026,6,1662,0,''),
(5027,6,1660,0,''),
(5028,6,3557,0,''),
(5029,6,1617,0,''),
(5030,6,4411,0,''),
(5031,6,1637,0,''),
(5032,6,3487,0,''),
(5033,6,3704,0,''),
(5034,6,1638,0,''),
(5035,6,1639,0,''),
(5036,6,1641,0,''),
(5037,6,1640,0,''),
(5038,6,2197,0,''),
(5039,6,1497,0,'');

DELETE FROM `disables` WHERE entry IN (5020,5021,5022,5023,5024,5025,5026,5027,5028,5029,5030,5031,5032,5033,5034,5035,5036,5037,5038,5039);

UPDATE `creature_template` SET `exp`=2 WHERE `entry` IN (36853,38265,38266,38267); -- Sindragosa
UPDATE `creature_template` SET `exp`=2 WHERE `entry` IN (36980,38320,38321,38322); -- Ice Tomb

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_gen_magic_rooster';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(65917, 'spell_gen_magic_rooster');

