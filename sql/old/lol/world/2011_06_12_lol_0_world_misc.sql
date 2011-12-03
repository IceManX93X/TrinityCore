UPDATE `creature_template` SET `mechanic_immune_mask`=650854239 WHERE `entry` IN (33113,34003, 33118,33190, 33293,33885, 32867,33693, 32927,33692, 32930,33909, 32933,33910, 32934,33911, 34014,34166, 32906,33360, 33203,33376, 33228,33385, 32915,33391, 32913,33392, 32914,33393, 33524,34152, 33288,33955, 32871,33070, 33121,33191);
UPDATE `creature_template` SET `mechanic_immune_mask`=617299803 WHERE `entry` IN (33515,34175, 33271,33449);
UPDATE `creature_template` SET `mechanic_immune_mask`=617297755, `flags_extra`=`flags_extra`|0x100000 WHERE `entry` IN (34035,34171, 32857,33694);
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|1 WHERE `entry` IN (33909,33391,33392,33393,33449,33955);

-- Flame Leviathan
UPDATE `creature_model_info` SET `bounding_radius`=0.93, `combat_reach`=10 WHERE `modelid`=28875;
-- Molgeim
UPDATE `creature_model_info` SET `bounding_radius`=0.45, `combat_reach`=4 WHERE `modelid`=28381;
-- Steelbreaker
UPDATE `creature_model_info` SET `bounding_radius`=0.45, `combat_reach`=8 WHERE `modelid`=28344;
-- Auriaya
UPDATE `creature_model_info` SET `bounding_radius`=0.775, `combat_reach`=5 WHERE `modelid`=28651;
-- Vezax
UPDATE `creature_model_info` SET `bounding_radius`=0.62, `combat_reach`=12 WHERE `modelid`=28548;
UPDATE `creature_model_info` SET `bounding_radius`=0.62, `combat_reach`=10 WHERE `modelid`=28992;

-- Sartharion
UPDATE `creature_model_info` SET `bounding_radius`=1.8, `combat_reach`=17 WHERE `modelid`=27035;
-- Cyanigosa
UPDATE `creature_model_info` SET `bounding_radius`=1.2, `combat_reach`=12 WHERE `modelid`=27508;


UPDATE `creature_template` SET `dmg_multiplier`=20 WHERE `entry`=33121;
UPDATE `creature_template` SET `dmg_multiplier`=35 WHERE `entry`=33191;

UPDATE `creature_template` SET `dmg_multiplier`=17 WHERE `entry`=33388;
UPDATE `creature_template` SET `dmg_multiplier`=30 WHERE `entry`=33850;

UPDATE `creature_template` SET `dmg_multiplier`=12 WHERE `entry`=33453;
UPDATE `creature_template` SET `dmg_multiplier`=20 WHERE `entry`=33851;

UPDATE `creature_template` SET `dmg_multiplier`=7.5 WHERE `entry`=34035;
UPDATE `creature_template` SET `dmg_multiplier`=13 WHERE `entry`=34171;

UPDATE `creature_template` SET `dmg_multiplier`=20 WHERE `entry`=32916;
UPDATE `creature_template` SET `dmg_multiplier`=35 WHERE `entry`=33400;

UPDATE `creature_template` SET `dmg_multiplier`=12 WHERE `entry`=33202;
UPDATE `creature_template` SET `dmg_multiplier`=20 WHERE `entry`=33398;

UPDATE `creature_template` SET `dmg_multiplier`=20 WHERE `entry`=33203;
UPDATE `creature_template` SET `dmg_multiplier`=35 WHERE `entry`=33376;

UPDATE `creature_template` SET `dmg_multiplier`=12 WHERE `entry`=32876;
UPDATE `creature_template` SET `dmg_multiplier`=20 WHERE `entry`=33158;

UPDATE `creature_template` SET `dmg_multiplier`=20 WHERE `entry`=32872;
UPDATE `creature_template` SET `dmg_multiplier`=35 WHERE `entry`=33149;

UPDATE `creature_template` SET `dmg_multiplier`=20 WHERE `entry`=32873;
UPDATE `creature_template` SET `dmg_multiplier`=35 WHERE `entry`=33148;
