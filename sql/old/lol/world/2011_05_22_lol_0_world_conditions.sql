DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (62976,64098);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,64098,18,1,32865),
(13,62976,18,1,34055);

UPDATE `creature_template` SET `faction_A`=35, `faction_H`=35 WHERE `entry`=34055;
