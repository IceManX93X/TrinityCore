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
