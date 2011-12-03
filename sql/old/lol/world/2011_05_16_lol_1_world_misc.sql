-- clear spawn
DELETE FROM `creature` WHERE `guid`=135475;
DELETE FROM `creature_addon` WHERE `guid`=135475;

-- GO scriptname
UPDATE `gameobject_template` SET `ScriptName`='go_blackened_urn' WHERE `entry`=194092;
