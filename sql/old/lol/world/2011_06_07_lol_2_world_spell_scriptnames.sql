DELETE FROM `spell_script_names` WHERE `spell_id` IN (63025,64233,63024,64234,63018,65121);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(63024, 'spell_xt002_bomb_select_target'),
(64234, 'spell_xt002_bomb_select_target'),
(63018, 'spell_xt002_bomb_select_target'),
(65121, 'spell_xt002_bomb_select_target');

-- Junk Bot
UPDATE `creature_template` SET `difficulty_entry_1`=34114 WHERE `entry`=33855;
UPDATE `creature_template` SET `faction_A`=16, `faction_H`=16, `dmg_multiplier`=15 WHERE `entry`=34114;
