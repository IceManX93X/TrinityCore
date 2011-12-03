UPDATE `creature_template` SET `mindmg`=100,`maxdmg`=300,`attackpower`=1000,`faction_A`=3,`faction_H`=3,`AIName`='',`ScriptName`='' WHERE `entry`=28017;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=28017;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=28017;
DELETE FROM `creature_template_addon` WHERE `entry`=28017;
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES
(28017,'50453');    -- Blood Gorged