DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (30541,30571,30631,30657);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,30541,18,1,17454),
(13,30571,18,1,0),
(13,30631,18,1,0),
(13,30657,18,1,17257);

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=30658;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(30658,30571,0, 'Magtheridon - Trigger Quake Knockback');

DELETE FROM `creature` WHERE `guid` BETWEEN 90978 AND 90982;
DELETE FROM `creature_addon` WHERE `guid` BETWEEN 90978 AND 90982;
DELETE FROM `creature_linked_respawn` WHERE `guid` BETWEEN 90978 AND 90982;
