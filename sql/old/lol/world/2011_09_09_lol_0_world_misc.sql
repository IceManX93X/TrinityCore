DELETE FROM `spell_script_names` WHERE `spell_id`=63006;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(63006, 'spell_aggregation_pheromones_targeting');

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10304,10313) AND `type` IN (11,18);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10304,11,0,0, 'achievement_who_needs_bloodlust'),
(10313,11,0,0, 'achievement_who_needs_bloodlust');
