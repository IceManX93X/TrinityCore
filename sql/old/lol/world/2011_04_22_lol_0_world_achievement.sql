DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=9118;
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(9118,5,61716,0,''),
(9118,6,543,0,''),
(9118,16,181,0,'');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=61716;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(61716,61719,2, 'Rabbit Costume - trigger Easter Lay Noblegarden Egg Aura');
