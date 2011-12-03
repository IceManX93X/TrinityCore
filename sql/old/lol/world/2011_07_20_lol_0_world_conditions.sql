DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (28374,54426);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,28374,18,1,0),
(13,28374,18,1,16360),
(13,54426,18,1,0),
(13,54426,18,1,16360);
