-- ------------------
-- Flame Leviathane |
-- ------------------
-- Runeforged Sentry
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=7.5,`AIName`='SmartAI' WHERE `entry`=34234;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=13 WHERE `entry`=34235;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34234;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34234;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34234,0,0,0,0,0,100,0,2000,2000,10000,10000,11,64852,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Runeforged Sentry - Cast Flaming Rune'),
(34234,0,1,0,0,0,100,0,3000,5000,5000,7000,11,64870,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Runeforged Sentry - Cast Lava Burst'),
(34234,0,2,0,0,0,100,0,2500,3000,12000,15000,11,64847,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Runeforged Sentry - Cast Runed Flame Jets');
-- Steelforged Defender
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=7.5,`AIName`='SmartAI' WHERE `entry`=33236;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=13 WHERE `entry`=34113;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33236;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33236;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33236,0,0,0,0,0,100,0,4000,6000,15000,20000,11,62845,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Steelforged Defender - Cast Hamstring'),
(33236,0,1,0,0,0,100,0,0,4000,6000,8000,11,57780,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Steelforged Defender - Cast Lightning Bolt'),
(33236,0,2,0,0,0,100,0,5000,6000,4000,6000,11,50370,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Steelforged Defender - Cast Sunder Armor');
-- Mechagnome Battletank
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mindmg`=417,`maxdmg`=582,`attackpower`=968,`minrangedmg`=341,`maxrangedmg`=506,`baseattacktime`=2000,`dmg_multiplier`=7.5,`AIName`='SmartAI' WHERE `entry`=34164;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mindmg`=417,`maxdmg`=582,`attackpower`=968,`minrangedmg`=341,`maxrangedmg`=506,`baseattacktime`=2000,`dmg_multiplier`=13 WHERE `entry`=34165;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34164;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34164;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34164,0,0,0,0,0,100,0,3000,4000,6000,8000,11,64693,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Mechagnome Battletank - Cast Flame Cannon'),
(34164,0,1,0,0,0,100,0,10000,10000,15000,20000,11,64953,0,0,0,0,0,6,0,0,0,0,0,0,0, 'Mechagnome Battletank - Cast Jump Attack');
-- Ironwork Cannon - NEED HELP!
/*UPDATE `creature_template` SET `dynamicflags`=`dynamicflags`|8,`unit_flags`=`unit_flags`|4,`mindmg`=417,`maxdmg`=582,`attackpower`=968,`minrangedmg`=341,`maxrangedmg`=506,`baseattacktime`=2000,`AIName`='SmartAI' WHERE `entry`=34164;
UPDATE `creature_model_info` SET `bounding_radius`=2.06,`combat_reach`=3 WHERE `modelid` IN (26161,27101,25723,28471);
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34164;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34164;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34164,0,0,0,0,0,100,0,3000,4000,6000,8000,11,64693,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Ironwork Cannon - Cast Flame Cannon');*/
-- -------
-- Ignis |
-- -------
-- Molten Colossus
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`attackpower`=982,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=34069;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`attackpower`=982,`dmg_multiplier`=18 WHERE `entry`=34185;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34069;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34069;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34069,0,0,0,0,0,100,0,6000,10000,10000,12000,11,64697,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Molten Colossus - Cast Earthquake'),
(34069,0,1,0,0,0,100,0,2000,4000,5000,6000,11,64698,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Molten Colossus - Cast Pyroblast');
-- Magma Rager
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`mechanic_immune_mask`=33557296,`AIName`='SmartAI' WHERE `entry`=34086;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18,`mechanic_immune_mask`=33557296 WHERE `entry`=34201;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34086;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34086;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34086,0,0,0,0,0,100,0,2000,4000,6000,8000,11,64773,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Magma Rager - Cast Fire Blast'),
(34086,0,1,0,0,0,100,0,6000,16000,15000,25000,11,64746,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Magma Rager - Cast Superheated Winds');
-- Superheated Winds
UPDATE `creature_template` SET `unit_flags`=33718790,`modelid1`=11686,`modelid2`=0,`AIName`='SmartAI' WHERE `entry`=34194;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34194;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34194;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34194,0,0,0,1,0,100,0,0,0,1000,1000,11,64724,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Superheated Winds - OOC - Cast Superheated Winds');
-- Forge Construct
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=34085;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18 WHERE `entry`=34186;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34085;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34085;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34085,0,0,0,0,0,100,0,8000,12000,10000,15000,11,64719,0,0,0,0,0,6,0,0,0,0,0,0,0, 'Forge Construct - Cast Charge'),
(34085,0,1,0,0,0,100,2,2000,6000,6000,9000,11,64720,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Forge Construct - Cast Flame Emission 10'),
(34085,0,2,0,0,0,100,4,2000,6000,6000,9000,11,64721,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Forge Construct - Cast Flame Emission 25');
-- --------
-- XT-002 |
-- --------
-- XB-488 Disposalbot
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=34273;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18 WHERE `entry`=34274;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34273;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34273;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34273,0,0,0,2,0,100,0,30,40,0,0,11,65084,1,0,0,0,0,1,0,0,0,0,0,0,0, 'XB-488 Disposalbot - Cast Self Destruct'),
(34273,0,1,0,0,0,100,2,2000,6000,6000,10000,11,65080,0,0,0,0,0,2,0,0,0,0,0,0,0, 'XB-488 Disposalbot - Cast Cut Scrap Metal 10'),
(34273,0,2,0,0,0,100,4,2000,6000,6000,10000,11,65104,0,0,0,0,0,2,0,0,0,0,0,0,0, 'XB-488 Disposalbot - Cast Cut Scrap Metal 25');
-- Parts Recovery Technician
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`mechanic_immune_mask`=33554432,`AIName`='SmartAI' WHERE `entry`=34267;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18,`mechanic_immune_mask`=33554432 WHERE `entry`=34268;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34267;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34267;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34267,0,0,0,0,0,100,0,6000,8000,10000,12000,11,65071,0,0,0,0,0,6,0,0,0,0,0,0,0, 'Parts Recovery Technician - Cast Mechano Kick'),
(34267,0,1,0,0,0,100,0,8000,12000,15000,20000,11,65070,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Parts Recovery Technician - Cast Defense Matrix');
-- XD-175 Compactobot
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=34271;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18 WHERE `entry`=34272;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34271;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34271;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34271,0,0,0,0,0,100,2,8000,12000,15000,20000,11,65073,0,0,0,0,0,6,0,0,0,0,0,0,0, 'XD-175 Compactobot - Cast Trash Compactor 10'),
(34271,0,1,0,0,0,100,4,8000,12000,15000,20000,11,65106,0,0,0,0,0,6,0,0,0,0,0,0,0, 'XD-175 Compactobot - Cast Trash Compactor 25');
-- XR-949 Salvagebot
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=34269;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18 WHERE `entry`=34270;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34269;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34269;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34269,0,0,0,0,0,100,0,4000,6000,6000,8000,11,65099,0,0,0,0,0,5,0,0,0,0,0,0,0,'XR-949 Salvagebot - Cast Deploy Salvage Saws'),
(34269,0,1,0,6,0,100,0,0,0,0,0,41,0,0,0,0,0,0,9,34288,0,100,0,0,0,0,'XR-949 Salvagebot - on Death - Despawn Salvagebot Sawblade');
-- Salvagebot Sawblade
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`unit_flags`=33554560,`AIName`='SmartAI' WHERE `entry`=34288;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18,`unit_flags`=33554560 WHERE `entry`=34291;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34288;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34288;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34288,0,0,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,5,0,0,0,0,0,0,0,'Salvagebot Sawblade - on Summon - attack random Hostile'),
(34288,0,1,0,60,0,100,0,5000,5000,5000,5000,49,0,0,0,0,0,0,5,0,0,0,0,0,0,0,'Salvagebot Sawblade - every 5sec - attack random Hostile');
-- -------------------
-- Antechamber (CoI) |
-- -------------------
-- Lightning Charged Iron Dwarf
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=34199;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18 WHERE `entry`=34237;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34199;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34199;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34199,0,0,0,0,0,100,2,0,0,6000,8000,11,64889,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lightning Charged Iron Dwarf - Cast Lightning Charged 10'),
(34199,0,1,0,0,0,100,4,0,0,6000,8000,11,64975,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lightning Charged Iron Dwarf - Cast Lightning Charged 25');
-- Hardened Iron Golem
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`mechanic_immune_mask`=33554496,`AIName`='SmartAI' WHERE `entry`=34190;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18,`mechanic_immune_mask`=33554496 WHERE `entry`=34229;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34190;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34190;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34190,0,0,0,0,0,100,0,4000,8000,10000,15000,11,64877,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Hardened Iron Golem - Cast Harden Fists'),
(34190,0,1,0,0,0,100,2,5000,7000,15000,20000,11,64874,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Hardened Iron Golem - Cast Rune Punch 10'),
(34190,0,2,0,0,0,100,4,5000,7000,15000,20000,11,64967,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Hardened Iron Golem - Cast Rune Punch 25');
-- Iron Mender
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`mechanic_immune_mask`=33554496,`AIName`='SmartAI' WHERE `entry`=34198;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18,`mechanic_immune_mask`=33554496,`AIName`='SmartAI' WHERE `entry`=34236;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34198;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34198;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34198,0,0,0,0,0,100,2,2000,4000,4000,6000,11,64918,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Iron Mender - Cast Electro Shock 10'),
(34198,0,1,0,0,0,100,4,2000,4000,4000,6000,11,64971,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Iron Mender - Cast Electro Shock 25'),
(34198,0,2,0,0,0,100,2,3000,6000,10000,15000,11,64903,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Iron Mender - Cast Fuse Lightning 10'),
(34198,0,3,0,0,0,100,4,3000,6000,10000,15000,11,64970,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Iron Mender - Cast Fuse Lightning 25'),
(34198,0,4,0,0,0,100,2,10000,15000,20000,25000,11,64897,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Iron Mender - Cast Fuse Metal 10'),
(34198,0,5,0,0,0,100,4,10000,15000,20000,25000,11,64968,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Iron Mender - Cast Fuse Metal 25');
-- Rune Etched Sentry
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mechanic_immune_mask`=33554496,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=34196;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mechanic_immune_mask`=33554496,`dmg_multiplier`=18 WHERE `entry`=34245;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34196;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34196;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34196,0,0,0,0,0,100,0,2000,2000,10000,10000,11,64852,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Rune Etched Sentry - Cast Flaming Rune'),
(34196,0,1,0,0,0,100,2,3000,5000,5000,7000,11,64870,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Rune Etched Sentry - Cast Lava Burst 10'),
(34196,0,2,0,0,0,100,4,3000,5000,5000,7000,11,64991,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Rune Etched Sentry - Cast Lava Burst 25'),
(34196,0,3,0,0,0,100,2,2500,3000,12000,15000,11,64847,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Rune Etched Sentry - Cast Runed Flame Jets 10'),
(34196,0,4,0,0,0,100,4,2500,3000,12000,15000,11,64988,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Rune Etched Sentry - Cast Runed Flame Jets 25');
-- Chamber Overseer
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18,`mechanic_immune_mask`=33554496,`AIName`='SmartAI' WHERE `entry`=34197;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=32,`mechanic_immune_mask`=33554496 WHERE `entry`=34226;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34197;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34197;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34197,0,0,0,0,0,100,0,7000,9000,8000,10000,11,64783,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Chamber Overseer - Cast Displacement Device'),
(34197,0,1,0,0,0,100,2,4000,8000,6000,9000,11,64820,0,0,0,0,0,6,0,0,0,0,0,0,0, 'Chamber Overseer - Cast Devastating Leap 10'),
(34197,0,2,0,0,0,100,4,4000,8000,6000,9000,11,64943,0,0,0,0,0,6,0,0,0,0,0,0,0, 'Chamber Overseer - Cast Devastating Leap 25'),
(34197,0,3,0,0,0,100,2,8000,10000,8000,12000,11,64825,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Chamber Overseer - Cast Staggering Roar 10'),
(34197,0,4,0,0,0,100,4,8000,10000,8000,12000,11,64944,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Chamber Overseer - Cast Staggering Roar 25');
-- Displacement Device
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`unit_flags`=33554560,`speed_walk`=0.4,`speed_run`=0.6,`dmg_multiplier`=1,`unit_flags`=514,`InhabitType`=1,`MovementType`=0,`AIName`='SmartAI' WHERE `entry`=34203;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`unit_flags`=33554560,`speed_walk`=0.4,`speed_run`=0.6,`dmg_multiplier`=1,`unit_flags`=514,`InhabitType`=1,`MovementType`=0 WHERE `entry`=34227; 
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34203;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34203;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34203,0,0,0,54,0,100,0,0,0,0,0,29,0,360,0,0,0,0,5,0,0,0,0,0,0,0,'Displacement Device - on Summon - Follow random Hostile'),
(34203,0,1,0,1,0,100,2,0,0,0,0,11,64793,0,0,0,0,0,1,0,0,0,0,0,0,0,'Displacement Device - OOC - Cast Displacement 10'),
(34203,0,2,0,1,0,100,4,0,0,0,0,11,64941,0,0,0,0,0,1,0,0,0,0,0,0,0,'Displacement Device - OOC - Cast Displacement 25'); 
-- ---------------------
-- Circle of Guardians |
-- ---------------------
-- Storm Tempered Keeper in Progress
-- -------
-- Hodir |
-- -------
-- Champion of Hodir
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=34133;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18 WHERE `entry`=34139;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34133;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34133;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34133,0,0,0,0,0,100,2,3000,6000,8000,10000,11,64639,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Champion of Hodir - Cast Stomp 10'),
(34133,0,1,0,0,0,100,4,3000,6000,8000,10000,11,64652,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Champion of Hodir - Cast Stomp 25');
-- Winter Jormungar
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=34137;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18 WHERE `entry`=34140;
UPDATE `creature_template_addon` SET `auras`='47677' WHERE `entry`=34137;
UPDATE `creature` SET `spawndist`=2 WHERE`id`=34137;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34137;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34137;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34137,0,0,0,0,0,100,0,3000,6000,6000,9000,11,64638,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Winter Jormungar - Cast Acidic Bite');
-- Winter Revenant
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mechanic_immune_mask`=33554496,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=34134;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mechanic_immune_mask`=33554496,`dmg_multiplier`=18 WHERE `entry`=34141;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34134;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34134;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34134,0,0,0,0,0,100,2,8000,10000,12000,15000,11,64642,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Winter Revenant - Cast Blizzard 10'),
(34134,0,1,0,0,0,100,4,8000,10000,12000,15000,11,64653,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Winter Revenant - Cast Blizzard 25'),
(34134,0,2,0,0,0,100,0,3000,5000,10000,12000,11,64643,0,0,0,0,0,0,0,0,0,0,0,0,0, 'Winter Revenant - Cast Whirling Strike'),
(34134,0,3,0,0,0,100,1,15000,20000,0,0,11,64644,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Winter Revenant - Cast Shield of the Winter Revenant');
-- Winter Rumbler
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`mechanic_immune_mask`=33554496,`AIName`='SmartAI' WHERE `entry`=34135;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18,`mechanic_immune_mask`=33554496,`AIName`='SmartAI' WHERE `entry`=34142;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34135;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34135;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34135,0,0,0,0,0,100,2,6000,10000,8000,12000,11,64645,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Winter Rumbler - Cast Cone of Cold 10'),
(34135,0,1,0,0,0,100,4,6000,10000,8000,12000,11,64655,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Winter Rumbler - Cast Cone of Cold 25'),
(34135,0,2,0,0,0,100,2,3000,6000,6000,10000,11,64647,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Winter Rumbler - Cast Snow Blindness 10'),
(34135,0,3,0,0,0,100,4,3000,6000,6000,10000,11,64654,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Winter Rumbler - Cast Snow Blindness 25');
-- ------
-- Freya|
-- ------
-- Guardian Lasher
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`mechanic_immune_mask`=33554496,`AIName`='SmartAI' WHERE `entry`=33430;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18,`mechanic_immune_mask`=33554496 WHERE `entry`=33732;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33430;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33430;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33430,0,0,0,4,0,100,0,0,0,0,0,11,63007,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Guardian Lasher - on Aggro - Cast Guardian Pheromones'),
(33430,0,1,0,0,0,100,2,3000,6000,8000,12000,11,63047,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Guardian Lasher - Cast Guardian''s Lash 10'),
(33430,0,2,0,0,0,100,4,3000,6000,8000,12000,11,63550,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Guardian Lasher - Cast Guardian''s Lash 25');
-- Forest Swarmer
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=33431;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18 WHERE `entry`=33731;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33431;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33431;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33431,0,0,0,0,0,100,0,3000,9000,10000,20000,11,63059,0,0,0,0,0,9,33430,0,20,0,0,0,0, 'Forest Swarmer - Cast Pollinate on Guardian Lasher');
-- Guardian of Life
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=33528;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18 WHERE `entry`=33733;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33528;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33528;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33528,0,0,0,0,0,100,2,6000,9000,15000,20000,11,63226,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Guardian of Life - Cast Poison Breath 10'),
(33528,0,1,0,0,0,100,4,6000,9000,15000,20000,11,63551,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Guardian of Life - Cast Poison Breath 25');
-- Nature's Blade
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=33527;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18 WHERE `entry`=33741;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33527;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33527;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33527,0,0,0,0,0,100,2,8000,10000,15000,25000,11,63247,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Nature''s Blade - Cast Living Tsunami 10'),
(33527,0,1,0,0,0,100,4,8000,10000,15000,25000,11,63568,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Nature''s Blade - Cast Living Tsunami 25');
-- Ironroot Lasher
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=33526;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18 WHERE `entry`=33734;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33526;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33526;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33526,0,0,0,16,0,100,2,63240,20,10000,20000,11,63240,0,0,0,0,0,9,0,0,20,0,0,0,0, 'Ironroot Lasher - on missing Buff - Cast Ironroot Thorns 10'),
(33526,0,1,0,16,0,100,4,63553,20,10000,20000,11,63553,0,0,0,0,0,9,0,0,20,0,0,0,0, 'Ironroot Lasher - on missing Buff - Cast Ironroot Thorns 25');
-- Mangrove Ent
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=33525;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18 WHERE `entry`=33735;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33525;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33525;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33525,0,0,0,0,0,100,0,6000,8000,12000,15000,11,63272,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Mangrove Ent - Cast Hurricane'),
(33525,0,1,0,0,0,100,2,12000,16000,12000,16000,11,63242,0,0,0,0,0,9,0,0,20,0,0,0,0, 'Mangrove Ent - Cast Nourish 10'),
(33525,0,2,0,0,0,100,4,12000,16000,12000,16000,11,63556,0,0,0,0,0,9,0,0,20,0,0,0,0, 'Mangrove Ent - Cast Nourish 25'),
(33525,0,3,0,0,0,100,2,15000,25000,25000,30000,11,63241,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Mangrove Ent - Cast Tranquility 10'), -- doesn't heal creatures in range only caster
(33525,0,4,0,0,0,100,4,15000,25000,25000,30000,11,63554,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Mangrove Ent - Cast Tranquility 25');
-- Misguided Nymph
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=33355;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18,`AIName`='' WHERE `entry`=33737;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33355;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33355;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33355,0,0,0,0,0,100,2,8000,12000,20000,25000,11,63082,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Misguided Nymph - Cast Bind Life 10'),
(33355,0,1,0,0,0,100,4,8000,12000,20000,25000,11,63559,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Misguided Nymph - Cast Bind Life 25'),
(33355,0,2,0,0,0,100,2,4000,6000,10000,12000,11,63111,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Misguided Nymph - Cast Frost Spear 10'),
(33355,0,3,0,0,0,100,4,4000,6000,10000,12000,11,63562,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Misguided Nymph - Cast Frost Spear 25'),
(33355,0,4,0,0,0,100,2,15000,20000,15000,20000,11,63136,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Misguided Nymph - Cast Winter''s Embrace 10'),
(33355,0,5,0,0,0,100,4,15000,20000,15000,20000,11,63564,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Misguided Nymph - Cast Winter''s Embrace 25');
-- Corrupted Servitor
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`mechanic_immune_mask`=33554496,`AIName`='SmartAI' WHERE `entry`=33354;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18,`mechanic_immune_mask`=33554496  WHERE `entry`=33729;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33354;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33354;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33354,0,0,0,0,0,100,2,2000,4000,8000,12000,11,63169,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Corrupted Servitor - Cast Petrify Joints 10'),
(33354,0,1,0,0,0,100,4,2000,4000,8000,12000,11,63549,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Corrupted Servitor - Cast Petrify Joints 25'),
(33354,0,2,0,0,0,100,0,6000,8000,12000,16000,11,63149,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Corrupted Servitor - Cast Violent Earth');
-- --------
-- Thorim |
-- --------
-- Dark Rune Ravager & Thunderer
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`= 18 WHERE `entry` IN (33754,33755);
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`= 32 WHERE `entry` IN (33757,33758);
UPDATE `creature_template` SET `dmgschool`=3 WHERE `entry`=33754; -- Nature Damage
-- some equipment updates
UPDATE `creature_template` SET `equipment_id` = 1849 WHERE `entry` = 32885;
UPDATE `creature_template` SET `equipment_id` = 1850 WHERE `entry` = 32908;
-- --------
-- Mimiron|
-- --------
-- Arachnopod Destroyer
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`mechanic_immune_mask`=33554496,`AIName`='SmartAI' WHERE `entry`=34183;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18,`mechanic_immune_mask`=33554496 WHERE `entry`=34214;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34183;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34183;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34183,0,0,0,0,0,100,0,2000,4000,6000,9000,11,64717,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Arachnopod Destroyer - Cast Flame Spray'),
(34183,0,1,0,0,0,100,0,6000,8000,8000,10000,11,64776,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Arachnopod Destroyer - Cast Machine Gun');
/*-- Clockwork Mechanic - mount in Vehicle Arachnopod Destroyer 
UPDATE `creature_template` SET `dmg_multiplier` = 20, `mingold` = 1720000, `maxgold` = 1760000 WHERE `entry` = 34184;
*/
-- Trash
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10 WHERE `entry`=34191;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18 WHERE `entry`=34217;
-- Boomer XP-500
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=34192;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`dmg_multiplier`=18 WHERE `entry`=34216;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34192;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34192;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34192,0,0,0,9,0,100,0,0,3,0,0,11,55714,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Boomer XP-500 - Explode');
-- Clockwork Sapper
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`dmg_multiplier`=10,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`mechanic_immune_mask`=33554496,`AIName`='SmartAI' WHERE `entry`=34193;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`dmg_multiplier`=18,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`mechanic_immune_mask`=33554496 WHERE `entry`=34220;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34193;
DELETE FROM `smart_scripts` WHERE `entryorguid`=34193;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34193,0,0,0,0,0,100,0,2000,6000,6000,8000,11,64740,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Clockwork Sapper - Cast Energy Sap');
-- ------
-- Vezak|
-- ------
-- Twilight Adherent
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`equipment_id`=1848,`mechanic_immune_mask`=33554513,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`unit_class`=2,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=33818;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`equipment_id`=1848,`mechanic_immune_mask`=33554513,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`unit_class`=2,`dmg_multiplier`=18 WHERE `entry`=33827;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33818;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33818;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33818,0,0,0,0,0,100,0,6000,8000,15000,20000,11,64663,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Twilight Adherent - Cast Arcane Burst'),
(33818,0,1,0,0,0,100,0,3000,5000,6000,8000,11,64662,0,0,0,0,0,17,15,0,0,0,0,0,0, 'Twilight Adherent - Cast Blink'),
(33818,0,2,0,0,0,100,0,12000,15000,15000,20000,11,63760,0,0,0,0,0,9,0,0,20,0,0,0,0, 'Twilight Adherent - Cast Greater Heal'),
(33818,0,3,0,0,0,100,0,4000,6000,10000,16000,11,13704,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Twilight Adherent - Cast Psychic Scream'),
(33818,0,4,0,0,0,100,0,8000,10000,12000,15000,11,37978,0,0,0,0,0,9,0,0,20,0,0,0,0, 'Twilight Adherent - Cast Renew');
-- Twilight Guardian
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mechanic_immune_mask`=33554513,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`equipment_id`=1852,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=33822;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mechanic_immune_mask`=33554513,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`equipment_id`=1852,`dmg_multiplier`=18 WHERE `entry`=33828;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33822;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33822;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33822,0,0,0,0,0,100,0,6000,10000,8000,10000,11,52719,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Twilight Guardian - Cast Concussion Blow'),
(33822,0,1,0,0,0,100,0,2000,3000,3000,6000,11,62317,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Twilight Guardian - Cast Devastate'),
(33822,0,2,0,0,0,100,0,8000,10000,10000,12000,11,63757,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Twilight Guardian - Cast Thunderclap');
-- Twilight Shadowblade
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mechanic_immune_mask`=33554513,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`equipment_id`=1862,`dmg_multiplier`=10,`baseattacktime`=1000,`AIName`='SmartAI' WHERE `entry`=33824;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mechanic_immune_mask`=33554513,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`equipment_id`=1862,`dmg_multiplier`=18,`baseattacktime`=1000 WHERE `entry`=33831;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33824;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33824;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33824,0,0,0,0,0,100,0,6000,8000,10000,12000,11,63753,0,0,0,0,0,0,0,0,0,0,0,0,0, 'Twilight Shadowblade - Cast Fan of Knives'),
(33824,0,1,0,0,0,100,0,6000,8000,10000,12000,11,63754,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Twilight Shadowblade - Cast Backstab');
-- Twilight Slayer
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mechanic_immune_mask`=33554513,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`equipment_id`=1847,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=33823;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mechanic_immune_mask`=33554513,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`equipment_id`=1847,`dmg_multiplier`=18 WHERE `entry`=33832;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33823;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33823;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33823,0,0,0,0,0,100,0,3000,5000,7000,9000,11,35054,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Twilight Slayer - Cast Mortal Strike'),
(33823,0,1,0,0,0,100,0,8000,12000,12000,15000,11,63784,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Twilight Slayer - Cast Bladestorm');
-- Faceless Horror
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mechanic_immune_mask`=33554513,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`dmg_multiplier`=18,`AIName`='SmartAI' WHERE `entry`=33772;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mechanic_immune_mask`=33554513,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`dmg_multiplier`=32 WHERE `entry`=33773;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33772;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33772;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33772,0,0,0,0,0,100,0,18000,22000,15000,20000,11,64429,0,0,0,0,0,17,10,0,0,0,0,0,0, 'Faceless Horror - Cast Death Grip'),
(33772,0,1,0,0,0,100,0,2000,4000,8000,10000,11,63722,2,0,0,0,0,5,0,0,0,0,0,0,0, 'Faceless Horror - Cast Shadow Crash'),
(33772,0,2,0,4,0,100,0,0,0,0,0,75,63703,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Faceless Horror - on Aggro - add Aura: Void Wave'),
(33772,0,3,0,2,0,100,0,0,75,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Twilight Guardian - on 75% HP - set Phase 1'),
(33772,0,4,5,0,1,100,1,0,0,0,0,12,33806,6,0,0,1,0,2,0,0,0,0,0,0,0, 'Twilight Guardian - on Phase 1 - Summon Void Beast'),
(33772,0,5,0,61,1,100,0,0,0,0,0,75,63710,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Twilight Guardian - on Phase 1 - add Aura: Void Barrier'),
(33772,0,6,0,2,0,100,0,0,50,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Twilight Guardian - on 50% HP - set Phase 2'),
(33772,0,7,8,0,2,100,1,0,0,0,0,12,33806,6,0,0,1,0,2,0,0,0,0,0,0,0, 'Twilight Guardian - on Phase 2 - Summon Void Beast'),
(33772,0,8,0,61,2,100,0,0,0,0,0,75,63710,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Twilight Guardian - on Phase 2 - add Aura: Void Barrier'),
(33772,0,9,0,2,0,100,0,0,25,0,0,22,4,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Twilight Guardian - on 25% HP - set Phase 3'),
(33772,0,10,11,0,4,100,1,0,0,0,0,12,33806,6,0,0,1,0,2,0,0,0,0,0,0,0, 'Twilight Guardian - on Phase 3 - Summon Void Beast'),
(33772,0,11,0,61,4,100,0,0,0,0,0,75,63710,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Twilight Guardian - on Phase 3 - add Aura: Void Barrier');
-- Void Beast
UPDATE `creature_template` SET `difficulty_entry_1`=33815,`faction_A`=16,`faction_H`=16,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`dmg_multiplier`=18,`AIName`='SmartAI' WHERE `entry`=33806;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`dmg_multiplier`=32 WHERE `entry`=33815;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33806;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33806;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33806,0,0,1,6,0,100,0,0,0,0,0,11,63723,2,0,0,0,0,0,0,0,0,0,0,0,0, 'Void Beast - on Death - Cast Shadow Nova'),
(33806,0,1,0,61,0,100,0,0,0,0,0,28,63710,0,0,0,0,0,19,33772,0,0,0,0,0,0, 'Void Beast - on Death - remove Aura: Void Barrier from closest Faceless Horror');
-- Twilight Frost Mage
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`equipment_id`=1849,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`mechanic_immune_mask`=33554513,`unit_class`=2,`dmg_multiplier`=10,`AIName`='SmartAI' WHERE `entry`=33819;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`equipment_id`=1849,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`mechanic_immune_mask`=33554513,`unit_class`=2,`dmg_multiplier`=18 WHERE `entry`=33829;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33819;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33819;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33819,0,0,0,0,0,100,0,10000,16000,20000,25000,11,64663,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Twilight Frost Mage - Cast Arcane Burst'),
(33819,0,1,0,0,0,100,0,1000,2000,6000,8000,11,63913,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Twilight Frost Mage - Cast Frostbolt'),
(33819,0,2,0,0,0,100,0,2000,4000,10000,16000,11,63758,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Twilight Frost Mage - Cast Frost Bolt Volley'),
(33819,0,3,0,0,0,100,0,8000,10000,12000,16000,11,63912,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Twilight Frost Mage - Cast Frost Nova'),
(33819,0,4,0,0,0,100,0,7000,9000,9000,11000,11,64662,0,0,0,0,0,17,15,0,0,0,0,0,0, 'Twilight Frost Mage - Cast Blink');
-- Twilight Pyromancer
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`equipment_id`=1848,`mechanic_immune_mask`=33554513,`unit_class`=2,`dmg_multiplier`=10,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`AIName`='SmartAI' WHERE `entry`=33820;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`equipment_id`=1848,`mechanic_immune_mask`=33554513,`unit_class`=2,`dmg_multiplier`=18,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112 WHERE `entry`=33830;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33820;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33820;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33820,0,0,0,0,0,100,0,10000,16000,20000,25000,11,64663,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Twilight Pyromancer - Cast Arcane Burst'),
(33820,0,1,0,0,0,100,0,1000,2000,6000,8000,11,63789,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Twilight Pyromancer - Cast Fireball'),
(33820,0,2,0,0,0,100,0,2000,4000,10000,16000,11,63775,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Twilight Pyromancer - Cast Flamestrike'),
(33820,0,3,0,0,0,100,0,7000,9000,9000,11000,11,64662,0,0,0,0,0,17,15,0,0,0,0,0,0, 'Twilight Pyromancer - Cast Blink'),
(33820,0,4,0,11,0,100,0,0,0,0,0,11,63774,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Twilight Pyromancer - Cast Summon Fire Elemental');
-- Enslaved Fire Elemental
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`difficulty_entry_1`=33839,`faction_A`=16,`faction_H`=16,`mechanic_immune_mask`=33554513,`dmg_multiplier`=10,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112,`AIName`='SmartAI' WHERE `entry`=33838;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`faction_A`=16,`faction_H`=16,`mechanic_immune_mask`=33554513,`dmg_multiplier`=18,`mindmg`=464,`maxdmg`=604,`attackpower`=708,`minrangedmg`=353,`maxrangedmg`=512,`rangedattackpower`=112 WHERE `entry`=33839;
UPDATE `creature` SET `spawntimesecs`=604800 WHERE `id`=33838;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=33838;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33838;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33838,0,0,0,54,0,100,0,0,0,0,0,29,0,360,0,0,0,0,23,0,0,0,0,0,0,0, 'Enslaved Fire Elemental - on Summon - Follow Owner or Summoner'),
(33838,0,1,0,0,0,100,0,4000,8000,12000,14000,11,38064,0,0,0,0,0,0,0,0,0,0,0,0,0, 'Enslaved Fire Elemental - Cast Blast Wave'),
(33838,0,2,0,4,0,100,0,0,0,0,0,11,63778,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Enslaved Fire Elemental - Cast Fire Shield on aggro');
-- Serverside Spells
DELETE FROM `spell_dbc` WHERE `Id` IN (29710,58934);
INSERT INTO `spell_dbc` (`Id`, `Dispel`, `Mechanic`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `AttributesEx5`, `Stances`, `StancesNot`, `Targets`, `CastingTimeIndex`, `AuraInterruptFlags`, `ProcFlags`, `ProcChance`, `ProcCharges`, `MaxLevel`, `BaseLevel`, `SpellLevel`, `DurationIndex`, `RangeIndex`, `StackAmount`, `EquippedItemClass`, `EquippedItemSubClassMask`, `EquippedItemInventoryTypeMask`, `Effect1`, `Effect2`, `Effect3`, `EffectDieSides1`, `EffectDieSides2`, `EffectDieSides3`, `EffectRealPointsPerLevel1`, `EffectRealPointsPerLevel2`, `EffectRealPointsPerLevel3`, `EffectBasePoints1`, `EffectBasePoints2`, `EffectBasePoints3`, `EffectMechanic1`, `EffectMechanic2`, `EffectMechanic3`, `EffectImplicitTargetA1`, `EffectImplicitTargetA2`, `EffectImplicitTargetA3`, `EffectImplicitTargetB1`, `EffectImplicitTargetB2`, `EffectImplicitTargetB3`, `EffectRadiusIndex1`, `EffectRadiusIndex2`, `EffectRadiusIndex3`, `EffectApplyAuraName1`, `EffectApplyAuraName2`, `EffectApplyAuraName3`, `EffectAmplitude1`, `EffectAmplitude2`, `EffectAmplitude3`, `EffectMultipleValue1`, `EffectMultipleValue2`, `EffectMultipleValue3`, `EffectMiscValue1`, `EffectMiscValue2`, `EffectMiscValue3`, `EffectMiscValueB1`, `EffectMiscValueB2`, `EffectMiscValueB3`, `EffectTriggerSpell1`, `EffectTriggerSpell2`, `EffectTriggerSpell3`, `EffectSpellClassMaskA1`, `EffectSpellClassMaskA2`, `EffectSpellClassMaskA3`, `EffectSpellClassMaskB1`, `EffectSpellClassMaskB2`, `EffectSpellClassMaskB3`, `EffectSpellClassMaskC1`, `EffectSpellClassMaskC2`, `EffectSpellClassMaskC3`, `MaxTargetLevel`, `SpellFamilyName`, `SpellFamilyFlags1`, `SpellFamilyFlags2`, `SpellFamilyFlags3`, `MaxAffectedTargets`, `DmgClass`, `PreventionType`, `DmgMultiplier1`, `DmgMultiplier2`, `DmgMultiplier3`, `AreaGroupId`, `SchoolMask`, `Comment`) VALUES
('29710','0','0','256','0','0','0','0','0','0','0','0','1','0','0','101','0','0','0','0','0','1','0','-1','0','0','140','0','0','0','0','0','0','0','0','0','0','0','0','0','0','25','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','29531','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','1','1','0','1','Ribbon Pole - Force Cast Ribbon Pole Channel'),
('58934','0','0','536870912','0','0','0','0','0','0','0','0','1','0','0','101','0','0','0','0','0','1','0','-1','0','0','3','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','28','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','Burning Hot Pole Dance credit marker');

-- Link Dancer Check Aura and Visual to Ribbon Pole Channel
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (29531,45390);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(29531,45390,0, 'Ribbon Pole - Dancer Check Aura'),
(45390,45406,2, 'Ribbon Pole - Periodic Visual');

-- Spell Script
DELETE FROM `spell_script_names` WHERE `spell_id`=45390;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(45390, 'spell_gen_ribbon_pole_dancer_check');

-- Ulduar Proc Trinket's
DELETE FROM `spell_proc_event` WHERE `entry` IN (65007,65002,64738,64742,64714,65005,64792,65013,65025,64786,65020,64764);
INSERT INTO `spell_proc_event` (`entry`,`SchoolMask`,`SpellFamilyName`,`SpellFamilyMask0`,`SpellFamilyMask1`,`SpellFamilyMask2`,`procFlags`,`procEx`,`ppmRate`,`CustomChance`,`Cooldown`) VALUES
(65007,0,0,0,0,0,0x00055000,0,0,100,0),         -- Eye of the Broodmother
(65002,0,0,0,0,0,0x00055400,0,0,0,45),          -- Sif's Remembrance
(64738,0,0,0,0,0,0x00055400,0,0,0,45),          -- Show of Faith
(64742,0,0,0,0,0,0x00055400,0,0,0,45),          -- Pandora's Plea
(64714,0,0,0,0,0,0x00010000,0x0040000,0,0,45),  -- Flare of the Heavens
(65005,0,0,0,0,0,0x00010000,0x0040000,0,0,45),  -- Elemental Focus Stone
(64792,0,0,0,0,0,0x00000154,0x0000002,0,0,45),  -- Blood of the old God
(65013,0,0,0,0,0,0x00000154,0x0000002,0,0,45),  -- Pyrite Infuser
(65025,0,0,0,0,0,0x00000154,0,0,0,45),          -- Dark Matter
(64786,0,0,0,0,0,0x00000154,0,0,0,45),          -- Comet's Trail
(65020,0,0,0,0,0,0x00000154,0,0,0,45),          -- Mjolnir Runestone 
(64764,0,0,0,0,0,0x00100000,0,0,0,45);          -- The General's Heart   
UPDATE `quest_template` SET `Method`=0 WHERE `entry`=100000;

DELETE FROM `gameobject_loot_template` WHERE `entry`=27079 AND `item`=1;
UPDATE `gameobject_loot_template` SET `lootmode`=1 WHERE `entry`=26962 AND `lootmode`=2;

-- leviathan workaround
DELETE FROM `gameobject_template` WHERE `entry` IN (500005,500006);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `AIName`, `ScriptName`, `WDBVerified`) VALUES
('500005','3','8686','Cache of Safe Loot','','','','0','0','5','0','0','0','0','0','0','1634','40001','0','1','0','0','0','0','0','0','1','1','1','1','0','1','0','0','0','0','0','0','0','0','','','1'),
('500006','3','8686','Cache of Safe Loot','','','','0','0','5','0','0','0','0','0','0','1634','40002','0','1','0','0','0','0','0','0','1','1','1','1','0','1','0','0','0','0','0','0','0','0','','','1');

DELETE FROM `gameobject_loot_template` WHERE `entry` IN (40001,40002);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
-- 10
('40001','1','100','1','0','-34116','2'),
('40001','2','100','2','0','-34116','1'),
('40001','3','100','4','0','-34117','1'),
('40001','4','100','8','0','-34118','1'),
('40001','5','100','16','0','-34116','1'),
('40001','40753','100','1','0','1','1'),
('40001','45912','0.1','1','0','1','1'),
-- 25
('40002','1','100','1','0','-34157','3'),
('40002','2','100','2','0','-34157','1'),
('40002','3','100','4','0','-34158','1'),
('40002','4','100','8','0','-34159','1'),
('40002','5','10','1','0','-34154','1'),
('40002','45038','8','1','0','1','1'),
('40002','45087','75','1','0','1','1'),
('40002','45132','0','16','1','1','1'),
('40002','45133','0','16','1','1','1'),
('40002','45134','0','16','1','1','1'),
('40002','45135','0','16','1','1','1'),
('40002','45136','0','16','1','1','1'),
('40002','45624','100','1','0','1','1'),
('40002','45912','0.1','1','0','1','1');

-- Fix Haal'eshi Talonguard
UPDATE `creature_template` SET `faction_A`=16, `faction_H`=16 WHERE `entry`=16967;

-- Brain of Yogg-Saron
UPDATE `creature_template` SET `difficulty_entry_1`=33954 WHERE `entry`=33890;

-- Guardian of Yogg-Saron
UPDATE `creature_template` SET `difficulty_entry_1`=33968 WHERE `entry`=33136;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=33136;
UPDATE `creature_template` SET `minlevel`=82, `maxlevel`=82, `faction_A`=16, `faction_H`=16, `speed_walk`=1.6, `speed_run`=1.71429, `unit_flags`=32768, `AIName`='' WHERE `entry`=33968;
UPDATE `creature_template` SET `dmg_multiplier`=35 WHERE `entry`=33136;
UPDATE `creature_template` SET `dmg_multiplier`=70 WHERE `entry`=33968;

-- Immortal Guardian
UPDATE `creature_template` SET `difficulty_entry_1`=33989 WHERE `entry`=33988;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=33988;
UPDATE `creature_template` SET `minlevel`=82, `maxlevel`=82 WHERE `entry`=33989;
UPDATE `creature_template` SET `dmg_multiplier`=4 WHERE `entry`=33988;
UPDATE `creature_template` SET `dmg_multiplier`=6 WHERE `entry`=33989;

-- Constrictor Tentacle
UPDATE `creature_template` SET `difficulty_entry_1`=33984 WHERE `entry`=33983;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=33983;
UPDATE `creature_template` SET `minlevel`=82, `maxlevel`=82 WHERE `entry`=33984;

-- Corruptor Tentacle
UPDATE `creature_template` SET `difficulty_entry_1`=33986 WHERE `entry`=33985;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=33985;
UPDATE `creature_template` SET `minlevel`=82, `maxlevel`=82 WHERE `entry`=33986;

-- Crusher Tentacle
UPDATE `creature_template` SET `difficulty_entry_1`=33967 WHERE `entry`=33966;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=33966;
UPDATE `creature_template` SET `minlevel`=81, `maxlevel`=81 WHERE `entry`=33967;
UPDATE `creature_template` SET `dmg_multiplier`=15 WHERE `entry`=33966;
UPDATE `creature_template` SET `dmg_multiplier`=30 WHERE `entry`=33967;

-- Thorim
UPDATE `creature_template` SET `dmg_multiplier`=20 WHERE `entry`=32865;
UPDATE `creature_template` SET `dmg_multiplier`=40 WHERE `entry`=33147;

-- Ignis
UPDATE `creature_template` SET `mingold`=1190671, `maxgold`=1190671 WHERE `entry`=33118;
UPDATE `creature_template` SET `mingold`=1190671*2.5, `maxgold`=1190671*2.5 WHERE `entry`=33190;
-- Razorscale
UPDATE `creature_template` SET `mingold`=325206, `maxgold`=325206 WHERE `entry`=33186;
UPDATE `creature_template` SET `mingold`=325206*2.5, `maxgold`=325206*2.5 WHERE `entry`=33724;
-- XT-002
UPDATE `creature_template` SET `mingold`=713762, `maxgold`=713762 WHERE `entry`=33293;
UPDATE `creature_template` SET `mingold`=713762*2.5, `maxgold`=713762*2.5 WHERE `entry`=33885;
-- Steelbreaker
UPDATE `creature_template` SET `mingold`=1717186, `maxgold`=1717186 WHERE `entry`=32867;
UPDATE `creature_template` SET `mingold`=1717186*2.5, `maxgold`=1717186*2.5 WHERE `entry`=33693;
-- Molgeim
UPDATE `creature_template` SET `mingold`=1763054, `maxgold`=1763054 WHERE `entry`=32927;
UPDATE `creature_template` SET `mingold`=1763054*2.5, `maxgold`=1763054*2.5 WHERE `entry`=33692;
-- Brundir
UPDATE `creature_template` SET `mingold`=1791922, `maxgold`=1791922 WHERE `entry`=32857;
UPDATE `creature_template` SET `mingold`=1791922*2.5, `maxgold`=1791922*2.5 WHERE `entry`=33694;
-- Auriaya
UPDATE `creature_template` SET `mingold`=1366181, `maxgold`=1366181 WHERE `entry`=33515;
UPDATE `creature_template` SET `mingold`=1366181*2.5, `maxgold`=1366181*2.5 WHERE `entry`=34175;
-- Vezax
UPDATE `creature_template` SET `mingold`=1810711, `maxgold`=1810711 WHERE `entry`=33271;
UPDATE `creature_template` SET `mingold`=1810711*2.5, `maxgold`=1810711*2.5 WHERE `entry`=33449;
-- Yogg-Saron
UPDATE `creature_template` SET `mingold`=2128378, `maxgold`=2128378 WHERE `entry`=33288;
UPDATE `creature_template` SET `mingold`=2128378*2.5, `maxgold`=2128378*2.5 WHERE `entry`=33955;

-- Thorim Spawn
UPDATE `creature` SET `position_z`=440.331 WHERE `id`=32865;

-- Rare Cache of Winter
DELETE FROM `gameobject` WHERE `id` IN (194200,194201);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
('400007','194200','603','1','1','1966.07','-220.64','432.687','0.465871','0','0','0.230835','0.972993','604800','0','1'),
('400008','194201','603','2','1','1966.07','-220.64','432.687','0.465871','0','0','0.230835','0.972993','604800','0','1');

-- Fix Gold Loot of Ulduar
SET @Gold_10_Trash_min  :=100000;
SET @Gold_10_Trash_max  :=@Gold_10_Trash_min*1.5;
SET @Gold_25_Trash_min  :=250000;
SET @Gold_25_Trash_max  :=@Gold_25_Trash_min*1.5;

UPDATE `creature_template` SET `mingold`=@Gold_10_Trash_min,`maxgold`=@Gold_10_Trash_max WHERE
(SELECT entry FROM `creature_template` WHERE
`entry` IN (SELECT `id` FROM `creature` WHERE `map`=603) AND    -- Ulduar Map
`faction_A` IN (14,16) AND
`faction_H` IN (14,16) AND
`rank`=1 AND
`entry` NOT IN (34234,33236,34164,34164,32872)                  -- exclude Fame Leviathane Trash
);
UPDATE `creature_template` SET `mingold`=@Gold_25_Trash_min,`maxgold`=@Gold_25_Trash_max WHERE
(SELECT difficulty_entry_1 FROM `creature_template` WHERE
`entry` IN (SELECT `id` FROM `creature` WHERE `map`=603) AND    -- Ulduar Map
`faction_A` IN (14,16) AND
`faction_H` IN (14,16) AND
`rank`=1 AND
`entry` NOT IN (34234,33236,34164,34164,32872)                  -- exclude Fame Leviathane Trash
);
UPDATE `creature_template` SET `mindmg`=100,`maxdmg`=300,`attackpower`=1000,`faction_A`=3,`faction_H`=3,`AIName`='',`ScriptName`='' WHERE `entry`=28017;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=28017;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=28017;
DELETE FROM `creature_template_addon` WHERE `entry`=28017;
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES
(28017,'50453');    -- Blood Gorged
