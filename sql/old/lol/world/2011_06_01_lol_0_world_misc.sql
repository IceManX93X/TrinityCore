DELETE FROM `spell_script_names` WHERE `spell_id`=62042;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(62042, 'spell_stormhammer_targeting');

UPDATE `gameobject_template` SET `flags`=`flags`|0x10 WHERE `entry`=194265;
