DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=42436;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,42436,18,1,24108),
(13,42436,18,1,23709);

UPDATE `quest_template` SET `ReqSpellCast1`=42436 WHERE `entry` IN (12022,12191);

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=42436;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(42436,42435,1, 'Brewfest - Stun');
