DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=64996;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,64996,18,1,34246);

UPDATE `creature_template` SET `minlevel`=83, `maxlevel`=83 WHERE `entry` IN (33104,33070);

DELETE FROM `spell_script_names` WHERE `spell_id`=64445;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(64445, 'spell_remove_player_from_phase');
