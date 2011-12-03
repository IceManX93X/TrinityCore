DELETE FROM `spell_script_names` WHERE `spell_id`=56153;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(56153, 'spell_elder_nadox_guardian_aura');

DELETE FROM `disables` WHERE `sourceType`=4 AND `entry`=7317;

DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=7317 AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(7317,11,0,0, 'achievement_respect_your_elders');
