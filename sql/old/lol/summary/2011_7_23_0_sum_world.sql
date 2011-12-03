DELETE FROM `spell_proc_event` WHERE `entry` = 58642;
INSERT INTO `spell_proc_event` VALUES
(58642, 0x00, 15, 0x00000000, 0x08000000, 0x00000000, 0x00000010, 0x00000000, 0, 0, 0);

UPDATE `spell_proc_event` SET `procEx` = 0 WHERE `entry` IN (53671,53673,54151,54154,54155);

UPDATE `creature_template` SET `flags_extra`=`flags_extra`|0x80 WHERE `entry` IN (17965,34784,34825,35278,35279,35280);

DELETE FROM `spell_bonus_data` WHERE `entry` = 12162;
INSERT INTO `spell_bonus_data` VALUES
(12162, 0, 0, 0, 0, 'Warrior - Deep Wounds');

