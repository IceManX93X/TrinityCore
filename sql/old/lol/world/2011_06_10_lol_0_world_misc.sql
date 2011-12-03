-- set 25N chopper spells
UPDATE `creature_template` SET `spell1`=62974, `spell2`=62286, `spell3`=62299, `spell4`=64660 WHERE `entry`=34045;

-- longer steelforged defender respawn timer (should not be DB spawned at all?)
UPDATE `creature` SET `spawntimesecs`=1800 WHERE `id`=33236;
