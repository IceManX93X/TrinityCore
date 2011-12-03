-- trigger Electrical Charge on Meltdown
DELETE FROM `spell_script_names` WHERE `spell_id`=61889;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(61889, 'spell_meltdown');
