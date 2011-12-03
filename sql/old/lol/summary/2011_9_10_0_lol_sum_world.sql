UPDATE `creature_template` SET `flags_extra`=`flags_extra`|0x10000000 WHERE `entry` IN (33550,34127,33438,33429);

UPDATE `creature_template` SET `InhabitType`=7,`flags_extra`=`flags_extra`|0x10000000 WHERE `entry`=33687;
UPDATE `creature` SET `spawntimesecs`=180 WHERE `id`=33687;

DELETE FROM `spell_script_names` WHERE `spell_id`=63006;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(63006, 'spell_aggregation_pheromones_targeting');

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10304,10313) AND `type` IN (11,18);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10304,11,0,0, 'achievement_who_needs_bloodlust'),
(10313,11,0,0, 'achievement_who_needs_bloodlust');

