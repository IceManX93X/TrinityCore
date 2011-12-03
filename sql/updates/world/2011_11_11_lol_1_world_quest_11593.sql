-- Item only usable on creature 25343
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceEntry`=34692;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUE
(18, 0, 34692, 0, 24, 1, 25343, 0, 0, '', NULL);

DELETE FROM `spell_scripts` WHERE `id`=45474;
INSERT INTO `spell_scripts` (`id`, `effIndex`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUE
(45474, 1, 0, 8, 25343, 0, 0, 0, 0, 0, 0);

UPDATE `quest_template` SET `ReqCreatureOrGOId1`=25343 WHERE `entry`=11593;
