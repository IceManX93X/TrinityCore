-- ----------------------------------------------
-- Fix Quest 'Projection and Plans' #12060 #12061
-- ----------------------------------------------
-- Restore original Projections and Plans Kill Bunny & add SmartAI
DELETE FROM `creature_template` WHERE `entry`=27853;
INSERT INTO `creature_template` (`entry`,`difficulty_entry_1`,`difficulty_entry_2`,`difficulty_entry_3`,`KillCredit1`,`KillCredit2`,`modelid1`,`modelid2`,`modelid3`,`modelid4`,`name`,`subname`,`IconName`,`gossip_menu_id`,`minlevel`,`maxlevel`,`exp`,`faction_A`,`faction_H`,`npcflag`,`speed_walk`,`speed_run`,`scale`,`rank`,`mindmg`,`maxdmg`,`dmgschool`,`attackpower`,`dmg_multiplier`,`baseattacktime`,`rangeattacktime`,`unit_class`,`unit_flags`,`dynamicflags`,`family`,`trainer_type`,`trainer_spell`,`trainer_class`,`trainer_race`,`minrangedmg`,`maxrangedmg`,`rangedattackpower`,`type`,`type_flags`,`lootid`,`pickpocketloot`,`skinloot`,`resistance1`,`resistance2`,`resistance3`,`resistance4`,`resistance5`,`resistance6`,`spell1`,`spell2`,`spell3`,`spell4`,`spell5`,`spell6`,`spell7`,`spell8`,`PetSpellDataId`,`VehicleId`,`mingold`,`maxgold`,`AIName`,`MovementType`,`InhabitType`,`Health_mod`,`Mana_mod`,`Armor_mod`,`RacialLeader`,`questItem1`,`questItem2`,`questItem3`,`questItem4`,`questItem5`,`questItem6`,`movementId`,`RegenHealth`,`equipment_id`,`mechanic_immune_mask`,`flags_extra`,`ScriptName`,`WDBVerified`) VALUES
(27853,0,0,0,0,0,1126,17612,0,0,'Projections and Plans Kill Credit Bunny','','',0,1,1,0,35,35,0,1,1.14286,1,0,2,2,0,24,1,2000,0,1,33555200,8,0,0,0,0,0,1,1,0,10,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'SmartAI',0,7,1,1,1,0,0,0,0,0,0,0,0,1,0,0,128,'',12340);
-- UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=27853;
-- SAI
DELETE FROM `smart_scripts` WHERE `entryorguid`=27853 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(27853,0,0,0,1,0,100,0,1000,1000,1000,1000,11,49731,0,0,0,0,0,1,0,0,0,0,0,0,0,'Projections and Plans Kill Credit Bunny - OOC - Cast Projections and Plans: Kill Credit on self');
-- -----------------------------------------------------------------------------
-- TempFix Quests:
-- 'The Focus on the Beach' #12065 #12066
-- 'Atop the Woodlands' #12083 #12084
-- 'The End of the Line' #12107 #12110
-- Workaround (no Spellhits on Bunny??? and receive no Spellchannel from Bunny)
-- -----------------------------------------------------------------------------
-- define spell links
DELETE FROM `spell_linked_spell` WHERE `spell_effect` IN (47390,47472,47635);
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(47374,47390,0,'The Focus on the Beach - Quest Credit'),
(47469,47472,0,'Atop The Woodlands - Quest Credit'),
(47634,47635,0,'The End of The Line - Quest Credit');

-- 'The End of the Line' - 2nd Objective - The End of the Line Area Trigger Kill Credit Bunny
-- Restore original The End of the Line Area Trigger Kill Credit Bunny & add SmartAI
DELETE FROM `creature_template` WHERE `entry`=26889;
INSERT INTO `creature_template` (`entry`,`difficulty_entry_1`,`difficulty_entry_2`,`difficulty_entry_3`,`KillCredit1`,`KillCredit2`,`modelid1`,`modelid2`,`modelid3`,`modelid4`,`name`,`subname`,`IconName`,`gossip_menu_id`,`minlevel`,`maxlevel`,`exp`,`faction_A`,`faction_H`,`npcflag`,`speed_walk`,`speed_run`,`scale`,`rank`,`mindmg`,`maxdmg`,`dmgschool`,`attackpower`,`dmg_multiplier`,`baseattacktime`,`rangeattacktime`,`unit_class`,`unit_flags`,`dynamicflags`,`family`,`trainer_type`,`trainer_spell`,`trainer_class`,`trainer_race`,`minrangedmg`,`maxrangedmg`,`rangedattackpower`,`type`,`type_flags`,`lootid`,`pickpocketloot`,`skinloot`,`resistance1`,`resistance2`,`resistance3`,`resistance4`,`resistance5`,`resistance6`,`spell1`,`spell2`,`spell3`,`spell4`,`spell5`,`spell6`,`spell7`,`spell8`,`PetSpellDataId`,`VehicleId`,`mingold`,`maxgold`,`AIName`,`MovementType`,`InhabitType`,`Health_mod`,`Mana_mod`,`Armor_mod`,`RacialLeader`,`questItem1`,`questItem2`,`questItem3`,`questItem4`,`questItem5`,`questItem6`,`movementId`,`RegenHealth`,`equipment_id`,`mechanic_immune_mask`,`flags_extra`,`ScriptName`,`WDBVerified`) VALUES
(26889,0,0,0,0,0,1126,17612,0,0,'The End of the Line Area Trigger Kill Credit Bunny','','',0,1,1,0,35,35,0,1,1.14286,1,0,2,2,0,24,1,2000,0,1,33555200,8,0,0,0,0,0,1,1,0,10,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'SmartAI',0,7,1,1,1,0,0,0,0,0,0,0,0,1,0,0,128,'',12340);
-- UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=26889;

-- create KillCredit spell - using empty spell ID - (template of spell from DBC:Projections and Plans: Kill Credit #49731 was useful)
DELETE FROM `spell_dbc` WHERE `id`=47639;
INSERT INTO `spell_dbc` (`Id`,`Attributes`,`AttributesEx`,`AttributesEx2`,`AttributesEx3`,`AttributesEx4`,`AttributesEx5`,`EffectImplicitTargetA1`,`EffectImplicitTargetB1`,`CastingTimeIndex`,`ProcChance`,`EquippedItemClass`,`Effect1`,`EffectRadiusIndex1`,`EffectMiscValue1`,`Comment`) VALUES
(47639,0x29000100,0x420,0x4004,0x10000040,0x80,0x60008,22,7,1,101,-1,134,10,26889,'The End of the Line Area Trigger Kill Credit');

-- SAI
DELETE FROM `smart_scripts` WHERE `entryorguid`=26889 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(26889,0,0,0,1,0,100,0,1000,1000,1000,1000,11,47639,0,0,0,0,0,1,0,0,0,0,0,0,0,'The End of the Line Area Trigger Kill Credit Bunny - Cast The End of the Line Area Trigger Kill Credit on self');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (62942,62466);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13, 62942, 18, 1, 33110),
(13, 62942, 18, 1, 32874),
(13, 62942, 18, 1, 32872),
(13, 62942, 18, 1, 32875),
(13, 62466, 18, 1, 32780);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (62976,64098);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,64098,18,1,32865),
(13,62976,18,1,34055);

UPDATE `creature_template` SET `faction_A`=35, `faction_H`=35 WHERE `entry`=34055;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=49731;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,49731,18,1,0);

UPDATE `creature_template` SET `modelid1`=`modelid2`, `unit_flags`=2, `flags_extra`=0 WHERE `entry`=27853;

DELETE FROM `smart_scripts` WHERE `entryorguid`=27853;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(27853,0,0,0,10,0,100,0,1,20,1000,1000,11,49731,2,0,0,0,0,0,0,0,0,0,0,0,0,'On LOS - Give Quest Credit');

INSERT IGNORE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(302617,6491,571,1,1,0,0,2002.79,5937.71,37.158,5.9327,60,0,0,4120,0,0,0,0,0,0);

INSERT IGNORE INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES 
(6647,0,3,'I would like to train further in the ways of the Light.',5,16,0,0,0,0,0,'');
UPDATE `creature_template` SET `exp`=0 WHERE `entry` IN (33432,34071,34106);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=63414;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,63414,18,1,33651);

DELETE FROM `spell_script_names` WHERE `spell_id`=63382;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(63382, 'spell_rapid_burst');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (64570,65192,64626,65333,64619);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,64570,18,1,34121),
(13,64570,18,1,34363),
(13,65192,18,1,34121),
(13,65192,18,1,34363),
(13,64626,18,1,34121),
(13,64626,18,1,34363),
(13,65333,18,1,34121),
(13,65333,18,1,34363),
(13,64619,18,1,34121),
(13,64619,18,1,34363);

UPDATE `creature_template` SET `faction_A`=14, `faction_H`=14 WHERE `entry` IN (34149,34361);

DELETE FROM `spell_script_names` WHERE `spell_id`=62374;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(62374, 'spell_pursued');

-- make Orbital Support trigger and passive
UPDATE `creature_template` SET `flags_extra`=130 WHERE `entry`=34286;

