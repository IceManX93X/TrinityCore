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