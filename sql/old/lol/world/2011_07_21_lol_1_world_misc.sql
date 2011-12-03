-- cleanup
UPDATE `creature_addon` SET `auras`=NULL WHERE `guid`=126981;
UPDATE `creature_template` SET `dmg_multiplier`=15 WHERE `entry`=31533;

-- update waypoints
UPDATE `waypoint_data` SET `delay`=10000, `action`=1269811 WHERE `id`=1269810 AND `point` IN (5,14);
UPDATE `waypoint_data` SET `action`=1269810 WHERE `id`=1269810 AND `point` IN (2,11);

-- waypoint scripts
DELETE FROM `waypoint_scripts` WHERE `id` IN (1269810,1269811);
INSERT INTO `waypoint_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`,`guid`)
VALUES
(1269810,0,14,52092,1,0,0,0,0,0,2500),
(1269811,2,15,52098,1,0,0,0,0,0,2501);

-- bjarngrim's charge up
DELETE FROM `spell_script_names` WHERE `spell_id`=52098;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(52098, 'spell_bjarngrim_charge_up');

-- trigger's charge up
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=56458;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,56458,18,1,28586);

-- cast temporary electrical charge on hit
DELETE FROM `spell_scripts` WHERE `id`=56458;
INSERT INTO `spell_scripts` (`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(56458,0,0,15,52092,2,0,0,0,0,0);

-- bjarngrim's stance auras
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (53790,53791,53792);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(53790,41105,2, 'Bjarngrim - Defensive Aura'),
(53791,41107,2, 'Bjarngrim - Berserker Aura'),
(53792,41106,2, 'Bjarngrim - Battle Aura');

-- achievement: lightning struck
DELETE FROM `disables` WHERE `sourceType`=4 AND `entry`=6835;

DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=6835 AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(6835,11,0,0, 'achievement_lightning_struck');
