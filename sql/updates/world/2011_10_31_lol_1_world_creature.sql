SET @guid:=303117;

DELETE FROM `creature` WHERE `id`=34383;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@guid,'34383','571','1','1','0','0','5853.91','763.98','641.37','3.85247','120','0','0','12600','0','0','0','0','0'),
(@guid+1,'34383','1','1','1','0','0','1176.13','-4463.65','21.3435','1.02333','120','0','0','12600','0','0','0','0','0'),
(@guid+2,'34383','0','1','1','0','0','-9337.6','163.489','61.5579','0.913772','120','0','0','12600','0','0','0','0','0');

DELETE FROM `game_event_creature` WHERE `guid` BETWEEN @guid AND @guid+2;
INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES
(51,@guid),
(51,@guid+1),
(51,@guid+2);
