UPDATE `creature` SET `position_x`=2406.222,`position_y`=62.616,`position_z`=434.342 WHERE `guid`=136608;
UPDATE `creature` SET `position_x`=2267.847,`position_y`=-113.317,`position_z`=430.503 WHERE `guid`=136606;
UPDATE `creature` SET `spawndist`=5,`MovementType`=1 WHERE `guid`=136604;
INSERT IGNORE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(136607,33430,603,3,1,19775,0,2322.52, 3.06219,427.529,0.583555,604800,5,0,195495,0,1,0,0,0); -- add missing Guardian Lasher
