-- Deadly Poison
DELETE FROM `spell_bonus_data` WHERE `entry` IN (2819,11353,11354,25349,26968,27187,57969,57970);
UPDATE `spell_bonus_data` SET `comments`='Rogue - Deadly Poison ($AP*0.12 / number of ticks)' WHERE `entry`=2818;

-- Instant Poison
DELETE FROM `spell_bonus_data` WHERE `entry` IN (8685,8689,11335,11336,11337,26890,57964,57965);
UPDATE `spell_bonus_data` SET `direct_bonus`=0, `dot_bonus`=0, `ap_dot_bonus`=0, `comments`='Rogue - Instant Poison' WHERE `entry`=8680;

-- Wound Poison
DELETE FROM `spell_bonus_data` WHERE `entry` IN (13222,13223,13224,27189,57974,57975);
UPDATE `spell_bonus_data` SET `direct_bonus`=0, `dot_bonus`=0, `ap_dot_bonus`=0, `comments`='Rogue - Wound Poison' WHERE `entry`=13218;

-- Gouge
UPDATE `spell_bonus_data` SET `direct_bonus`=0, `dot_bonus`=0, `ap_dot_bonus`=0 WHERE `entry`=1776;

-- Garrote
UPDATE `spell_bonus_data` SET `direct_bonus`=0, `dot_bonus`=0, `ap_bonus`=0 WHERE `entry`=703;
