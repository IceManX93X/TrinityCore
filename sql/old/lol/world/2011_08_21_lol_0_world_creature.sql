DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (33060,33062,33109);
UPDATE `creature_template` SET `AIName`='' WHERE `entry` IN (33060,33062,33109);
