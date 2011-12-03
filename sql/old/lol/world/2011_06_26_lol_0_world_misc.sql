UPDATE `creature_template` SET `dmg_multiplier`=12 WHERE `entry`=33998;
UPDATE `creature_template` SET `minlevel`=82, `maxlevel`=82, `dmg_multiplier`=25 WHERE `entry`=34200;
UPDATE `creature_template` SET `dmg_multiplier`=20, `ScriptName`='mob_tempest_minion' WHERE `entry`=34015;
UPDATE `creature_template` SET `dmg_multiplier`=40 WHERE `entry`=34016;
UPDATE `creature_template` SET `mechanic_immune_mask`=650854239 WHERE `entry` IN (33998,34200,33993,33994,34015,34016);

UPDATE `creature_loot_template` SET `item`=40753 WHERE `entry`=33993 AND `item`=47241;
UPDATE `creature_loot_template` SET `item`=45624 WHERE `entry`=33994 AND `item`=47241;

DELETE FROM `spell_script_names` WHERE `spell_id`=65279;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(65279, 'spell_emalon_lightning_nova');

UPDATE `creature_template` SET `npcflag`=1,`AIName`='SmartAI',`ScriptName`='' WHERE `entry`=900003;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (900003);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(900003,0,0,1,62,0,100,0,30000,1,0,0,62,571,0,0,0,0,0,8,0,0,0,5474,2841,419,6.26,'port to Vault of Archavon on gossip select'),
(900003,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'close gossip');
