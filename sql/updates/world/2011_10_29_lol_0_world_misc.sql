DELETE FROM `spell_dbc` WHERE `id`=65037;
INSERT INTO `spell_dbc` (`Id`,`Effect1`,`EffectImplicitTargetA1`,`comment`) VALUES 
(65037,3,1,'Nerf the Scrapbots Achievement Criteria Marker');

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10401,10402) AND `type`=18;

DELETE FROM `conditions` WHERE `SourceEntry`=62834 AND `SourceTypeOrReferenceId`=13 AND `ConditionTypeOrReference`=18;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`Comment`) VALUES
(13,62834,18,1,0,'Boombot Boom - Player target'),
(13,62834,18,1,33343,'Boombot Boom - Scrapbot target'),
(13,62834,18,1,33344,'Boombot Boom - Pummeler target'),
(13,62834,18,1,33346,'Boombot Boom - Boombot target'),
(13,62834,18,1,33329,'Boombot Boom - Heart of the Deconstructor target'),
(13,62834,18,1,33293,'Boombot Boom - XT-002 target');

-- Delete disabled achievements
DELETE FROM `disables` WHERE `sourceType`=4 AND `entry` IN(10074,10075,10220,10221,10077,10079);

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10074,10075,10220,10221,10077,10079);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`ScriptName`) VALUES
-- Nerf Engineering 10m
(10074,11,0,'achievement_nerf_engineering'),
(10074,12,0,''),
-- Nerf Engineering 25m
(10075,11,0,'achievement_nerf_engineering'),
(10075,12,1,''),
-- Heartbreaker 10m
(10221,11,0,'achievement_heartbreaker'),
(10221,12,0,''),
-- Heartbreaker 25m
(10220,11,0,'achievement_heartbreaker'),
(10220,12,1,''),
-- Nerf Gravity Bombs 10m
(10077,11,0,'achievement_nerf_gravity_bombs'),
(10077,12,0,''),
-- Nerf Gravity Bombs 25m
(10079,11,0,'achievement_nerf_gravity_bombs'),
(10079,12,1,'');

UPDATE `spell_script_names` SET `ScriptName`='spell_xt002_gravity_bomb' WHERE `ScriptName`='spell_xt002_gravity_bomb_targeting';
UPDATE `spell_script_names` SET `ScriptName`='spell_xt002_searing_light' WHERE `ScriptName`='spell_xt002_searing_light_targeting';

DELETE FROM `spell_script_names` WHERE `spell_id` IN (64233,63025);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(64233,'spell_xt002_gravity_bomb_damage'),
(63025,'spell_xt002_gravity_bomb_damage');
