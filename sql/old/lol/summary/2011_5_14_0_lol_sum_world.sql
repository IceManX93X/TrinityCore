DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=62343;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,62343,18,1,33121);

DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=33121);
DELETE FROM `creature` WHERE `id`=33121;

DELETE FROM `spell_linked_spell` WHERE `spell_effect`=-65667;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(62373,-65667,2, 'Iron Construct - immune to Heat when Molten'),
(62382,-65667,2, 'Iron Construct - immune to Heat when Brittle'),
(67114,-65667,2, 'Iron Construct - immune to Heat when Brittle');

UPDATE `spell_bonus_data` SET `direct_bonus`=0, `dot_bonus`=0, `ap_bonus`=0.063, `ap_dot_bonus`=0 WHERE `entry`=779;

-- Fix NPC 'Kaye Toogie' add vendor flag & add sales 
UPDATE `creature_template` SET `npcflag`=`npcflag` | 128 WHERE `entry`=35826;
INSERT INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`ExtendedCost`) VALUES
(35826,0,16054,1,1800,0),
(35826,0,13311,1,1800,0),
(35826,0,10609,1,1800,0);
DELETE FROM `spell_bonus_data` WHERE `entry`=52212;
INSERT INTO `spell_bonus_data` (`entry`,`direct_bonus`,`dot_bonus`,`ap_bonus`,`ap_dot_bonus`,`comments`) VALUES 
(52212,0,-1,0.0475,-1,'Death Knight - Death and Decay');
DELETE FROM `spell_script_names` WHERE `spell_id` IN (62359,64979);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(64979, 'spell_anti_air_rocket'),
(62359, 'spell_anti_air_rocket');

UPDATE `creature_template` SET `ScriptName`='' WHERE `entry`=33218;
UPDATE `creature_template` SET `ScriptName`='npc_liquid_pyrite' WHERE `entry`=33189;

UPDATE `creature` SET `id`=33214 WHERE `id`=33218;
UPDATE `creature` SET `spawndist`=50, `MovementType`=1 WHERE `id`=33214;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=62363;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13, 62363, 18, 1, 33214);

UPDATE `creature_template` SET `Armor_mod`=3 WHERE `entry`=16803;

-- trigger Electrical Charge on Meltdown
DELETE FROM `spell_script_names` WHERE `spell_id`=61889;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(61889, 'spell_meltdown');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (64224,64225);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,64224,18,1,32934),
(13,64225,18,1,32934);

-- Fix Loot of 'Captain Shely' NPC#27232 - should drop: Captain Shely's Rutters (37305) instead of: Apothecary's Burning Water (37304)
UPDATE `creature_loot_template` SET `item`=37305 WHERE `entry`=27232 AND `item`=37304;
