UPDATE `creature_template` SET `ScriptName`='npc_flame_leviathan_seat' WHERE `entry`=33114;
UPDATE `creature_template` SET `ScriptName`='npc_flame_leviathan_defense_cannon' WHERE `entry`=33139;
UPDATE `creature_template` SET `ScriptName`='npc_flame_leviathan_defense_turret' WHERE `entry`=33142;
UPDATE `creature_template` SET `ScriptName`='npc_flame_leviathan_overload_device' WHERE `entry`=33143;

-- UPDATE `creature_template` SET `VehicleId`=387 WHERE `entry`=33113; -- 10N
-- UPDATE `creature_template` SET `VehicleId`=340 WHERE `entry`=34003; -- 25N
UPDATE `creature_template` SET `VehicleId`=340 WHERE `entry`=33113;

DELETE FROM `vehicle_template_accessory` WHERE `entry` IN (33113,33114);
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(33113,33114,0,1,'Flame Leviathan',6,30000),
(33113,33114,1,1,'Flame Leviathan',6,30000),
(33113,33114,2,1,'Flame Leviathan',6,30000),
(33113,33114,3,1,'Flame Leviathan',6,30000),
(33113,33139,7,1,'Flame Leviathan',6,30000),
(33114,33142,1,1,'Flame Leviathan Seat',6,30000),
(33114,33143,2,1,'Flame Leviathan Seat',6,30000);
