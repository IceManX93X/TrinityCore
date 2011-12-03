-- >> remove hack from rev. 57e5631e69c67f7d35f6c4fffb65e2a40847cd4f and set trinitycore values (source: TDB 335.11.43) <<
UPDATE `quest_template` SET
    `QuestFlags`=128
    ,`ReqCreatureOrGOId1`=
        CASE `entry`
            WHEN 10305 THEN 19547
            WHEN 10306 THEN 19548
            WHEN 10307 THEN 19550
            ELSE 0
        END
    ,`ReqCreatureOrGOId2`=
        CASE `entry`
            WHEN 10182 THEN 19549
            ELSE 0
        END
    ,`ReqCreatureOrGOCount1`=
        CASE `entry`
            WHEN 10182 THEN 0
            ELSE 1
        END
    ,`ReqCreatureOrGOCount2`=
        CASE `entry`
            WHEN 10182 THEN 1
            ELSE 0
        END
    ,`ReqSpellCast1`=0
    ,`ReqSpellCast2`=0
WHERE `entry` IN (10182,10305,10306,10307);

UPDATE `item_template` SET `ScriptName`='' WHERE `entry` IN (28336,28352,28353,28351);
DELETE FROM `spell_script_names` WHERE `spell_id` IN(34140,34142,34144,34141);
-- >> REMOVE END <<

-- source: <www.wowwiki.com>
DELETE FROM `creature_text` WHERE `entry`=19579;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(19579,0,0,'Phew! There''s my lucky hat. I''ve been looking for it everywhere.',12,0,100,1,0,0,'Cohlien Frostweaver with Hat');

UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry` IN (19579,19580);
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (19579,19580);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- Cohlien Frostweaver with Hat
(19579,0,0,1,54,0,100,0,0,0,0,0,33,19550,0,0,0,0,0,7,0,0,0,0,0,0,0,'Cohlien Frostweaver with Hat - On Summon - Give Quest Credit'),
(19579,0,1,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cohlien Frostweaver with Hat - On Summon - say Text'),
-- Luminrath with Cape(missing text)
(19580,0,0,0,54,0,100,0,0,0,0,0,33,19548,0,0,0,0,0,7,0,0,0,0,0,0,0,'Luminrath with Cape - On Summon - Give Quest Credit');

DELETE FROM `event_scripts` WHERE `id` BETWEEN 12607 AND 12610;
INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(12607,1,8,19547,0,0,0,0,0,0), -- Place Belmara's Tome (no creature for event available - instant credit)
(12608,1,8,19549,0,0,0,0,0,0), -- Place Dathric's Blade (no creature for event available - instant credit)
(12609,1,10,19580,15000,0,2194.1209,2339.6069,90.239,3.8795), -- Place Luminrath's Mantle
(12610,1,10,19579,15000,0,2202.2272,2406.2532,107.470,1.3364); -- Place Cohlien's Hat