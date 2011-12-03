-- Creatures
UPDATE `creature` SET `position_x`=754.26 WHERE `guid`=132302;
UPDATE `creature` SET `position_x`=754.29 WHERE `guid`=132303;
UPDATE `creature` SET `position_x`=652.42 WHERE `guid`=132309;
UPDATE `creature` SET `position_x`=847.67 WHERE `guid`=132310;
UPDATE `creature` SET `position_x`=647.68 WHERE `guid`=132311;
UPDATE `creature` SET `position_x`=843.18 WHERE `guid`=132312;
UPDATE `creature` SET `position_x`=808.53 WHERE `guid`=132313;
UPDATE `creature` SET `position_x`=754.54 WHERE `guid`=132314;
-- GameObjects
UPDATE `gameobject` SET `position_x`=764.56 WHERE `guid`=151793;
UPDATE `gameobject` SET `position_x`=764.56 WHERE `guid`=151792;
UPDATE `gameobject` SET `position_x`=754.35 WHERE `guid`=67449;
UPDATE `gameobject` SET `position_x`=724.68 WHERE `guid`=67450;
UPDATE `gameobject` SET `position_x`=754.35 WHERE `guid`=400001;
UPDATE `gameobject` SET `position_x`=754.35 WHERE `guid`=400000;
-- Areatrigger
UPDATE `areatrigger_teleport` SET `target_position_x`=727.94 WHERE `id`=5290;
-- Disable LOS
DELETE FROM `disables` WHERE `sourceType`=6 AND `entry`=616;
INSERT INTO `disables` VALUES (6, 616, 4, 0, 0, "Disable Eye of Eternity LOS");
