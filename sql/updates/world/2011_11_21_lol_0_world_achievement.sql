UPDATE `creature_template` SET `ScriptName`='npc_wild_turkey' WHERE `entry`=32820;

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_gen_turkey_tracker';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(62014, 'spell_gen_turkey_tracker');
