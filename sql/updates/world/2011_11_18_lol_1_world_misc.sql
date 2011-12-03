-- Fix Quests 'Norgannon's Shell' [A]12872 [H]12928
SET @NPC_ARCHIVIST_MECHATON := 29775;
SET @SPELL_ARCHIVISTS_SCAN  := 55224;
SET @SPELL_CHARGED_DISK     := 55197;

DELETE FROM `creature_text` WHERE `entry`=@NPC_ARCHIVIST_MECHATON;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@NPC_ARCHIVIST_MECHATON,1,0,'Use of the Inventor\'s Disk detected. Emergency protocol gamma activated.',12,0,100,1,0,0,'Archivist Mechaton'),
(@NPC_ARCHIVIST_MECHATON,2,0,'Verifying status of Norgannon\'s shell.',12,0,100,1,0,0,'Archivist Mechaton'),
(@NPC_ARCHIVIST_MECHATON,3,0,'Norgannon\'s shell accounted for and secure. It will be available for transfer once user\'s identity has been verified.',12,0,100,1,0,0,'Archivist Mechaton'),
(@NPC_ARCHIVIST_MECHATON,4,0,'Standby to verify identity as Keeper Mimir.',12,0,100,1,0,0,'Archivist Mechaton'),
(@NPC_ARCHIVIST_MECHATON,5,0,'%s stuns you as he scans your identity.',16,0,100,1,0,0,'Archivist Mechaton'),
(@NPC_ARCHIVIST_MECHATON,6,0,'Identity verification failed. User is not Keeper Mimir.',12,0,100,1,0,0,'Archivist Mechaton'),
(@NPC_ARCHIVIST_MECHATON,7,0,'The Inventor\'s Disk has fallen into the hands of an unauthorized user. Activating defense protocol.',12,0,100,1,0,0,'Archivist Mechaton'),
(@NPC_ARCHIVIST_MECHATON,8,0,'Impostor must be dealt with. The Inventor\'s Disk must be recovered.',12,0,100,1,0,0,'Archivist Mechaton');

-- creature and objects are spawned by an event
DELETE FROM `creature` WHERE `id`=@NPC_ARCHIVIST_MECHATON;
DELETE FROM `gameobject` WHERE `id` IN (191762,191763);

UPDATE `creature_template` SET `unit_flags`=512|2,`lootid`=`entry`,`AIName`='',`ScriptName`='npc_archivist_mechaton' WHERE `entry`=@NPC_ARCHIVIST_MECHATON;

DELETE FROM `creature_loot_template` WHERE `item`=41258;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES 
(@NPC_ARCHIVIST_MECHATON,41258,-100,1,0,1,1); -- Norgannon's Shell

DELETE FROM `event_scripts` WHERE `id`=19410;
INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(19410,0,10,@NPC_ARCHIVIST_MECHATON,300000,0,7991.799805,-827.638977,968.159973,0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=@SPELL_CHARGED_DISK;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=@SPELL_ARCHIVISTS_SCAN;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(17,0,@SPELL_CHARGED_DISK,0,23,4485,0,0,0,'','Spell: Charged Disk only cast if at Area: Inventor\'s Library'),
(17,0,@SPELL_CHARGED_DISK,1,9,12872,0,0,0,'','Spell: Charged Disk cast only if took Quest'),
(17,0,@SPELL_CHARGED_DISK,1,9,12928,0,0,0,'','Spell: Charged Disk cast only if took Quest'),
(13,0,@SPELL_ARCHIVISTS_SCAN,0,18,1,0,0,0,'','Spell: Archivists Scan only target players');