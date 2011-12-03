-- cleanup
DELETE FROM `creature` WHERE `guid` IN (137490,137491);
DELETE FROM `creature_addon` WHERE `guid` IN (137490,137491);
DELETE FROM `creature_formations` WHERE `leaderguid`=137496;

UPDATE `spell_script_names` SET `ScriptName`='spell_auriaya_strenght_of_the_pack' WHERE `spell_id`=64381;
