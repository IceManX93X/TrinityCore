DELETE FROM `spell_script_names` WHERE `spell_id`=62374;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(62374, 'spell_pursued');

-- make Orbital Support trigger and passive
UPDATE `creature_template` SET `flags_extra`=130 WHERE `entry`=34286;
