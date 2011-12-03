DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (45644,45819);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,45644,18,1,0),
(13,45819,18,1,0);

DELETE FROM `spell_script_names` WHERE `spell_id`=45819;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(45819, 'spell_gen_throw_torch');

DELETE FROM `spell_scripts` WHERE `id`=45644;
INSERT INTO `spell_scripts` (`id`, `effIndex`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES
('45644','0','0','15','45280','2','0','0','0','0','0');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (45792,45806,45816);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(45792,46120,0, 'Torch Toss (Shadow), Slow'),
(45806,46118,0, 'Torch Toss (Shadow), Medium'),
(45816,46117,0, 'Torch Toss (Shadow), Fast');

UPDATE `quest_template` SET `NextQuestId`=9365 WHERE `entry` IN (9324,9325,9326,11935);
UPDATE `quest_template` SET `NextQuestId`=9339 WHERE `entry` IN (9330,9331,9332,11933);
