DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_dreamwalker_summon_suppresser_effect';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(70936, 'spell_dreamwalker_summon_suppresser_effect');

UPDATE `creature_template` SET `scriptname`='mob_bullet_controller' WHERE `entry` = 34743;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `ConditionTypeOrReference` = 18 AND `SourceEntry` IN (66152,66153);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 0, 66152, 0, 18, 1, 34720, 1, 0, '', 'Light Bullets Stalker - Light Orb Spawn'),
(13, 0, 66153, 0, 18, 1, 34704, 1, 0, '', 'Dark Bullets Stalker - Dark Orb Spawn');

-- DELETE FROM `spell_script_names` WHERE `spell_id` IN (53475,53487,54015);
-- INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
-- (53475, 'spell_gen_oracle_wolvar_reputation'), -- Set Oracle Faction Friendly
-- (53487, 'spell_gen_oracle_wolvar_reputation'), -- Set Wolvar Faction Honored
-- (54015, 'spell_gen_oracle_wolvar_reputation'); -- Set Oracle Faction Honored
DELETE FROM command WHERE name = 'dev';
INSERT INTO command VALUES
('dev', 3, 'Syntax: .dev [on/off]\r\n\r\nEnable or Disable in game Dev tag or show current state if on/off not provided.');

DELETE FROM trinity_string WHERE entry IN (1137, 1138);
INSERT INTO trinity_string (`entry`,`content_default`) VALUES
(1137, 'Dev mode is ON'),
(1138, 'Dev mode is OFF');

-- DELETE FROM `spell_script_names` WHERE `spell_id`=63342;
-- INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
-- (63342,'spell_kologarn_summon_focused_eyebeam');

