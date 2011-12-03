-- Gurubashi Blood Drinker SAI
SET @ENTRY := 11353;
SET @SPELL_BLOOD_LEECH := 24437; -- Blood Leech
SET @SPELL_DRAIN_LIFE := 24435; -- Drain Life
UPDATE `creature_template` SET `AIName`='SmartAI',`spell1`=24437,`spell2`=24435,`spell3`=0,`spell4`=0 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,0,0,30,0,0,11,@SPELL_BLOOD_LEECH,1,0,0,0,0,1,0,0,0,0,0,0,0,'Gurubashi Blood Drinker - At 50% HP - Cast Blood Leech');
-- (@ENTRY,0,1,0,0,0,100,0,3000,5000,9000,11000,11,@SPELL_DRAIN_LIFE,1,0,0,0,0,2,0,0,0,0,0,0,0,'Gurubashi Blood Drinker - In Combat - Cast Drain Life'); -- Need spellscript, right now it heals the player for 5000 every second

-- Hakkari Priest SAI
SET @ENTRY := 11830;
SET @SPELL_PSYCHIC_SCREAM := 13704; -- Psychic Scream
SET @SPELL_ANTI_MAGIC_SHIELD := 24021; -- Anti-Magic Shield
SET @SPELL_CLEANSE_NOVA := 24022; -- Cleanse Nova
SET @SPELL_HEAL := 22883; -- Heal
UPDATE `creature_template` SET `AIName`='SmartAI',`mechanic_immune_mask`=`mechanic_immune_mask`|1 WHERE `entry`=@ENTRY; -- Immune to charm effects (mind control)
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,30,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Hakkari Priest - On Aggro - Say Line 0 (random)'),
(@ENTRY,0,1,0,0,0,100,0,8000,8000,27000,27000,11,@SPELL_PSYCHIC_SCREAM,0,0,0,0,0,1,0,0,0,0,0,0,0,'Hakkari Priest - In Combat - Cast Psychic Scream'),
(@ENTRY,0,2,0,0,0,100,0,1000,1000,22000,24000,11,@SPELL_ANTI_MAGIC_SHIELD,0,0,0,0,0,1,0,0,0,0,0,0,0,'Hakkari Priest - In Combat - Cast Anti-Magic Shield'),
(@ENTRY,0,3,0,0,0,100,0,15000,15000,30000,30000,11,@SPELL_CLEANSE_NOVA,0,0,0,0,0,1,0,0,0,0,0,0,0,'Hakkari Priest - In Combat - Cast Cleanse Nova'),
(@ENTRY,0,4,0,2,0,100,1,0,50,0,0,11,@SPELL_HEAL,1,0,0,0,0,1,0,0,0,0,0,0,0,'Hakkari Priest - At 50% HP - Cast Heal');
-- Texts
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'Killing you be easy!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,1,'Troll mojo da strongest mojo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,2,'Your skull gonna decorate our ritual altars!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,3,'I gonna make you into mojo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,4,'Feel da big bad voodoo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,5,'My weapon be thirsty!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,6,'You be dead soon!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines');

-- Gurubashi Axe Thrower SAI
SET @ENTRY := 11350;
SET @SPELL_RANGED_THROW := 22887; -- Ranged Throw
SET @SPELL_FRENZY := 8269; -- Frenzy
SET @SPELL_AXE_FLURRY := 24018; -- Axe Flurry
UPDATE `creature_template` SET `AIName`='SmartAI',`spell1`=22887,`spell2`=24018,`spell3`=8269,`spell4`=0 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,30,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,'Gurubashi Axe Thrower - On Aggro - Say Line 1 (random)'),
(@ENTRY,0,1,0,9,0,100,1,5,30,1500,2000,11,@SPELL_RANGED_THROW,1,0,0,0,0,2,0,0,0,0,0,0,0,'Gurubashi Axe Thrower - On Range - Cast Ranged Throw'),
(@ENTRY,0,2,0,2,0,100,1,0,30,0,0,11,@SPELL_FRENZY,1,0,0,0,0,1,0,0,0,0,0,0,0,'Gurubashi Axe Thrower - At 30% HP - Cast Frenzy'),
(@ENTRY,0,3,0,2,0,100,1,0,30,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Gurubashi Axe Thrower - At 30% HP - Say Line 0'),
(@ENTRY,0,4,0,0,0,100,0,15000,15000,25000,28000,11,@SPELL_AXE_FLURRY,0,0,0,0,0,1,0,0,0,0,0,0,0,'Gurubashi Axe Thrower - In Combat - Cast Axe Flurry');
-- Axe Flurry whirldwind effect will now stun nearby players by throwing axes at them
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=24071 AND `spell_effect`=24020;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(24071,24020,1,'Axe Flurry will now throw axes at nearby players, stunning them');
-- Texts
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'%s goes into a frenzy!',16,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,1,0,'Killing you be easy!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,1,1,'Troll mojo da strongest mojo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,1,2,'Your skull gonna decorate our ritual altars!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,1,3,'I gonna make you into mojo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,1,4,'Feel da big bad voodoo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,1,5,'My weapon be thirsty!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,1,6,'You be dead soon!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines');

-- Portal of Madness SAI
SET @ENTRY := 15141;
SET @SPELL_SUMMON_MAD_VOIDWALKERS := 24622; -- Summon Mad Voidwalkers
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,6000,6000,6000,6000,11,@SPELL_SUMMON_MAD_VOIDWALKERS,0,0,0,0,0,1,0,0,0,0,0,0,0,'Portal of Madness - OCC - Cast Summon Mad Voidwalkers'),
(@ENTRY,0,1,0,11,0,100,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Portal of Madness - On Spawn - Set react state Passive');

-- Mad Voidwalker SAI
SET @ENTRY := 15146;
SET @SPELL_CONSUMING_SHADOW := 24614; -- Consuming Shadows
SET @SPELL_SHADOW_SHOCK := 24616; -- Shadow Shock
UPDATE `creature_template` SET `AIName`='SmartAI',`mechanic_immune_mask`=131073,`flags_extra`=64 WHERE `entry`=@ENTRY; -- Immune to Enslave and Banish and no experience gain
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,89,10,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mad Voidwalker - On spawn - Set random movement'),
(@ENTRY,0,1,0,0,0,100,2,7000,9000,11000,13000,11,@SPELL_CONSUMING_SHADOW,0,0,0,0,0,2,0,0,0,0,0,0,0,'Mad Voidwalker - In Combat - Cast Consuming Shadows'),
(@ENTRY,0,2,0,0,0,100,2,3000,4000,8000,8000,11,@SPELL_SHADOW_SHOCK,0,0,0,0,0,2,0,0,0,0,0,0,0,'Mad Voidwalker - In Combat - Cast Shadow Shock'),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,41,180000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mad Voidwalker - Link - Despawn after 3 minutes');

-- Mad Servant SAI
SET @ENTRY := 15111;
SET @SPELL_PORTAL_OF_MADNESS := 24621; -- Portal of Madness
SET @SPELL_FIREBALL := 24611; -- Fireball
SET @SPELL_FLAMESTRIKE := 24612; -- Flamestrike
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,3000,4000,5000,11,@SPELL_FIREBALL,0,0,0,0,0,5,0,0,0,0,0,0,0,'Mad Servant - In Combat - Cast Fireball'),
(@ENTRY,0,1,0,0,0,100,0,6000,7000,9000,11000,11,@SPELL_FLAMESTRIKE,1,0,0,0,0,5,0,0,0,0,0,0,0,'Mad Servant - In Combat - Cast Flamestrike'),
(@ENTRY,0,2,0,6,0,100,0,0,0,0,0,11,@SPELL_PORTAL_OF_MADNESS,2,0,0,0,0,1,0,0,0,0,0,0,0,'Mad Servant - On Death - Cast Portal of Madness');

-- Razzashi Adder SAI
SET @ENTRY := 11372;
SET @SPELL_VENOM_SPIT := 24011; -- Venom Spit
SET @SPELL_EXPLOIT_WEAKNESS := 24016; -- Exploit Weakness
SET @SPELL_TRASH := 3391; -- Trash
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,85,0,3000,3000,15000,18000,11,@SPELL_VENOM_SPIT,1,0,0,0,0,5,0,0,0,0,0,0,0,'Razzashi Adder - In Combat - Cast Venom Spit'),
(@ENTRY,0,1,0,0,0,100,0,10000,11000,20000,20000,11,@SPELL_EXPLOIT_WEAKNESS,1,0,0,0,0,2,0,0,0,0,0,0,0,'Razzashi Adder - In Combat - Cast Exploit Weakness'),
(@ENTRY,0,2,0,0,0,100,0,9000,9000,11000,14000,11,@SPELL_TRASH,1,0,0,0,0,1,0,0,0,0,0,0,0,'Razzashi Adder - In Combat - Cast Trash');

-- Gurubashi Headhunter SAI
SET @ENTRY := 11351;
SET @SPELL_THROW := 22887; -- Throw
SET @SPELL_WHIRLING_TRIP := 24048; -- Whirling Trip
SET @SPELL_MORTAL_STRIKE := 15708; -- Mortal Strike
UPDATE `creature_template` SET `AIName`='SmartAI',`spell1`=22887,`spell2`=15708,`spell3`=0,`spell4`=0 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,30,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Gurubashi Headhunter - On Aggro - Say Line 0'),
(@ENTRY,0,1,0,9,0,100,0,5,30,1500,2000,11,@SPELL_THROW,1,0,0,0,0,2,0,0,0,0,0,0,0,'Gurubashi Headhunter - On Range - Cast Throw'),
(@ENTRY,0,2,0,0,0,100,0,3000,5000,7000,8000,11,@SPELL_WHIRLING_TRIP,1,0,0,0,0,1,0,0,0,0,0,0,0,'Gurubashi Headhunter - In Combat - Cast Whirlwing Trip'),
(@ENTRY,0,3,0,0,0,100,1,7000,8000,15000,15000,11,@SPELL_MORTAL_STRIKE,1,0,0,0,0,2,0,0,0,0,0,0,0,'Gurubashi Headhunter - In Combat - Cast Mortal Strike');
-- Texts
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'Killing you be easy!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,1,'Troll mojo da strongest mojo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,2,'Your skull gonna decorate our ritual altars!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,3,'I gonna make you into mojo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,4,'Feel da big bad voodoo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,5,'My weapon be thirsty!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,6,'You be dead soon!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines');

-- Hakkari Witch Doctor SAI
SET @ENTRY := 11831;
SET @SPELL_HEX := 24053; -- Hex
SET @SPELL_RELEASE_TOADS := 24058; -- Release Toads - needs work
SET @SPELL_SHADOW_SHOCK := 17289; -- Shadow Shock
UPDATE `creature_template` SET `AIName`='SmartAI',`spell1`=24053,`spell2`=17289,`spell3`=24054,`spell4`=0 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,30,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Hakkari Witch Doctor - On Aggro - Say Line 0'),
(@ENTRY,0,1,0,0,0,100,0,7000,9000,15000,17000,11,@SPELL_HEX,1,0,0,0,0,2,0,0,0,0,0,0,0,'Hakkari Witch Doctor - In Combat - Cast Hex'),
(@ENTRY,0,2,0,0,0,100,0,5000,6000,12000,13000,11,@SPELL_SHADOW_SHOCK,1,0,0,0,0,2,0,0,0,0,0,0,0,'Hakkari Witch Doctor - In Combat - Cast Shadow Shock');
-- (@ENTRY,0,2,0,0,0,100,0,15000,16000,20000,22000,11,@SPELL_RELEASE_TOADS,1,0,0,0,0,1,0,0,0,0,0,0,0,'Hakkari Witch Doctor - Cast Release Toads'); -- Spell needs work
-- Texts
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'Killing you be easy!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,1,'Troll mojo da strongest mojo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,2,'Your skull gonna decorate our ritual altars!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,3,'I gonna make you into mojo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,4,'Feel da big bad voodoo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,5,'My weapon be thirsty!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,6,'You be dead soon!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines');

-- Bloodseeker Bat SAI
SET @ENTRY := 11368;
SET @SPELL_CHARGE := 24023; -- Charge
UPDATE `creature_template` SET `AIName`='SmartAI',`unit_flags`=512 WHERE `entry`=@ENTRY; -- Will now be attackable
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,@SPELL_CHARGE,1,0,0,0,0,2,0,0,0,0,0,0,0,'Bloodseeker Bat - On Aggro - Cast Charge');
-- Charge will now also trigger Fixate (cast on bat)
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=24023 AND `spell_effect`=12021;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(24023,12021,1,'Charge (24023) will now trigger Fixate'); -- Bloodseeker Bat's charge

-- Razzashi Venombrood SAI
SET @ENTRY := 14532;
SET @SPELL_INTOXICATING_VENOM := 24596; -- Intoxicating Venom
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,1,5000,7000,11000,13000,11,@SPELL_INTOXICATING_VENOM,1,0,0,0,0,2,0,0,0,0,0,0,0,'Razzashi Venombrood - In Combat - Cast Intoxicating Venom');

-- Razzashi Broodwidow SAI
SET @ENTRY := 11370;
SET @SPELL_WEB_SPIN := 24600; -- Web Spin
SET @SPELL_SUMMON_RAZZASHI_SKITTERER := 24598; -- Summon Razzashi Skitterer (x5)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,9000,10000,14000,15000,11,@SPELL_WEB_SPIN,1,0,0,0,0,2,0,0,0,0,0,0,0,'Razzashi Broodwidow - In Combat - Cast Web Spin'),
(@ENTRY,0,1,0,6,0,100,0,0,0,0,0,11,@SPELL_SUMMON_RAZZASHI_SKITTERER,2,0,0,0,0,1,0,0,0,0,0,0,0,'Razzashi Broodwidow - On Death - Cast Summon Razzashi Skitterer');

-- Hakkari Shadowcaster SAI
SET @ENTRY := 11338;
SET @SPELL_MANA_BURN := 22947; -- Mana Burn
SET @SPELL_SHADOW_BOLT := 15232; -- Shadow Bolt
SET @SPELL_SHADOW_BOLT_VOLLEY := 20741; -- Shadow Bolt Volley
UPDATE `creature_template` SET `AIName`='SmartAI',`spell1`=15232,`spell2`=20741,`spell3`=0,`spell4`=0 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,6000,11000,13000,11,@SPELL_MANA_BURN,1,0,0,0,0,5,0,0,0,0,0,0,0,'Hakkari Shadowcaster - In Combat - Cast Mana Burn'),
(@ENTRY,0,1,0,0,0,100,0,7000,9000,12000,14000,11,@SPELL_SHADOW_BOLT,1,0,0,0,0,2,0,0,0,0,0,0,0,'Hakkari Shadowcaster - In Combat - Cast Shadow Bolt'),
(@ENTRY,0,2,0,0,0,100,0,7000,9000,12000,14000,11,@SPELL_SHADOW_BOLT_VOLLEY,1,0,0,0,0,2,0,0,0,0,0,0,0,'Hakkari Shadowcaster - In Combat - Cast Shadow Bolt Volley');

-- Razzashi Raptor SAI
SET @ENTRY := 14821;
SET @SPELL_ENRAGE := 8599; -- Enrage
SET @SPELL_INFECTED_BITE := 24339; -- Infected Bite
SET @SPELL_TRASH := 3391; -- Trash
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,6500,6500,8000,8000,11,@SPELL_INFECTED_BITE,1,0,0,0,0,2,0,0,0,0,0,0,0,'Razzashi Raptor - In Combat - Cast Infected Bite'),
(@ENTRY,0,1,0,0,0,100,0,7000,8000,9000,10000,11,@SPELL_TRASH,1,0,0,0,0,1,0,0,0,0,0,0,0,'Razzashi Raptor - In Combat - Cast Trash'),
(@ENTRY,0,2,0,2,0,100,1,0,30,0,0,11,@SPELL_ENRAGE,1,0,0,0,0,1,0,0,0,0,0,0,0,'Razzashi Raptor - At 30% HP - Cast Enrage'),
(@ENTRY,0,3,0,2,0,100,1,0,30,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Razzashi Raptor - At 30% HP - Say Line 0');
-- Enrage text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'%s becomes enraged!',16,0,100,0,0,0,'Razzashi Raptor - At 30% HP - Say Line 0');

-- Gurubashi Champion SAI
SET @ENTRY := 11356;
SET @SPELL_BATTLE_SHOUT := 24438; -- Battle Shout
SET @SPELL_CHARGE := 22886; -- Berserker Charge
SET @SPELL_STRIKE := 22591; -- Strike
SET @SPELL_SHIELD_SLAM := 15655; -- Shield Slam
UPDATE `creature_template` SET `AIName`='SmartAI',`spell1`=22886,`spell2`=22591,`spell3`=15655,`spell4`=0 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,30,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Gurubashi Champion - On aggro - Say Line 0'),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,11,@SPELL_BATTLE_SHOUT,1,0,0,0,0,1,0,0,0,0,0,0,0,'Gurubashi Champion - On Aggro - Cast Battle Shout'),
(@ENTRY,0,2,0,0,0,100,0,3000,3000,9000,10000,11,@SPELL_STRIKE,1,0,0,0,0,2,0,0,0,0,0,0,0,'Gurubashi Champion - In Combat - Cast Strike'),
(@ENTRY,0,3,0,0,0,100,0,11000,13000,20000,22000,11,@SPELL_CHARGE,1,0,0,0,0,2,0,0,0,0,0,0,0,'Gurubashi Champion - In Combat - Cast Berserker Charge'),
(@ENTRY,0,4,0,0,0,100,0,6000,6000,9000,9000,11,@SPELL_SHIELD_SLAM,1,0,0,0,0,2,0,0,0,0,0,0,0,'Gurubashi Champion - In Combat - Cast Shield Shalm');
-- Texts
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'Killing you be easy!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,1,'Troll mojo da strongest mojo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,2,'Your skull gonna decorate our ritual altars!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,3,'I gonna make you into mojo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,4,'Feel da big bad voodoo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,5,'My weapon be thirsty!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,6,'You be dead soon!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines');

-- Zulian Panther SAI
SET @ENTRY := 11365;
SET @SPELL_RAKE := 24332; -- Rake
SET @SPELL_RAVAGE := 24333; -- Ravage
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,4000,9000,11000,13000,11,@SPELL_RAKE,1,0,0,0,0,2,0,0,0,0,0,0,0,'Zulian Panther - In Combat - Cast Rake'),
(@ENTRY,0,1,0,0,0,100,0,11000,12000,22000,23000,11,@SPELL_RAVAGE,1,0,0,0,0,2,0,0,0,0,0,0,0,'Zulian Panther - In Combat - Cast Ravage');

-- Gurubashi SAI
-- This one needs some work. It's summoned when opening a Voodoo Pile (spawned all over the instance) and should mind control the player for some seconds, but SAI refuses to cast the spell
SET @ENTRY := 15047;
SET @SPELL_WILL_OF_HAKKAR := 24178; -- Will of Hakkar
UPDATE `creature_template` SET `AIName`='SmartAI',`unit_flags`=33554434 WHERE `entry`=@ENTRY; -- Set unattackable, untargetable
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Portal of Madness - On Spawn - Set react state Passive'), -- Temporarily workaround. It shouldn't attack players, but need core support for creatures mind controlling players
(@ENTRY,0,1,0,0,0,100,0,5,5,5,5,11,@SPELL_WILL_OF_HAKKAR,1,0,0,0,0,2,0,0,0,0,0,0,0,'Gurubashi - In Combat - Cast Will Of Hakkar');

-- Hakkari Shadow Hunter SAI
SET @ENTRY := 11339;
SET @SPELL_SHOOT := 16496; -- Shoot
SET @SPELL_MULTI_SHOT := 21390; -- Multi-shot
SET @SPELL_WYVERN_STING := 24335; -- Wyvern Sting
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,30,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Hakkari Shadow Hunter - On aggro - Emote Line 0'),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,11,@SPELL_SHOOT,1,0,0,0,0,2,0,0,0,0,0,0,0,'Hakkari Shadow Hunter - On Aggro - Cast Shoot'),
(@ENTRY,0,2,0,0,0,100,0,1000,1000,2000,3000,11,@SPELL_SHOOT,1,0,0,0,0,2,0,0,0,0,0,0,0,'Hakkari Shadow Hunter - In Combat - Cast Shoot'),
(@ENTRY,0,3,0,0,0,100,0,10000,10000,14000,16000,11,@SPELL_MULTI_SHOT,1,0,0,0,0,5,0,0,0,0,0,0,0,'Hakkari Shadow Hunter - In Combat - Cast Multi-Shot'),
(@ENTRY,0,4,0,0,0,100,0,12000,13000,17000,19000,11,@SPELL_WYVERN_STING,1,0,0,0,0,5,0,0,0,0,0,0,0,'Hakkari Shadow Hunter - In Combat - Cast Wyvern Sting');
-- Texts
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'Killing you be easy!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,1,'Troll mojo da strongest mojo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,2,'Your skull gonna decorate our ritual altars!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,3,'I gonna make you into mojo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,4,'Feel da big bad voodoo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,5,'My weapon be thirsty!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,6,'You be dead soon!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines');

-- 24247, 24246, 24222
-- Zulian Prowler SAI
SET @ENTRY := 15101;
SET @SPELL_TRASH := 3391; -- Trash
SET @SPELL_STEALTH := 24246; -- Stealth
SET @SPELL_VANISH_VISUAL := 24222; -- Vanish Visual
SET @SPELL_XXXXXX := 24247; -- Need more information and DBC
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,7000,8000,9000,10000,11,@SPELL_TRASH,1,0,0,0,0,1,0,0,0,0,0,0,0,'Zulian Prowler - In Combat - Cast Trash');
-- (@ENTRY,0,1,0,11,0,100,0,0,0,0,0,11,@SPELL_STEALTH,0,0,0,0,0,1,0,0,0,0,0,0,0,'Zulian Prowler - On Spawn - Cast Stealth'), -- Needs to be implented in DBCs, together with 24247
-- (@ENTRY,0,2,0,11,0,100,0,0,0,0,0,11,@SPELL_VANISH_VISUAL,0,0,0,0,0,1,0,0,0,0,0,0,0,'Zulian Prowler - On Spawn - Cast Vanish Visual');

-- Atal'ai Mistress SAI
SET @ENTRY := 14882;
SET @SPELL_TRASH := 3391; -- Trash
SET @SPELL_CURSE_OF_BLOOD := 24673; -- Curse of Blood
SET @SPELL_SNAP_KICK := 24671; -- Snap Kick
UPDATE `creature_template` SET `AIName`='SmartAI',`spell1`=3391,`spell2`=24673,`spell3`=0,`spell4`=0 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,7000,8000,9000,10000,11,@SPELL_TRASH,1,0,0,0,0,1,0,0,0,0,0,0,0,'Atalai Mistress - In Combat - Cast Trash'),
(@ENTRY,0,1,0,0,0,100,0,11000,14000,22000,22000,11,@SPELL_CURSE_OF_BLOOD,1,0,0,0,0,2,0,0,0,0,0,0,0,'Atalai Mistress - In Combat - Cast Curse of Blood'),
(@ENTRY,0,2,0,0,0,100,0,9000,12000,22000,22000,11,@SPELL_SNAP_KICK,1,0,0,0,0,2,0,0,0,0,0,0,0,'Atalai Mistress - In Combat - Cast Snap Kick');

-- Zulian Crocolisk SAI
SET @ENTRY := 15043;
SET @SPELL_REND := 13445; -- Rend
SET @SPELL_TENDON_RIP := 3604; -- Tendon Rip
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,8000,9000,11000,12000,11,@SPELL_TENDON_RIP,1,0,0,0,0,2,0,0,0,0,0,0,0,'Zulian Crocolisk - In Combat - Cast Tendon Rip'),
(@ENTRY,0,1,0,0,0,100,0,17000,19000,22000,24000,11,@SPELL_REND,1,0,0,0,0,2,0,0,0,0,0,0,0,'Zulian Crocolisk - In Combat - Cast Rend');

-- Hooktooth Frenzy SAI
SET @ENTRY := 11374;
SET @SPELL_PIERCE_ARMOR := 12097; -- Pierce Armor
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_loot_template` WHERE `entry`=@ENTRY AND `item`=19221; -- Remove incorrect item from loot table (Darkmoon Special Reserve)
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,5000,11000,11000,11,@SPELL_PIERCE_ARMOR,1,0,0,0,0,2,0,0,0,0,0,0,0,'Hooktooth Frenzy - In Combat - Cast Pierce Armor');

-- Son of Hakkar SAI
SET @ENTRY := 11357;
SET @SPELL_TRASH := 3391; -- Trash
SET @SPELL_KNOCKDOWN := 16790; -- Knockdown
SET @SPELL_POISONOUS_BLOOD := 24320; -- Poisonous Blood
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,7000,8000,9000,10000,11,@SPELL_TRASH,1,0,0,0,0,1,0,0,0,0,0,0,0,'Son of Hakkar - In Combat - Cast Trash'),
(@ENTRY,0,1,0,0,0,100,0,11000,13000,19000,22000,11,@SPELL_KNOCKDOWN,1,0,0,0,0,2,0,0,0,0,0,0,0,'Son of Hakkar - In Combat - Cast Knockdown'),
(@ENTRY,0,2,0,6,0,100,0,0,0,0,0,11,@SPELL_POISONOUS_BLOOD,2,0,0,0,0,1,0,0,0,0,0,0,0,'Mad Servant - In Combat - Cast Poisonous Blood'); -- Spell needs work

-- Soulflayer SAI
SET @ENTRY := 11359;
SET @SPELL_FEAR := 22678; -- Fear
SET @SPELL_FRENZY := 8269; -- Frenzy
SET @SPELL_SOUL_TAP := 24619; -- Soul Tap
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,16000,19000,2100,23000,11,@SPELL_FEAR,1,0,0,0,0,5,0,0,0,0,0,0,0,'Soulflayer - In Combat - Cast Fear'),
(@ENTRY,0,1,0,0,0,100,0,10000,14000,20000,22000,11,@SPELL_SOUL_TAP,0,0,0,0,0,2,0,0,0,0,0,0,0,'Soulflayer - In Combat - Cast Soul Tap'),
(@ENTRY,0,2,0,2,0,100,1,0,30,0,0,11,@SPELL_FRENZY,1,0,0,0,0,1,0,0,0,0,0,0,0,'Soulflayer - At 30% HP - Cast Frenzy'),
(@ENTRY,0,3,0,2,0,100,1,0,30,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Soulflayer - At 30% HP - Say Line 0');
-- Frenzy text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'%s goes into a frenzy!',16,0,100,0,0,0,'Soulflayer - At 30% HP - Say Line 0');

-- Razzashi Cobra SAI
SET @ENTRY := 11373;
SET @SPELL_POISON := 24097; -- Poison
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,7000,9000,11000,13000,11,@SPELL_POISON,1,0,0,0,0,2,0,0,0,0,0,0,0,'Razzashi Cobra - In Combat - Cast Poison');

-- Hakkari Blood Priest SAI
SET @ENTRY := 11340;
SET @SPELL_DRAIN_LIFE := 24618; -- Drain Life
SET @SPELL_BLOOD_FUNNEL := 24617; -- Blood Funnel
SET @SPELL_DISPEL_MAGIC := 17201; -- Dispel Magic
UPDATE `creature_template` SET `AIName`='SmartAI',`spell1`=24618,`spell2`=0,`spell3`=0,`spell4`=0 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,30,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Hakkari Blood Priest - On Aggro - Emote Line'),
(@ENTRY,0,1,0,0,0,100,0,10000,10000,15000,15000,11,@SPELL_DISPEL_MAGIC,1,0,0,0,0,1,0,0,0,0,0,0,0,'Hakkari Blood Priest - In Combat - Cast Dispel Magic'),
(@ENTRY,0,2,0,2,0,100,0,0,30,0,0,11,@SPELL_DRAIN_LIFE,1,0,0,0,0,1,0,0,0,0,0,0,0,'Hakkari Blood Priest - At 30% HP - Cast Drain Life');
-- (@ENTRY,0,3,0,0,0,85,0,5000,5000,15000,18000,11,@SPELL_BLOOD_FUNNEL,1,0,0,0,0,2,0,0,0,0,0,0,0,'Hakkari Blood Priest - In Combat - Cast Blood Funnel'), -- Need spellscript, heals player (target)
-- Texts
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'Killing you be easy!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,1,'Troll mojo da strongest mojo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,2,'Your skull gonna decorate our ritual altars!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,3,'I gonna make you into mojo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,4,'Feel da big bad voodoo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,5,'My weapon be thirsty!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,6,'You be dead soon!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines');

-- Voodoo Slave SAI
SET @ENTRY := 14883;
SET @SPELL_LIGHTNING_BLAST := 43996; -- Lightning Blast
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,1,0,0,0,100,0,3000,3000,6000,9000,11,@SPELL_LIGHTNING_BLAST,1,0,0,0,0,2,0,0,0,0,0,0,0,'Voodoo Slave - In Combat - Cast Lightning Blast');

-- Withered Mistress SAI
SET @ENTRY := 14825;
SET @SPELL_CURSE := 24673; -- Curse of Blood
SET @SPELL_DISPEL := 17201; -- Dispel Magic
SET @SPELL_VEIL_OF_SHADOW := 24674; -- Veil of Shadow
SET @SPELL_UNHOLY_FRENZY := 24672; -- Unholy Frenzy
UPDATE `creature_template` SET `AIName`='SmartAI',`spell1`=3391,`spell2`=24673,`spell3`=0,`spell4`=0 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,11000,14000,22000,22000,11,@SPELL_CURSE,1,0,0,0,0,2,0,0,0,0,0,0,0,'Withered Mistress - In Combat - Cast Curse of Blood'),
(@ENTRY,0,1,0,0,0,100,0,4000,5000,23000,26000,11,@SPELL_DISPEL,0,0,0,0,0,1,0,0,0,0,0,0,0,'Withered Mistress - In Combat - Cast Dispel Magic'),
(@ENTRY,0,2,0,2,0,100,1,0,50,0,0,11,@SPELL_UNHOLY_FRENZY,1,0,0,0,0,1,0,0,0,0,0,0,0,'Withered Mistress - At 50% HP - Cast Unholy Frenzy'),
(@ENTRY,0,3,0,2,0,100,1,0,20,0,0,11,@SPELL_UNHOLY_FRENZY,1,0,0,0,0,1,0,0,0,0,0,0,0,'Withered Mistress - At 20% HP - Cast Unholy Frenzy');

-- Zulian Cub SAI
SET @ENTRY := 11360;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,0,0,15,0,0,25,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Zulian Cub - At 15% HP - Flee'),
(@ENTRY,0,1,0,2,0,100,1,0,15,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Zulian Cub - At 15% HP - Emote line 0');
-- Insert emote
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'%s attempts to run away in fear!',16,0,100,0,0,0,'Zulian Cub - At 15% HP - Emote line 0');

-- Gurubashi Berserker SAI
SET @ENTRY := 11352;
SET @SPELL_THUNDERCLAP := 15588; -- Thunderclap
SET @SPELL_KNOCK_AWAY := 11130; -- Knock Away
SET @SPELL_INTIMIDATING_ROAR := 16508; -- Intimidating Roar
SET @SPELL_FRENZY := 8269; -- Frenzy
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,3000,15000,15000,11,@SPELL_INTIMIDATING_ROAR,1,0,0,0,0,2,0,0,0,0,0,0,0,'Gurubashi Berserker - In Combat - Cast Intimidating Roar'),
(@ENTRY,0,1,0,0,0,100,0,10000,10000,12000,12000,11,@SPELL_KNOCK_AWAY,1,0,0,0,0,2,0,0,0,0,0,0,0,'Gurubashi Berserker - In Combat - Cast Knock Away'),
(@ENTRY,0,2,0,0,0,100,0,5000,5000,13000,18000,11,@SPELL_THUNDERCLAP,1,0,0,0,0,1,0,0,0,0,0,0,0,'Gurubashi Berserker - In Combat - Cast Thunderclap'),
(@ENTRY,0,3,0,2,0,100,1,0,30,0,0,11,@SPELL_FRENZY,1,0,0,0,0,1,0,0,0,0,0,0,0,'Gurubashi Berserker - At 30% HP - Cast Frenzy'),
(@ENTRY,0,4,0,2,0,100,1,0,30,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Gurubashi Berserker - At 30% HP - Emote Line 0');
-- Frenzy text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'%s goes into a frenzy!',16,0,100,0,0,0,'Gurubashi Berserker - At 30% HP - Emote Line 0');

-- Razzashi Serpent SAI
SET @ENTRY := 11371;
SET @SPELL_FATAL_BITE := 20539; -- Fatal Bite
SET @SPELL_PIERCE_ARMOR := 12097; -- Pierce Armor
SET @SPELL_TRANQUILIZING_POISON := 24002; -- Tranquilizing Poison
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,7000,9000,12000,15000,11,@SPELL_FATAL_BITE,1,0,0,0,0,2,0,0,0,0,0,0,0,'Razzashi Serpent - In Combat - Cast Fatal Bite'),
(@ENTRY,0,1,0,0,0,100,0,9000,11000,14000,17000,11,@SPELL_TRANQUILIZING_POISON,1,0,0,0,0,5,0,0,0,0,0,0,0,'Razzashi Serpent - In Combat - Cast Tranquilizing Poison'),
(@ENTRY,0,2,0,0,0,100,0,3000,5000,11000,11000,11,@SPELL_PIERCE_ARMOR,1,0,0,0,0,2,0,0,0,0,0,0,0,'Razzashi Serpent - In Combat - Cast Pierce Armor');

-- Skullspitter Speaker SAI
SET @ENTRY := 11390;
SET @SPELL_HEAD_CRACK := 16172; -- Head Crack
SET @SPELL_WHIRLING_TRIP := 24048; -- Whirling Trip
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,16000,19000,1100,13000,11,@SPELL_HEAD_CRACK,1,0,0,0,0,2,0,0,0,0,0,0,0,'Skullspitter Speaker - In Combat - Cast Head Crack'),
(@ENTRY,0,1,0,0,0,100,0,8000,9000,7000,8000,11,@SPELL_WHIRLING_TRIP,1,0,0,0,0,2,0,0,0,0,0,0,0,'Skullspitter Speaker - In Combat - Cast Whirlwing Trip');
-- Remove old addon data
DELETE FROM `creature_addon` WHERE `guid`=49257;
DELETE FROM `creature_template_addon` WHERE `entry`=@ENTRY;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@ENTRY,0,8,1,0,NULL); -- Make Skullspitter Speaker kneel

-- Bloodscalp Speaker SAI
SET @ENTRY := 11389;
SET @SPELL_DISARM := 6713; -- Disarm
SET @SPELL_REND := 16509; -- Rend
SET @SPELL_ENRAGE := 8599; -- Enrage
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,6000,9000,11000,13000,11,@SPELL_REND,1,0,0,0,0,2,0,0,0,0,0,0,0,'Bloodscalp Speaker - In Combat - Cast Rend'),
(@ENTRY,0,1,0,0,0,100,0,9000,10000,13000,16000,11,@SPELL_DISARM,1,0,0,0,0,2,0,0,0,0,0,0,0,'Bloodscalp Speaker - In Combat - Cast Disarm');
-- Remove old addon data
DELETE FROM `creature_addon` WHERE `guid`=49288;
DELETE FROM `creature_template_addon` WHERE `entry`=@ENTRY;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@ENTRY,0,8,1,0,NULL); -- Make Bloodscalp Speaker kneel

-- Vilebranch Speaker SAI
SET @ENTRY := 11391;
SET @SPELL_CLEAVE := 15284; -- Cleave
SET @SPELL_DEMORALIZING_SHOUT := 13730; -- Demoralizing Shout
SET @SPELL_ENRAGE := 8599; -- Enrage
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,@SPELL_DEMORALIZING_SHOUT,1,0,0,0,0,2,0,0,0,0,0,0,0,'Vilebranch Speaker - On Aggro - Cast Demoralizing Shout'),
(@ENTRY,0,1,0,0,0,100,0,9000,10000,1300,16000,11,@SPELL_CLEAVE,1,0,0,0,0,2,0,0,0,0,0,0,0,'Vilebranch Speaker - In Combat - Cast Cleave');
-- Remove old addon data
DELETE FROM `creature_addon` WHERE `guid`=49656;
DELETE FROM `creature_template_addon` WHERE `entry`=@ENTRY;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@ENTRY,0,0,1,20,NULL); -- Make Vilebranch Speaker beg

-- Witherbark Speaker SAI
SET @ENTRY := 11388;
SET @SPELL_EARTH_SHOCK := 22885; -- Earth Shock
SET @SPELL_FROST_SHOCK := 21401; -- Frost Shock
SET @SPELL_LIGHTNING_BOLT := 15801; -- Lightning Bolt
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,@SPELL_FROST_SHOCK,0,0,0,0,0,2,0,0,0,0,0,0,0,'Witherbark Speaker - On Aggro - Cast Frost Shock'),
(@ENTRY,0,1,0,0,0,100,0,9000,10000,13000,16000,11,@SPELL_LIGHTNING_BOLT,0,0,0,0,0,2,0,0,0,0,0,0,0,'Witherbark Speaker - In Combat - Cast Lightning Bolt'),
(@ENTRY,0,2,0,0,0,100,0,5000,7000,10000,11000,11,@SPELL_EARTH_SHOCK,0,0,0,0,0,2,0,0,0,0,0,0,0,'Witherbark Speaker - In Combat - Cast Earth Shock');
-- Remove old addon data
DELETE FROM `creature_addon` WHERE `guid`=49657;
DELETE FROM `creature_template_addon` WHERE `entry`=@ENTRY;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@ENTRY,0,0,1,20,NULL); -- Make Witherbark Speaker beg

-- Gurubashi Bat Rider SAI
SET @ENTRY := 14750;
SET @SPELL_DEMORALIZING_SHOUT := 23511; -- Demoralizing Shout
SET @SPELL_BATTLE_COMMAND := 5115; -- Battle Command
SET @SPELL_INFECTED_BITE := 16128; -- Infected Bite
SET @SPELL_TRASH := 3391; -- Trash
SET @SPELL_UNSTABLE_CONCOCTION := 24024; -- Unstable Concoction
SET @SPELL_THROW_LIQUID_FIRE := 23968; -- Throw Liquid Fire
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,@SPELL_DEMORALIZING_SHOUT,0,0,0,0,0,2,0,0,0,0,0,0,0,'Gurubashi Bat Rider - On Aggro - Cast Demoralizing Shout'),
(@ENTRY,0,1,0,0,0,100,0,8000,8000,25000,25000,11,@SPELL_BATTLE_COMMAND,0,0,0,0,0,1,0,0,0,0,0,0,0,'Gurubashi Bat Rider - On Combat - Cast Battle Command'),
(@ENTRY,0,2,0,0,0,100,0,6500,6500,8000,8000,11,@SPELL_INFECTED_BITE,0,0,0,0,0,2,0,0,0,0,0,0,0,'Gurubashi Bat Rider - On Combat - Cast Infected Bite'),
(@ENTRY,0,3,0,0,0,100,0,6000,6000,6000,6000,11,@SPELL_TRASH,0,0,0,0,0,1,0,0,0,0,0,0,0,'Gurubashi Bat Rider - On Combat - Cast Trash'),
(@ENTRY,0,4,0,2,0,100,1,0,30,0,0,11,@SPELL_UNSTABLE_CONCOCTION,4,0,0,0,0,1,0,0,0,0,0,0,0,'Gurubashi Bat Rider - At 30% HP - Cast Unstable Concoction'),
(@ENTRY,0,5,0,2,0,100,1,0,30,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Gurubashi Bat Rider - At 30% HP - Emote Line 0');
-- Insert emote
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'%s fully engulfs in flame and a maddened look appears in his eyes!',16,0,100,0,0,0,'Gurubashi Bat Rider - On Unstable Concoction cast - Emote Line 0');

-- Variable
SET @GOSSIP := 21258; -- gossip_menu.entry

-- Set actual gossip for Zanza the Restless
UPDATE `creature_template` SET `gossip_menu_id`=@GOSSIP+0 WHERE `entry`=15042;

-- Insert gossip menu itself
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP+0 AND `text_id`=7594;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP+0,7594);
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP+0 AND `text_id`=7595;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP+0,7595);
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP+1 AND `text_id`=7596;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP+1,7596);
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP+2 AND `text_id`=7597;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP+2,7597);
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP+3 AND `text_id`=7598;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP+3,7598);

-- Insert the gossip menu options, redirects to the next page which forms a short story by Zanza
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (@GOSSIP+0,@GOSSIP+1,@GOSSIP+2);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@GOSSIP+0,0,0,'I think I have heard of this magic.',1,3,@GOSSIP+1,0,0,0,''),
(@GOSSIP+1,0,0,'Arcanum? That sounds very familiar.',1,3,@GOSSIP+2,0,0,0,''),
(@GOSSIP+2,0,0,'What are the components?',1,3,@GOSSIP+3,0,0,0,'');

-- Conditions for gossip menu, the 'story' Zanza tells you becomes available when you hit exalted with Zandalar Tribe.
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` BETWEEN @GOSSIP+0 AND @GOSSIP+3;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`Comment`) VALUES
(14,@GOSSIP+0,7594,0,5,270,3,0,0,"Only show text_id 7594 if player is neutral with Zandalar Tribe (270)"),
(14,@GOSSIP+0,7594,1,5,270,4,0,0,"Only show text_id 7594 if player is friendly with Zandalar Tribe (270)"),
(14,@GOSSIP+0,7594,2,5,270,5,0,0,"Only show text_id 7594 if player is honored with Zandalar Tribe (270)"),
(14,@GOSSIP+0,7594,3,5,270,6,0,0,"Only show text_id 7594 if player is reveved with Zandalar Tribe (270)"),
(14,@GOSSIP+0,7595,0,5,270,7,0,0,"Only show text_id 7595 if player is exalted with Zandalar Tribe (270)"),
(15,@GOSSIP+0,0,0,5,270,7,0,0,"Only show gossip option if player is exalted with Zandalar Tribe (270)"),
(15,@GOSSIP+1,0,0,5,270,7,0,0,"Only show gossip option if player is exalted with Zandalar Tribe (270)"),
(15,@GOSSIP+2,0,0,5,270,7,0,0,"Only show gossip option if player is exalted with Zandalar Tribe (270)");

-- Zanza's Potent Potables
UPDATE `quest_template` SET `RequestItemsText`='With your increased status amongst the tribe comes access to some of our more potent potables. Behold... these brews are strong in the mojo - blessed by Zanza and fit for adventurers from all walks of life!$B$BI will allow you to choose one from the three I offer; in exchange, I require one Zandalar Honor Token. Note that only the effects of a single one may course through your spirit at any given time.$B$BLet me know when you''re ready to barter!' WHERE `entry`=8243;

-- Essence Mangoes
UPDATE `quest_template` SET `RequestItemsText`='The extremely potent essence mango grows across many of the islands in the South Seas. A single mango will refresh those who eat it,both physically and mentally. If you''ve never had one,you do yourself a disservice!$B$BWe have enough of a supply here on the isle to offer you a handful in exchange for a Zandalar Honor Token. Speak with Vinchaxa if you need to learn how to get tokens; otherwise, let''s get to the business at hand!' WHERE `entry`=8196;

-- Signets of the Zandalar
UPDATE `quest_template` SET `RequestItemsText`='$N - for someone as exalted among the Zandalar as you are,I have something very special for you. Direct from our home in the South Seas... the Signets of the Zandalar! These signets are used to enhance any shoulder item you may possess. Should you seek might,mojo,or serenity - I have what you need!$B$BI ask for fifteen Zandalar Honor Tokens in exchange for your choice of one signet. If you have the tokens ready,then I''m ready to make a deal!' WHERE `entry`=8246;

-- Zandalar Headhsrinkers
UPDATE `creature` SET `position_x`=-11786.887695,`position_y`=1253.674072,`position_z`=0.959927,`orientation`=2.357351 WHERE `guid`=285;
UPDATE `creature` SET `position_x`=-11750.439453,`position_y`=1309.479858,`position_z`=2.551236,`orientation`=4.998511 WHERE `guid`=283;
UPDATE `creature` SET `MovementType`=0,`spawndist`=0 WHERE `guid` IN (285,283,284,280);

-- One missing Zandalar Headhsrinker spawn
-- This was the best guid I could find which was not in use
DELETE FROM `creature` WHERE `guid`=200615 AND `id`=14876;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES 
(200615,14876,0,1,1,14998,0,-11775.231445,1358.505981,0.776265,1.409376,1800,0,0,7326,2434,2,0,0,0);

-- Set Zandalar Enforcer's home position next to cage
UPDATE `creature` SET `position_x`=-11834.728516,`position_y`=1257.751221,`position_z`=2.153508,`orientation`=5.568032 WHERE `guid`=314;

-- Set Captured Hakkari Zealot's home position in cage
UPDATE `creature` SET `position_x`=-11838.209961,`position_y`=1256.006836,`position_z`=2.081958,`orientation`=5.776157 WHERE `guid`=2368;
DELETE FROM `creature_addon` WHERE `guid`=2368; -- Remove kneel from Zealot, happens in conversation

-- Make Exzhal face his object, he faces Captured Hakkari Zealot in conversation
UPDATE `creature` SET `orientation`=5.821840 WHERE `guid`=312;

-- Remove Circle of Binding - should be summoned in conversation between Exzhal and Captured Hakkari Zealot
DELETE FROM `gameobject` WHERE `guid`=12165;

-- Molthor SAI
SET @ENTRY := 14875;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,64,0,100,0,0,0,0,0,5,4,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Molthor - On Gossip Hello - Play Emote Cheer");

-- Zandalar Headshrinker: 14876
SET @GUID := 287;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11829.594727,`position_y`=1269.249512,`position_z`=1.430709,`orientation`=1.842991 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11835.188477,1288.131714,1.291541,0,0,0,100,0),
(@PATH,2,-11829.594727,1269.249512,1.430709,0,0,0,100,0),
(@PATH,3,-11823.579102,1251.472412,2.542836,0,0,0,100,0),
(@PATH,4,-11823.824219,1252.372681,2.492942,0,0,0,100,0),
(@PATH,5,-11814.262695,1246.662720,2.205406,0,0,0,100,0),
(@PATH,6,-11791.875977,1262.220703,1.538649,0,0,0,100,0),
(@PATH,7,-11766.643555,1275.045776,3.064182,0,0,0,100,0),
(@PATH,8,-11791.875977,1262.220703,1.538649,0,0,0,100,0),
(@PATH,9,-11814.262695,1246.662720,2.205406,0,0,0,100,0),
(@PATH,10,-11823.824219,1252.372681,2.492942,0,0,0,100,0),
(@PATH,11,-11823.579102,1251.472412,2.542836,0,0,0,100,0),
(@PATH,12,-11829.594727,1269.249512,1.430709,0,0,0,100,0),
(@PATH,13,-11835.188477,1288.131714,1.291541,0,0,0,100,0);

-- Zandalar Headshrinker: 14876
SET @GUID := 286;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11832.375977,`position_y`=1271.938721,`position_z`=1.459813,`orientation`=1.842991 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11837.279297,1288.950317,1.512615,0,0,0,100,0),
(@PATH,2,-11832.375977,1271.938721,1.459813,0,0,0,100,0),
(@PATH,3,-11825.054688,1251.701782,2.429044,0,0,0,100,0),
(@PATH,4,-11823.474609,1249.535645,2.501543,0,0,0,100,0),
(@PATH,5,-11813.486328,1243.423096,1.650653,0,0,0,100,0),
(@PATH,6,-11809.788086,1243.615967,1.399789,0,0,0,100,0),
(@PATH,7,-11794.386719,1257.631592,1.222988,0,0,0,100,0),
(@PATH,8,-11789.625000,1260.664429,1.522318,0,0,0,100,0),
(@PATH,9,-11764.781250,1273.674072,2.998039,0,0,0,100,0),
(@PATH,10,-11789.625000,1260.664429,1.522318,0,0,0,100,0),
(@PATH,11,-11794.386719,1257.631592,1.222988,0,0,0,100,0),
(@PATH,12,-11809.788086,1243.615967,1.399789,0,0,0,100,0),
(@PATH,13,-11813.486328,1243.423096,1.650653,0,0,0,100,0),
(@PATH,14,-11823.474609,1249.535645,2.501543,0,0,0,100,0),
(@PATH,15,-11825.054688,1251.701782,2.429044,0,0,0,100,0),
(@PATH,16,-11832.375977,1271.938721,1.459813,0,0,0,100,0),
(@PATH,17,-11837.279297,1288.950317,1.512615,0,0,0,100,0);

-- Zandalar Headshrinker: 14876
SET @GUID := 282;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11828.326172,`position_y`=1234.463989,`position_z`=0.780894,`orientation`=5.261924 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11824.317383,1227.511108,0.670448,0,0,0,100,0),
(@PATH,2,-11839.237305,1241.058105,1.519958,0,0,0,100,0),
(@PATH,3,-11846.645508,1243.729980,4.5744192,0,0,0,100,0),
(@PATH,4,-11841.049805,1260.212158,10.099603,0,0,0,100,0),
(@PATH,5,-11841.225586,1264.016235,11.571445,0,0,0,100,0),
(@PATH,6,-11842.425781,1267.932251,12.456536,0,0,0,100,0),
(@PATH,7,-11846.776367,1270.782959,14.125699,0,0,0,100,0),
(@PATH,8,-11850.278320,1271.012329,15.261613,0,0,0,100,0),
(@PATH,9,-11853.373047,1268.856567,16.700747,0,0,0,100,0),
(@PATH,10,-11855.116211,1264.943848,18.011517,0,0,0,100,0),
(@PATH,11,-11857.451172,1254.989014,21.714193,0,0,0,100,0),
(@PATH,12,-11851.708008,1250.510010,21.714193,0,0,0,100,0),
(@PATH,13,-11857.451172,1254.989014,21.714193,0,0,0,100,0),
(@PATH,14,-11855.116211,1264.943848,18.011517,0,0,0,100,0),
(@PATH,15,-11853.373047,1268.856567,16.700747,0,0,0,100,0),
(@PATH,16,-11850.278320,1271.012329,15.261613,0,0,0,100,0),
(@PATH,17,-11846.776367,1270.782959,14.125699,0,0,0,100,0),
(@PATH,18,-11842.425781,1267.932251,12.456536,0,0,0,100,0),
(@PATH,19,-11841.225586,1264.016235,11.571445,0,0,0,100,0),
(@PATH,20,-11841.049805,1260.212158,10.099603,0,0,0,100,0),
(@PATH,21,-11846.645508,1243.729980,4.5744192,0,0,0,100,0),
(@PATH,22,-11839.237305,1241.058105,1.519958,0,0,0,100,0),
(@PATH,23,-11824.317383,1227.511108,0.670448,0,0,0,100,0);

-- Hakkari Oracle: 14876
SET @GUID := 748;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11915.200195,`position_y`=-943.197021,`position_z`=52.455700,`orientation`=1.575122 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11915.455078,-884.229614,32.811508,10000,0,0,100,0),
(@PATH,2,-11915.200195,-943.197021,52.455700,0,0,0,100,0),
(@PATH,3,-11915.335938,-971.741028,62.940353,0,0,0,100,0),
(@PATH,4,-11915.582031,-997.877869,67.938759,0,0,0,100,0),
(@PATH,5,-11915.845703,-1047.903076,69.805588,0,0,0,100,0),
(@PATH,6,-11915.582031,-997.877869,67.938759,0,0,0,100,0),
(@PATH,7,-11915.335938,-971.741028,62.940353,0,0,0,100,0),
(@PATH,8,-11915.200195,-943.197021,52.455700,0,0,0,100,0);

-- Hakkari Oracle SAI
SET @ENTRY := 11346;
SET @SPELL_EARTH_SHOCK := 15501; -- Earth Shock
SET @SPELL_CHAIN_LIGHTNING := 16006; -- Chain Lightning
SET @SPELL_HEALING_WAVE := 15982; -- Healing Wave
UPDATE `creature_template` SET `AIName`='SmartAI',`spell1`=0,`spell2`=0,`spell3`=0,`spell4`=0 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,1000,1000,12000,15000,11,@SPELL_CHAIN_LIGHTNING,0,0,0,0,0,2,0,0,0,0,0,0,0,'Hakkari Oracle - In Combat - Cast Chain Lightning'),
(@ENTRY,0,1,0,0,0,100,0,4000,5000,19000,20000,11,@SPELL_EARTH_SHOCK,0,0,0,0,0,2,0,0,0,0,0,0,0,'Hakkari Oracle - In Combat - Cast Earth Shock'),
(@ENTRY,0,2,0,2,0,100,1,0,50,0,0,11,@SPELL_HEALING_WAVE,1,0,0,0,0,1,0,0,0,0,0,0,0,'Hakkari Oracle - At 50% HP - Cast Healing Wave');

-- Gurubashi Warrior SAI
SET @ENTRY := 11355;
SET @SPELL_KNOCKDOWN := 11428; -- Knockdown
SET @SPELL_ENRAGE := 8599; -- Enrage
UPDATE `creature_template` SET `AIName`='SmartAI',`spell1`=0,`spell2`=0,`spell3`=0,`spell4`=0,`mechanic_immune_mask`=1 WHERE `entry`=@ENTRY; -- Immune to charm effects (mind control)
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,4000,12000,15000,11,@SPELL_KNOCKDOWN,0,0,0,0,0,2,0,0,0,0,0,0,0,'Gurubashi Warrior - In Combat - Cast Knockdown'),
(@ENTRY,0,1,0,2,0,100,1,0,30,0,0,11,@SPELL_ENRAGE,1,0,0,0,0,1,0,0,0,0,0,0,0,'Gurubashi Warrior - At 30% HP - Cast Enrage'),
(@ENTRY,0,2,0,2,0,100,1,0,30,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Gurubashi Warrior - At 30% HP - Say Line 0');
-- Enrage text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'%s becomes enraged!',16,0,100,0,0,0,'Gurubashi Warrior - At 30% HP - Say Line 0');

-- High Priestess Hai'watna SAI
SET @ENTRY := 11383;
SET @SPELL_SHADOW_BOLT_VOLLEY := 14887; -- Shadow Bolt Volley
SET @SPELL_HEAL := 15586; -- Heal
UPDATE `creature_template` SET `AIName`='SmartAI',`spell1`=0,`spell2`=0,`spell3`=0,`spell4`=0 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,1000,1000,12000,15000,11,@SPELL_SHADOW_BOLT_VOLLEY,0,0,0,0,0,2,0,0,0,0,0,0,0,'High Priestess Haiwatna - In Combat - Cast Shadow Bolt Volley'),
(@ENTRY,0,1,0,0,0,100,0,20000,25000,29000,31000,11,@SPELL_HEAL,0,0,0,0,0,1,0,0,0,0,0,0,0,'High Priestess Haiwatna - In Combat - Cast Heal');

-- All emotes, mostly ONESHOT_TALK
DELETE FROM `creature_addon` WHERE `guid` IN (49115,49114,49742,49741,49754,49120,49121,49122,49738,49105,49104,49737,91479,91478,91511,91512,91465,91464,49702,49701,91477,91476,91495,91496,49703,49704,91491,91490,91442,91443,49753,49314,49313,49310,49784,49785,49778,49779,49780,51459,51456,51457,51966,51965,49273,49272,49786,49787,49280,49281,49279,49799,49798,49797,49796,49795,49793,49794);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(49115,0,0,0,0,1,''),(49114,0,0,0,0,1,''),(49742,0,0,0,0,1,''),(49741,0,0,0,0,1,''),(49754,0,0,0,0,1,''),(49120,0,0,0,0,1,''),
(49121,0,0,0,0,1,''),(49122,0,0,0,0,1,''),(49738,0,0,0,0,1,''),(49105,0,0,0,0,1,''),(49104,0,0,0,0,1,''),(49737,0,0,0,0,1,''),
(91479,0,0,0,0,1,''),(91478,0,0,0,0,1,''),(91511,0,0,0,0,1,''),(91512,0,0,0,0,1,''),(91465,0,0,0,0,1,''),(91464,0,0,0,0,1,''),
(91496,0,0,0,0,1,''),(91495,0,0,0,0,1,''),(91476,0,0,0,0,1,''),(91477,0,0,0,0,1,''),(49701,0,0,0,0,1,''),(49702,0,0,0,0,1,''),
(49703,0,0,0,0,1,''),(49704,0,0,0,0,1,''),(91491,0,0,0,0,1,''),(91490,0,0,0,0,1,''),(91442,0,0,0,0,1,''),(91443,0,0,0,0,1,''),
(49784,0,0,0,0,1,''),(49785,0,0,0,0,1,''),(49778,0,0,0,0,1,''),(49779,0,0,0,0,1,''),(49780,0,0,0,0,1,''),(51459,0,0,0,0,1,''),
(51456,0,0,0,0,1,''),(51457,0,0,0,0,1,''),(51966,0,0,0,0,1,''),(51965,0,0,0,0,1,''),(49273,0,0,0,0,1,''),(49272,0,0,0,0,1,''),
(49786,0,0,0,0,1,''),(49787,0,0,0,0,1,''),(49280,0,0,0,0,1,''),(49281,0,0,0,0,1,''),(49279,0,0,0,0,1,''),(49799,0,0,0,0,1,''),
(49798,0,0,0,0,1,''),(49797,0,0,0,0,1,''),(49753,0,0,0,0,1,''),(49314,0,0,8,0,0,''),(49313,0,0,8,0,0,''),(49310,0,0,0,0,1,''),
(49794,0,0,0,0,333,''),(49796,0,0,0,0,333,''),(49795,0,0,0,0,333,''),(49793,0,0,0,0,333,'');

-- Set correct positions
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-11960.496094,`position_y`=-1558.178711,`position_z`=41.212128,`orientation`=2.233450 WHERE `guid`=49097; -- Razzashi Serpent
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-11971.704102,`position_y`=-1549.167236,`position_z`=41.434246,`orientation`=5.631021 WHERE `guid`=49096; -- Razzashi Adder
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-12010.169922,`position_y`=-1485.053101,`position_z`=79.251274,`orientation`=5.129887 WHERE `guid`=49121; -- Gurubashi Headhunter
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-12006.965820,`position_y`=-1484.825195,`position_z`=79.190865,`orientation`=4.628802 WHERE `guid`=49122; -- Hakkari Witch Doctor
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-11981.070313,`position_y`=-1475.364746,`position_z`=79.736366,`orientation`=0.874606 WHERE `guid`=49193; -- Gurubashi Bat Rider
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-11988.361328,`position_y`=-1621.758301,`position_z`=33.236633,`orientation`=2.167352 WHERE `guid`=49104; -- Gurubashi Axe Thrower
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-12054.768555,`position_y`=-1685.999512,`position_z`=43.074993,`orientation`=1.606618 WHERE `guid`=49752; -- Hakkari Priest
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-11929.511719,`position_y`=-1844.217651,`position_z`=57.701702,`orientation`=0.172101 WHERE `guid`=49056; -- Mad Servant
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-11596.799805,`position_y`=-1757.020020,`position_z`=39.871101,`orientation`=5.515240 WHERE `guid`=91464; -- Gurubashi Axe Thrower
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-11649.000000,`position_y`=-1568.680054,`position_z`=39.392300,`orientation`=4.206240 WHERE `guid`=91476; -- Gurubashi Axe Thrower
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`orientation`=0.382538 WHERE `guid` IN (51396,51395); -- Gurubashi Berserker
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`orientation`=1.396260 WHERE `guid`=49120; -- Gurubashi Headhunter
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`orientation`=5.497790 WHERE `guid`=49105; -- Gurubashi Axe Thrower
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`orientation`=3.388120 WHERE `guid`=49059; -- Mad Servant
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`orientation`=0.000000 WHERE `guid`=49060; -- Mad Servant
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`orientation`=2.460910 WHERE `guid`=49285; -- Razzashi Raptor
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`orientation`=5.284594 WHERE `guid`=51576; -- Razzashi Raptor
UPDATE `creature` SET `MovementType`=0,`spawndist`=0 WHERE `guid` IN (51382,51375,51381,51383,51372,51370,51369,49359,49361,49362,49218,49219,49234,49235,49259,49260,91463,91462,91461,91459,91460,91439,49140,49139);

-- Double spawned creatures. Removing addon data to prevent errors
DELETE FROM `creature` WHERE `guid`=49806 AND `id`=11360; 
DELETE FROM `creature_addon` WHERE `guid`=49806;
DELETE FROM `creature` WHERE `guid`=49056 AND `id`=15111;
DELETE FROM `creature_addon` WHERE `guid` IN (15111,49056);
DELETE FROM `creature` WHERE `guid` IN (49221,49220) AND `id` IN (14880);
DELETE FROM `creature_addon` WHERE `guid` IN (49221,49220);
DELETE FROM `creature` WHERE `guid` IN (49142,49141,49149) AND `id` IN (14750);
DELETE FROM `creature_addon` WHERE `guid` IN (49142,49141,49149);
DELETE FROM `creature` WHERE `guid` IN (49138,49137) AND `id` IN (11368);
DELETE FROM `creature_addon` WHERE `guid` IN (49138,49137);

-- Missing spawns
-- Hakkari Priest
DELETE FROM `creature` WHERE `guid`=200616 AND `id`=11830;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES 
(200616,11830,309,1,1,11758,0,-11942.391602,-1640.220825,42.506130,2.932328,7200,0,0,17094,12170,0,0,0,0);
-- Razzashi Adder
DELETE FROM `creature` WHERE `guid` IN (200617,200618) AND `id` IN (11372);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(200617,11372,309,1,1,15150,0,-11997.982422,-1650.174438,34.328613,1.432994,7200,0,0,15260,0,2,0,0,0),
(200618,11372,309,1,1,15150,0,-11986.670898,-1651.959961,33.775238,1.432994,7200,0,0,15260,0,2,0,0,0);
-- Gurubashi Blood Drinker (this guid was used by a double-spawned NPC)
DELETE FROM `creature` WHERE `guid` IN (200619,200620) AND `id` IN (11353);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(200619,11353,309,1,1,11080,0,-11609.610352,-1631.155518,39.957348,3.214375,7200,0,0,18312,0,0,0,0,0),
(200620,11353,309,1,1,11081,0,-11608.893555,-1609.535156,40.082027,2.992088,7200,0,0,18312,0,0,0,0,0);

-- Zulian Panther pathing: 11365
SET @GUID := 49320;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11626.807617,`position_y`=-1701.435425,`position_z`=38.823635 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11626.807617,-1701.435425,38.823635,0,1,0,100,0),
(@PATH,2,-11627.707031,-1727.870483,40.333164,0,1,0,100,0),
(@PATH,3,-11629.434570,-1760.955322,38.754513,0,1,0,100,0),
(@PATH,4,-11653.967773,-1807.740723,43.086334,0,1,0,100,0),
(@PATH,5,-11629.434570,-1760.955322,38.754513,0,1,0,100,0),
(@PATH,6,-11627.707031,-1727.870483,40.333164,0,1,0,100,0),
(@PATH,7,-11630.115234,-1687.330566,39.997681,0,1,0,100,0),
(@PATH,8,-11634.075195,-1596.245239,39.645630,0,0,0,100,0);

-- Make the two other panthers follow 49320 (leader)
UPDATE `creature` SET `MovementType`=2 WHERE `guid` IN (49320,49319,49318);
DELETE FROM `creature_formations` WHERE `leaderGUID`=49320;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(49320,49320,0,0,2),
(49320,49319,3,225,2),
(49320,49318,3,90,2);

-- Hakkari Priest pathing: 11830
SET @GUID := 49752; -- Hakkari Priest leads
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-12054.799805,`position_y`=-1686.000000,`position_z`=43.075001 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-12059.555664,-1691.853027,43.423206,0,0,0,100,0),
(@PATH,2,-12059.799805,-1701.031494,44.344296,0,0,0,100,0),
(@PATH,3,-12053.253906,-1720.945435,48.184185,0,0,0,100,0),
(@PATH,4,-12043.537109,-1733.467651,51.260815,0,0,0,100,0),
(@PATH,5,-12034.110352,-1742.581421,53.809147,0,0,0,100,0),
(@PATH,6,-12043.537109,-1733.467651,51.260815,0,0,0,100,0),
(@PATH,7,-12053.253906,-1720.945435,48.184185,0,0,0,100,0),
(@PATH,8,-12059.799805,-1701.031494,44.344296,0,0,0,100,0),
(@PATH,9,-12059.555664,-1691.853027,43.423206,0,0,0,100,0),
(@PATH,10,-12058.425781,-1681.930420,42.665642,0,0,0,100,0),
(@PATH,11,-12042.879883,-1650.618164,40.627056,0,0,0,100,0),
(@PATH,12,-12034.342773,-1643.789551,39.795006,0,0,0,100,0),
(@PATH,13,-12009.803711,-1642.433350,35.999470,0,0,0,100,0),
(@PATH,14,-11992.014648,-1646.609253,34.173782,0,0,0,100,0),
(@PATH,15,-11962.285156,-1644.002441,36.924133,0,0,0,100,0),
(@PATH,16,-11951.910156,-1638.948730,38.838421,0,0,0,100,0),
(@PATH,17,-11949.411133,-1628.985229,39.359371,0,0,0,100,0),
(@PATH,18,-11946.486328,-1619.823486,41.083221,0,0,0,100,0),
(@PATH,19,-11947.083984,-1614.833984,39.48743,0,0,0,100,0),
(@PATH,20,-11943.375000,-1576.649292,38.514889,0,0,0,100,0),
(@PATH,21,-11942.552734,-1568.465454,41.119324,0,0,0,100,0),
(@PATH,23,-11941.658203,-1559.485596,39.735973,0,0,0,100,0),
(@PATH,24,-11938.247070,-1554.563354,39.750710,0,0,0,100,0),
(@PATH,25,-11918.897461,-1550.056152,38.295830,0,0,0,100,0),
(@PATH,26,-11903.013672,-1537.574463,31.093979,0,0,0,100,0),
(@PATH,27,-11900.709961,-1530.430054,28.203531,10000,0,0,100,0),
(@PATH,28,-11903.013672,-1537.574463,31.093979,0,0,0,100,0),
(@PATH,29,-11918.897461,-1550.056152,38.295830,0,0,0,100,0),
(@PATH,30,-11938.247070,-1554.563354,39.750710,0,0,0,100,0),
(@PATH,31,-11941.658203,-1559.485596,39.735973,0,0,0,100,0),
(@PATH,32,-11943.507813,-1569.661377,40.848972,0,0,0,100,0),
(@PATH,33,-11943.375000,-1576.649292,38.514889,0,0,0,100,0),
(@PATH,34,-11947.083984,-1614.833984,39.48743,0,0,0,100,0),
(@PATH,36,-11946.486328,-1619.823486,41.083221,0,0,0,100,0),
(@PATH,37,-11949.411133,-1628.985229,39.359371,0,0,0,100,0),
(@PATH,38,-11951.910156,-1638.948730,38.838421,0,0,0,100,0),
(@PATH,39,-11962.285156,-1644.002441,36.924133,0,0,0,100,0),
(@PATH,40,-11992.014648,-1646.609253,34.173782,0,0,0,100,0),
(@PATH,41,-12009.803711,-1642.433350,35.999470,0,0,0,100,0),
(@PATH,42,-12034.342773,-1643.789551,39.795006,0,0,0,100,0),
(@PATH,43,-12042.879883,-1650.618164,40.627056,0,0,0,100,0),
(@PATH,44,-12058.425781,-1681.930420,42.665642,0,0,0,100,0),
(@PATH,45,-12059.555664,-1691.853027,43.423206,0,0,0,100,0),
(@PATH,46,-12059.799805,-1701.031494,44.344296,0,0,0,100,0),
(@PATH,47,-12053.253906,-1720.945435,48.184185,0,0,0,100,0),
(@PATH,48,-12043.537109,-1733.467651,51.260815,0,0,0,100,0),
(@PATH,49,-12034.110352,-1742.581421,53.809147,0,0,0,100,0),
(@PATH,50,-12043.537109,-1733.467651,51.260815,0,0,0,100,0),
(@PATH,51,-12053.253906,-1720.945435,48.184185,0,0,0,100,0),
(@PATH,52,-12059.799805,-1701.031494,44.344296,0,0,0,100,0),
(@PATH,53,-12059.555664,-1691.853027,43.423206,0,0,0,100,0);

-- Make the Gurubashi Axe Thrower follow the Hakkari Priest
UPDATE `creature` SET `MovementType`=2 WHERE `guid` IN (49752,49751);
DELETE FROM `creature_formations` WHERE `leaderGUID`=49752;
DELETE FROM `creature_formations` WHERE `memberGUID`=49751;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(49752,49752,0,0,2),
(49752,49751,3,200,2);

-- Note: those should go faster but it's not possible. The `move_flag` column is limited!
-- Razzashi Skitterer pathing: 14880
SET @GUID := 49763;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-12121.770508,`position_y`=-1781.804077,`position_z`=80.251060 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-12121.770508,-1781.804077,80.251060,1000,1,0,100,0),
(@PATH,2,-12107.982422,-1754.442871,81.616844,1000,1,0,100,0),
(@PATH,3,-12106.101563,-1742.353638,80.255928,1000,1,0,100,0),
(@PATH,4,-12126.319336,-1719.959229,80.978317,1000,1,0,100,0),
(@PATH,5,-12107.717773,-1699.646362,81.238678,1000,1,0,100,0),
(@PATH,6,-12133.279297,-1669.547363,82.450058,1000,1,0,100,0),
(@PATH,7,-12138.102539,-1669.364258,85.529083,1000,1,0,100,0),
(@PATH,8,-12161.593750,-1692.840698,95.234123,1000,1,0,100,0),
(@PATH,9,-12165.793945,-1692.938721,97.776299,1000,1,0,100,0),
(@PATH,10,-12191.083008,-1669.304321,111.627693,1000,1,0,100,0),
(@PATH,11,-12195.055664,-1669.150146,113.257439,1000,1,0,100,0),
(@PATH,12,-12215.911133,-1692.359497,122.447922,1000,1,0,100,0),
(@PATH,13,-12220.180664,-1692.659546,124.706985,1000,1,0,100,0),
(@PATH,14,-12221.366211,-1670.207275,126.270119,1000,1,0,100,0),
(@PATH,15,-12215.528320,-1669.463379,122.749390,1000,1,0,100,0),
(@PATH,16,-12183.934570,-1689.368286,106.393227,1000,1,0,100,0),
(@PATH,17,-12164.437500,-1681.142578,95.410744,1000,1,0,100,0),
(@PATH,18,-12145.658203,-1670.292603,89.038513,1000,1,0,100,0),
(@PATH,19,-12134.544922,-1682.580444,82.284355,1000,1,0,100,0),
(@PATH,20,-12126.685547,-1692.754028,81.543770,1000,1,0,100,0),
(@PATH,21,-12108.330078,-1725.148071,80.870346,1000,1,0,100,0),
(@PATH,22,-12123.732422,-1739.145386,80.321144,1000,1,0,100,0),
(@PATH,23,-12111.660156,-1760.424561,80.601723,1000,1,0,100,0);

-- Make them follow each other
UPDATE `creature` SET `MovementType`=2 WHERE `guid` IN (49763,49762);
DELETE FROM `creature_formations` WHERE `leaderGUID`=49763;
DELETE FROM `creature_formations` WHERE `memberGUID`=49762;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(49763,49763,0,0,2),
(49763,49762,3,180,2);

-- Gurubashi Bat Rider pathing: 14750
SET @GUID := 49130;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-12244.3,`position_y`=-1422.24,`position_z`=130.774 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-12274.899414,-1414.912354,130.601059,0,0,0,100,0),
(@PATH,2,-12295.537109,-1443.068726,130.600327,0,0,0,100,0),
(@PATH,3,-12292.955078,-1465.422241,130.604462,0,0,0,100,0),
(@PATH,4,-12263.731445,-1485.708252,130.600510,0,0,0,100,0),
(@PATH,5,-12236.019531,-1462.886475,130.611526,0,0,0,100,0),
(@PATH,6,-12216.861328,-1455.598511,130.600693,0,0,0,100,0),
(@PATH,7,-12219.386719,-1437.946533,130.600693,0,0,0,100,0);

-- Following bats, leader is Gurubashi Bat Rider
UPDATE `creature` SET `MovementType`=2 WHERE `guid` IN (49130,49129,49123,49128,49127,49124,49125);
DELETE FROM `creature_formations` WHERE `leaderGUID`=49130;
DELETE FROM `creature_formations` WHERE `memberGUID` IN (49129,49123,49128,49127,49124,49125);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(49130,49130,0,0,2),
(49130,49129,6,0,2),
(49130,49123,6,60,2),
(49130,49128,6,120,2),
(49130,49127,6,180,2),
(49130,49124,6,240,2),
(49130,49125,6,300,2);

-- Gurubashi Bat Rider pathing: 14750
SET @GUID := 49185;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-12277.5,`position_y`=-1444.66,`position_z`=130.725 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-12279.888672,-1448.802124,130.600830,0,0,0,100,0),
(@PATH,2,-12274.909180,-1430.427979,130.601120,0,0,0,100,0),
(@PATH,3,-12244.499023,-1423.547974,130.601120,0,0,0,100,0),
(@PATH,4,-12224.520508,-1436.454224,130.601135,0,0,0,100,0),
(@PATH,5,-12212.955078,-1451.349609,130.600372,0,0,0,100,0),
(@PATH,6,-12233.332031,-1465.460449,130.600296,0,0,0,100,0),
(@PATH,7,-12255.265625,-1464.750000,130.600754,0,0,0,100,0);

-- Following bats, leader is Gurubashi Bat Rider
UPDATE `creature` SET `MovementType`=2 WHERE `guid` IN (49185,49167,49157,49156,49158);
DELETE FROM `creature_formations` WHERE `leaderGUID`=49185;
DELETE FROM `creature_formations` WHERE `memberGUID` IN (49167,49157,49156,49158);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(49185,49185,0,0,2),
(49185,49167,6,0,2),
(49185,49157,6,90,2),
(49185,49156,6,190,2),
(49185,49158,6,270,2);

-- Gurubashi Bat Rider pathing: 14750
SET @GUID := 49189;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-12170.500000,`position_y`=-1467.250000,`position_z`=130.725006 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-12131.439453,-1464.801758,130.600494,0,0,0,100,0),
(@PATH,2,-12170.894531,-1464.666138,130.602112,0,0,0,100,0),
(@PATH,3,-12196.201172,-1460.112305,131.453781,0,0,0,100,0),
(@PATH,4,-12211.844727,-1477.258057,130.900391,0,0,0,100,0),
(@PATH,5,-12196.201172,-1460.112305,131.453781,0,0,0,100,0),
(@PATH,6,-12170.894531,-1464.666138,130.602112,0,0,0,100,0);

-- Following bats, leader is Gurubashi Bat Rider
UPDATE `creature` SET `MovementType`=2 WHERE `guid` IN (49189,49188,49187,49186);
DELETE FROM `creature_formations` WHERE `leaderGUID`=49189;
DELETE FROM `creature_formations` WHERE `memberGUID` IN (49188,49187,49186);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(49189,49189,0,0,2),
(49189,49188,6,0,2),
(49189,49187,6,120,2),
(49189,49186,6,240,2);

-- Gurubashi Bat Rider pathing: 14750
SET @GUID := 49155;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-12152.967773,`position_y`=-1487.547241,`position_z`=130.881485 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-12186.473633,-1478.295776,130.600891,0,0,0,100,0),
(@PATH,2,-12206.798828,-1462.722656,131.283966,0,0,0,100,0),
(@PATH,3,-12195.971680,-1452.815918,130.631592,0,0,0,100,0),
(@PATH,4,-12175.709961,-1458.300659,130.601974,0,0,0,100,0),
(@PATH,5,-12155.517578,-1455.088135,130.601059,0,0,0,100,0),
(@PATH,6,-12136.959961,-1455.091919,130.601059,0,0,0,100,0),
(@PATH,7,-12125.050781,-1468.265625,130.600433,0,0,0,100,0),
(@PATH,8,-12150.831055,-1484.939819,130.655197,0,0,0,100,0);

-- Following bats, leader is Gurubashi Bat Rider
UPDATE `creature` SET `MovementType`=2 WHERE `guid` IN (49155,49154,49151,49150);
DELETE FROM `creature_formations` WHERE `leaderGUID`=49155;
DELETE FROM `creature_formations` WHERE `memberGUID` IN (49154,49151,49150);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(49155,49155,0,0,2),
(49155,49154,6,0,2),
(49155,49151,6,120,2),
(49155,49150,6,240,2);

-- Gurubashi Bat Rider pathing: 14750
SET @GUID := 49147;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-12055.000000,`position_y`=-1443.459961,`position_z`=130.014999 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-12072.780273,-1448.517334,130.204498,0,0,0,100,0),
(@PATH,2,-12098.666992,-1451.737915,130.774368,20000,0,0,100,0), -- Wait 20 seconds
(@PATH,3,-12072.780273,-1448.517334,130.204498,0,0,0,100,0),
(@PATH,4,-12056.207031,-1442.100464,130.156296,0,0,0,100,0);

-- Following bats, leader is Gurubashi Bat Rider
UPDATE `creature` SET `MovementType`=2 WHERE `guid` IN (49147,49143,49144,49145,49146);
DELETE FROM `creature_formations` WHERE `leaderGUID`=49147;
DELETE FROM `creature_formations` WHERE `memberGUID` IN (49143,49144,49145,49146);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(49147,49147,0,0,2),
(49147,49143,6,90,2),
(49147,49144,6,180,2),
(49147,49145,6,270,2),
(49147,49146,6,360,2);

-- Bloodseeker Bat pathing: 11368
-- This one is done in move_flag run, makes it look better. Still looks horrible though =/
SET @GUID := 91555;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-12300.099609,`position_y`=-1370.160034,`position_z`=144.891006,`orientation`=5.4159 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-12280.832031,-1391.850098,149.030792,0,1,0,100,0),
(@PATH,2,-12279.230469,-1431.357666,150.007248,0,1,0,100,0),
(@PATH,3,-12263.227539,-1460.766235,147.386337,0,1,0,100,0),
(@PATH,4,-12231.422852,-1469.367920,148.652176,0,1,0,100,0),
(@PATH,5,-12220.394531,-1434.480347,151.252106,0,1,0,100,0),
(@PATH,6,-12246.502930,-1412.346069,152.635223,0,1,0,100,0);
DELETE FROM `creature_text` WHERE `entry`=36627 AND `groupid`=9;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(36627,9,0,'|TInterface\Icons\ability_creature_disease_02.blp:16|tYou have |cFF00FF00Mutated Infection!|r',42,0,0,0,0,0,'Rotface - EMOTE_MUTATED_INFECTION');

DELETE FROM `spell_dbc` WHERE `id`=18350;
INSERT INTO `spell_dbc` (`id`,`Effect1`,`EffectImplicitTargetA1`,`Comment`) VALUES
(18350,3,1,'Soul Preserver trinket spell');

DELETE FROM `spell_script_names` WHERE `spell_id`=18350;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(18350,'spell_gen_soul_preserver');
