SET @guid := 303111;
SET @pool := 60003;

DELETE FROM `creature` WHERE `id` IN (35189,38453);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
-- Arcturis
(@guid,'38453','571','1','1','0','0','3584.87','-2757.84','158.353','2.16861','43200','10','0','15423','0','1','0','0','0'),
-- Skoll
(@guid+1,'35189','571','1','1','0','0','7148.45','-321.5','798.255','2.90844','43200','7','0','18900','0','1','0','0','0'),
(@guid+2,'35189','571','1','1','0','0','7187.58','-1360.15','934.57','6.04374','43200','7','0','18900','0','1','0','0','0'),
(@guid+3,'35189','571','1','1','0','0','7754.46','-99.3483','906.935','4.59625','43200','7','0','18900','0','1','0','0','0');

DELETE FROM `pool_template` WHERE `entry`=@pool;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(@pool,1,'Skoll (35189)');

DELETE FROM `pool_creature` WHERE `pool_entry`=@pool;
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES
(@guid+1,@pool,'0','Skoll (35189) - Spawn 1'),
(@guid+2,@pool,'0','Skoll (35189) - Spawn 2'),
(@guid+3,@pool,'0','Skoll (35189) - Spawn 3');

UPDATE `creature_template` SET `faction_A`=190, `faction_H`=190, `baseattacktime`=1500 WHERE `entry`=35189;
