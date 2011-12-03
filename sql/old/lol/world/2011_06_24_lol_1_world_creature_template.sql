-- Brain of Yogg-Saron
UPDATE `creature_template` SET `difficulty_entry_1`=33954 WHERE `entry`=33890;

-- Guardian of Yogg-Saron
UPDATE `creature_template` SET `difficulty_entry_1`=33968 WHERE `entry`=33136;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=33136;
UPDATE `creature_template` SET `minlevel`=82, `maxlevel`=82, `faction_A`=16, `faction_H`=16, `speed_walk`=1.6, `speed_run`=1.71429, `unit_flags`=32768, `AIName`='' WHERE `entry`=33968;
UPDATE `creature_template` SET `dmg_multiplier`=35 WHERE `entry`=33136;
UPDATE `creature_template` SET `dmg_multiplier`=70 WHERE `entry`=33968;

-- Immortal Guardian
UPDATE `creature_template` SET `difficulty_entry_1`=33989 WHERE `entry`=33988;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=33988;
UPDATE `creature_template` SET `minlevel`=82, `maxlevel`=82 WHERE `entry`=33989;
UPDATE `creature_template` SET `dmg_multiplier`=4 WHERE `entry`=33988;
UPDATE `creature_template` SET `dmg_multiplier`=6 WHERE `entry`=33989;

-- Constrictor Tentacle
UPDATE `creature_template` SET `difficulty_entry_1`=33984 WHERE `entry`=33983;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=33983;
UPDATE `creature_template` SET `minlevel`=82, `maxlevel`=82 WHERE `entry`=33984;

-- Corruptor Tentacle
UPDATE `creature_template` SET `difficulty_entry_1`=33986 WHERE `entry`=33985;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=33985;
UPDATE `creature_template` SET `minlevel`=82, `maxlevel`=82 WHERE `entry`=33986;

-- Crusher Tentacle
UPDATE `creature_template` SET `difficulty_entry_1`=33967 WHERE `entry`=33966;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=33966;
UPDATE `creature_template` SET `minlevel`=81, `maxlevel`=81 WHERE `entry`=33967;
UPDATE `creature_template` SET `dmg_multiplier`=15 WHERE `entry`=33966;
UPDATE `creature_template` SET `dmg_multiplier`=30 WHERE `entry`=33967;

-- Thorim
UPDATE `creature_template` SET `dmg_multiplier`=20 WHERE `entry`=32865;
UPDATE `creature_template` SET `dmg_multiplier`=40 WHERE `entry`=33147;
