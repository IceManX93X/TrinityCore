-- vezax - run speed
UPDATE `creature_template` SET `speed_run`=1.42857, `baseattacktime`=1500 WHERE `entry` IN (33271,33449);

-- herb and mineral respawn
UPDATE `gameobject` SET `spawntimesecs`=604800 WHERE `map`=603 AND `spawntimesecs`=3600;

-- thorim - lightning orb (temporary)
UPDATE `creature_template` SET `speed_run`=9.6, `dmg_multiplier`=200, `baseattacktime`=1000, `Health_mod`=100 WHERE `entry`=33138;

-- steelbreaker - electrical charge
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=61901;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
(13,61901,18,1,32867);

DELETE FROM `spell_script_names` WHERE `spell_id` IN (61911,63495);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(61911, 'spell_steelbreaker_static_disruption'),
(63495, 'spell_steelbreaker_static_disruption');
