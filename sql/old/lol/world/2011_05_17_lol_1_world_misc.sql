UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128 WHERE `entry` IN (33906,33907);

DELETE FROM `gameobject` WHERE `guid` IN (400005,400006);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(400005,194565,603,2,1,559.119,-140.505,391.517,2.28638,0,0,0,1,180,255,1),
(400006,194565,603,2,1,606.229,-136.721,391.897,-2.9845,0,0,0,1,180,255,1);

UPDATE `gameobject` SET `spawnMask`=3 WHERE `guid` IN (56042,56068);
UPDATE `creature` SET `spawnMask`=3 WHERE `id`=33233;
