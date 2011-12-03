DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `ConditionValue2`=0 AND `SourceEntry` IN (63317,64021);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`Comment`) VALUES
(13,63317,18,1,0,'Flame Breath - Players'),
(13,64021,18,1,0,'Flame Breath - Players');
