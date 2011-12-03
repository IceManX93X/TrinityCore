UPDATE `script_texts` SET `content_default`='%s hugs her father.' WHERE `entry`=-1000116;
UPDATE `script_texts` SET `content_default`='Be gone, trifling elf. I am in control now!' WHERE `entry`=-1548010;
UPDATE `script_texts` SET `content_default`='It would appear that I''ve made a slight miscalculation. I allowed my mind to be corrupted by the fiend in the prison, overriding my primary directive. All systems seem to be functional now. Clear.' WHERE `entry`=-1603257;
UPDATE `script_texts` SET `content_default`='Rin''ji will tell you secret now... $n, should go to the Overlook Cliffs. Rin''ji hid something on island there' WHERE `entry`=-1000408;

UPDATE `spell_proc_event` SET `procEx` = 0 WHERE `entry` = 60172;

UPDATE `spell_proc_event` SET `procEx` = `procEx`|0x42000 WHERE `entry` IN (58872,58874);

UPDATE `trinity_string` SET `content_default`='id: %d %s effmask: %d charges: %d stack: %d slot %d duration: %d maxduration: %d %s %s caster: %s guid: %d' WHERE `entry`=468;

-- Remove EAI events for Eye of the Storm Emissary and Eye of the Storm Envoy (incorrectly added earlier)
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (22013,22015);

-- Scripts already converted to SAI, removing EAI equivalents
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (18103,26349,26370,27234,27235,27236,27237);

-- Update: Use EventAI for Oluf the Violent, Iron Rune-shaper, Slag, Apprentice Osterkilgr, Scarlet Highlord Daion
UPDATE `creature_template` SET `AIName`='EventAI', `ScriptName`='' WHERE `entry` IN (23931,26270,28585,30409,32417);


-- More areatrigger_teleport fixes
UPDATE `areatrigger_teleport` SET `target_orientation`=4.718671 WHERE `id`=3928; -- Zul Gurub entrance
UPDATE `areatrigger_teleport` SET `target_orientation`=1.617921 WHERE `id`=3930; -- Zul Gurub exit

-- Timbermaw (spell_rate was 4, quest_rate was 1)
UPDATE `reputation_reward_rate` SET `quest_rate`=4,`spell_rate`=1 WHERE `faction`=576;

-- Mag'har (spell_rate was 2, quest_rate was 1)
UPDATE `reputation_reward_rate` SET `quest_rate`=2,`spell_rate`=1 WHERE `faction`=941;

UPDATE `gameobject_template` SET `ScriptName`='go_wind_stone' WHERE `entry` IN (180456,180461,180466,180518,180529,180534,180539,180544,180549,180554,180559,180564);

DELETE FROM `gossip_menu` WHERE `entry` IN (6543,6540,6542) AND `text_id` IN (7771,7772,7773,7776);
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(6540,7771),
(6542,7772),
(6543,7776);

DELETE FROM `creature_text` WHERE `entry` IN (15209,15211,15212,15307,15206,15207,15208,15220,15203,15204,15205,15305);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(15209,0,0, 'The Abyssal Council does not tolerate deceit! Feel our wrath, little human!',12,0,100,0,0,0, 'Crimson Templar - SAY_TEMPLAR_AGGRO'),
(15211,0,0, 'The Abyssal Council does not tolerate deceit! Feel our wrath, little human!',12,0,100,0,0,0, 'Azure Templar - SAY_TEMPLAR_AGGRO'),
(15212,0,0, 'The Abyssal Council does not tolerate deceit! Feel our wrath, little human!',12,0,100,0,0,0, 'Hoary Templar - SAY_TEMPLAR_AGGRO'),
(15307,0,0, 'The Abyssal Council does not tolerate deceit! Feel our wrath, little human!',12,0,100,0,0,0, 'Earthen Templar - SAY_TEMPLAR_AGGRO'),
(15206,0,0, 'What? Such a small, frail thing beckons me? This will not do unpunished!',12,0,100,0,0,0, 'The Duke of Cynders - SAY_DUKE_AGGRO'),
(15207,0,0, 'What? Such a small, frail thing beckons me? This will not do unpunished!',12,0,100,0,0,0, 'The Duke of Fathoms - SAY_DUKE_AGGRO'),
(15208,0,0, 'What? Such a small, frail thing beckons me? This will not do unpunished!',12,0,100,0,0,0, 'The Duke of Shards - SAY_DUKE_AGGRO'),
(15220,0,0, 'What? Such a small, frail thing beckons me? This will not do unpunished!',12,0,100,0,0,0, 'The Duke of Zephyrs - SAY_DUKE_AGGRO'),
(15203,0,0, 'Your treachery only speeds your doom. This world will fall to darkness!',14,0,100,0,0,0, 'Prince Skaldrenox - YELL_ROYAL_AGGRO'),
(15204,0,0, 'Your treachery only speeds your doom. This world will fall to darkness!',14,0,100,0,0,0, 'High Marshal Whirlaxis - YELL_ROYAL_AGGRO'),
(15205,0,0, 'Your treachery only speeds your doom. This world will fall to darkness!',14,0,100,0,0,0, 'Baron Kazum - YELL_ROYAL_AGGRO'),
(15305,0,0, 'Your treachery only speeds your doom. This world will fall to darkness!',14,0,100,0,0,0, 'Lord Skwol - YELL_ROYAL_AGGRO');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (24734,24744,24756,24758,24760,24763,24765,24768,24770,24772,24784,24786,24788,24789,24790);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`, `Comment`) VALUES
(13,0,24734,0,18,0,180529,0,0, '', 'Summon Templar Random - Lesser Wind Stone'),
(13,0,24734,0,18,0,180456,0,0, '', 'Summon Templar Random - Lesser Wind Stone'),
(13,0,24734,0,18,0,180518,0,0, '', 'Summon Templar Random - Lesser Wind Stone'),
(13,0,24734,0,18,0,180544,0,0, '', 'Summon Templar Random - Lesser Wind Stone'),
(13,0,24734,0,18,0,180549,0,0, '', 'Summon Templar Random - Lesser Wind Stone'),
(13,0,24734,0,18,0,180564,0,0, '', 'Summon Templar Random - Lesser Wind Stone'),
(13,0,24744,0,18,0,180529,0,0, '', 'Summon Templar Fire - Lesser Wind Stone'),
(13,0,24744,0,18,0,180456,0,0, '', 'Summon Templar Fire - Lesser Wind Stone'),
(13,0,24744,0,18,0,180518,0,0, '', 'Summon Templar Fire - Lesser Wind Stone'),
(13,0,24744,0,18,0,180544,0,0, '', 'Summon Templar Fire - Lesser Wind Stone'),
(13,0,24744,0,18,0,180549,0,0, '', 'Summon Templar Fire - Lesser Wind Stone'),
(13,0,24744,0,18,0,180564,0,0, '', 'Summon Templar Fire - Lesser Wind Stone'),
(13,0,24756,0,18,0,180529,0,0, '', 'Summon Templar Air - Lesser Wind Stone'),
(13,0,24756,0,18,0,180456,0,0, '', 'Summon Templar Air - Lesser Wind Stone'),
(13,0,24756,0,18,0,180518,0,0, '', 'Summon Templar Air - Lesser Wind Stone'),
(13,0,24756,0,18,0,180544,0,0, '', 'Summon Templar Air - Lesser Wind Stone'),
(13,0,24756,0,18,0,180549,0,0, '', 'Summon Templar Air - Lesser Wind Stone'),
(13,0,24756,0,18,0,180564,0,0, '', 'Summon Templar Air - Lesser Wind Stone'),
(13,0,24758,0,18,0,180529,0,0, '', 'Summon Templar Earth - Lesser Wind Stone'),
(13,0,24758,0,18,0,180456,0,0, '', 'Summon Templar Earth - Lesser Wind Stone'),
(13,0,24758,0,18,0,180518,0,0, '', 'Summon Templar Earth - Lesser Wind Stone'),
(13,0,24758,0,18,0,180544,0,0, '', 'Summon Templar Earth - Lesser Wind Stone'),
(13,0,24758,0,18,0,180549,0,0, '', 'Summon Templar Earth - Lesser Wind Stone'),
(13,0,24758,0,18,0,180564,0,0, '', 'Summon Templar Earth - Lesser Wind Stone'),
(13,0,24760,0,18,0,180529,0,0, '', 'Summon Templar Water - Lesser Wind Stone'),
(13,0,24760,0,18,0,180456,0,0, '', 'Summon Templar Water - Lesser Wind Stone'),
(13,0,24760,0,18,0,180518,0,0, '', 'Summon Templar Water - Lesser Wind Stone'),
(13,0,24760,0,18,0,180544,0,0, '', 'Summon Templar Water - Lesser Wind Stone'),
(13,0,24760,0,18,0,180549,0,0, '', 'Summon Templar Water - Lesser Wind Stone'),
(13,0,24760,0,18,0,180564,0,0, '', 'Summon Templar Water - Lesser Wind Stone'),
--
(13,0,24763,0,18,0,180534,0,0, '', 'Summon Duke Random - Wind Stone'),
(13,0,24763,0,18,0,180461,0,0, '', 'Summon Duke Random - Wind Stone'),
(13,0,24763,0,18,0,180554,0,0, '', 'Summon Duke Random - Wind Stone'),
(13,0,24765,0,18,0,180534,0,0, '', 'Summon Duke Fire - Wind Stone'),
(13,0,24765,0,18,0,180461,0,0, '', 'Summon Duke Fire - Wind Stone'),
(13,0,24765,0,18,0,180554,0,0, '', 'Summon Duke Fire - Wind Stone'),
(13,0,24768,0,18,0,180534,0,0, '', 'Summon Duke Air - Wind Stone'),
(13,0,24768,0,18,0,180461,0,0, '', 'Summon Duke Air - Wind Stone'),
(13,0,24768,0,18,0,180554,0,0, '', 'Summon Duke Air - Wind Stone'),
(13,0,24770,0,18,0,180534,0,0, '', 'Summon Duke Earth - Wind Stone'),
(13,0,24770,0,18,0,180461,0,0, '', 'Summon Duke Earth - Wind Stone'),
(13,0,24770,0,18,0,180554,0,0, '', 'Summon Duke Earth - Wind Stone'),
(13,0,24772,0,18,0,180534,0,0, '', 'Summon Duke Water - Wind Stone'),
(13,0,24772,0,18,0,180461,0,0, '', 'Summon Duke Water - Wind Stone'),
(13,0,24772,0,18,0,180554,0,0, '', 'Summon Duke Water - Wind Stone'),
--
(13,0,24784,0,18,0,180466,0,0, '', 'Summon Royal Random - Greater Wind Stone'),
(13,0,24784,0,18,0,180539,0,0, '', 'Summon Royal Random - Greater Wind Stone'),
(13,0,24784,0,18,0,180559,0,0, '', 'Summon Royal Random - Greater Wind Stone'),
(13,0,24786,0,18,0,180466,0,0, '', 'Summon Royal Fire - Greater Wind Stone'),
(13,0,24786,0,18,0,180539,0,0, '', 'Summon Royal Fire - Greater Wind Stone'),
(13,0,24786,0,18,0,180559,0,0, '', 'Summon Royal Fire - Greater Wind Stone'),
(13,0,24788,0,18,0,180466,0,0, '', 'Summon Royal Air - Greater Wind Stone'),
(13,0,24788,0,18,0,180539,0,0, '', 'Summon Royal Air - Greater Wind Stone'),
(13,0,24788,0,18,0,180559,0,0, '', 'Summon Royal Air - Greater Wind Stone'),
(13,0,24789,0,18,0,180466,0,0, '', 'Summon Royal Earth - Greater Wind Stone'),
(13,0,24789,0,18,0,180539,0,0, '', 'Summon Royal Earth - Greater Wind Stone'),
(13,0,24789,0,18,0,180559,0,0, '', 'Summon Royal Earth - Greater Wind Stone'),
(13,0,24790,0,18,0,180466,0,0, '', 'Summon Royal Water - Greater Wind Stone'),
(13,0,24790,0,18,0,180539,0,0, '', 'Summon Royal Water - Greater Wind Stone'),
(13,0,24790,0,18,0,180559,0,0, '', 'Summon Royal Water - Greater Wind Stone');

-- More areatriggers rotations and some Z coordinates fixed
UPDATE `areatrigger_teleport` SET `target_orientation`=4.582802 WHERE `id`=259; -- Blackfathom deeps
UPDATE `areatrigger_teleport` SET `target_orientation`=3.147877 WHERE `id`=3186; -- Dire Maul, Capital Gardens, south
UPDATE `areatrigger_teleport` SET `target_orientation`=1.784425 WHERE `id`=3126; -- Maraudon, north
UPDATE `areatrigger_teleport` SET `target_position_z`=81.491974, `target_orientation`='1.259779' WHERE `id`=444; -- Razorfen Downs
UPDATE `areatrigger_teleport` SET `target_orientation`=1.840974 WHERE `id`=1472; -- Blackrock Dephts
UPDATE `areatrigger_teleport` SET `target_orientation`=2.095443 WHERE `id`=1470; -- Blackrock Spire
UPDATE `areatrigger_teleport` SET `target_orientation`=3.663096 WHERE `id`=2568; -- Scholomance
UPDATE `areatrigger_teleport` SET `target_position_z`=108.449623, `target_orientation`=1.935219 WHERE `id`=2221; -- Stratholme
UPDATE `areatrigger_teleport` SET `target_orientation`=4.55217 WHERE `id`=119; -- Deadmines
UPDATE `areatrigger_teleport` SET `target_orientation`=3.20443 WHERE `id`=288; -- Uldaman, north
UPDATE `areatrigger_teleport` SET `target_position_z`=266.22583, `target_orientation`=3.135308 WHERE `id`=882; -- Uldaman, south
UPDATE `areatrigger_teleport` SET `target_orientation`=2.959382 WHERE `id`=448; -- Altar of Atal'Hakkar

SET @ENTRY := 18716;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,0,0,0,62,0,100,0,7759,0,0,0,11,47068,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Who Are They - Shadowy Initiate - On Gossip option - Cast spell 47068 on player'),
(@ENTRY,0,1,0,25,0,100,0,0,0,0,0,58,1,9613,2400,3800,30,30,1,0,0,0,0,0,0,0, 'Shadowy Initiate - On spawn install caster template');

SET @ENTRY := 18719;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,0,0,0,62,0,100,0,7760,0,0,0,11,47070,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Who Are They - Shadowy Advisor - On Gossip option - Cast spell 47070 on player'),
(@ENTRY,0,1,0,25,0,100,0,0,0,0,0,58,1,9613,2400,3800,30,30,1,0,0,0,0,0,0,0, 'Shadowy Advisor - On spawn install caster template');

SET @ENTRY := 18930;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,0,0,0,62,0,100,0,7938,1,0,0,11,34924,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Vlagga Freyfeather - On gossip option 1 select - Cast Stair of Destiny to Thrallmar'),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,12,9297,4,30000,0,0,0,1,0,0,0,0,0,0,0, 'Vlagga Freyfeather - Vlagga Freyfeather - Summon Enraged Wyverns on Aggro'),
(@ENTRY,0,2,0,4,0,100,0,0,0,0,0,12,9297,4,30000,0,0,0,1,0,0,0,0,0,0,0, 'Vlagga Freyfeather - Vlagga Freyfeather - Summon Enraged Wyverns on Aggro'),
(@ENTRY,0,3,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Vlagga Freyfeather - Say text on Aggro');

DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES 
(@ENTRY,0,0, 'Arrrhhh...Guards!',14,7,100,0,0,0, 'Common Horde Flight Master');

-- some cleanup
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (19534,26816,26820,28417);
DELETE FROM `creature_ai_texts` WHERE `entry`=-337;

-- incorrectly set AIName
UPDATE `creature_template` SET `AIName`='EventAI', `ScriptName`='' WHERE `entry` IN (24938,27570);

SET @ENTRY := 25596;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,11,32423,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Infected Kodo Beast - Blue Radiation on spawn'),
(@ENTRY,0,1,0,27,0,100,0,0,0,0,0,91,7,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Infected Kodo Beast - remove death state on passager boarded'),
(@ENTRY,0,2,0,31,0,100,0,45877,0,0,0,41,0,0,0,0,0,0,22,0,0,0,0,0,0,0, 'Infected Kodo Beast - On Spell Hit despawn');

SET @ENTRY := 26257;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,58,1,51797,3400,4800,30,7,1,0,0,0,0,0,0,0, 'Surge Needle Sorcerer - On spawn install caster template');

SET @ENTRY := 26343;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,11,32423,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Indu''le Fisherman - On spawn - Cast Blue Radiation on self'),
(@ENTRY,0,1,0,9,0,100,0,0,20,15000,18000,11,11820,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Indu''le Fisherman -  Cast Electrified Net');

SET @ENTRY := 27842;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,12,9521,4,30000,0,0,0,1,0,0,0,0,0,0,0, 'Fenrick Barlowe - Summon Enraged Felbat on Aggro'),
(@ENTRY,0,2,0,4,0,100,0,0,0,0,0,12,9521,4,30000,0,0,0,1,0,0,0,0,0,0,0, 'Fenrick Barlowe - Summon Enraged Felbat on Aggro'),
(@ENTRY,0,3,0,4,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fenrick Barlowe - Say text on Aggro'),
(@ENTRY,0,4,0,11,0,100,0,0,0,0,0,53,0,27842,1,0,0,0,1,0,0,0,0,0,0,0, 'Fenrick Barlowe - on spawn start path'),
(@ENTRY,0,5,0,40,0,100,0,5,27842,0,0,80,2784201,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fenrick Barlowe - at wp 5 run script1'),
(@ENTRY,0,6,0,40,0,100,0,8,27842,0,0,80,2784202,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fenrick Barlowe - at wp 8 run script2');

DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES 
(@ENTRY, 0, 0, 'Bat gizzards again for the gnomes tonight...', 12, 0, 100, 1, 0, 0, 'Fenrick Barlowe text'),
(@ENTRY, 0, 1, 'What do they expect, making the bats come in at that angle? Broken necks and gamey bat stew, that''s what they get.', 12, 0, 100, 1, 0, 0, 'Fenrick Barlowe text'),
(@ENTRY, 0, 2, 'We like trees, Fenrick. They provide cover. They won''t let me chop them down, either.', 12, 0, 100, 1, 0, 0, 'Fenrick Barlowe text'),
(@ENTRY, 0, 3, 'I wonder how many reinforcements need to suffer injury before they allows us to chop down these idiotic trees. They''re costing us a fortune in bats. Maybe I''ll rig a harness or two...', 12, 0, 100, 1, 0, 0, 'Fenrick Barlowe text'),
(@ENTRY,1,0, 'Arrrhhh...Guards!',14,7,100,0,0,0, 'Common Horde Flight Master');

UPDATE `creature_template` SET `baseattacktime`=2000 WHERE `entry`=36213; -- Kor'kron Overseer
UPDATE `creature_template` SET `faction_A`=14,`faction_H`=14,`baseattacktime`=2000,`unit_flags`=33280,`speed_walk`=1 WHERE `entry`=5677; -- Summoned Succubus
UPDATE `creature_template` SET `npcflag`=1,`unit_flags`=0x300,`speed_run`=0.99206 WHERE `entry`=33238; -- Argent Squire
UPDATE `creature_template` SET `faction_A`=35,`faction_H`=35,`unit_flags`=33536 WHERE `entry`=36979; -- Lil'KT
UPDATE `creature_template` SET `exp`=0,`InhabitType`=7,`flags_extra`=`flags_extra`|2|128 WHERE `entry` IN (34286,34159,33571); -- Orbital Support, Ulduar Gauntlet Generator, Ulduar Gauntlet Generator (small radius)
UPDATE `creature_template` SET `gossip_menu_id`=5021 WHERE `entry`=13257;
UPDATE `creature_template` SET `gossip_menu_id`=7320 WHERE `entry`=16886;
UPDATE `creature_template` SET `gossip_menu_id`=5283 WHERE `entry`=13617;
UPDATE `creature_template` SET `gossip_menu_id`=5241 WHERE `entry`=12096;
UPDATE `creature_template` SET `gossip_menu_id`=2602 WHERE `entry`=10267;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_venture_co_straggler' WHERE `entry`=27570; -- Wrongly deleted in a recent commit

UPDATE `creature_model_info` SET `bounding_radius`=0.2596,`combat_reach`=1.65,`gender`=1 WHERE `modelid`=30063; -- Kor'kron Overseer
UPDATE `creature_model_info` SET `bounding_radius`=0.6045,`combat_reach`=2.25,`gender`=1 WHERE `modelid`=10923; -- Summoned Succubus
UPDATE `creature_model_info` SET `bounding_radius`=0.06,`combat_reach`=0.3,`gender`=0 WHERE `modelid`=30507; -- Lil'KT
UPDATE `creature_model_info` SET `bounding_radius`=0.3,`combat_reach`=0,`gender`=0 WHERE `modelid`=28946; -- Argent Squire
UPDATE `creature_model_info` SET `bounding_radius`=0.3519,`combat_reach`=1.725,`gender`=0 WHERE `modelid`=26078; -- Windle Sparkshine

DELETE FROM `creature_template_addon` WHERE `entry` IN (36213,5677,33238,36979,34286,34159);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(36213,0,0,257,0, NULL), -- Kor'kron Overseer
(5677,0,0,1,0, NULL), -- Summoned Succubus
(33238,0,0,1,0, NULL), -- Argent Squire
(36979,0,0,1,0, '69683 70050'), -- Lil'KT (Lil' K.T. Passive / [DND] Lich Pet)
(34286,0,0,1,0, NULL), -- Orbital Support
(34159,0,0,1,0, NULL); -- Ulduar Gauntlet Generator (small radius)

UPDATE `creature` SET `MovementType`=0,`spawndist`=0 WHERE `id` IN (34286,34159,33571); -- Orbital Support, Ulduar Gauntlet Generator, Ulduar Gauntlet Generator (small radius)

-- No npc should have UNIT_FLAG_PVP_ATTACKABLE
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~0x8 WHERE `unit_flags` & 0x8;

DELETE FROM `gossip_menu` WHERE `entry`=1822 AND `text_id`=2474;
DELETE FROM `gossip_menu` WHERE `entry`=1823 AND `text_id`=2482;
DELETE FROM `gossip_menu` WHERE `entry`=1824 AND `text_id`=2481;
DELETE FROM `gossip_menu` WHERE `entry`=1825 AND `text_id`=2480;
DELETE FROM `gossip_menu` WHERE `entry`=1826 AND `text_id`=2479;
DELETE FROM `gossip_menu` WHERE `entry`=1827 AND `text_id`=2478;
DELETE FROM `gossip_menu` WHERE `entry`=1828 AND `text_id`=2477;
DELETE FROM `gossip_menu` WHERE `entry`=2186 AND `text_id`=2820;
DELETE FROM `gossip_menu` WHERE `entry`=2187 AND `text_id`=2820;
DELETE FROM `gossip_menu` WHERE `entry`=3182 AND `text_id`=3937;
DELETE FROM `gossip_menu` WHERE `entry`=2602 AND `text_id`=3296;
DELETE FROM `gossip_menu` WHERE `entry`=5241 AND `text_id`=6255;
DELETE FROM `gossip_menu` WHERE `entry`=5283 AND `text_id`=6316;
DELETE FROM `gossip_menu` WHERE `entry`=5021 AND `text_id`=6073;
DELETE FROM `gossip_menu` WHERE `entry`=5627 AND `text_id`=6736;
DELETE FROM `gossip_menu` WHERE `entry`=7320 AND `text_id`=8688;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(1822, 2474), (1823, 2482), (1824, 2481),
(1825, 2480), (1826, 2479), (1827, 2478),
(1828, 2477), (2186, 2820), (2187, 2820),
(3182, 3937), (2602, 3296), (5241, 6255),
(5283, 6316), (5021, 6073), (5627, 6736),
(7320, 8688);

DELETE FROM `gossip_menu_option` WHERE `menu_id`=1663 AND `id`=0;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2187 AND `id`=0;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4558 AND `id` IN (0,1,2);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=7939 AND `id` IN (0,1);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5021 AND `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5241 AND `id` IN (0,2);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(1663,0,0,'Amazing! I\'ve never spoken to a ghost. I wish to learn!', 1,1,0,0,0,0,''),
(2187,0,0,'Transcribe the tablet.',1,1,0,0,0,0,''),
(4558,0,3,'I seek more training in the priestly ways.',1,1,0,0,0,0,''),
(4558,1,0,'I wish to unlearn my talents.',1,1,0,0,0,0,''),
(4558,2,0,'Learn about Dual Talent Specialization.',1,1,0,0,0,0,''),
(7939,0,2,'Show me where I can fly.',1,1,0,0,0,0,''),
(7939,1,2,'Send me to Honor Hold!',1,1,0,0,0,0,''),
(5021,3,0,'How many more supplies are needed for the next upgrade?',1,1,5627,0,0,0,''),
(5241,0,0,'How many more supplies are needed to send ground assaults?',1,1,0,0,0,0,''),
(5241,2,1,'I want to browse your goods.',1,1,0,0,0,0,'');

UPDATE `creature_template` SET `dynamicflags`=32 WHERE `entry` IN (27457,27481,26513,26516); -- Skirmisher Corpse, Westfall Infantry Corpse, Drakkari Shaman Corpse, Drakkari Warrior Corpse

DELETE FROM `creature_template_addon` WHERE `entry` IN (27457,27481);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(27457,0,0,1,0, '29266'), -- Skirmisher Corpse (Permanent Feign Death)
(27481,0,0,1,0, '29266'); -- Westfall Infantry Corpse (Permanent Feign Death)

UPDATE `creature_template_addon` SET `bytes1`=0,`bytes2`=1,`mount`=0,`emote`=0,`auras`='29266' WHERE `entry` IN (26513,26516); -- Drakkari Shaman Corpse (Permanent Feign Death)

UPDATE `creature` SET `MovementType`=0, `spawndist`=0 WHERE `id` IN (27457,27481,26513,26516);
DELETE FROM `creature_addon` WHERE `guid` IN (102034,102035,102036,102037,102038,102041,102042,102043,102044,102045,102046,102047,103956,103957,103958,103959,103960,103972,103973,103974,103975,103976,103977,103978,103984,103985,103986,103987);

DELETE FROM `creature_ai_scripts` WHERE `creature_id`=27570;

DELETE FROM `gossip_menu_option` WHERE `menu_id`=3062 AND `id` BETWEEN 0 AND 6;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`) VALUES
(3062,0,0, 'Low spirits', 1,1),
(3062,1,0, 'Bad hang nail', 1,1),
(3062,2,0, 'Feeling underpowered', 1,1),
(3062,3,0, 'Jungle Fever', 1,1),
(3062,4,0, 'Uni-brow', 1,1),
(3062,5,0, 'Whiplash', 1,1),
(3062,6,0, 'I don''t want to go back to work', 1,1);

DELETE FROM `creature_template_addon` WHERE `entry`=10578;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(10578,0,0,257,0, NULL); -- Bom'bay

UPDATE `creature` SET `MovementType`=1,`spawndist`=5 WHERE `id`=10578; -- rand movement
UPDATE `creature_template` SET `AIName`='SmartAI',`MovementType`=1 WHERE `entry`=10578;

DELETE FROM `smart_scripts` WHERE (`entryorguid`=10578 AND `source_type`=0);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=1057800 AND `source_type`=9);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(10578, 0, 0, 0, 62, 0, 100, 0, 3062, 0, 0, 0, 80, 10578*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bom''bay - On gossip select 0 run timed action list'),
(10578, 0, 1, 0, 62, 0, 100, 0, 3062, 1, 0, 0, 80, 10578*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bom''bay - On gossip select 1 run timed action list'),
(10578, 0, 2, 0, 62, 0, 100, 0, 3062, 2, 0, 0, 80, 10578*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bom''bay - On gossip select 2 run timed action list'),
(10578, 0, 3, 0, 62, 0, 100, 0, 3062, 3, 0, 0, 80, 10578*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bom''bay - On gossip select 3 run timed action list'),
(10578, 0, 4, 0, 62, 0, 100, 0, 3062, 4, 0, 0, 80, 10578*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bom''bay - On gossip select 4 run timed action list'),
(10578, 0, 5, 0, 62, 0, 100, 0, 3062, 5, 0, 0, 80, 10578*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bom''bay - On gossip select 5 run timed action list'),
(10578, 0, 6, 0, 62, 0, 100, 0, 3062, 6, 0, 0, 80, 10578*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bom''bay - On gossip select 6 run timed action list'),
(10578, 0, 7, 0, 1, 0, 100, 0, 1000, 1000, 20000, 40000, 10, 153, 15, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bom''bay - Every 20-40 seconds do random emote'),
(1057800, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bom''bay - Close gossip'),
-- could use a stop movement here
(1057800, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 4, 6482, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bom''bay - Play a sound'),
(1057800, 9, 2, 0, 0, 0, 100, 0, 100, 100, 0, 0, 11, 17009, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bom''bay - Cast Voodoo');

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_voodoo';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(17009, 'spell_voodoo');

UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128 WHERE `entry` IN (32892,32879); -- Fix Thorim triggers

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=71189;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,71189,0,18,1,37868,0,0, '', 'Dreamwalker''s Rage - target Risen Archmage'),
(13,0,71189,0,18,1,36791,0,0, '', 'Dreamwalker''s Rage - target Blazing Skeleton'),
(13,0,71189,0,18,1,37863,0,0, '', 'Dreamwalker''s Rage - target Suppresser'),
(13,0,71189,0,18,1,37934,0,0, '', 'Dreamwalker''s Rage - target Blistering Zombie'),
(13,0,71189,0,18,1,37886,0,0, '', 'Dreamwalker''s Rage - target Gluttonous Abomination'),
(13,0,71189,0,18,1,38186,0,0, '', 'Dreamwalker''s Rage - target Dream Portal (Pre-effect)'),
(13,0,71189,0,18,1,37945,0,0, '', 'Dreamwalker''s Rage - target Dream Portal'),
(13,0,71189,0,18,1,38429,0,0, '', 'Dreamwalker''s Rage - target Nightmare Portal (Pre-effect)'),
(13,0,71189,0,18,1,38430,0,0, '', 'Dreamwalker''s Rage - target Nightmare Portal'),
(13,0,71189,0,18,1,37907,0,0, '', 'Dreamwalker''s Rage - target Rot Worm');

