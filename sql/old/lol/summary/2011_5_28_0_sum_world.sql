-- Fix InhabitType for Mana Snapper (Netherstorm)
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=18883;

DELETE FROM `conditions` WHERE `SourceEntry` IN (62385,62386,62387,62521,62525,62524);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`)
VALUES
(13,0,62385,0,18,1,32906,0,0,'','Brightleaf\'s Essence'),
(13,0,62386,0,18,1,32906,0,0,'','Stonebarks\'s Essence'),
(13,0,62387,0,18,1,32906,0,0,'','Ironbranch\'s Essence'),
(13,0,62521,0,18,1,32906,0,0,'','Attuned to Nature 25 Dose Reduction'),
(13,0,62524,0,18,1,32906,0,0,'','Attuned to Nature 2 Dose Reduction'),
(13,0,62525,0,18,1,32906,0,0,'','Attuned to Nature 10 Dose Reduction');
-- Trigger flag
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128 WHERE `entry`=34129;

-- Delete NPC which is not supposed to be here
DELETE FROM `creature` WHERE `guid`=136607;

-- Immunity
UPDATE `creature_template` SET `mechanic_immune_mask`=650854239 WHERE `entry`=32906;

-- Spell Difficulties
DELETE FROM `spelldifficulty_dbc` WHERE `id` BETWEEN 3240 AND 3250;
INSERT INTO `spelldifficulty_dbc` (`id`,`spellid0`,`spellid1`,`spellid2`,`spellid3`)
VALUES
(3240,63169,63549,0,0), -- Ulduar: Corrupted Servitor - Petrify Joints
(3241,63082,63559,0,0), -- Ulduar: Misguided Nymph - Bind Life
(3242,63111,63562,0,0), -- Ulduar: Misguided Nymph - Frost Spear
(3243,63136,63564,0,0), -- Ulduar: Misguided Nymph - Winter's Embrace
(3244,63047,63550,0,0), -- Ulduar: Guardian Lasher - Guardian's Lash
(3245,63242,63556,0,0), -- Ulduar: Mangrove Ent - Nourish
(3246,63241,63554,0,0), -- Ulduar: Mangrove Ent - Tranquility
(3247,63240,63553,0,0), -- Ulduar: Ironroot Lasher - Ironroot Thorns
(3248,63247,63568,0,0), -- Ulduar: Nature's Blade - Living Tsunami
(3249,63226,63551,0,0), -- Ulduar: Guardian of Life - Poison Breath
(3250,64587,34650,0,0); -- Ulduar: Nature Bomb - Nature Bomb
UPDATE `creature_template` SET `ScriptName`='boss_freya' WHERE `entry`=32906;
UPDATE `creature_template` SET `ScriptName`='boss_elder_brightleaf' WHERE `entry`=32915;
UPDATE `creature_template` SET `ScriptName`='boss_elder_ironbranch' WHERE `entry`=32913;
UPDATE `creature_template` SET `ScriptName`='boss_elder_stonebark' WHERE `entry`=32914;
UPDATE `creature_template` SET `ScriptName`='npc_ancient_conservator' WHERE `entry`=33203;
UPDATE `creature_template` SET `ScriptName`='npc_snaplasher' WHERE `entry`=32916;
UPDATE `creature_template` SET `ScriptName`='npc_storm_lasher' WHERE `entry`=32919;
UPDATE `creature_template` SET `ScriptName`='npc_ancient_water_spirit' WHERE `entry`=33202;
UPDATE `creature_template` SET `ScriptName`='npc_detonating_lasher' WHERE `entry`=32918;
UPDATE `creature_template` SET `ScriptName`='npc_sun_beam' WHERE `entry`=33170;
UPDATE `creature_template` SET `ScriptName`='npc_nature_bomb' WHERE `entry`=34129;
UPDATE `creature_template` SET `ScriptName`='npc_eonars_gift' WHERE `entry`=33228;
UPDATE `creature_template` SET `ScriptName`='npc_healthy_spore' WHERE `entry`=33215;
UPDATE `creature_template` SET `ScriptName`='npc_unstable_sun_beam' WHERE `entry`=33050;
UPDATE `creature_template` SET `ScriptName`='npc_iron_roots' WHERE `entry` IN (33088,33168);
DELETE FROM `spell_script_names` WHERE `spell_id` IN (62519,65158,65160);
INSERT INTO `spell_script_names`
VALUES
(62519, 'spell_freya_attuned_to_nature'),
(65158, 'spell_freya_iron_roots'),
(65160, 'spell_freya_iron_roots');
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~0x02000100 WHERE `entry` IN (37007,38031);

DELETE FROM `creature_template_addon` WHERE `entry` IN (37007,38031);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(37007,0,0x0000000,0,0,'70733'),
(38031,0,0x0000000,0,0,'70733');

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_icc_stoneform';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_icc_sprit_alarm';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(70733, 'spell_icc_stoneform'),
(70546, 'spell_icc_sprit_alarm'),
(70536, 'spell_icc_sprit_alarm'),
(70545, 'spell_icc_sprit_alarm'),
(70547, 'spell_icc_sprit_alarm');

DELETE FROM `creature_text` WHERE `entry`=37007;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(37007,0,0, 'The master''s sanctum has been disturbed!',1,0,0,0,0,16865, 'Deathbound Ward - SAY_TRAP_ACTIVATE'),
(37007,0,1, 'I... awaken!',1,0,0,0,0,16866, 'Deathbound Ward - SAY_TRAP_ACTIVATE'),
(37007,0,2, 'Who... goes there...?',1,0,0,0,0,16867, 'Deathbound Ward - SAY_TRAP_ACTIVATE');

SET @Zul = 23863; -- Zul'jin (ZA)
UPDATE `creature_template` SET `speed_walk`=2.4,`speed_run`=2.14286 WHERE `entry`=@Zul;
UPDATE `creature_model_info` SET `bounding_radius`=1.566,`combat_reach`=3.6,`gender`=0 WHERE `modelid`=21899;
DELETE FROM `creature_template_addon` WHERE `entry`=@Zul;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@Zul,0,0,1,0, NULL);

/* should this be set by core script or DB?
SET @EquiEntry = XXX; -- (creature_equip_template.entry - need 1)
UPDATE `creature_template` SET `equipment_id`=@EquiEntry WHERE `entry`=@Zul;
DELETE FROM `creature_equip_template` WHERE `entry`=@EquiEntry;
INSERT INTO `creature_equip_template` (`entry`,`equipentry1`,`equipentry2`,`equipentry3`) VALUES
(@EquiEntry,33975,0,0);*/

/* Ruby Sanctum template updates */
SET @EquiEntry = 2466; -- (creature_equip_template.entry - need 7)

-- Template
UPDATE `creature_template` SET `exp`=2,`equipment_id`=@EquiEntry+0 WHERE `entry`=39746; -- General Zarithrian
UPDATE `creature_template` SET `exp`=2 WHERE `entry`=39747; -- Saviana Ragefire
UPDATE `creature_template` SET `exp`=2,`equipment_id`=@EquiEntry+1 WHERE `entry`=39751; -- Baltharus the Warborn
UPDATE `creature_template` SET `exp`=2,`minlevel`=80,`maxlevel`=80,`unit_flags`=`unit_flags`|0x2000000,`speed_run`=0.99206 WHERE `entry`=39794; -- Zarithrian Spawn Stalker
UPDATE `creature_template` SET `exp`=2,`baseattacktime`=2000,`unit_flags`=`unit_flags`|0x8000,`equipment_id`=@EquiEntry+2 WHERE `entry`=39814; -- Onyx Flamecaller (flying)
UPDATE `creature_template` SET `baseattacktime`=1500,`unit_flags`=`unit_flags`|0x8040 WHERE `entry`=39863; -- Halion
UPDATE `creature_template` SET `exp`=2,`baseattacktime`=2000,`unit_flags`=`unit_flags`|0x40,`equipment_id`=@EquiEntry+1 WHERE `entry`=39899; -- Baltharus the Warborn (clone)
UPDATE `creature_template` SET `exp`=2,`unit_flags`=`unit_flags`|0x2000000,`unit_class`=1 WHERE `entry`=40001; -- Combustion
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|0x2000000,`unit_class`=2 WHERE `entry`=40029; -- Meteor Strike
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|0x2000000,`unit_class`=2 WHERE `entry`=40041; -- Meteor Strike
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|0x2000000,`unit_class`=2 WHERE `entry`=40042; -- Meteor Strike
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|0x2000000,`unit_class`=2 WHERE `entry`=40043; -- Meteor Strike
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|0x2000000,`unit_class`=2 WHERE `entry`=40044; -- Meteor Strike
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|0x2000000,`unit_class`=2 WHERE `entry`=40055; -- Meteor Strike
UPDATE `creature_template` SET `exp`=2,`baseattacktime`=2000,`unit_flags`=`unit_flags`|0x2000100,`speed_run`=0.42857 WHERE `entry`=40081; -- Orb Carrier (vehicle)
UPDATE `creature_template` SET `exp`=2,`baseattacktime`=2000,`unit_flags`=`unit_flags`|0x2000000,`speed_run`=0.85714 WHERE `entry`=40083; -- Shadow Orb
UPDATE `creature_template` SET `baseattacktime`=2000,`unit_flags`=`unit_flags`|0x2000100,`speed_run`=0.78571 WHERE `entry`=40091; -- Orb Rotation Focus
UPDATE `creature_template` SET `exp`=2,`baseattacktime`=2000,`unit_flags`=`unit_flags`|0x2000000,`speed_run`=0.85714 WHERE `entry`=40100; -- Shadow Orb
UPDATE `creature_template` SET `exp`=2,`baseattacktime`=1500,`unit_flags`=`unit_flags`|0x88840,`dynamicflags`=`dynamicflags`|0xC WHERE `entry`=40142; -- Halion (P2)
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|0x2000100 WHERE `entry`=40146; -- Halion Controller
UPDATE `creature_template` SET `exp`=2,`baseattacktime`=2000,`unit_flags`=`unit_flags`|0x8040,`equipment_id`=@EquiEntry+3,`unit_class`=8 WHERE `entry`=40417; -- Charscale Invoker
UPDATE `creature_template` SET `exp`=2,`baseattacktime`=2000,`unit_flags`=`unit_flags`|0x8040,`equipment_id`=@EquiEntry+4 WHERE `entry`=40419; -- Charscale Assaulter
UPDATE `creature_template` SET `exp`=2,`baseattacktime`=1250,`unit_flags`=`unit_flags`|0x8040,`equipment_id`=@EquiEntry+5 WHERE `entry`=40421; -- Charscale Elite
UPDATE `creature_template` SET `exp`=2,`baseattacktime`=2000,`unit_flags`=`unit_flags`|0x8040,`equipment_id`=@EquiEntry+6 WHERE `entry`=40423; -- Charscale Commander
UPDATE `creature_template` SET `exp`=2,`unit_flags`=`unit_flags`|0x8000,`unit_class`=8 WHERE `entry`=40429; -- Sanctum Guardian Xerestrasza
UPDATE `creature_template` SET `exp`=2,`unit_flags`=`unit_flags`|0x22040300 WHERE `entry`=40626; -- Ruby Drakonid
UPDATE `creature_template` SET `exp`=2,`unit_flags`=`unit_flags`|0x22040300 WHERE `entry`=40627; -- Ruby Drake
UPDATE `creature_template` SET `exp`=2,`unit_flags`=`unit_flags`|0x22040300 WHERE `entry`=40628; -- Ruby Scalebane
UPDATE `creature_template` SET `exp`=2,`unit_flags`=`unit_flags`|0x22040300 WHERE `entry`=40870; -- Ruby Dragon

-- Equips
DELETE FROM `creature_equip_template` WHERE `entry` BETWEEN @EquiEntry AND @EquiEntry+6;
INSERT INTO `creature_equip_template` (`entry`,`itemEntry1`,`itemEntry2`,`itemEntry3`) VALUES 
(@EquiEntry+0,43111,0,0),
(@EquiEntry+1,28365,0,0),
(@EquiEntry+2,19355,0,0),
(@EquiEntry+3,43114,0,0),
(@EquiEntry+4,5597,0,0),
(@EquiEntry+5,49737,49737,0),
(@EquiEntry+6,40608,0,0);

-- Model
UPDATE `creature_model_info` SET `bounding_radius`=1.75,`combat_reach`=1,`gender`=0 WHERE `modelid`=32179; -- General Zarithrian
UPDATE `creature_model_info` SET `bounding_radius`=2.625,`combat_reach`=5.25,`gender`=1 WHERE `modelid`=31577; -- Saviana Ragefire
UPDATE `creature_model_info` SET `bounding_radius`=3,`combat_reach`=9,`gender`=0 WHERE `modelid`=31761; -- Baltharus the Warborn
UPDATE `creature_model_info` SET `bounding_radius`=1.8,`combat_reach`=1,`gender`=2 WHERE `modelid`=31952; -- Halion
UPDATE `creature_model_info` SET `bounding_radius`=2,`combat_reach`=4,`gender`=2 WHERE `modelid`=16946; -- Combustion
UPDATE `creature_model_info` SET `bounding_radius`=1.5,`combat_reach`=5,`gender`=0 WHERE `modelid`=14308; -- Charscale Assaulter
UPDATE `creature_model_info` SET `bounding_radius`=0.67025,`combat_reach`=2.625,`gender`=1 WHERE `modelid`=31962; -- Sanctum Guardian Xerestrasza
UPDATE `creature_model_info` SET `bounding_radius`=1.875,`combat_reach`=6.25,`gender`=0 WHERE `modelid`=32105; -- Ruby Drakonid
UPDATE `creature_model_info` SET `bounding_radius`=3.75,`combat_reach`=4.375,`gender`=0 WHERE `modelid`=32104; -- Ruby Scalebane
UPDATE `creature_model_info` SET `bounding_radius`=1,`combat_reach`=1,`gender`=1 WHERE `modelid`=2718; -- Ruby Dragon

-- Addon
UPDATE `creature_template_addon` SET `bytes1`=0,`bytes2`=0x1,`mount`=0,`emote`=0,`auras`='29266' WHERE `entry`=40626; -- Ruby Drakonid (Permanent Feing Death)
UPDATE `creature_template_addon` SET `bytes1`=0,`bytes2`=0x1,`mount`=0,`emote`=0,`auras`='29266' WHERE `entry`=40627; -- Ruby Drake (Permanent Feing Death)
UPDATE `creature_template_addon` SET `bytes1`=0,`bytes2`=0x1,`mount`=0,`emote`=0,`auras`='29266' WHERE `entry`=40628; -- Ruby Scalebane (Permanent Feing Death)
UPDATE `creature_template_addon` SET `bytes1`=0,`bytes2`=0x1,`mount`=0,`emote`=0,`auras`='29266' WHERE `entry`=40870; -- Ruby Dragon (Permanent Feing Death)
DELETE FROM `creature_template_addon` WHERE `entry` IN (39746,39747,39751,39794,39814,39863,40001,40029,40041,40042,40043,40044,40055,40081,40083,40091,40100,40142,40146,40417,40419,40421,40423,40429);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(39746,0,0,0x1,0, NULL), -- General Zarithrian
(39747,0,0,0x1,0, NULL), -- Saviana Ragefire
(39751,0,0,0x1,0, NULL), -- Baltharus the Warborn
(39794,0,0,0x1,0, NULL), -- Zarithrian Spawn Stalker
(39814,0,0,0x1,0, NULL), -- Onyx Flamecaller
(39863,0,0,0x1,0, NULL), -- Halion
(40001,0,0,0x1,0, NULL), -- Combustion
(40029,0,0,0x1,0, NULL), -- Meteor Strike
(40041,0,0,0x1,0, NULL), -- Meteor Strike
(40042,0,0,0x1,0, NULL), -- Meteor Strike
(40043,0,0,0x1,0, NULL), -- Meteor Strike
(40044,0,0,0x1,0, NULL), -- Meteor Strike
(40055,0,0,0x1,0, NULL), -- Meteor Strike
(40081,0,0x3000000,0x1,0, NULL), -- Orb Carrier
(40083,0,0x2000000,0x1,0, NULL), -- Shadow Orb
(40091,0,0,0x1,0, NULL), -- Orb Rotation Focus
(40100,0,0x2000000,0x1,0, NULL), -- Shadow Orb
(40142,0,0,0x1,0, NULL), -- Halion
(40146,0,0,0x1,0, NULL), -- Halion Controller
(40417,0,0,0x1,0, NULL), -- Charscale Invoker
(40419,0,0,0x1,0, NULL), -- Charscale Assaulter
(40421,0,0,0x1,0, NULL), -- Charscale Elite
(40423,0,0,0x1,0, NULL), -- Charscale Commander
(40429,0,0,0x1,0, NULL); -- Sanctum Guardian Xerestrasza

-- GOs
UPDATE `gameobject_template` SET `flags`=`flags`|0x30 WHERE `entry`=203007; -- Ruby Sanctum Halion Flame Ring

SET @Valkyr = 38391; -- Val'kyr Guardian
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|0x8000,`AIName`='SmartAI' WHERE `entry`=@Valkyr; -- unk_15
UPDATE `creature_model_info` SET `bounding_radius`=0.124,`combat_reach`=1.6,`gender`=1 WHERE `modelid`=31181;
DELETE FROM `creature_template_addon` WHERE `entry`=@Valkyr;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@Valkyr,0,50331648,1,0, NULL);

DELETE FROM `smart_scripts` WHERE `entryorguid`=@Valkyr;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@Valkyr,0,0,0,25,0,100,0,0,0,0,0,58,1,71841,1500,2500,45,0,1,0,0,0,0,0,0,0, 'Val''kyr Guardian - On reset install AI template caster - Cast Smite every 1.5/2.5 seconds');

UPDATE `gameobject_template` SET `flags`=`flags`|32,`faction`=35 WHERE `entry`=195527; -- Argent Coliseum Floor

DELETE FROM `creature_text` WHERE `entry` IN (37007,37491,37493,37494,37495);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(37007,0,0, 'The master''s sanctum has been disturbed!',14,0,0,0,0,16865, 'Deathbound Ward - SAY_TRAP_ACTIVATE'),
(37007,0,1, 'I... awaken!',14,0,0,0,0,16866, 'Deathbound Ward - SAY_TRAP_ACTIVATE'),
(37007,0,2, 'Who... goes there...?',14,0,0,0,0,16867, 'Deathbound Ward - SAY_TRAP_ACTIVATE'),
(37491,1,0, 'You miserable fools never did manage to select a decent bat wing.',14,0,0,0,0,16587, 'Captain Arnath - SAY_ARNATH_RESURRECTED'),
(37491,2,0, 'THAT was for bringing me spoiled spider ichor!',14,0,0,0,0,16588, 'Captain Arnath - SAY_ARNATH_KILL'),
(37491,3,0, 'Don''t... let Finklestein use me... for his potions...',14,0,0,0,0,16589, 'Captain Arnath - SAY_ARNATH_SECOND_DEATH'),
(37493,1,0, 'What? This strength...? All of the pain is gone! You... must join me in the eternal embrace of death!',14,0,0,0,0,16811, 'Captain Brandon - SAY_BRANDON_RESURRECTED'),
(37493,2,0, 'It doesn''t hurt anymore, does it?',14,0,0,0,0,16812, 'Captain Brandon - SAY_BRANDON_KILL'),
(37493,3,0, 'I''m sorry...',14,0,0,0,0,16813, 'Captain Brandon - SAY_BRANDON_SECOND_DEATH'),
(37494,1,0, 'No! Why was I denied a death by flame? You must all BURN!',14,0,0,0,0,16845, 'Captain Grondel - SAY_GRONDEL_RESURRECTED'),
(37494,2,0, 'Can you feel the burn?',14,0,0,0,0,16846, 'Captain Grondel - SAY_GRONDEL_KILL'),
(37494,3,0, 'What... have I done? No!',14,0,0,0,0,16847, 'Captain Grondel - SAY_GRONDEL_SECOND_DEATH'),
(37495,1,0, 'There is no escaping the Lich King''s will. Prepare for an explosive encounter!',14,0,0,0,0,16999, 'Captain Rupert - SAY_RUPERT_RESURRECTED'),
(37495,2,0, 'So that''s what happens when you stand too close to a bomb!',14,0,0,0,0,17000, 'Captain Rupert - SAY_RUPERT_KILL'),
(37495,3,0, 'What an... explosive ending!',14,0,0,0,0,17001, 'Captain Rupert - SAY_RUPERT_SECOND_DEATH');

SET @Valkyr = 38391;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (@Valkyr,@Valkyr+1); -- 9 scripts

UPDATE `creature_template` SET `AIName`='SmartAI',`exp`=2,`minlevel`=80,`maxlevel`=80,`baseattacktime`=2000,`unit_flags`=`unit_flags`|0x8000,`speed_walk`=2.8,`speed_run`=1.07143 WHERE `entry`=@Valkyr+1; -- Val'kyr Protector

DELETE FROM `creature_template_addon` WHERE `entry`=@Valkyr+1;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@Valkyr+1,0,0x3000000,0x801,0, NULL); -- Val'kyr Protector

DELETE FROM `smart_scripts` WHERE `entryorguid`=@Valkyr+1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@Valkyr+1,0,0,0,25,0,100,0,0,0,0,0,58,1,71842,1500,2500,45,0,1,0,0,0,0,0,0,0, 'Val''kyr Protector - On reset install AI template caster - Cast Smite (Rank 12) every 1.5/2.5 seconds');

UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=29598; -- Icefang
UPDATE `creature_template` SET `spell1`=54897, `spell2`=54907, `spell3`=54788 WHERE `entry`=29602; -- Icefang
-- Last spell (spell3) shouldn't be show to the client, core implementation of vehicle spells needs to change.
DELETE FROM `creature_template_addon` WHERE `entry`=29598;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(29598,0,0,1,0, NULL); -- Icefang

UPDATE `creature_text` SET `type`=14 WHERE `type`=1; -- 9 rows changed
UPDATE `creature_text` SET `type`=16 WHERE `type`=2; -- 1 row changed

-- Fix unrelated DB errors
UPDATE `creature_template` SET `unit_class`=8 WHERE `entry`=40418;
DELETE FROM `creature_addon` WHERE `guid`=136607;

-- Eradication should not have internal cooldown
UPDATE `spell_proc_event` SET `Cooldown`=0 WHERE `entry` IN (47195,47196,47197); 

DELETE FROM `spell_dbc` WHERE `Id`=25042;
INSERT INTO `spell_dbc` (`Id`,`Dispel`,`Mechanic`,`Attributes`,`AttributesEx`,`AttributesEx2`,`AttributesEx3`,`AttributesEx4`,`AttributesEx5`,`Stances`,`StancesNot`,`Targets`,`CastingTimeIndex`,`AuraInterruptFlags`,`ProcFlags`,`ProcChance`,`ProcCharges`,`MaxLevel`,`BaseLevel`,`SpellLevel`,`DurationIndex`,`RangeIndex`,`StackAmount`,`EquippedItemClass`,`EquippedItemSubClassMask`,`EquippedItemInventoryTypeMask`,`Effect1`,`Effect2`,`Effect3`,`EffectDieSides1`,`EffectDieSides2`,`EffectDieSides3`,`EffectRealPointsPerLevel1`,`EffectRealPointsPerLevel2`,`EffectRealPointsPerLevel3`,`EffectBasePoints1`,`EffectBasePoints2`,`EffectBasePoints3`,`EffectMechanic1`,`EffectMechanic2`,`EffectMechanic3`,`EffectImplicitTargetA1`,`EffectImplicitTargetA2`,`EffectImplicitTargetA3`,`EffectImplicitTargetB1`,`EffectImplicitTargetB2`,`EffectImplicitTargetB3`,`EffectRadiusIndex1`,`EffectRadiusIndex2`,`EffectRadiusIndex3`,`EffectApplyAuraName1`,`EffectApplyAuraName2`,`EffectApplyAuraName3`,`EffectAmplitude1`,`EffectAmplitude2`,`EffectAmplitude3`,`EffectMultipleValue1`,`EffectMultipleValue2`,`EffectMultipleValue3`,`EffectMiscValue1`,`EffectMiscValue2`,`EffectMiscValue3`,`EffectMiscValueB1`,`EffectMiscValueB2`,`EffectMiscValueB3`,`EffectTriggerSpell1`,`EffectTriggerSpell2`,`EffectTriggerSpell3`,`EffectSpellClassMaskA1`,`EffectSpellClassMaskA2`,`EffectSpellClassMaskA3`,`EffectSpellClassMaskB1`,`EffectSpellClassMaskB2`,`EffectSpellClassMaskB3`,`EffectSpellClassMaskC1`,`EffectSpellClassMaskC2`,`EffectSpellClassMaskC3`,`MaxTargetLevel`,`SpellFamilyName`,`SpellFamilyFlags1`,`SpellFamilyFlags2`,`SpellFamilyFlags3`,`MaxAffectedTargets`,`DmgClass`,`PreventionType`,`DmgMultiplier1`,`DmgMultiplier2`,`DmgMultiplier3`,`AreaGroupId`,`SchoolMask`,`Comment`) VALUES
(25042,0,0,384,268435592,4,0,0,0,0,0,0,1,0,0,101,0,0,0,0,29,1,0,-1,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,22,0,0,15,0,0,12,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0, 'Triggerspell - Mark of Nature');

SET @ENTRY := 27853;
SET @GUID := 115101;

-- Remove old EAI and replace with proper SAI
DELETE FROM `creature_ai_scripts` WHERE `id`=2785301;
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@ENTRY;

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY,-109577,-109576,-109573);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,3000,3000,3000,3000,11,49731,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Projections and Plans Kill Credit Bunny - OOC - Cast Projections and Plans: Kill Credit on self'),
(-109577,0,0,0,1,0,100,1,1000,1000,30000,30000,11,46906,2,0,0,0,0,10,@GUID,@ENTRY,0,0,0,0,0, 'Surge Needle Sorcerer - OOC - Cast Surge Needle Beam'),
(-109577,0,1,0,0,0,100,0,3000,4000,3000,5000,11,51797,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Surge Needle Sorcerer - Combat - Cast Arcane Blast on victim'),
(-109576,0,0,0,1,0,100,1,1000,1000,30000,30000,11,46906,2,0,0,0,0,10,@GUID,@ENTRY,0,0,0,0,0, 'Surge Needle Sorcerer - OOC - Cast Surge Needle Beam'),
(-109576,0,1,0,0,0,100,0,3000,4000,3000,5000,11,51797,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Surge Needle Sorcerer - Combat - Cast Arcane Blast on victim'),
(-109573,0,0,0,1,0,100,1,1000,1000,30000,30000,11,46906,2,0,0,0,0,10,@GUID,@ENTRY,0,0,0,0,0, 'Surge Needle Sorcerer - OOC - Cast Surge Needle Beam'),
(-109573,0,1,0,0,0,100,0,3000,4000,3000,5000,11,51797,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Surge Needle Sorcerer - Combat - Cast Arcane Blast on victim');

-- Pathing for Stormpeak Wyrm Entry: 29753
SET @NPC := 101109;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7171.794,`position_y`=-1623.425,`position_z`=1024.3910 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7232.853,-1552.436,1018.6120,0,0,0,100,0),
(@PATH,2,7307.723,-1450.282,1031.3350,0,0,0,100,0),
(@PATH,3,7331.675,-1329.285,1071.6680,0,0,0,100,0),
(@PATH,4,7358.584,-1200.453,1095.0840,0,0,0,100,0),
(@PATH,5,7466.604,-1189.773,1087.8350,0,0,0,100,0),
(@PATH,6,7551.937,-1306.039,1036.9180,0,0,0,100,0),
(@PATH,7,7448.903,-1429.033,989.2788,0,0,0,100,0),
(@PATH,8,7265.264,-1460.603,924.7513,0,0,0,100,0),
(@PATH,9,7092.603,-1462.597,1039.6130,0,0,0,100,0),
(@PATH,10,6996.566,-1627.143,1060.5580,0,0,0,100,0),
(@PATH,11,7050.830,-1759.601,1026.4740,0,0,0,100,0),
(@PATH,12,7171.794,-1623.425,1024.3910,0,0,0,100,0);

-- Pathing for Stormpeak Wyrm Entry: 29753
SET @NPC := 101111;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7587.957,`position_y`=-1291.808,`position_z`=991.6395 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7576.177,-1339.229,991.6395,0,0,0,100,0),
(@PATH,2,7507.776,-1364.563,991.6395,0,0,0,100,0),
(@PATH,3,7462.349,-1304.429,991.6395,0,0,0,100,0),
(@PATH,4,7498.511,-1237.602,991.6395,0,0,0,100,0),
(@PATH,5,7560.044,-1239.629,991.6395,0,0,0,100,0),
(@PATH,6,7587.957,-1291.808,991.6395,0,0,0,100,0);

-- Pathing for Stormpeak Wyrm Entry: 29753
SET @NPC := 101112;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7325.549,`position_y`=-1146.471,`position_z`=1046.3540 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7422.022,-1135.820,1033.4380,0,0,0,100,0),
(@PATH,2,7518.522,-1237.663,1056.8260,0,0,0,100,0),
(@PATH,3,7501.124,-1449.262,1017.7980,0,0,0,100,0),
(@PATH,4,7376.508,-1303.557,1049.8540,0,0,0,100,0),
(@PATH,5,7325.549,-1146.471,1046.3540,0,0,0,100,0);

-- Pathing for Stormpeak Wyrm Entry: 29753
SET @NPC := 101121;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7306.776,`position_y`=-1409.522,`position_z`=1035.3630 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7403.804,-1456.458,1035.3630,0,0,0,100,0),
(@PATH,2,7468.895,-1421.992,1035.3630,0,0,0,100,0),
(@PATH,3,7499.714,-1349.263,1035.3630,0,0,0,100,0),
(@PATH,4,7436.533,-1280.687,1035.3630,0,0,0,100,0),
(@PATH,5,7396.054,-1281.403,1035.3630,0,0,0,100,0),
(@PATH,6,7298.188,-1334.745,1035.3630,0,0,0,100,0),
(@PATH,7,7306.776,-1409.522,1035.3630,0,0,0,100,0);

-- Pathing for Stormpeak Wyrm Entry: 29753
SET @NPC := 101123;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7505.094,`position_y`=-1216.210,`position_z`=980.8120 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7458.424,-1438.003,1005.1730,0,0,0,100,0),
(@PATH,2,7528.125,-1725.565,1300.1730,0,0,0,100,0),
(@PATH,3,7422.311,-1569.981,1141.3120,0,0,0,100,0),
(@PATH,4,7330.956,-1412.603,980.8120,0,0,0,100,0),
(@PATH,5,7303.932,-1283.664,980.8120,0,0,0,100,0),
(@PATH,6,7361.022,-1158.353,980.8120,0,0,0,100,0),
(@PATH,7,7505.094,-1216.210,980.8120,0,0,0,100,0);

-- Pathing for Stormpeak Wyrm Entry: 29753
SET @NPC := 101124;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7462.040,`position_y`=-1145.189,`position_z`=1073.3400 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7534.368,-1192.623,1109.7570,0,0,0,100,0),
(@PATH,2,7491.979,-1297.336,1075.2560,0,0,0,100,0),
(@PATH,3,7435.823,-1388.198,963.8117,0,0,0,100,0),
(@PATH,4,7374.318,-1466.145,951.8396,0,0,0,100,0),
(@PATH,5,7270.311,-1513.188,983.5063,0,0,0,100,0),
(@PATH,6,7186.261,-1542.495,999.2841,0,0,0,100,0),
(@PATH,7,7146.302,-1430.093,1026.7840,0,0,0,100,0),
(@PATH,8,7277.046,-1312.483,941.7841,0,0,0,100,0),
(@PATH,9,7350.680,-1247.736,932.9788,0,0,0,100,0),
(@PATH,10,7462.040,-1145.189,1073.3400,0,0,0,100,0);

-- Some fixups
UPDATE `creature` SET `spawndist`=0,`MovementType`=0 WHERE `guid` IN (101107,101113,101115,101117);
DELETE FROM `creature` WHERE `guid`=101116;
DELETE FROM `creature_addon` WHERE `guid`=101116;
UPDATE `creature_template` SET `speed_run`=1.25 WHERE `entry`=29753;

-- Pathing for Beryl Treasure Hunter Entry: 25353
SET @NPC := 97322;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3561.386,`position_y`=5473.793,`position_z`=30.31353 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3557.931,5461.132,32.72385,0,0,0,100,0),
(@PATH,2,3561.386,5473.793,30.31353,0,0,0,100,0),
(@PATH,3,3564.122,5486.128,28.18853,0,0,0,100,0),
(@PATH,4,3570.361,5499.623,27.06404,0,0,0,100,0),
(@PATH,5,3575.282,5511.941,27.06258,0,0,0,100,0),
(@PATH,6,3582.943,5519.652,27.06258,0,0,0,100,0),
(@PATH,7,3597.379,5520.971,27.06258,0,0,0,100,0),
(@PATH,8,3582.943,5519.652,27.06258,0,0,0,100,0),
(@PATH,9,3575.282,5511.941,27.06258,0,0,0,100,0),
(@PATH,10,3570.361,5499.623,27.06404,0,0,0,100,0),
(@PATH,11,3564.122,5486.128,28.18853,0,0,0,100,0),
(@PATH,12,3561.386,5473.793,30.31353,0,0,0,100,0);

-- Pathing for Beryl Treasure Hunter Entry: 25353
SET @NPC := 97331;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3664.771,`position_y`=5602.22,`position_z`=32.81259 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3652.738,5615.229,33.31259,0,0,0,100,0),
(@PATH,2,3664.771,5602.22,32.81259,0,0,0,100,0),
(@PATH,3,3674.368,5584.944,32.89562,0,0,0,100,0),
(@PATH,4,3674.716,5568.044,34.64562,0,0,0,100,0),
(@PATH,5,3678.86,5555.542,36.44348,0,0,0,100,0),
(@PATH,6,3685.907,5546.087,38.06848,0,0,0,100,0),
(@PATH,7,3690.099,5526.772,39.84897,0,0,0,100,0),
(@PATH,8,3685.907,5546.087,38.06848,0,0,0,100,0),
(@PATH,9,3678.86,5555.542,36.44348,0,0,0,100,0),
(@PATH,10,3674.716,5568.044,34.64562,0,0,0,100,0),
(@PATH,11,3674.368,5584.944,32.89562,0,0,0,100,0),
(@PATH,12,3664.771,5602.22,32.81259,0,0,0,100,0);

-- Pathing for Beryl Treasure Hunter Entry: 25353
SET @NPC := 97301;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3585.395,`position_y`=5444.673,`position_z`=39.95293 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3585.856,5453.249,37.95293,0,0,0,100,0),
(@PATH,2,3586.374,5461.863,35.32793,0,0,0,100,0),
(@PATH,3,3585.856,5453.249,37.95293,0,0,0,100,0),
(@PATH,4,3585.395,5444.673,39.95293,0,0,0,100,0),
(@PATH,5,3585.615,5433.987,40.45293,0,0,0,100,0),
(@PATH,6,3585.395,5444.673,39.95293,0,0,0,100,0);

-- Pathing for Beryl Treasure Hunter Entry: 25353
SET @NPC := 97276;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3697.089,`position_y`=5631.371,`position_z`=32.76652 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3698.534,5644.674,32.66938,0,0,0,100,0),
(@PATH,2,3706.474,5658.97,32.38537,0,0,0,100,0),
(@PATH,3,3698.534,5644.674,32.66938,0,0,0,100,0),
(@PATH,4,3697.089,5631.371,32.76652,0,0,0,100,0),
(@PATH,5,3702.564,5621.85,32.72995,0,0,0,100,0),
(@PATH,6,3708.017,5615.569,32.85495,0,0,0,100,0),
(@PATH,7,3716.102,5613.98,33.35495,0,0,0,100,0),
(@PATH,8,3727.071,5621.008,35.35495,0,0,0,100,0),
(@PATH,9,3716.102,5613.98,33.35495,0,0,0,100,0),
(@PATH,10,3708.017,5615.569,32.85495,0,0,0,100,0),
(@PATH,11,3702.564,5621.85,32.72995,0,0,0,100,0),
(@PATH,12,3697.089,5631.371,32.76652,0,0,0,100,0);

-- Pathing for Beryl Treasure Hunter Entry: 25353
SET @NPC := 97318;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3548.629,`position_y`=5599.825,`position_z`=50.65398 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3555.003,5601.37,46.20094,0,0,0,100,0),
(@PATH,2,3564.607,5602.538,37.57594,0,0,0,100,0),
(@PATH,3,3578.939,5601.566,31.57699,0,0,0,100,0),
(@PATH,4,3586.806,5593.127,31.12983,0,0,0,100,0),
(@PATH,5,3592.613,5587.148,30.37983,0,0,0,100,0),
(@PATH,6,3586.806,5593.127,31.12983,0,0,0,100,0),
(@PATH,7,3578.939,5601.566,31.57699,0,0,0,100,0),
(@PATH,8,3564.607,5602.538,37.57594,0,0,0,100,0),
(@PATH,9,3555.003,5601.37,46.20094,0,0,0,100,0),
(@PATH,10,3548.629,5599.825,50.65398,0,0,0,100,0),
(@PATH,11,3543.457,5613.289,52.70094,0,0,0,100,0),
(@PATH,12,3535.345,5628.1,53.57594,0,0,0,100,0),
(@PATH,13,3526.802,5644.103,55.89756,0,0,0,100,0),
(@PATH,14,3535.345,5628.1,53.57594,0,0,0,100,0),
(@PATH,15,3543.457,5613.289,52.70094,0,0,0,100,0),
(@PATH,16,3548.629,5599.825,50.65398,0,0,0,100,0);

-- Pathing for Beryl Treasure Hunter Entry: 25353
SET @NPC := 97307;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3534.608,`position_y`=5627.963,`position_z`=53.57594 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3539.981,5619.029,53.45094,0,0,0,100,0),
(@PATH,2,3546.2,5609.595,51.45094,0,0,0,100,0),
(@PATH,3,3550.636,5602.65,49.20094,0,0,0,100,0),
(@PATH,4,3560.588,5603.686,41.20094,0,0,0,100,0),
(@PATH,5,3567.586,5605.285,35.95199,0,0,0,100,0),
(@PATH,6,3573.637,5605.286,32.70199,0,0,0,100,0),
(@PATH,7,3581.634,5597.975,31.25483,0,0,0,100,0),
(@PATH,8,3587.999,5591.561,31.12983,0,0,0,100,0),
(@PATH,9,3596.174,5584.191,29.25483,0,0,0,100,0),
(@PATH,10,3587.999,5591.561,31.12983,0,0,0,100,0),
(@PATH,11,3581.634,5597.975,31.25483,0,0,0,100,0),
(@PATH,12,3573.637,5605.286,32.70199,0,0,0,100,0),
(@PATH,13,3567.637,5605.286,35.95199,0,0,0,100,0),
(@PATH,14,3560.814,5603.728,41.20094,0,0,0,100,0),
(@PATH,15,3550.873,5602.673,49.20094,0,0,0,100,0),
(@PATH,16,3546.2,5609.595,51.45094,0,0,0,100,0),
(@PATH,17,3539.981,5619.029,53.45094,0,0,0,100,0),
(@PATH,18,3534.608,5627.963,53.57594,0,0,0,100,0),
(@PATH,19,3530.087,5637.976,54.52256,0,0,0,100,0),
(@PATH,20,3527.31,5655.765,58.77256,0,0,0,100,0),
(@PATH,21,3530.087,5637.976,54.52256,0,0,0,100,0),
(@PATH,22,3534.608,5627.963,53.57594,0,0,0,100,0);

-- Pathing for Beryl Treasure Hunter Entry: 25353
SET @NPC := 97326;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3513.876,`position_y`=5606.854,`position_z`=63.13185 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3520.958,5599.072,62.37835,0,0,0,100,0),
(@PATH,2,3526.856,5589.065,62.00335,0,0,0,100,0),
(@PATH,3,3526.894,5567.229,62.87835,0,0,0,100,0),
(@PATH,4,3528.539,5553.205,63.56588,0,0,0,100,0),
(@PATH,5,3530.672,5540.383,65.44087,0,0,0,100,0),
(@PATH,6,3527.634,5519.506,64.80357,0,0,0,100,0),
(@PATH,7,3530.648,5540.28,65.44087,0,0,0,100,0),
(@PATH,8,3528.539,5553.205,63.56588,0,0,0,100,0),
(@PATH,9,3526.894,5567.229,62.87835,0,0,0,100,0),
(@PATH,10,3526.856,5589.065,62.00335,0,0,0,100,0),
(@PATH,11,3520.958,5599.072,62.37835,0,0,0,100,0),
(@PATH,12,3513.876,5606.854,63.13185,0,0,0,100,0),
(@PATH,13,3505.681,5611.771,63.63185,0,0,0,100,0),
(@PATH,14,3502.509,5621.209,64.63185,0,0,0,100,0),
(@PATH,15,3503.642,5628.48,64.50685,0,0,0,100,0),
(@PATH,16,3505.995,5635.619,63.89756,0,0,0,100,0),
(@PATH,17,3505.937,5645.619,62.52256,0,0,0,100,0),
(@PATH,18,3505.995,5635.619,63.89756,0,0,0,100,0),
(@PATH,19,3503.642,5628.48,64.50685,0,0,0,100,0),
(@PATH,20,3502.509,5621.209,64.63185,0,0,0,100,0),
(@PATH,21,3505.681,5611.771,63.63185,0,0,0,100,0),
(@PATH,22,3513.876,5606.854,63.13185,0,0,0,100,0);

-- Pathing for Beryl Treasure Hunter Entry: 25353
SET @NPC := 97319;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3517.062,`position_y`=5501.915,`position_z`=63.42858 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3518.122,5485.379,58.96079,0,0,0,100,0),
(@PATH,2,3522.787,5476,55.96079,0,0,0,100,0),
(@PATH,3,3518.122,5485.379,58.96079,0,0,0,100,0),
(@PATH,4,3517.062,5501.915,63.42858,0,0,0,100,0),
(@PATH,5,3517.615,5510.972,65.17857,0,0,0,100,0),
(@PATH,6,3521.31,5518.627,65.42857,0,0,0,100,0),
(@PATH,7,3517.615,5510.972,65.17857,0,0,0,100,0),
(@PATH,8,3517.062,5501.915,63.42858,0,0,0,100,0);

-- Add Missing Black Blood of Draenor Spawns to db
SET @GUID := 209032;
DELETE FROM `creature` WHERE `guid` BETWEEN @GUID AND @GUID+36;
INSERT IGNORE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES 
(@GUID+0,23286,530,1,1,0,0,-4989.68945,533.267,-6.23201227,2.588225,120,5,0,1,0,0,1),
(@GUID+1,23286,530,1,1,0,0,-5008.07764,445.799774,-7.687496,4.848184,120,5,0,1,0,0,1),
(@GUID+2,23286,530,1,1,0,0,-5012.0127,514.3434,-5.042469,5.13465834,120,5,0,1,0,0,1),
(@GUID+3,23286,530,1,1,0,0,-5012.997,549.9415,-4.40564346,1.67378473,120,5,0,1,0,0,1),
(@GUID+4,23286,530,1,1,0,0,-5016.02148,490.971039,-7.866439,4.838478,120,5,0,1,0,0,1),
(@GUID+5,23286,530,1,1,0,0,-5021.433,469.1069,-8.175169,1.2226696,120,5,0,1,0,0,1),
(@GUID+6,23286,530,1,1,0,0,-5024.51563,426.561432,-10.20804,1.11687481,120,5,0,1,0,0,1),
(@GUID+7,23286,530,1,1,0,0,-5025.797,397.633545,-13.0280495,4.00145245,120,5,0,1,0,0,1),
(@GUID+8,23286,530,1,1,0,0,-5036.446,597.1265,18.5822525,0.0929955542,120,5,0,1,0,0,1),
(@GUID+9,23286,530,1,1,0,0,-5048.92041,450.347321,-12.185751,2.29650974,120,5,0,1,0,0,1),
(@GUID+10,23286,530,1,1,0,0,-5051.3457,399.3506,-12.2878532,5.29644632,120,5,0,1,0,0,1),
(@GUID+11,23286,530,1,1,0,0,-5053.088,628.9155,24.1695518,2.795165,120,5,0,1,0,0,1),
(@GUID+12,23286,530,1,1,0,0,-5056.857,296.117645,-7.93896675,3.48118663,120,5,0,1,0,0,1),
(@GUID+13,23286,530,1,1,0,0,-5069.628,423.853058,-11.0079794,6.07293034,120,5,0,1,0,0,1),
(@GUID+14,23286,530,1,1,0,0,-5069.8833,636.1971,30.2196884,5.05358,120,5,0,1,0,0,1),
(@GUID+15,23286,530,1,1,0,0,-5080.326,676.015869,32.9786034,3.00858331,120,5,0,1,0,0,1),
(@GUID+16,23286,530,1,1,0,0,-5085.002,454.966553,-7.321316,1.203854,120,5,0,1,0,0,1),
(@GUID+17,23286,530,1,1,0,0,-5087.409,344.1611,4.08592224,5.54356575,120,5,0,1,0,0,1),
(@GUID+18,23286,530,1,1,0,0,-5087.988,507.385925,-11.2343569,1.80733728,120,5,0,1,0,0,1),
(@GUID+19,23286,530,1,1,0,0,-5088.39746,475.1501,-7.82405758,5.05217171,120,5,0,1,0,0,1),
(@GUID+20,23286,530,1,1,0,0,-5088.81445,645.055237,32.7489166,2.61234975,120,5,0,1,0,0,1),
(@GUID+21,23286,530,1,1,0,0,-5094.403,647.8368,33.02874,5.85462,120,5,0,1,0,0,1),
(@GUID+22,23286,530,1,1,0,0,-5099.644,408.555359,-12.73991,2.38603544,120,5,0,1,0,0,1),
(@GUID+23,23286,530,1,1,0,0,-5102.78174,685.7555,33.9081421,5.558793,120,5,0,1,0,0,1),
(@GUID+24,23286,530,1,1,0,0,-5102.902,443.3057,-7.44998455,0.574597657,120,5,0,1,0,0,1),
(@GUID+25,23286,530,1,1,0,0,-5105.38037,536.0138,-10.526392,5.009346,120,5,0,1,0,0,1),
(@GUID+26,23286,530,1,1,0,0,-5119.125,387.557648,-12.1417027,3.153311,120,5,0,1,0,0,1),
(@GUID+27,23286,530,1,1,0,0,-5131.08838,361.671021,-17.5902081,4.802402,120,5,0,1,0,0,1),
(@GUID+28,23286,530,1,1,0,0,-5133.446,398.5927,-11.155489,3.7525115,120,5,0,1,0,0,1),
(@GUID+29,23286,530,1,1,0,0,-5134.523,424.9907,-10.7020779,2.93014455,120,5,0,1,0,0,1),
(@GUID+30,23286,530,1,1,0,0,-5136.922,466.687683,-13.7564421,2.79966116,120,5,0,1,0,0,1),
(@GUID+31,23286,530,1,1,0,0,-5149.55469,351.741577,-19.33655,0.996007144,120,5,0,1,0,0,1),
(@GUID+32,23286,530,1,1,0,0,-5153.18555,487.3614,-12.2186108,4.57836151,120,5,0,1,0,0,1),
(@GUID+33,23286,530,1,1,0,0,-5170.654,422.92,-10.6833916,0.485873938,120,5,0,1,0,0,1),
(@GUID+34,23286,530,1,1,0,0,-5179.337,369.596924,-20.0646782,1.51201284,120,5,0,1,0,0,1),
(@GUID+35,23286,530,1,1,0,0,-5181.72559,345.638947,-21.1928349,5.528716,120,5,0,1,0,0,1),
(@GUID+36,23286,530,1,1,0,0,-5212.74658,326.250763,-21.8211174,4.56194735,120,5,0,1,0,0,1);

-- Onslaught Warhorse SAI
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry` IN (27213,27206);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (27213,27206);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(27213,0,0,0,11,0,100,0,0,0,0,0,12,27206,8,0,0,0,0,1,0,0,0,0,0,0,0,'Onslaught Warhorse - On Spawn - Summon Onslaught Knight'),
(27206,0,0,0,1,0,100,1,500,500,500,500,11,43671,3,0,0,0,0,19,27213,0,0,0,0,0,0,'Onslaught Knight - OOC once - Cast Ride Vehicle on Onslaught Warhorse');

-- Remove spawned Onslaught Knights
DELETE FROM `creature_addon` WHERE `guid` IN (Select `guid` FROM `creature` WHERE `id`=27206);
DELETE FROM `creature` WHERE `id`=27206;

-- Pathing for Onslaught Warhorse Entry: 27213
SET @NPC := 102716;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2508.58,`position_y`=-290.6462,`position_z`=-0.1427202 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2519.424,-279.186,-0.7677202,0,0,0,100,0),
(@PATH,2,2530.539,-279.0238,-0.7677202,0,0,0,100,0),
(@PATH,3,2539.442,-270.758,-0.3258755,0,0,0,100,0),
(@PATH,4,2540.027,-251.3916,-0.06487894,0,0,0,100,0),
(@PATH,5,2539.442,-270.758,-0.3258755,0,0,0,100,0),
(@PATH,6,2530.539,-279.0238,-0.7677202,0,0,0,100,0),
(@PATH,7,2519.424,-279.186,-0.7677202,0,0,0,100,0),
(@PATH,8,2508.58,-290.6462,-0.1427202,0,0,0,100,0);

-- Pathing for Onslaught Warhorse Entry: 27213
SET @NPC := 102717;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2587.305,`position_y`=-291.1189,`position_z`=3.032966 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2601.257,-273.5315,1.532966,0,0,0,100,0),
(@PATH,2,2618.792,-253.0176,2.282767,0,0,0,100,0),
(@PATH,3,2633.199,-245.2131,4.532767,0,0,0,100,0),
(@PATH,4,2618.873,-252.9083,2.282767,0,0,0,100,0),
(@PATH,5,2601.339,-273.4219,1.532966,0,0,0,100,0),
(@PATH,6,2587.305,-291.1189,3.032966,0,0,0,100,0),
(@PATH,7,2575.844,-304.2566,3.642326,0,0,0,100,0),
(@PATH,8,2570.643,-318.0563,3.767326,0,0,0,100,0),
(@PATH,9,2571.61,-332.3442,3.767326,0,0,0,100,0),
(@PATH,10,2570.399,-357.3963,3.884323,0,0,0,100,0),
(@PATH,11,2571.61,-332.3442,3.767326,0,0,0,100,0),
(@PATH,12,2570.643,-318.0563,3.767326,0,0,0,100,0),
(@PATH,13,2575.844,-304.2566,3.642326,0,0,0,100,0),
(@PATH,14,2587.305,-291.1189,3.032966,0,0,0,100,0);

-- Pathing for Onslaught Warhorse Entry: 27213
SET @NPC := 102719;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2538.552,`position_y`=-475.1394,`position_z`=0.6403183 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2515.825,-450.3543,0.282984,0,0,0,100,0),
(@PATH,2,2538.552,-475.1394,0.6403183,0,0,0,100,0),
(@PATH,3,2562.629,-487.9083,0.7653183,0,0,0,100,0),
(@PATH,4,2569.465,-510.7032,0.8169425,0,0,0,100,0),
(@PATH,5,2575.739,-523.7434,1.191942,0,0,0,100,0),
(@PATH,6,2601.065,-534.6965,0.9285774,0,0,0,100,0),
(@PATH,7,2575.739,-523.7434,1.191942,0,0,0,100,0),
(@PATH,8,2569.465,-510.7032,0.8169425,0,0,0,100,0),
(@PATH,9,2562.629,-487.9083,0.7653183,0,0,0,100,0),
(@PATH,10,2538.552,-475.1394,0.6403183,0,0,0,100,0);

-- Pathing for Onslaught Warhorse Entry: 27213
SET @NPC := 102721;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2582.436,`position_y`=-222.4737,`position_z`=-0.4052925 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2579.515,-214.4551,-0.5302925,0,0,0,100,0),
(@PATH,2,2580.979,-202.8364,0.3447075,0,0,0,100,0),
(@PATH,3,2579.515,-214.4551,-0.5302925,0,0,0,100,0),
(@PATH,4,2582.436,-222.4737,-0.4052925,0,0,0,100,0),
(@PATH,5,2561.902,-230.8203,-0.3034239,0,0,0,100,0),
(@PATH,6,2582.436,-222.4737,-0.4052925,0,0,0,100,0);

-- Pathing for Onslaught Warhorse Entry: 27213
SET @NPC := 102723;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2838.992,`position_y`=-178.4683,`position_z`=137.0378 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2837.595,-191.9704,137.9128,0,0,0,100,0),
(@PATH,2,2842.86,-215.9774,136.6075,0,0,0,100,0),
(@PATH,3,2837.595,-191.9704,137.9128,0,0,0,100,0),
(@PATH,4,2838.992,-178.4683,137.0378,0,0,0,100,0),
(@PATH,5,2836.44,-170.251,138.1628,0,0,0,100,0),
(@PATH,6,2829.992,-167.1136,138.761,0,0,0,100,0),
(@PATH,7,2820.281,-166.5459,138.6697,0,0,0,100,0),
(@PATH,8,2829.992,-167.1136,138.761,0,0,0,100,0),
(@PATH,9,2836.44,-170.251,138.1628,0,0,0,100,0),
(@PATH,10,2838.992,-178.4683,137.0378,0,0,0,100,0);

-- Pathing for Onslaught Warhorse Entry: 27213
SET @NPC := 102724;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2712.161,`position_y`=-564.5253,`position_z`=9.693825 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2693.882,-580.2343,7.060011,0,0,0,100,0),
(@PATH,2,2672.807,-596.9056,9.185011,0,0,0,100,0),
(@PATH,3,2662.762,-603.8812,9.776094,0,0,0,100,0),
(@PATH,4,2648.289,-604.2076,10.40109,0,0,0,100,0),
(@PATH,5,2662.762,-603.8812,9.776094,0,0,0,100,0),
(@PATH,6,2672.807,-596.9056,9.185011,0,0,0,100,0),
(@PATH,7,2693.882,-580.2343,7.060011,0,0,0,100,0),
(@PATH,8,2712.161,-564.5253,9.693825,0,0,0,100,0);

-- Pathing for Onslaught Warhorse Entry: 27213
SET @NPC := 102725;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2688.144,`position_y`=-181.5894,`position_z`=138.8123 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2690.253,-211.2009,138.7873,0,0,0,100,0),
(@PATH,2,2711.088,-233.0926,141.4496,0,0,0,100,0),
(@PATH,3,2691.518,-247.295,142.4064,0,0,0,100,0),
(@PATH,4,2690.253,-211.2009,138.7873,0,0,0,100,0),
(@PATH,5,2688.144,-181.5894,138.8123,0,0,0,100,0);

-- Pathing for Onslaught Warhorse Entry: 27213
SET @NPC := 102726;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2832.563,`position_y`=-258.2318,`position_z`=133.0783 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2823.757,-269.6722,132.6919,0,0,0,100,0),
(@PATH,2,2810.606,-274.9349,132.6919,0,0,0,100,0),
(@PATH,3,2798.263,-267.8378,132.7004,0,0,0,100,0),
(@PATH,4,2795.204,-255.2375,132.6619,0,0,0,100,0),
(@PATH,5,2815.456,-249.9233,133.0783,0,0,0,100,0),
(@PATH,6,2841.983,-244.2453,135.4677,0,0,0,100,0),
(@PATH,7,2815.456,-249.9233,133.0783,0,0,0,100,0),
(@PATH,8,2795.204,-255.2375,132.6619,0,0,0,100,0),
(@PATH,9,2798.263,-267.8378,132.7004,0,0,0,100,0),
(@PATH,10,2810.606,-274.9349,132.6919,0,0,0,100,0),
(@PATH,11,2823.757,-269.6722,132.6919,0,0,0,100,0),
(@PATH,12,2832.563,-258.2318,133.0783,0,0,0,100,0);

-- Pathing for Onslaught Warhorse Entry: 27213
SET @NPC := 102727;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2655.115,`position_y`=-139.6238,`position_z`=73.46788 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2656.776,-155.0757,66.71788,0,0,0,100,0),
(@PATH,2,2655.572,-172.0843,62.16366,0,0,0,100,0),
(@PATH,3,2650.678,-180.1066,63.41366,0,0,0,100,0),
(@PATH,4,2656.032,-164.1928,64.71788,0,0,0,100,0),
(@PATH,5,2656.646,-150.7192,68.46788,0,0,0,100,0),
(@PATH,6,2654.885,-130.6351,77.12984,0,0,0,100,0),
(@PATH,7,2659.214,-115.5115,82.62984,0,0,0,100,0),
(@PATH,8,2659.958,-93.19423,87.00713,0,0,0,100,0),
(@PATH,9,2666.549,-83.81207,89.50713,0,0,0,100,0),
(@PATH,10,2681.103,-87.36887,92.43093,0,0,0,100,0),
(@PATH,11,2700.115,-95.54926,101.8188,0,0,0,100,0),
(@PATH,12,2718.652,-104.436,110.9657,0,0,0,100,0),
(@PATH,13,2731.385,-117.8694,116.5907,0,0,0,100,0),
(@PATH,14,2726.709,-128.2827,120.8407,0,0,0,100,0),
(@PATH,15,2714.232,-134.095,125.4612,0,0,0,100,0),
(@PATH,16,2684.606,-134.3662,125.9815,0,0,0,100,0),
(@PATH,17,2705.027,-135.4983,127.8362,0,0,0,100,0),
(@PATH,18,2719.343,-131.1707,122.8407,0,0,0,100,0),
(@PATH,19,2731.655,-119.8017,117.2157,0,0,0,100,0),
(@PATH,20,2725.038,-106.6583,113.3407,0,0,0,100,0),
(@PATH,21,2703.98,-99.18321,103.9438,0,0,0,100,0),
(@PATH,22,2680.189,-88.67188,92.05593,0,0,0,100,0),
(@PATH,23,2665.09,-83.62039,89.38213,0,0,0,100,0),
(@PATH,24,2660.516,-94.05186,87.00713,0,0,0,100,0),
(@PATH,25,2659.939,-112.8213,83.37984,0,0,0,100,0),
(@PATH,26,2658.327,-126.0295,79.12984,0,0,0,100,0),
(@PATH,27,2655.115,-139.6238,73.46788,0,0,0,100,0);

-- Pathing for Onslaught Warhorse Entry: 27213
SET @NPC := 102728;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2809.652,`position_y`=-404.1015,`position_z`=118.2837 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2820.063,-404.6535,118.2837,0,0,0,100,0),
(@PATH,2,2808.515,-405.1523,118.2837,0,0,0,100,0),
(@PATH,3,2793.463,-420.3747,118.3209,0,0,0,100,0),
(@PATH,4,2779.776,-437.7538,118.6404,0,0,0,100,0),
(@PATH,5,2775.378,-463.4759,116.1404,0,0,0,100,0),
(@PATH,6,2767.986,-472.3566,116.8041,0,0,0,100,0),
(@PATH,7,2755.093,-477.2342,121.6782,0,0,0,100,0),
(@PATH,8,2773.319,-467.1881,116.1791,0,0,0,100,0),
(@PATH,9,2778.031,-447.918,118.3904,0,0,0,100,0),
(@PATH,10,2785.59,-429.4701,118.3209,0,0,0,100,0),
(@PATH,11,2800.177,-413.79,118.2837,0,0,0,100,0),
(@PATH,12,2809.652,-404.1015,118.2837,0,0,0,100,0);

-- Pathing for Onslaught Warhorse Entry: 27213
SET @NPC := 102729;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2750.5,`position_y`=-154.7686,`position_z`=139.4088 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2741.167,-164.7871,139.1588,0,0,0,100,0),
(@PATH,2,2750.5,-154.7686,139.4088,0,0,0,100,0),
(@PATH,3,2759.093,-161.0407,138.9088,0,0,0,100,0),
(@PATH,4,2771.567,-152.4166,139.9017,0,0,0,100,0),
(@PATH,5,2781.019,-154.3085,140.5267,0,0,0,100,0),
(@PATH,6,2791.13,-161.2096,139.1517,0,0,0,100,0),
(@PATH,7,2802.436,-164.2816,137.4197,0,0,0,100,0),
(@PATH,8,2791.13,-161.2096,139.1517,0,0,0,100,0),
(@PATH,9,2781.019,-154.3085,140.5267,0,0,0,100,0),
(@PATH,10,2771.567,-152.4166,139.9017,0,0,0,100,0),
(@PATH,11,2759.093,-161.0407,138.9088,0,0,0,100,0),
(@PATH,12,2750.5,-154.7686,139.4088,0,0,0,100,0);

-- Pathing for Onslaught Warhorse Entry: 27213
SET @NPC := 102730;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2712.018,`position_y`=-465.3528,`position_z`=85.87247 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2722.812,-487.2094,91.62904,0,0,0,100,0),
(@PATH,2,2726.125,-504.7564,94.96687,0,0,0,100,0),
(@PATH,3,2720.495,-521.4435,91.71687,0,0,0,100,0),
(@PATH,4,2727.937,-503.8876,95.59187,0,0,0,100,0),
(@PATH,5,2725.637,-491.6325,93.62904,0,0,0,100,0),
(@PATH,6,2715.711,-476.3229,88.62904,0,0,0,100,0),
(@PATH,7,2704.701,-454.9398,81.12247,0,0,0,100,0),
(@PATH,8,2692.514,-431.9863,72.42125,0,0,0,100,0),
(@PATH,9,2672.562,-431.7496,64.54625,0,0,0,100,0),
(@PATH,10,2649.395,-432.2932,52.79884,0,0,0,100,0),
(@PATH,11,2643.88,-442.8751,50.55303,0,0,0,100,0),
(@PATH,12,2652.563,-431.4375,54.42384,0,0,0,100,0),
(@PATH,13,2682.649,-431.7939,69.17125,0,0,0,100,0),
(@PATH,14,2693.424,-434.0273,73.17553,0,0,0,100,0),
(@PATH,15,2703.067,-449.0695,79.62247,0,0,0,100,0),
(@PATH,16,2712.018,-465.3528,85.87247,0,0,0,100,0);

-- Pathing for Onslaught Warhorse Entry: 27213
SET @NPC := 102731;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2534.057,`position_y`=-419.9908,`position_z`=3.277672 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2543.743,-400.441,2.027672,0,0,0,100,0),
(@PATH,2,2555.679,-395.5271,2.825949,0,0,0,100,0),
(@PATH,3,2543.743,-400.441,2.027672,0,0,0,100,0),
(@PATH,4,2534.057,-419.9908,3.277672,0,0,0,100,0),
(@PATH,5,2532.219,-440.2344,3.032984,0,0,0,100,0),
(@PATH,6,2532.378,-470.4768,0.8200397,0,0,0,100,0),
(@PATH,7,2548.762,-479.3864,0.5153183,0,0,0,100,0),
(@PATH,8,2532.378,-470.4768,0.8200397,0,0,0,100,0),
(@PATH,9,2532.219,-440.2344,3.032984,0,0,0,100,0),
(@PATH,10,2534.057,-419.9908,3.277672,0,0,0,100,0);

-- Pathing for Onslaught Warhorse Entry: 27213
SET @NPC := 102734;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2684.26,`position_y`=-287.8797,`position_z`=127.2792 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2728.101,-295.6697,132.1564,0,0,0,100,0),
(@PATH,2,2698.353,-312.0914,133.1807,0,0,0,100,0),
(@PATH,3,2689.288,-321.3154,132.3057,0,0,0,100,0),
(@PATH,4,2675.345,-320.4376,131.9307,0,0,0,100,0),
(@PATH,5,2654.261,-324.0862,132.1816,0,0,0,100,0),
(@PATH,6,2675.345,-320.4376,131.9307,0,0,0,100,0),
(@PATH,7,2689.288,-321.3154,132.3057,0,0,0,100,0),
(@PATH,8,2698.353,-312.0914,133.1807,0,0,0,100,0),
(@PATH,9,2728.101,-295.6697,132.1564,0,0,0,100,0),
(@PATH,10,2684.26,-287.8797,127.2792,0,0,0,100,0);

-- Pathing for Zorus the Judicator Entry: 21774 (Replace)
SET @NPC := 76076;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-3970.86,`position_y`=2191.12,`position_z`=101.885 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-3959.922,2188.494,101.799,0,0,0,100,0),
(@PATH,2,-3951.734,2200.173,101.7906,0,0,0,100,0),
(@PATH,3,-3958.357,2210.038,101.9156,0,0,0,100,0),
(@PATH,4,-3967.201,2208.166,101.76,0,0,0,100,0),
(@PATH,5,-3972.306,2201.522,101.76,0,0,0,100,0),
(@PATH,6,-3992.194,2215.025,103.635,0,0,0,100,0),
(@PATH,7,-4014.109,2218.045,108.6923,0,0,0,100,0),
(@PATH,8,-4023.189,2214.694,109.9423,0,0,0,100,0),
(@PATH,9,-4019.969,2183.267,107.4989,0,0,0,100,0),
(@PATH,10,-4000.393,2174.054,104.3739,0,0,0,100,0),
(@PATH,11,-3970.86,2191.12,101.885,0,0,0,100,0);

-- Pathing for Wildhammer Guard Entry: 19353 (Replace)
SET @NPC := 69029;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-3956.661,`position_y`=2150.609,`position_z`=99.19981 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-3952.747,2135.461,98.19981,0,0,0,100,0),
(@PATH,2,-3942.882,2121.993,96.84258,0,0,0,100,0),
(@PATH,3,-3936.123,2108.748,95.46758,0,0,0,100,0),
(@PATH,4,-3928.641,2095.985,94.73193,0,0,0,100,0),
(@PATH,5,-3916.894,2085.577,94.10693,0,0,0,100,0),
(@PATH,6,-3905.937,2073.934,94.48193,3000,0,0,100,0),
(@PATH,7,-3916.894,2085.577,94.10693,0,0,0,100,0),
(@PATH,8,-3928.641,2095.985,94.73193,0,0,0,100,0),
(@PATH,9,-3936.123,2108.748,95.46758,0,0,0,100,0),
(@PATH,10,-3942.882,2121.993,96.84258,0,0,0,100,0),
(@PATH,11,-3952.747,2135.461,98.19981,0,0,0,100,0),
(@PATH,12,-3956.661,2150.609,99.19981,0,0,0,100,0),
(@PATH,13,-3958.419,2169.508,100.424,0,0,0,100,0),
(@PATH,14,-3945.74,2173.963,101.174,0,0,0,100,0),
(@PATH,15,-3941.273,2175.507,101.549,3000,0,0,100,0),
(@PATH,16,-3945.74,2173.963,101.174,0,0,0,100,0),
(@PATH,17,-3958.419,2169.508,100.424,0,0,0,100,0),
(@PATH,18,-3956.661,2150.609,99.19981,0,0,0,100,0);

-- Pathing for Wildhammer Guard Entry: 19353 (Replace)
SET @NPC := 69030;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-3953.156,`position_y`=2196.489,`position_z`=101.799 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-3956.213,2190.557,101.799,0,0,0,100,0),
(@PATH,2,-3961.978,2187.907,101.924,0,0,0,100,0),
(@PATH,3,-3970.904,2191.666,101.885,0,0,0,100,0),
(@PATH,4,-3977.542,2187.189,102.135,0,0,0,100,0),
(@PATH,5,-3984.635,2183.306,102.885,0,0,0,100,0),
(@PATH,6,-3994.975,2177.334,103.885,0,0,0,100,0),
(@PATH,7,-4002.002,2173.979,104.4989,0,0,0,100,0),
(@PATH,8,-4020.553,2182.329,107.4989,0,0,0,100,0),
(@PATH,9,-4022.445,2199.229,109.3739,0,0,0,100,0),
(@PATH,10,-4024.303,2213.243,110.0673,0,0,0,100,0),
(@PATH,11,-4019.943,2220.104,109.9423,0,0,0,100,0),
(@PATH,12,-4010.167,2219.025,107.8173,0,0,0,100,0),
(@PATH,13,-3997.926,2217.727,105.135,0,0,0,100,0),
(@PATH,14,-3987.671,2211.935,102.76,0,0,0,100,0),
(@PATH,15,-3976.702,2204.916,101.885,0,0,0,100,0),
(@PATH,16,-3971.531,2203.007,101.76,0,0,0,100,0),
(@PATH,17,-3967.494,2207.26,101.76,0,0,0,100,0),
(@PATH,18,-3961.75,2209.582,101.7906,0,0,0,100,0),
(@PATH,19,-3955.481,2208.423,101.9156,0,0,0,100,0),
(@PATH,20,-3952.822,2204.261,101.9156,0,0,0,100,0),
(@PATH,21,-3953.156,2196.489,101.799,0,0,0,100,0);

-- Pathing for Wildhammer Guard Entry: 19353
SET @NPC := 69036;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-4027.414,`position_y`=2111.922,`position_z`=137.2429 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-4010.903,2103.363,137.2429,0,0,0,100,0),
(@PATH,2,-4027.414,2111.922,137.2429,0,0,0,100,0),
(@PATH,3,-4040.183,2116.031,137.2471,0,0,0,100,0),
(@PATH,4,-4051.71,2120.875,137.254,0,0,0,100,0),
(@PATH,5,-4064.835,2126.483,137.2603,0,0,0,100,0),
(@PATH,6,-4061.585,2129.041,137.2603,0,0,0,100,0),
(@PATH,7,-4053.318,2126.078,137.2559,0,0,0,100,0),
(@PATH,8,-4049.116,2130.594,137.254,0,0,0,100,0),
(@PATH,9,-4030.205,2123.756,127.3917,0,0,0,100,0),
(@PATH,10,-4013.132,2115.52,115.9905,0,0,0,100,0),
(@PATH,11,-4008.05,2114.437,115.6337,0,0,0,100,0),
(@PATH,12,-4005.22,2120.062,115.6409,0,0,0,100,0),
(@PATH,13,-4000.72,2130.597,107.8586,0,0,0,100,0),
(@PATH,14,-3993.985,2139.561,104.7343,0,0,0,100,0),
(@PATH,15,-3984.795,2135.855,104.9843,0,0,0,100,0),
(@PATH,16,-3982.541,2129.627,105.0458,0,0,0,100,0),
(@PATH,17,-3963.905,2117.34,100.7176,0,0,0,100,0),
(@PATH,18,-3954.1,2115.367,97.96758,0,0,0,100,0),
(@PATH,19,-3946.531,2111.822,96.84258,0,0,0,100,0),
(@PATH,20,-3943.734,2106.022,96.21758,0,0,0,100,0),
(@PATH,21,-3946.531,2111.822,96.84258,0,0,0,100,0),
(@PATH,22,-3953.81,2115.304,97.96758,0,0,0,100,0),
(@PATH,23,-3963.905,2117.34,100.7176,0,0,0,100,0),
(@PATH,24,-3982.541,2129.627,105.0458,0,0,0,100,0),
(@PATH,25,-3984.795,2135.855,104.9843,0,0,0,100,0),
(@PATH,26,-3993.985,2139.561,104.7343,0,0,0,100,0),
(@PATH,27,-4000.72,2130.597,107.8586,0,0,0,100,0),
(@PATH,28,-4005.202,2120.103,115.6362,0,0,0,100,0),
(@PATH,29,-4008.05,2114.437,115.6337,0,0,0,100,0),
(@PATH,30,-4013.132,2115.52,115.9905,0,0,0,100,0),
(@PATH,31,-4030.205,2123.756,127.3917,0,0,0,100,0),
(@PATH,32,-4049.116,2130.594,137.254,0,0,0,100,0),
(@PATH,33,-4053.318,2126.078,137.2559,0,0,0,100,0),
(@PATH,34,-4061.585,2129.041,137.2603,0,0,0,100,0),
(@PATH,35,-4064.835,2126.483,137.2603,0,0,0,100,0),
(@PATH,36,-4051.71,2120.875,137.254,0,0,0,100,0),
(@PATH,37,-4040.183,2116.031,137.2471,0,0,0,100,0),
(@PATH,38,-4027.414,2111.922,137.2429,0,0,0,100,0);

-- Pathing for Thane Yoregar Entry: 21773
SET @NPC := 76075;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-4034.194,`position_y`=2233.48,`position_z`=112.0453 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,17718, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-4037.18,2229.153,112.0457,0,0,0,100,0),
(@PATH,2,-4043.923,2229.386,112.0464,0,0,0,100,0),
(@PATH,3,-4037.18,2229.153,112.0457,0,0,0,100,0),
(@PATH,4,-4034.194,2233.48,112.0453,0,0,0,100,0);

-- Pathing for Wildhammer Scout Entry: 19384
SET @NPC := 69128;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-4022.309,`position_y`=2134.639,`position_z`=104.274 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-4021.637,2136.38,104.274,0,0,0,100,0),
(@PATH,2,-4020.335,2138.243,104.274,0,0,0,100,0),
(@PATH,3,-4018.53,2139.381,104.274,0,0,0,100,0),
(@PATH,4,-4016.425,2138.772,104.274,10000,0,0,100,0),
(@PATH,5,-4017.231,2139.141,104.274,0,0,0,100,0),
(@PATH,6,-4018.49,2140.534,104.274,0,0,0,100,0),
(@PATH,7,-4019.722,2143.937,104.274,10000,0,0,100,0),
(@PATH,8,-4019.373,2143.061,104.274,0,0,0,100,0),
(@PATH,9,-4019.427,2140.091,104.274,0,0,0,100,0),
(@PATH,10,-4020.97,2136.993,104.274,0,0,0,100,0),
(@PATH,11,-4022.309,2134.639,104.274,15000,0,0,100,0);

-- Pathing for Stonespine Gargoyle Entry: 36896
SET @NPC := 201822;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=674.3073,`position_y`=-26.43229,`position_z`=512.5833 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,871.2952,252.9757,561.8807,0,0,0,100,0),
(@PATH,2,908.3472,250.5347,561.8807,0,0,0,100,0),
(@PATH,3,914.9774,291.7049,561.8807,0,0,0,100,0),
(@PATH,4,862.7778,292.8316,561.8807,0,0,0,100,0),
(@PATH,5,840.6111,278.9184,561.8807,0,0,0,100,0),
(@PATH,6,826.5712,228.2292,561.8807,0,0,0,100,0),
(@PATH,7,833.5452,174.3576,561.8807,0,0,0,100,0),
(@PATH,8,840.9531,116.6059,561.8807,0,0,0,100,0),
(@PATH,9,816.033,96.46702,561.8807,0,0,0,100,0),
(@PATH,10,773.6111,120.1024,561.8807,0,0,0,100,0),
(@PATH,11,700.3021,175.5278,561.8807,0,0,0,100,0),
(@PATH,12,672.0243,223.6806,561.8807,0,0,0,100,0),
(@PATH,13,710.2379,266.3021,561.8807,0,0,0,100,0),
(@PATH,14,806.8594,287.4445,561.8807,0,0,0,100,0);

-- Pathing for Stonespine Gargoyle Entry: 36896
SET @NPC := 201834;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=674.3073,`position_y`=-26.43229,`position_z`=512.5833 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,410.967,187.1424,581.4994,0,0,0,100,0),
(@PATH,2,413.2448,207.5677,581.4994,0,0,0,100,0),
(@PATH,3,410.6823,230.7569,581.4994,0,0,0,100,0),
(@PATH,4,365.309,278.4445,581.4994,0,0,0,100,0),
(@PATH,5,378.1736,302.0868,581.4994,0,0,0,100,0),
(@PATH,6,410.0504,294.9097,581.4994,0,0,0,100,0),
(@PATH,7,439.2795,289.7951,581.4994,0,0,0,100,0),
(@PATH,8,477.2188,240.033,581.4994,0,0,0,100,0),
(@PATH,9,473.9323,183.2101,581.4994,0,0,0,100,0),
(@PATH,10,469.3889,140.6754,581.4994,0,0,0,100,0),
(@PATH,11,429.6354,121.7135,581.4994,0,0,0,100,0),
(@PATH,12,407.4063,143.0243,581.4994,0,0,0,100,0);

-- Pathing for Stonespine Gargoyle Entry: 36896
SET @NPC := 201838;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=674.3073,`position_y`=-26.43229,`position_z`=512.5833 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,873.783,136.9774,623.6115,0,0,0,100,0),
(@PATH,2,872.9045,139.2743,622.4446,0,0,0,100,0),
(@PATH,3,888.7917,171.3403,591.3615,0,0,0,100,0),
(@PATH,4,861.3073,209.8455,591.3615,0,0,0,100,0),
(@PATH,5,830.4913,254.5556,591.3615,0,0,0,100,0),
(@PATH,6,780.4844,277.6406,591.3615,0,0,0,100,0),
(@PATH,7,732.6771,272.4635,591.3615,0,0,0,100,0),
(@PATH,8,683.9028,265.276,591.3615,0,0,0,100,0),
(@PATH,9,612.3368,284.7934,553.4998,0,0,0,100,0),
(@PATH,10,554.816,303.1858,553.4998,0,0,0,100,0),
(@PATH,11,498.1024,309.0625,553.4998,0,0,0,100,0),
(@PATH,12,470.4167,230.0174,553.4998,0,0,0,100,0),
(@PATH,13,454.0087,175.2135,553.4998,0,0,0,100,0),
(@PATH,14,492.4288,127.1806,583.1108,0,0,0,100,0),
(@PATH,15,551.2604,121.6354,583.1108,0,0,0,100,0),
(@PATH,16,647.5573,126.3542,583.1108,0,0,0,100,0),
(@PATH,17,766.2222,130.9254,583.1108,0,0,0,100,0),
(@PATH,18,829.408,42.33854,583.1108,0,0,0,100,0),
(@PATH,19,746.7101,-53.03299,583.1108,0,0,0,100,0),
(@PATH,20,663.2379,-77.32291,583.1108,0,0,0,100,0),
(@PATH,21,618.6389,3.369792,583.1108,0,0,0,100,0),
(@PATH,22,641.8559,89.27604,583.1108,0,0,0,100,0),
(@PATH,23,794.1667,115.6858,583.1108,0,0,0,100,0);

-- Pathing for Stonespine Gargoyle Entry: 36896
SET @NPC := 201846;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=674.3073,`position_y`=-26.43229,`position_z`=512.5833 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,750.842,23.30903,568.327,0,0,0,100,0),
(@PATH,2,755.467,-50.2257,568.327,0,0,0,100,0),
(@PATH,3,734.6927,-93.41319,568.327,0,0,0,100,0),
(@PATH,4,662.4028,-41.9757,568.327,0,0,0,100,0),
(@PATH,5,634.9601,19.78472,568.327,0,0,0,100,0),
(@PATH,6,619.0972,58.13368,568.327,0,0,0,100,0),
(@PATH,7,569.6493,80.08681,568.327,0,0,0,100,0),
(@PATH,8,474.8889,136.7135,568.327,0,0,0,100,0),
(@PATH,9,427.566,173.5174,568.327,0,0,0,100,0),
(@PATH,10,399.5938,237.6424,568.327,0,0,0,100,0),
(@PATH,11,416.8108,271.5695,568.327,0,0,0,100,0),
(@PATH,12,442.8767,281.1493,568.327,0,0,0,100,0),
(@PATH,13,472.9375,286.9531,568.327,0,0,0,100,0),
(@PATH,14,515.0677,321.1632,568.327,0,0,0,100,0),
(@PATH,15,547.0538,332.9358,568.327,0,0,0,100,0),
(@PATH,16,605.0295,286.3281,568.327,0,0,0,100,0),
(@PATH,17,673.9167,184.0747,568.327,0,0,0,100,0);

-- Remove dupe Stonespine Gargoyle Spawns
DELETE FROM `creature` WHERE `MovementType`=0 AND `id`=36896;

-- Pathing for Iceborn Proto-Drake Entry: 36891
SET @NPC := 202197;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=619.3055,`position_y`=18.79167,`position_z`=513.5994 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,626.5364,0.711806,513.8494,0,0,0,100,0),
(@PATH,2,619.3055,18.79167,513.5994,0,0,0,100,0),
(@PATH,3,615.1875,32.38021,512.5994,0,0,0,100,0),
(@PATH,4,615.4705,47.52778,512.4364,0,0,0,100,0),
(@PATH,5,617.6285,62.52083,512.5614,0,0,0,100,0),
(@PATH,6,621.3264,77.02604,512.4487,0,0,0,100,0),
(@PATH,7,617.6285,62.52083,512.5614,0,0,0,100,0),
(@PATH,8,615.4705,47.52778,512.4364,0,0,0,100,0),
(@PATH,9,615.1875,32.38021,512.5994,0,0,0,100,0),
(@PATH,10,619.3055,18.79167,513.5994,0,0,0,100,0);

-- Pathing for Iceborn Proto-Drake Entry: 36891
SET @NPC := 201991;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=679.2205,`position_y`=-100.6076,`position_z`=513.8377 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,661.1771,-79.90452,513.8378,0,0,0,100,0),
(@PATH,2,651.3489,-62.0191,513.7985,0,0,0,100,0),
(@PATH,3,645.1337,-45.49132,513.7985,0,0,0,100,0),
(@PATH,4,634.1077,-20.19618,513.8635,0,0,0,100,0),
(@PATH,5,645.1337,-45.49132,513.7985,0,0,0,100,0),
(@PATH,6,651.3489,-62.0191,513.7985,0,0,0,100,0),
(@PATH,7,661.1771,-79.90452,513.8378,0,0,0,100,0),
(@PATH,8,679.2205,-100.6076,513.8377,0,0,0,100,0);

-- Pathing for Venom Stalker Entry: 15976
SET @NPC := 127864; -- 127865 should be in formation with him
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3310.01,`position_y`=-3862.94,`position_z`=294.662 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3321.301,-3868.157,294.6607,0,0,0,100,0),
(@PATH,2,3328.406,-3877.447,294.6608,0,0,0,100,0),
(@PATH,3,3327.705,-3889.598,294.6607,0,0,0,100,0),
(@PATH,4,3312.01,-3901.51,294.6607,0,0,0,100,0),
(@PATH,5,3297.603,-3897.307,294.6607,0,0,0,100,0),
(@PATH,6,3292.267,-3890.234,294.6607,0,0,0,100,0),
(@PATH,7,3290.384,-3882.75,294.6607,0,0,0,100,0),
(@PATH,8,3279.155,-3882.98,294.6607,0,0,0,100,0),
(@PATH,9,3260.253,-3882.767,294.6603,0,0,0,100,0),
(@PATH,10,3241.78,-3882.872,292.3388,0,0,0,100,0),
(@PATH,11,3221.214,-3882.398,282.8664,0,0,0,100,0),
(@PATH,12,3207.818,-3881.953,275.8379,0,0,0,100,0),
(@PATH,13,3166.121,-3882.08,267.5934,0,0,0,100,0),
(@PATH,14,3142.54,-3882.999,267.5932,0,0,0,100,0),
(@PATH,15,3118.083,-3883.491,267.593,0,0,0,100,0),
(@PATH,16,3114.162,-3894.186,267.5924,0,0,0,100,0),
(@PATH,17,3104.3,-3900.575,267.593,0,0,0,100,0),
(@PATH,18,3093.041,-3899.523,267.593,0,0,0,100,0),
(@PATH,19,3083.292,-3890.907,267.5929,0,0,0,100,0),
(@PATH,20,3082.536,-3878.924,267.593,0,0,0,100,0),
(@PATH,21,3088.724,-3868.493,267.593,0,0,0,100,0),
(@PATH,22,3103.835,-3863.884,267.593,0,0,0,100,0),
(@PATH,23,3114.156,-3873.857,267.5919,0,0,0,100,0),
(@PATH,24,3118.014,-3882.239,267.5925,0,0,0,100,0),
(@PATH,25,3142.844,-3882.002,267.5931,0,0,0,100,0),
(@PATH,26,3166.121,-3882.08,267.5934,0,0,0,100,0),
(@PATH,27,3207.818,-3881.953,275.8379,0,0,0,100,0),
(@PATH,28,3221.214,-3882.398,282.8664,0,0,0,100,0),
(@PATH,29,3241.78,-3882.872,292.3388,0,0,0,100,0),
(@PATH,30,3260.253,-3882.767,294.6603,0,0,0,100,0),
(@PATH,31,3279.155,-3882.98,294.6607,0,0,0,100,0),
(@PATH,32,3290.384,-3882.75,294.6607,0,0,0,100,0),
(@PATH,33,3291.66,-3875.24,294.662,0,0,0,100,0),
(@PATH,34,3295.71,-3868.95,294.662,0,0,0,100,0),
(@PATH,35,3302.22,-3864.56,294.662,0,0,0,100,0),
(@PATH,36,3310.01,-3862.94,294.662,0,0,0,100,0);

-- Pathing for Venom Stalker Entry: 15976
SET @NPC := 127863; -- 127862 should be in formation with him
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3252.581,`position_y`=-3730.202,`position_z`=279.2595 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3234.624,-3733.446,282.4044,0,0,0,100,0),
(@PATH,2,3234.132,-3743.128,280.9408,0,0,0,100,0),
(@PATH,3,3247.629,-3762.814,277.5423,0,0,0,100,0),
(@PATH,4,3232.144,-3779.076,273.1304,0,0,0,100,0),
(@PATH,5,3247.629,-3762.814,277.5423,0,0,0,100,0),
(@PATH,6,3234.124,-3743.281,280.9517,0,0,0,100,0),
(@PATH,7,3234.624,-3733.446,282.4044,0,0,0,100,0),
(@PATH,8,3252.519,-3730.217,279.2638,0,0,0,100,0),
(@PATH,9,3276.249,-3724.284,275.8947,0,0,0,100,0),
(@PATH,10,3309.417,-3714.943,266.8448,0,0,0,100,0),
(@PATH,11,3322.029,-3700.557,262.8869,0,0,0,100,0),
(@PATH,12,3298.23,-3700.239,271.5263,0,0,0,100,0),
(@PATH,13,3280.485,-3698.461,278.4746,0,0,0,100,0),
(@PATH,14,3298.23,-3700.239,271.5263,0,0,0,100,0),
(@PATH,15,3321.937,-3700.525,262.8836,0,0,0,100,0),
(@PATH,16,3309.417,-3714.943,266.8448,0,0,0,100,0),
(@PATH,17,3276.249,-3724.284,275.8947,0,0,0,100,0),
(@PATH,18,3252.581,-3730.202,279.2595,0,0,0,100,0);

-- Pathing for Noth the Plaguebringer Entry: 15954
SET @NPC := 127801;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2671.649,`position_y`=-3489.11,`position_z`=261.3754 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2666.34,-3502.596,261.2903,0,0,0,100,0),
(@PATH,2,2670.345,-3514.169,261.2776,0,0,0,100,0),
(@PATH,3,2676.189,-3520.29,261.2623,0,0,0,100,0),
(@PATH,4,2670.345,-3514.169,261.2776,0,0,0,100,0),
(@PATH,5,2666.34,-3502.596,261.2903,0,0,0,100,0),
(@PATH,6,2671.649,-3489.11,261.3754,0,0,0,100,0),
(@PATH,7,2676.566,-3484.499,261.3998,0,0,0,100,0),
(@PATH,8,2671.649,-3489.11,261.3754,0,0,0,100,0);

-- Pathing for Grobbulus Entry: 15931
SET @NPC := 127781;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3227.579,`position_y`=-3378.296,`position_z`=311.3255 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3228.724,-3363.874,304.4799,0,0,0,100,0),
(@PATH,2,3228.579,-3342.257,293.1313,0,0,0,100,0),
(@PATH,3,3228.15,-3327.913,292.5951,0,0,0,100,0),
(@PATH,4,3232.389,-3309.209,292.5951,0,0,0,100,0),
(@PATH,5,3252.036,-3310.178,292.5951,0,0,0,100,0),
(@PATH,6,3249.856,-3309.415,292.5951,60000,0,0,100,0),
(@PATH,7,3230.975,-3315.273,292.5951,0,0,0,100,0),
(@PATH,8,3229.008,-3330.244,292.5951,0,0,0,100,0),
(@PATH,9,3228.291,-3352.366,298.4386,0,0,0,100,0),
(@PATH,10,3228.85,-3367.867,306.5768,0,0,0,100,0),
(@PATH,11,3229.231,-3377.598,311.3294,0,0,0,100,0),
(@PATH,12,3222.958,-3389.251,311.3295,0,0,0,100,0),
(@PATH,13,3211.568,-3389.394,311.3405,0,0,0,100,0),
(@PATH,14,3205.059,-3380.847,311.3312,0,0,0,100,0),
(@PATH,15,3205.269,-3368.451,313.6086,0,0,0,100,0),
(@PATH,16,3205.238,-3346.578,318.9844,0,0,0,100,0),
(@PATH,17,3209.54,-3326.247,320.3741,0,0,0,100,0),
(@PATH,18,3209.07,-3314,320.337,0,0,0,100,0),
(@PATH,19,3200.387,-3306.898,320.325,0,0,0,100,0),
(@PATH,20,3186.123,-3306.752,320.2604,0,0,0,100,0),
(@PATH,21,3174.501,-3306.841,319.6423,60000,0,0,100,0),
(@PATH,22,3188.372,-3305.996,320.2764,0,0,0,100,0),
(@PATH,23,3201.267,-3305.621,320.3262,0,0,0,100,0),
(@PATH,24,3208.785,-3314.216,320.3366,0,0,0,100,0),
(@PATH,25,3211.18,-3328.448,320.3932,0,0,0,100,0),
(@PATH,26,3203.891,-3342.488,320.0162,0,0,0,100,0),
(@PATH,27,3204.194,-3365.331,314.3783,0,0,0,100,0),
(@PATH,28,3204.95,-3382.075,311.3327,0,0,0,100,0),
(@PATH,29,3211.571,-3388.579,311.3394,0,0,0,100,0),
(@PATH,30,3227.579,-3378.296,311.3255,0,0,0,100,0);

-- Pathing for Plague Beast Entry: 16034
SET @NPC := 128177;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2727.223,`position_y`=-3594.056,`position_z`=258.8858 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2723.637,-3604.718,259.6959,0,0,0,100,0),
(@PATH,2,2720.893,-3620.152,260.07,0,0,0,100,0),
(@PATH,3,2723.637,-3604.718,259.6959,0,0,0,100,0),
(@PATH,4,2727.223,-3594.056,258.8858,0,0,0,100,0),
(@PATH,5,2736.519,-3591.672,257.9183,0,0,0,100,0),
(@PATH,6,2743.838,-3597.846,257.6706,0,0,0,100,0),
(@PATH,7,2752.585,-3595.404,257.0601,0,0,0,100,0),
(@PATH,8,2755.268,-3585.129,256.3048,0,0,0,100,0),
(@PATH,9,2757.008,-3575.477,255.6362,0,0,0,100,0),
(@PATH,10,2755.268,-3585.129,256.3048,0,0,0,100,0),
(@PATH,11,2752.585,-3595.404,257.0601,0,0,0,100,0),
(@PATH,12,2743.837,-3597.847,257.6707,0,0,0,100,0),
(@PATH,13,2736.519,-3591.672,257.9183,0,0,0,100,0),
(@PATH,14,2727.223,-3594.056,258.8858,0,0,0,100,0);

-- Pathing for Plague Beast Entry: 16034
SET @NPC := 128178;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2847.407,`position_y`=-3611.501,`position_z`=261.8609 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2857.005,-3599.331,263.6793,0,0,0,100,0),
(@PATH,2,2873.124,-3590.235,267.1259,0,0,0,100,0),
(@PATH,3,2887.852,-3592.763,270.6516,0,0,0,100,0),
(@PATH,4,2897.192,-3605.39,273.3059,0,0,0,100,0),
(@PATH,5,2899.383,-3619.342,275.0363,0,0,0,100,0),
(@PATH,6,2891.756,-3631.639,274.1991,0,0,0,100,0),
(@PATH,7,2879.466,-3638.177,273.2885,0,0,0,100,0),
(@PATH,8,2866.484,-3640.015,271.3249,0,0,0,100,0),
(@PATH,9,2879.466,-3638.177,273.2885,0,0,0,100,0),
(@PATH,10,2891.756,-3631.639,274.1991,0,0,0,100,0),
(@PATH,11,2899.383,-3619.342,275.0363,0,0,0,100,0),
(@PATH,12,2897.192,-3605.39,273.3059,0,0,0,100,0),
(@PATH,13,2887.852,-3592.763,270.6516,0,0,0,100,0),
(@PATH,14,2873.124,-3590.235,267.1259,0,0,0,100,0),
(@PATH,15,2857.005,-3599.331,263.6793,0,0,0,100,0),
(@PATH,16,2847.407,-3611.501,261.8609,0,0,0,100,0);

-- Pathing for Plague Beast Entry: 16034
SET @NPC := 128179;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2777.605,`position_y`=-3575.896,`position_z`=253.7501 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2790.739,-3564.992,251.512,0,0,0,100,0),
(@PATH,2,2806.231,-3568.648,252.5588,0,0,0,100,0),
(@PATH,3,2817.801,-3583.097,254.5759,0,0,0,100,0),
(@PATH,4,2822.715,-3595.134,257.7653,0,0,0,100,0),
(@PATH,5,2829.62,-3612.201,259.9153,0,0,0,100,0),
(@PATH,6,2822.715,-3595.134,257.7653,0,0,0,100,0),
(@PATH,7,2817.801,-3583.097,254.5759,0,0,0,100,0),
(@PATH,8,2806.231,-3568.648,252.5588,0,0,0,100,0),
(@PATH,9,2790.979,-3565.049,251.5594,0,0,0,100,0),
(@PATH,10,2777.605,-3575.896,253.7501,0,0,0,100,0),
(@PATH,11,2767.949,-3589.933,256.7042,0,0,0,100,0),
(@PATH,12,2777.605,-3575.896,253.7501,0,0,0,100,0);

-- Pathing for Plague Beast Entry: 16034
SET @NPC := 128183;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2897.484,`position_y`=-3671.875,`position_z`=280.3942 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2900.623,-3683.831,284.0013,0,0,0,100,0),
(@PATH,2,2894.853,-3698.01,285.4735,0,0,0,100,0),
(@PATH,3,2881.999,-3708.828,285.7333,0,0,0,100,0),
(@PATH,4,2865.732,-3705.732,284.1666,0,0,0,100,0),
(@PATH,5,2858.935,-3691.243,281.1445,0,0,0,100,0),
(@PATH,6,2846.578,-3686.145,278.5287,0,0,0,100,0),
(@PATH,7,2827.884,-3686.887,275.8904,0,0,0,100,0),
(@PATH,8,2846.578,-3686.145,278.5287,0,0,0,100,0),
(@PATH,9,2858.935,-3691.243,281.1445,0,0,0,100,0),
(@PATH,10,2865.732,-3705.732,284.1666,0,0,0,100,0),
(@PATH,11,2881.999,-3708.828,285.7333,0,0,0,100,0),
(@PATH,12,2894.65,-3698.181,285.4753,0,0,0,100,0),
(@PATH,13,2900.623,-3683.831,284.0013,0,0,0,100,0),
(@PATH,14,2897.484,-3671.875,280.3942,0,0,0,100,0),
(@PATH,15,2884.267,-3662.161,277.4121,0,0,0,100,0),
(@PATH,16,2867.519,-3655.968,274.4418,0,0,0,100,0),
(@PATH,17,2884.267,-3662.161,277.4121,0,0,0,100,0),
(@PATH,18,2897.484,-3671.875,280.3942,0,0,0,100,0);

-- Pathing for Bile Retcher Entry: 16018
SET @NPC := 128082;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3042.894,`position_y`=-3210.451,`position_z`=293.3452 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3045.409,-3229.587,293.3453,0,0,0,100,0),
(@PATH,2,3042.894,-3210.451,293.3452,0,0,0,100,0),
(@PATH,3,3044.73,-3193.168,293.345,0,0,0,100,0),
(@PATH,4,3050.198,-3175.146,293.3451,0,0,0,100,0),
(@PATH,5,3057.628,-3160.267,293.3452,0,0,0,100,0),
(@PATH,6,3070.946,-3144.958,293.3451,0,0,0,100,0),
(@PATH,7,3085.224,-3133.8,293.3451,0,0,0,100,0),
(@PATH,8,3100.719,-3125.13,293.3454,0,0,0,100,0),
(@PATH,9,3115.583,-3120.971,293.3454,0,0,0,100,0),
(@PATH,10,3123.499,-3119.894,293.3453,0,0,0,100,0),
(@PATH,11,3115.583,-3120.971,293.3454,0,0,0,100,0),
(@PATH,12,3100.719,-3125.13,293.3454,0,0,0,100,0),
(@PATH,13,3085.224,-3133.8,293.3451,0,0,0,100,0),
(@PATH,14,3070.946,-3144.958,293.3451,0,0,0,100,0),
(@PATH,15,3057.628,-3160.267,293.3452,0,0,0,100,0),
(@PATH,16,3050.198,-3175.146,293.3451,0,0,0,100,0),
(@PATH,17,3044.73,-3193.168,293.345,0,0,0,100,0),
(@PATH,18,3042.894,-3210.451,293.3452,0,0,0,100,0);

-- Pathing for Bile Retcher Entry: 16018
SET @NPC := 128080;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3033.41,`position_y`=-3103.28,`position_z`=294.0816 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3042.117,-3111.578,294.0787,0,0,0,100,0),
(@PATH,2,3054.847,-3117.892,294.0732,0,0,0,100,0),
(@PATH,3,3064.48,-3116.37,294.0733,0,0,0,100,0),
(@PATH,4,3071.523,-3110.154,294.0739,0,0,0,100,0),
(@PATH,5,3073.239,-3096.89,294.0799,0,0,0,100,0),
(@PATH,6,3070.978,-3083.671,294.0771,0,0,0,100,0),
(@PATH,7,3069.906,-3072.977,294.0717,0,0,0,100,0),
(@PATH,8,3070.978,-3083.671,294.0771,0,0,0,100,0),
(@PATH,9,3073.239,-3096.89,294.0799,0,0,0,100,0),
(@PATH,10,3071.523,-3110.154,294.0739,0,0,0,100,0),
(@PATH,11,3064.48,-3116.37,294.0733,0,0,0,100,0),
(@PATH,12,3054.985,-3117.871,294.0741,0,0,0,100,0),
(@PATH,13,3042.117,-3111.578,294.0787,0,0,0,100,0),
(@PATH,14,3033.41,-3103.28,294.0816,0,0,0,100,0);

-- Pathing for Bile Retcher Entry: 16018
SET @NPC := 128077;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3142.82,`position_y`=-3289.663,`position_z`=293.6283 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3133.79,-3280.204,293.6283,0,0,0,100,0),
(@PATH,2,3124.373,-3283.016,293.6283,0,0,0,100,0),
(@PATH,3,3115.834,-3292.965,293.6283,0,0,0,100,0),
(@PATH,4,3107.542,-3301.675,293.6283,0,0,0,100,0),
(@PATH,5,3100.092,-3309.104,293.6283,0,0,0,100,0),
(@PATH,6,3096.534,-3315.12,293.6284,0,0,0,100,0),
(@PATH,7,3098.168,-3321.916,293.6283,0,0,0,100,0),
(@PATH,8,3105.722,-3329.35,293.6283,0,0,0,100,0),
(@PATH,9,3096.036,-3342.595,294.4876,0,0,0,100,0),
(@PATH,10,3089.529,-3352.048,299.1511,0,0,0,100,0),
(@PATH,11,3080.938,-3360.322,298.3178,0,0,0,100,0),
(@PATH,12,3090.223,-3352.669,299.1137,0,0,0,100,0),
(@PATH,13,3098.557,-3345.29,294.5518,0,0,0,100,0),
(@PATH,14,3110.563,-3333.553,293.6283,0,0,0,100,0),
(@PATH,15,3119.627,-3342.392,293.6283,0,0,0,100,0),
(@PATH,16,3126.197,-3344.948,293.6283,0,0,0,100,0),
(@PATH,17,3132.594,-3340.744,293.6283,0,0,0,100,0),
(@PATH,18,3139.652,-3333.695,293.6254,0,0,0,100,0),
(@PATH,19,3147.054,-3325.681,293.6215,0,0,0,100,0),
(@PATH,20,3156.757,-3316.759,293.6283,0,0,0,100,0),
(@PATH,21,3159.579,-3307.466,293.6283,0,0,0,100,0),
(@PATH,22,3151.304,-3298.503,293.6283,0,0,0,100,0),
(@PATH,23,3142.82,-3289.663,293.6283,0,0,0,100,0);

-- Pathing for Bile Retcher Entry: 16018
SET @NPC := 128083;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3014.116,`position_y`=-3151.28,`position_z`=294.0802 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3006.086,-3148.801,294.0794,0,0,0,100,0),
(@PATH,2,2998.345,-3143.183,294.0745,0,0,0,100,0),
(@PATH,3,3006.086,-3148.801,294.0794,0,0,0,100,0),
(@PATH,4,3014.116,-3151.28,294.0802,0,0,0,100,0),
(@PATH,5,3021.593,-3152.803,294.0765,0,0,0,100,0),
(@PATH,6,3029.989,-3151.037,294.0749,0,0,0,100,0),
(@PATH,7,3035.378,-3146.691,294.0736,0,0,0,100,0),
(@PATH,8,3037.918,-3141.474,294.0722,0,0,0,100,0),
(@PATH,9,3037.771,-3135.391,294.0739,0,0,0,100,0),
(@PATH,10,3032.81,-3126.448,294.0777,0,0,0,100,0),
(@PATH,11,3027.861,-3119.256,294.0811,0,0,0,100,0),
(@PATH,12,3023.261,-3113.858,294.0814,0,0,0,100,0),
(@PATH,13,3027.861,-3119.256,294.0811,0,0,0,100,0),
(@PATH,14,3032.81,-3126.448,294.0777,0,0,0,100,0),
(@PATH,15,3037.771,-3135.391,294.0739,0,0,0,100,0),
(@PATH,16,3037.918,-3141.474,294.0722,0,0,0,100,0),
(@PATH,17,3035.378,-3146.691,294.0736,0,0,0,100,0),
(@PATH,18,3029.989,-3151.037,294.0749,0,0,0,100,0),
(@PATH,19,3021.593,-3152.803,294.0765,0,0,0,100,0),
(@PATH,20,3014.116,-3151.28,294.0802,0,0,0,100,0);

-- Pathing for Patchwerk Entry: 16028 Goodbye YTDB waypoints :)
SET @NPC := 128135;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3256.364,`position_y`=-3230.328,`position_z`=294.0628 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3294.435,-3232.726,294.0628,0,0,0,100,0),
(@PATH,2,3259.98,-3230.881,294.0628,0,0,0,100,0),
(@PATH,3,3239.911,-3221.095,294.0628,0,0,0,100,0),
(@PATH,4,3217.512,-3195.807,294.0628,0,0,0,100,0),
(@PATH,5,3191.55,-3171.159,294.0628,0,0,0,100,0),
(@PATH,6,3163.729,-3148.403,294.0628,0,0,0,100,0),
(@PATH,7,3135.152,-3140.675,294.0628,0,0,0,100,0),
(@PATH,8,3102.748,-3145.538,294.0628,0,0,0,100,0),
(@PATH,9,3132.792,-3139.218,294.0628,0,0,0,100,0),
(@PATH,10,3158.633,-3145.425,294.0628,0,0,0,100,0),
(@PATH,11,3183.093,-3161.458,294.0628,0,0,0,100,0),
(@PATH,12,3207.656,-3187.538,294.0628,0,0,0,100,0),
(@PATH,13,3231.767,-3210.727,294.0628,0,0,0,100,0),
(@PATH,14,3256.364,-3230.328,294.0628,0,0,0,100,0);

-- Pathing for Sludge Belcher Entry: 16029
SET @NPC := 128136;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3118.057,`position_y`=-3238.513,`position_z`=294.0628 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3110.502,-3233.311,294.0628,0,0,0,100,0),
(@PATH,2,3104.615,-3222.995,294.062,0,0,0,100,0),
(@PATH,3,3102.009,-3217.843,294.0619,0,0,0,100,0),
(@PATH,4,3088.782,-3219.72,294.2053,0,0,0,100,0),
(@PATH,5,3062.66,-3225.544,294.0628,0,0,0,100,0),
(@PATH,6,3088.782,-3219.72,294.2053,0,0,0,100,0),
(@PATH,7,3102.009,-3217.843,294.0619,0,0,0,100,0),
(@PATH,8,3104.615,-3222.995,294.062,0,0,0,100,0),
(@PATH,9,3110.502,-3233.311,294.0628,0,0,0,100,0),
(@PATH,10,3118.057,-3238.513,294.0628,0,0,0,100,0),
(@PATH,11,3132.468,-3243.824,294.0882,0,0,0,100,0),
(@PATH,12,3132.824,-3258.017,294.5639,0,0,0,100,0),
(@PATH,13,3134.089,-3269.027,294.4024,0,0,0,100,0),
(@PATH,14,3145.958,-3276.273,294.7125,0,0,0,100,0),
(@PATH,15,3159.74,-3284.686,294.9083,0,0,0,100,0),
(@PATH,16,3165.632,-3293.163,294.7399,0,0,0,100,0),
(@PATH,17,3170.729,-3299.799,294.5983,0,0,0,100,0),
(@PATH,18,3176.233,-3307.651,294.5355,0,0,0,100,0),
(@PATH,19,3174.618,-3318.042,294.5306,0,0,0,100,0),
(@PATH,20,3165.177,-3325.201,294.523,0,0,0,100,0),
(@PATH,21,3174.617,-3318.042,294.5306,0,0,0,100,0),
(@PATH,22,3176.233,-3307.651,294.5355,0,0,0,100,0),
(@PATH,23,3170.73,-3299.8,294.5983,0,0,0,100,0),
(@PATH,24,3165.632,-3293.163,294.7399,0,0,0,100,0),
(@PATH,25,3159.74,-3284.686,294.9083,0,0,0,100,0),
(@PATH,26,3145.958,-3276.273,294.7125,0,0,0,100,0),
(@PATH,27,3134.089,-3269.027,294.4024,0,0,0,100,0),
(@PATH,28,3132.824,-3258.017,294.5639,0,0,0,100,0),
(@PATH,29,3132.468,-3243.824,294.0882,0,0,0,100,0),
(@PATH,30,3118.057,-3238.513,294.0628,0,0,0,100,0);

-- Pathing for Sludge Belcher Entry: 16029
SET @NPC := 97736;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `id`=16029,`modelid`=0,`map`=533,`spawnMask`=3,`spawndist`=0,`MovementType`=2,`position_x`=2992.316,`position_y`=-3175.448,`position_z`=294.0716 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2985.661,-3189.97,294.0675,0,0,0,100,0),
(@PATH,2,2992.316,-3175.448,294.0716,0,0,0,100,0),
(@PATH,3,2998.143,-3166.825,294.0744,0,0,0,100,0),
(@PATH,4,3007.454,-3161.701,294.0769,0,0,0,100,0),
(@PATH,5,3021.642,-3159.072,294.0751,0,0,0,100,0),
(@PATH,6,3033.026,-3156.022,294.0723,0,0,0,100,0),
(@PATH,7,3047.169,-3147.989,294.0677,0,0,0,100,0),
(@PATH,8,3061.901,-3133.495,294.0666,0,0,0,100,0),
(@PATH,9,3075.713,-3122.531,294.0668,0,0,0,100,0),
(@PATH,10,3088.894,-3113.645,294.0691,0,0,0,100,0),
(@PATH,11,3102.977,-3108.005,294.0687,0,0,0,100,0),
(@PATH,12,3115.019,-3104.743,294.0686,0,0,0,100,0),
(@PATH,13,3102.98,-3108.004,294.0687,0,0,0,100,0),
(@PATH,14,3088.894,-3113.645,294.0691,0,0,0,100,0),
(@PATH,15,3075.713,-3122.531,294.0668,0,0,0,100,0),
(@PATH,16,3061.901,-3133.495,294.0666,0,0,0,100,0),
(@PATH,17,3047.169,-3147.989,294.0677,0,0,0,100,0),
(@PATH,18,3033.026,-3156.022,294.0723,0,0,0,100,0),
(@PATH,19,3021.642,-3159.072,294.0751,0,0,0,100,0),
(@PATH,20,3007.454,-3161.701,294.0769,0,0,0,100,0),
(@PATH,21,2998.143,-3166.825,294.0744,0,0,0,100,0),
(@PATH,22,2992.316,-3175.448,294.0716,0,0,0,100,0);

-- Pathing for Sludge Belcher Entry: 16029
SET @NPC := 97718;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `id`=16029,`modelid`=0,`map`=533,`spawnMask`=3,`spawndist`=0,`MovementType`=2,`position_x`=3008.161,`position_y`=-3239.027,`position_z`=294.0628 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3012.525,-3243.854,294.0628,0,0,0,100,0),
(@PATH,2,3022.682,-3242.966,294.0628,0,0,0,100,0),
(@PATH,3,3028.833,-3236.661,294.0628,0,0,0,100,0),
(@PATH,4,3032.736,-3219.687,294.0628,0,0,0,100,0),
(@PATH,5,3028.816,-3207.798,294.0628,0,0,0,100,0),
(@PATH,6,3021.306,-3202.189,294.0628,0,0,0,100,0),
(@PATH,7,3006.159,-3199.062,294.0689,0,0,0,100,0),
(@PATH,8,2991.62,-3203.322,294.0628,0,0,0,100,0),
(@PATH,9,2985.41,-3218.486,294.0628,0,0,0,100,0),
(@PATH,10,2988.189,-3227.132,294.0628,0,0,0,100,0),
(@PATH,11,3001.484,-3232.543,294.0628,0,0,0,100,0),
(@PATH,12,3008.161,-3239.027,294.0628,0,0,0,100,0);

-- Pathing for Sludge Belcher Entry: 16029
SET @NPC := 97724;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `id`=16029,`modelid`=0,`map`=533,`spawnMask`=3,`spawndist`=0,`MovementType`=2,`position_x`=3103.862,`position_y`=-3199.295,`position_z`=294.0628 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3110.057,-3189.071,294.0628,0,0,0,100,0),
(@PATH,2,3117.292,-3183.439,294.0628,0,0,0,100,0),
(@PATH,3,3124.222,-3180.931,294.0628,0,0,0,100,0),
(@PATH,4,3134.678,-3179.746,294.0628,0,0,0,100,0),
(@PATH,5,3147.699,-3183.069,294.0628,0,0,0,100,0),
(@PATH,6,3156.941,-3191.08,294.0628,0,0,0,100,0),
(@PATH,7,3163.032,-3198.683,294.0628,0,0,0,100,0),
(@PATH,8,3165.123,-3211.401,294.0628,0,0,0,100,0),
(@PATH,9,3162.973,-3223.654,294.0628,0,0,0,100,0),
(@PATH,10,3155.372,-3234.195,294.0628,0,0,0,100,0),
(@PATH,11,3146.969,-3240.264,294.0867,0,0,0,100,0),
(@PATH,12,3138.718,-3243.327,294.088,0,0,0,100,0),
(@PATH,13,3146.969,-3240.264,294.0867,0,0,0,100,0),
(@PATH,14,3155.372,-3234.195,294.0628,0,0,0,100,0),
(@PATH,15,3162.97,-3223.67,294.0628,0,0,0,100,0),
(@PATH,16,3165.123,-3211.401,294.0628,0,0,0,100,0),
(@PATH,17,3163.032,-3198.683,294.0628,0,0,0,100,0),
(@PATH,18,3156.941,-3191.08,294.0628,0,0,0,100,0),
(@PATH,19,3147.699,-3183.069,294.0628,0,0,0,100,0),
(@PATH,20,3134.678,-3179.746,294.0628,0,0,0,100,0),
(@PATH,21,3124.222,-3180.931,294.0628,0,0,0,100,0),
(@PATH,22,3117.292,-3183.439,294.0628,0,0,0,100,0),
(@PATH,23,3110.057,-3189.071,294.0628,0,0,0,100,0),
(@PATH,24,3103.862,-3199.295,294.0628,0,0,0,100,0),
(@PATH,25,3102.404,-3208.719,294.0627,0,0,0,100,0),
(@PATH,26,3103.862,-3199.295,294.0628,0,0,0,100,0);

-- Pathing for Sludge Belcher Entry: 16029
SET @NPC := 97747;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `id`=16029,`modelid`=0,`map`=533,`spawnMask`=3,`spawndist`=0,`MovementType`=2,`position_x`=3112.745,`position_y`=-3093.264,`position_z`=294.0749 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3119.318,-3086.976,294.0759,0,0,0,100,0),
(@PATH,2,3126.585,-3076.191,294.0714,0,0,0,100,0),
(@PATH,3,3119.318,-3086.976,294.0759,0,0,0,100,0),
(@PATH,4,3112.745,-3093.264,294.0749,0,0,0,100,0),
(@PATH,5,3103.091,-3093.424,294.076,0,0,0,100,0),
(@PATH,6,3096.566,-3090.718,294.0785,0,0,0,100,0),
(@PATH,7,3089.514,-3081.602,294.08,0,0,0,100,0),
(@PATH,8,3086.157,-3071.268,294.0743,0,0,0,100,0),
(@PATH,9,3089.514,-3081.602,294.08,0,0,0,100,0),
(@PATH,10,3096.566,-3090.718,294.0785,0,0,0,100,0),
(@PATH,11,3103.091,-3093.424,294.076,0,0,0,100,0),
(@PATH,12,3112.745,-3093.264,294.0749,0,0,0,100,0);

-- Set random movement to Embalming Slime, Patchwork Golem, Maggot, Frenzied Bat, Plagued Bat, Diseased Maggot, Rotting Maggot, Larva Entry, Risen Squire
UPDATE `creature` SET `spawndist`=8,`MovementType`=1 WHERE `id` IN (16017,16024,16030,16036,16037,16056,16057,16068,16154);

-- Pathing for Death Knight Cavalier Entry: 16163
SET @NPC := 127752;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2827.984,`position_y`=-3152.95,`position_z`=273.787 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=0,`position_x`=2827.984,`position_y`=-3152.95,`position_z`=273.787 WHERE `guid`=127751;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,25278, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2828.418,-3128.86,273.8279,0,0,0,100,0),
(@PATH,2,2828.67,-3097.49,273.8293,0,0,0,100,0),
(@PATH,3,2824.122,-3127.451,273.8248,0,0,0,100,0),
(@PATH,4,2813.568,-3143.734,273.7569,0,0,0,100,0),
(@PATH,5,2801.097,-3163.161,273.7858,0,0,0,100,0),
(@PATH,6,2799.644,-3189.22,273.787,0,0,0,100,0),
(@PATH,7,2820.002,-3202.299,273.8145,0,0,0,100,0),
(@PATH,8,2844.853,-3200.758,273.787,0,0,0,100,0),
(@PATH,9,2848.53,-3180.427,273.787,0,0,0,100,0),
(@PATH,10,2827.984,-3152.95,273.787,0,0,0,100,0);

DELETE FROM `creature_formations` WHERE `leaderGUID`=127752;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(127752,127752,5,90,2),
(127752,127751,5,90,2);

-- Pathing for Death Knight Cavalier Entry: 16163
SET @NPC := 127745;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2709.55,`position_y`=-3013.26,`position_z`=240.524 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=0,`position_x`=2709.55,`position_y`=-3013.26,`position_z`=240.524 WHERE `guid`=127744;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,25278, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2724.357,-3002.94,240.5246,0,0,0,100,0),
(@PATH,2,2734.208,-2991.862,240.525,0,0,0,100,0),
(@PATH,3,2744.237,-2985.519,240.5257,0,0,0,100,0),
(@PATH,4,2763.189,-2986.039,240.5255,0,0,0,100,0),
(@PATH,5,2781.199,-2986.169,240.5265,0,0,0,100,0),
(@PATH,6,2791.35,-2986.05,240.528,0,0,0,100,0),
(@PATH,7,2811.443,-2985.972,250.953,0,0,0,100,0),
(@PATH,8,2830.531,-2985.851,260.8194,0,0,0,100,0),
(@PATH,9,2847.362,-2985.841,267.593,0,0,0,100,0),
(@PATH,10,2870.534,-2986.177,267.5924,0,0,0,100,0),
(@PATH,11,2882.414,-2997.007,267.5921,0,0,0,100,0),
(@PATH,12,2895.966,-3012.106,267.5932,0,0,0,100,0),
(@PATH,13,2915.716,-3014.353,267.594,0,0,0,100,0),
(@PATH,14,2931.21,-3007.478,267.5924,0,0,0,100,0),
(@PATH,15,2938.199,-2994.229,267.5921,0,0,0,100,0),
(@PATH,16,2937.735,-2977.154,267.5934,0,0,0,100,0),
(@PATH,17,2916.35,-2957.36,267.592,0,0,0,100,0),
(@PATH,18,2904.34,-2957.15,267.592,0,0,0,100,0),
(@PATH,19,2892.14,-2962.4,267.592,0,0,0,100,0),
(@PATH,20,2884.039,-2971.864,267.5926,0,0,0,100,0),
(@PATH,21,2870.617,-2985.568,267.5924,0,0,0,100,0),
(@PATH,22,2847.519,-2985.616,267.593,0,0,0,100,0),
(@PATH,23,2831.011,-2985.781,260.82,0,0,0,100,0),
(@PATH,24,2811.443,-2985.972,250.953,0,0,0,100,0),
(@PATH,25,2791.35,-2986.05,240.528,0,0,0,100,0),
(@PATH,26,2781.199,-2986.169,240.5265,0,0,0,100,0),
(@PATH,27,2763.189,-2986.039,240.5255,0,0,0,100,0),
(@PATH,28,2744.237,-2985.519,240.5257,0,0,0,100,0),
(@PATH,29,2734.137,-2977.427,240.5255,0,0,0,100,0),
(@PATH,30,2722.754,-2967.005,240.5243,0,0,0,100,0),
(@PATH,31,2708.031,-2957.228,240.5254,0,0,0,100,0),
(@PATH,32,2691.098,-2957.404,240.5251,0,0,0,100,0),
(@PATH,33,2676.669,-2966.855,240.5253,0,0,0,100,0),
(@PATH,34,2671.321,-2976.635,240.5246,0,0,0,100,0),
(@PATH,35,2671.421,-2993.49,240.5249,0,0,0,100,0),
(@PATH,36,2680.976,-3008.883,240.5253,0,0,0,100,0),
(@PATH,37,2696.83,-3014.89,240.524,0,0,0,100,0),
(@PATH,38,2709.55,-3013.26,240.524,0,0,0,100,0);

DELETE FROM `creature_formations` WHERE `leaderGUID`=127745;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(127745,127745,5,90,2),
(127745,127744,5,90,2);

-- Pathing for Death Knight Cavalier Entry: 16163
SET @NPC := 127743;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2787.864,`position_y`=-3320.589,`position_z`=267.6845 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=0,`position_x`=2787.864,`position_y`=-3320.589,`position_z`=267.6845 WHERE `guid`=127742;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,25278, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2787.931,-3363.628,267.6847,0,0,0,100,0),
(@PATH,2,2787.864,-3320.606,267.6845,0,0,0,100,0),
(@PATH,3,2787.388,-3287.191,267.6845,0,0,0,100,0),
(@PATH,4,2787.864,-3320.589,267.6845,0,0,0,100,0);
-- F1303F2316ADF300 .go 2787.931 -3363.628 267.6847

DELETE FROM `creature_formations` WHERE `leaderGUID`=127743;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(127743,127743,5,90,2),
(127743,127742,5,90,2);

-- Pathing for Death Knight Cavalier Entry: 16163
SET @NPC := 127754;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2911.993,`position_y`=-3204.611,`position_z`=273.3833 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2911.993,`position_y`=-3204.611,`position_z`=273.3833 WHERE `guid`=127753;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,25278, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2926.023,-3200.403,273.4004,0,0,0,100,0),
(@PATH,2,2931.457,-3188.328,273.3847,0,0,0,100,0),
(@PATH,3,2925.778,-3167.298,273.787,0,0,0,100,0),
(@PATH,4,2907.542,-3166.655,273.787,0,0,0,100,0),
(@PATH,5,2873.219,-3165.419,273.787,0,0,0,100,0),
(@PATH,6,2861.632,-3165.088,273.787,0,0,0,100,0),
(@PATH,7,2860.526,-3185.717,273.787,0,0,0,100,0),
(@PATH,8,2860.435,-3203.401,273.787,0,0,0,100,0),
(@PATH,9,2875.204,-3203.906,273.4075,0,0,0,100,0),
(@PATH,10,2892.834,-3204.38,273.3951,0,0,0,100,0),
(@PATH,11,2911.993,-3204.611,273.3833,0,0,0,100,0);
-- F1303F2317A7F300 .go 2926.023 -3200.403 273.4004
DELETE FROM `creature_formations` WHERE `leaderGUID`=127754;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(127754,127754,5,90,2),
(127754,127753,5,90,2);

-- Pathing for Shade of Naxxramas Entry: 16164
SET @NPC := 127756;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2892.747,`position_y`=-3294.521,`position_z`=298.1457 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2881.74,-3294.004,298.1457,0,0,0,100,0),
(@PATH,2,2870.605,-3303.931,298.1457,0,0,0,100,0),
(@PATH,3,2867.386,-3319,298.1457,0,0,0,100,0),
(@PATH,4,2863.142,-3340.528,298.1457,0,0,0,100,0),
(@PATH,5,2867.386,-3319,298.1457,0,0,0,100,0),
(@PATH,6,2870.605,-3303.931,298.1457,0,0,0,100,0),
(@PATH,7,2881.74,-3294.004,298.1457,0,0,0,100,0),
(@PATH,8,2892.747,-3294.521,298.1457,0,0,0,100,0),
(@PATH,9,2915.861,-3295.495,298.547,0,0,0,100,0),
(@PATH,10,2892.747,-3294.521,298.1457,0,0,0,100,0);

-- Pathing for Bony Construct Entry: 16167
SET @NPC := 127764;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2845.056,`position_y`=-3296.362,`position_z`=298.1237 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2847.821,-3308.784,298.1465,0,0,0,100,0),
(@PATH,2,2838.797,-3321.935,298.1519,0,0,0,100,0),
(@PATH,3,2847.821,-3308.784,298.1465,0,0,0,100,0),
(@PATH,4,2845.056,-3296.362,298.1237,0,0,0,100,0),
(@PATH,5,2832.532,-3295.221,298.1501,0,0,0,100,0),
(@PATH,6,2845.056,-3296.362,298.1237,0,0,0,100,0);

-- Pathing for Bony Construct Entry: 16167
SET @NPC := 127767;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2835.764,`position_y`=-3331.32,`position_z`=299.3642 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2830.406,-3329.089,304.8374,0,0,0,100,0),
(@PATH,2,2835.764,-3331.32,299.3642,0,0,0,100,0),
(@PATH,3,2842.907,-3323.556,298.1545,0,0,0,100,0),
(@PATH,4,2852.525,-3333.609,298.1457,0,0,0,100,0),
(@PATH,5,2854.874,-3350.62,298.1457,0,0,0,100,0),
(@PATH,6,2852.525,-3333.609,298.1457,0,0,0,100,0),
(@PATH,7,2842.907,-3323.556,298.1545,0,0,0,100,0),
(@PATH,8,2835.764,-3331.32,299.3642,0,0,0,100,0);

-- Pathing for Stoneskin Gargoyle Entry: 16168
SET @NPC := 127775;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2854.793,`position_y`=-3489.831,`position_z`=297.8863 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2872.719,-3489.734,297.6203,0,0,0,100,0),
(@PATH,2,2855.09,-3489.832,297.8829,0,0,0,100,0),
(@PATH,3,2836.616,-3489.816,297.8643,0,0,0,100,0),
(@PATH,4,2809.425,-3490.459,285.9723,0,0,0,100,0),
(@PATH,5,2775.243,-3489.796,274.0275,0,0,0,100,0),
(@PATH,6,2728.599,-3490.62,262.1311,0,0,0,100,0),
(@PATH,7,2775.243,-3489.796,274.0275,0,0,0,100,0),
(@PATH,8,2809.425,-3490.459,285.9723,0,0,0,100,0),
(@PATH,9,2836.616,-3489.816,297.8643,0,0,0,100,0),
(@PATH,10,2854.793,-3489.831,297.8863,0,0,0,100,0);

-- Pathing for Stoneskin Gargoyle Entry: 16168
SET @NPC := 127772;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2864.621,`position_y`=-3468.973,`position_z`=297.8703 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2871.249,-3500.704,297.6192,0,0,0,100,0),
(@PATH,2,2888.541,-3522.788,297.6146,0,0,0,100,0),
(@PATH,3,2905.121,-3519.568,297.863,0,0,0,100,0),
(@PATH,4,2921.399,-3509.922,297.4822,0,0,0,100,0),
(@PATH,5,2944.054,-3494.677,297.6308,0,0,0,100,0),
(@PATH,6,2921.399,-3509.922,297.4822,0,0,0,100,0),
(@PATH,7,2905.121,-3519.568,297.863,0,0,0,100,0),
(@PATH,8,2888.541,-3522.788,297.6146,0,0,0,100,0),
(@PATH,9,2871.249,-3500.704,297.6192,0,0,0,100,0),
(@PATH,10,2864.621,-3468.973,297.8703,0,0,0,100,0);

-- Pathing for Skeletal Smith Entry: 16193
SET @NPC := 127791;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2882.137,`position_y`=-3275.976,`position_z`=298.1409 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2899.501,-3263.09,298.1457,0,0,0,100,0),
(@PATH,2,2899.086,-3280.568,298.547,0,0,0,100,0),
(@PATH,3,2902.461,-3288.92,298.547,0,0,0,100,0),
(@PATH,4,2889.017,-3298.332,298.1457,0,0,0,100,0),
(@PATH,5,2879.739,-3293.503,298.1457,0,0,0,100,0),
(@PATH,6,2882.137,-3275.976,298.1409,0,0,0,100,0);

-- Pathing for Skeletal Smith Entry: 16193
SET @NPC := 127792;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2910.939,`position_y`=-3290.127,`position_z`=298.547 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2902.236,-3293.143,298.547,0,0,0,100,0),
(@PATH,2,2899.265,-3299.745,298.1457,0,0,0,100,0),
(@PATH,3,2902.873,-3306.907,298.1457,0,0,0,100,0),
(@PATH,4,2911.011,-3309.07,298.1457,0,0,0,100,0),
(@PATH,5,2920.521,-3308.821,298.1457,0,0,0,100,0),
(@PATH,6,2920.324,-3301.099,298.547,0,0,0,100,0),
(@PATH,7,2915.13,-3296.642,298.547,0,0,0,100,0),
(@PATH,8,2910.939,-3290.127,298.547,0,0,0,100,0);

-- Fix some screwed up / hacked up factions
UPDATE `creature_template` SET `faction_H`=`faction_A` WHERE `subname` IN ('The Assurance','The Cloudkisser','The Bravery');
UPDATE `creature_template` SET `faction_H`=`faction_A` WHERE `entry` IN (25013,25014);

-- Quest 12321 "A Righteous Sermon"
-- SAI for Inquisitor Hallard 
SET @ENTRY := 27316;
UPDATE `creature_template` SET `AIName`= 'SmartAI',`ScriptName`='' WHERE `entry`=@ENTRY; 
UPDATE `creature` SET `position_x`=3797.918,`position_y`=-677.4138,`position_z`=213.7526 WHERE id=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY; 
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid` IN (@ENTRY*100); 
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
-- AI
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,53,0,@ENTRY,1,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - on reset - load path 0'),
(@ENTRY,0,1,0,19,0,100,0,12321,0,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - on quest accept 12321 - run script'),
-- Script
(@ENTRY*100,9,0,0,0,0,100,0,1000,1000,0,0,54,180000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - pause path'),
(@ENTRY*100,9,1,0,0,0,100,0,100,100,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Turn off Questgiver flag'),
(@ENTRY*100,9,2,0,0,0,100,0,100,100,0,0,69,0,0,0,0,0,0,1,0,0,0,3801.585,-678.4510,213.7526,0, 'Inquisitor Hallard - Script - Move to'),
(@ENTRY*100,9,3,0,0,0,100,0,1500,1500,0,0,69,0,0,0,0,0,0,1,0,0,0,3800.602,-680.9520,213.5028,0, 'Inquisitor Hallard - Script - Move to'),
(@ENTRY*100,9,4,0,0,0,100,0,4000,4000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 0'),
(@ENTRY*100,9,5,0,0,0,100,0,6000,6000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 1'),
(@ENTRY*100,9,6,0,0,0,100,0,8000,8000,0,0,1,0,0,0,0,0,0,9,27577,0,30,0,0,0,0, 'Inquisitor Hallard - script - Mayor Godfrey Say text 0'),
(@ENTRY*100,9,7,0,0,0,100,0,3000,3000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 2'),
(@ENTRY*100,9,8,0,0,0,100,0,7000,7000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 3'),
(@ENTRY*100,9,9,0,0,0,100,0,3000,3000,0,0,1,1,0,0,0,0,0,9,27577,0,30,0,0,0,0, 'Inquisitor Hallard - script - Mayor Godfrey Say text 1'),
(@ENTRY*100,9,10,0,0,0,100,0,4000,4000,0,0,1,2,0,0,0,0,0,9,27577,0,30,0,0,0,0, 'Inquisitor Hallard - script - Mayor Godfrey Say text 2'),
(@ENTRY*100,9,11,0,0,0,100,0,4000,4000,0,0,1,3,0,0,0,0,0,9,27577,0,30,0,0,0,0, 'Inquisitor Hallard - script - Mayor Godfrey Say text 3'),
(@ENTRY*100,9,12,0,0,0,100,0,7000,7000,0,0,1,4,0,0,0,0,0,9,27577,0,30,0,0,0,0, 'Inquisitor Hallard - script - Mayor Godfrey Say text 4'),
(@ENTRY*100,9,13,0,0,0,100,0,7000,7000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 4'),
(@ENTRY*100,9,14,0,0,0,100,0,5000,5000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 5'),
(@ENTRY*100,9,15,0,0,0,100,0,5000,5000,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 6'),
(@ENTRY*100,9,16,0,0,0,100,0,5000,5000,0,0,11,49061,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - cast spell 49061'),
(@ENTRY*100,9,17,0,0,0,100,0,4000,4000,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 7'),
(@ENTRY*100,9,18,0,0,0,100,0,5000,5000,0,0,1,5,0,0,0,0,0,9,27577,0,30,0,0,0,0, 'Inquisitor Hallard - script - Mayor Godfrey Say text 5'),
(@ENTRY*100,9,19,0,0,0,100,0,3500,3500,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 8'),
(@ENTRY*100,9,20,0,0,0,100,0,3500,3500,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 9'),
(@ENTRY*100,9,21,0,0,0,100,0,500,500,0,0,1,6,0,0,0,0,0,9,27577,0,30,0,0,0,0, 'Inquisitor Hallard - script - Mayor Godfrey Say text 6'),
(@ENTRY*100,9,22,0,0,0,100,0,3000,3000,0,0,1,10,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 10'),
(@ENTRY*100,9,23,0,0,0,100,0,2000,2000,0,0,1,11,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 11'),
(@ENTRY*100,9,24,0,0,0,100,0,7000,7000,0,0,1,7,0,0,0,0,0,9,27577,0,30,0,0,0,0, 'Inquisitor Hallard - script - Mayor Godfrey Say text 7'),
(@ENTRY*100,9,25,0,0,0,100,0,7000,7000,0,0,1,12,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 12'),
(@ENTRY*100,9,26,0,0,0,100,0,12000,12000,0,0,1,8,0,0,0,0,0,9,27577,0,30,0,0,0,0, 'Inquisitor Hallard - script - Mayor Godfrey Say text 8'),
(@ENTRY*100,9,27,0,0,0,100,0,5000,5000,0,0,1,9,0,0,0,0,0,9,27577,0,30,0,0,0,0, 'Inquisitor Hallard - script - Mayor Godfrey Say text 9'),
(@ENTRY*100,9,28,0,0,0,100,0,13000,13000,0,0,1,13,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 13'),
(@ENTRY*100,9,29,0,0,0,100,0,7000,7000,0,0,1,10,0,0,0,0,0,9,27577,0,30,0,0,0,0, 'Inquisitor Hallard - script - Mayor Godfrey Say text 10'),
(@ENTRY*100,9,30,0,0,0,100,0,9000,9000,0,0,1,11,0,0,0,0,0,9,27577,0,30,0,0,0,0, 'Inquisitor Hallard - script - Mayor Godfrey Say text 11'),
(@ENTRY*100,9,31,0,0,0,100,0,5000,5000,0,0,1,14,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 14'),
(@ENTRY*100,9,32,0,0,0,100,0,5000,5000,0,0,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - turn to player'),
(@ENTRY*100,9,33,0,0,0,100,0,1000,1000,0,0,1,15,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 15'),
(@ENTRY*100,9,34,0,0,0,100,0,9000,9000,0,0,15,12321,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - give quest credit to player'),
(@ENTRY*100,9,35,0,0,0,100,0,1000,1000,0,0,66,0,0,0,0,0,0,9,27577,0,30,0,0,0,0, 'Inquisitor Hallard - script - turn to Mayor Godfrey'),
(@ENTRY*100,9,36,0,0,0,100,0,3000,3000,0,0,1,16,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Say text 16'),
(@ENTRY*100,9,37,0,0,0,100,0,10000,10000,0,0,81,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - Turn on Questgiver flag'),
(@ENTRY*100,9,38,0,0,0,100,0,0,0,0,0,78,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Inquisitor Hallard - script - reset creature');

-- waypoints for Inquisitor Hallard
DELETE FROM `waypoints` WHERE `entry` IN (@ENTRY); 
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES 
(@ENTRY,1,3804.538,-679.7090,213.7526, 'Inquisitor Hallard'), 
(@ENTRY,2,3802.979,-678.8114,214.2526, 'Inquisitor Hallard'),
(@ENTRY,3,3800.479,-678.0614,214.2526, 'Inquisitor Hallard'),
(@ENTRY,4,3797.918,-677.4138,213.7526, 'Inquisitor Hallard');

-- NPC talk text insert from sniff 
DELETE FROM `creature_text` WHERE `entry` IN (27316,27577); 
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES 
(27316,0,0, 'Stand back, $N, the beast might lash out and harm you.',12,7,100,396,0,0, 'Inquisitor Hallard'),
(27316,1,0, 'GODFREY! Hear me, fiend! Hear me, for I am the Light, here to deliver you from evil!',12,7,100,5,0,0, 'Inquisitor Hallard'),
(27577,0,0, '%s growls.',16,0,100,0,0,409, 'Mayor Godfrey'),
(27316,2,0, 'Good. I have your attention, then, Godfrey?',12,7,100,396,0,0, 'Inquisitor Hallard'),
(27316,3,0, 'We can do this in one of two ways, Godfrey. First, I will simply ask you to tell me what the unholy markings etched upon the pages of this tome mean. What say you?',12,7,100,1,0,0, 'Inquisitor Hallard'),
(27577,1,0, '%s hisses!',16,0,100,0,0,410, 'Mayor Godfrey'),
(27577,2,0, 'Tell you nothing, preacher.',12,0,100,1,0,0, 'Mayor Godfrey'),
(27577,3,0, 'What can you do to me that Kel''Thuzad has not? That the Lich King will not?',12,0,100,1,0,0, 'Mayor Godfrey'),
(27577,4,0, 'The book is your salvation, yes... but nothing will you know! NOTHING I SAY! NOTHING! ',12,0,100,1,0,0, 'Mayor Godfrey'),
(27316,4,0, 'Then it is option two.',12,7,100,1,0,0, 'Inquisitor Hallard'),
(27316,5,0, 'I say a prayer for you now, lost soul. May the Light take you gracefully.',12,7,100,68,4000,0, 'Inquisitor Hallard'),
(27316,6,0, 'Let the sermon begin.',12,7,100,1,0,0, 'Inquisitor Hallard'),
(27316,7,0, 'LIGHT TAKE YOU, BEAST!',12,7,100,0,0,0, 'Inquisitor Hallard'),
(27577,5,0, 'No more LIGHT! NO MORE! I BEG YOU!',12,0,100,0,0,0, 'Mayor Godfrey'),
(27316,8,0, 'BURN IN HOLY FIRE!',12,7,100,0,0,0, 'Inquisitor Hallard'),
(27316,9,0, 'LET THE LIGHT IN, GODFREY GOODARD!',12,7,100,0,0,0, 'Inquisitor Hallard'),
(27577,6,0, 'Never felt hurt like this!',12,0,100,0,0,0, 'Mayor Godfrey'),
(27316,10,0, 'May the power of Light compel you!',12,7,100,0,0,0, 'Inquisitor Hallard'),
(27316,11,0, 'I thought you would see the Light, Godfrey... Now speak quickly, fiend. What does it say?',12,7,100,396,0,0, 'Inquisitor Hallard'),
(27577,7,0, 'It tells of the coming apocalypse. How this world will burn and be reborn from death.',12,0,100,1,0,0, 'Mayor Godfrey'),
(27316,12,0, 'RUBBISH! Godfrey do you take me for a fool? Do not spew your Scourge propaganda at a man of the Light, heathen! Speak now or I will have the peasants craft a holy water bath and dip you into it like a dog with fleas!',12,7,100,6,0,0, 'Inquisitor Hallard'),
(27577,8,0, 'NOOOO!!! I tell you! I tell you everything!',12,0,100,39,0,0, 'Mayor Godfrey'),
(27577,9,0, 'Humans... Beneath the earth of Wintergarde Village you built a mausoleum! Why do you think Naxxramas attacked that spot? Thel''zan hides deep in your own crypt and sends a thousand-thousand corpses at you! Perish you will...',12,0,100,1,0,0, 'Mayor Godfrey'),
(27316,13,0, 'What? There is a mausoleum beneath the old village? What fools we are to not have noticed! We will find and strike down your master now, Godfrey. We will end this nightmare.',12,7,100,6,0,0, 'Inquisitor Hallard'),
(27577,10,0, 'How? Humans truly are stupid, yes? Thel''zan the Duskbringer! Thel''zan the Lich! He who is born of human flesh and bone, sacrificed all for power, protected by the Lich King!',12,0,100,1,0,0, 'Mayor Godfrey'),
(27577,11,0, 'You cannot stop Thel''zan! He bears the dark gift, bestowed upon him by the Lich King himself!',12,0,100,1,0,0, 'Mayor Godfrey'),
(27316,14,0, 'You let us worry about how we kill the monster, Godfrey.',12,7,100,396,0,0, 'Inquisitor Hallard'),
(27316,15,0, 'Return to Halford with the information that the good mayor was kind enough to submit, $N. I will finish here and squeeze whatever else this wretch might know about Thel''zan. Now, I will show Godfrey the rarely seen "option three."',12,7,100,1,0,0, 'Inquisitor Hallard'),
(27316,16,0, 'Let''s you and I have a chat about some things, Godfrey.',12,7,100,1,0,0, 'Inquisitor Hallard');

-- Add spell conditions for 49062
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=49062;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,49062,0,18,1,27577,0,0,'','Spell 49062 target creature 27577');

-- SAI for Grom'tor, Son of Oronok & Coilskar Commander (Shadowmoon Valley)
SET @ENTRY := 21291;
UPDATE `creature` SET `spawndist`=0,`MovementType`=0,`position_x`=-2815.424,`position_y`=1771.031,`position_z`=59.10168,`orientation`=4.967079 WHERE `guid`=74574;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY; 
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY; 
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=@ENTRY*100;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
-- AI
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,53,0,@ENTRY,1,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - On spawn - Start WP movement'),
(@ENTRY,0,1,0,1,0,100,0,10000,30000,240000,240000,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - OOC - Run Script'),
-- Script
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,54,16000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Pause path'),
(@ENTRY*100,9,1,0,0,0,100,0,0,0,0,0,69,0,0,0,0,0,0,1,0,0,0,-2814.744,1774.838,59.49939,0, 'Grom''tor, Son of Oronok - Script - Move to'),
(@ENTRY*100,9,2,0,0,0,100,0,1200,1200,0,0,66,0,0,0,0,0,0,19,21295,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Turn to Coilskar Commander'),
(@ENTRY*100,9,3,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Say text 0'),
(@ENTRY*100,9,4,0,0,0,100,0,4000,4000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Say text 1'),
(@ENTRY*100,9,5,0,0,0,100,0,3000,3000,0,0,5,5,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - do emote 5'),
(@ENTRY*100,9,6,0,0,0,100,0,4000,4000,0,0,1,0,0,0,0,0,0,19,21295,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Coilskar Commander Say text 0'),
(@ENTRY*100,9,7,0,0,0,100,0,1000,1000,0,0,65,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Resume path'),
(@ENTRY*100,9,8,0,0,0,100,0,4000,4000,0,0,1,1,0,0,0,0,0,19,21295,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Coilskar Commander Say text 1'),
(@ENTRY*100,9,9,0,0,0,100,0,4000,4000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Say text 2'),
(@ENTRY*100,9,10,0,0,0,100,0,2000,2000,0,0,54,26000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Pause path'),
(@ENTRY*100,9,11,0,0,0,100,0,2000,2000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Say text 3'),
(@ENTRY*100,9,12,0,0,0,100,0,2000,2000,0,0,1,2,0,0,0,0,0,19,21295,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Coilskar Commander Say text 2'),
(@ENTRY*100,9,13,0,0,0,100,0,5000,5000,0,0,69,0,0,0,0,0,0,1,0,0,0,-2814.744,1774.838,59.49939,0, 'Grom''tor, Son of Oronok - Script - Move to'),
(@ENTRY*100,9,14,0,0,0,100,0,1500,1500,0,0,66,0,0,0,0,0,0,19,21295,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Turn to Coilskar Commander'),
(@ENTRY*100,9,15,0,0,0,100,0,2000,2000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Say text 4'),
(@ENTRY*100,9,16,0,0,0,100,0,2000,2000,0,0,5,25,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - do emote 25'),
(@ENTRY*100,9,17,0,0,0,100,0,1500,1500,0,0,11,36538,0,0,0,0,0,19,21295,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - cast 36538 on Coilskar Commander'),
(@ENTRY*100,9,18,0,0,0,100,0,1200,1200,0,0,11,36540,0,0,0,0,0,19,21295,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - cast 36540 on Coilskar Commander'),
(@ENTRY*100,9,19,0,0,0,100,0,1200,1200,0,0,11,36538,0,0,0,0,0,19,21295,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - cast 36538 on Coilskar Commander'),
(@ENTRY*100,9,20,0,0,0,100,0,1200,1200,0,0,11,36538,0,0,0,0,0,19,21295,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - cast 36538 on Coilskar Commander'),
(@ENTRY*100,9,21,0,0,0,100,0,1200,1200,0,0,11,36540,0,0,0,0,0,19,21295,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - cast 36540 on Coilskar Commander'),
(@ENTRY*100,9,22,0,0,0,100,0,1200,1200,0,0,11,36539,0,0,0,0,0,19,21295,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - cast 36539 on Coilskar Commander'),
(@ENTRY*100,9,23,0,0,0,100,0,1500,1500,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Say text 5'),
(@ENTRY*100,9,24,0,0,0,100,0,500,500,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Say text 6'),
(@ENTRY*100,9,25,0,0,0,100,0,2500,2500,0,0,65,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Resume path'),
(@ENTRY*100,9,26,0,0,0,100,0,2500,2500,0,0,54,16000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Pause path'),
(@ENTRY*100,9,27,0,0,0,100,0,100,100,0,0,66,0,0,0,0,0,0,19,21295,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Turn to Coilskar Commander'),
(@ENTRY*100,9,28,0,0,0,100,0,500,500,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Say text 7'),
(@ENTRY*100,9,29,0,0,0,100,0,3000,3000,0,0,1,4,0,0,0,0,0,19,21295,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Coilskar Commander Say text 4'),
(@ENTRY*100,9,30,0,0,0,100,0,4000,4000,0,0,1,5,0,0,0,0,0,19,21295,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Coilskar Commander Say text 5'),
(@ENTRY*100,9,31,0,0,0,100,0,4000,4000,0,0,65,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Grom''tor, Son of Oronok - Script - Resume path');
-- Waypoints for Grom'tor, Son of Oronok from sniff
DELETE FROM `waypoints` WHERE `entry`=@ENTRY;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@ENTRY,1,-2817.188,1777.806,60.35168, 'Grom''tor, Son of Oronok'),
(@ENTRY,2,-2815.424,1771.031,59.10168, 'Grom''tor, Son of Oronok');
-- SAI for Coilskar Commander
SET @ENTRY := 21295;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY; 
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY; 
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,0,0,1,8,0,100,0,36539,0,0,0,11,36542,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Coilskar Commander - On Spellhit 36539 - cast 36542 on self'),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,90,7,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Coilskar Commander - On Spellhit 36539 - set bytes1 7'),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Coilskar Commander - On Spellhit 36539 - set phase 1'),
(@ENTRY,0,3,4,1,1,100,0,6000,6000,6000,6000,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Coilskar Commander - On Spellhit 36539 - Coilskar Commander Say text 3 (phase 1)'),
(@ENTRY,0,4,5,61,1,100,0,0,0,0,0,28,36542,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Coilskar Commander - On Spellhit 36539 - remove aura 36542 (phase 1)'),
(@ENTRY,0,5,6,61,1,100,0,0,0,0,0,91,7,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Coilskar Commander - On Spellhit 36539 - unset bytes1 7 (phase 1)'),
(@ENTRY,0,6,0,61,1,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Coilskar Commander - On Spellhit 36539 - set phase 0 (phase 1)');
-- NPC talk text insert from sniff
DELETE FROM `creature_text` WHERE `entry` IN (21291,21295);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(21291,0,0, 'I''m through asking nicely, fish-man.',12,0,100,25,0,0, 'Grom''tor, Son of Oronok'),
(21291,1,0, 'Where is the Cipher of Damnation? I know a third of it is in this village.',12,0,100,6,0,0, 'Grom''tor, Son of Oronok'),
(21295,0,0, 'Whhaaat... are you sssspeaking of, ssssoft-sskin?',12,0,100,1,0,0, 'Coilskar Commander'),
(21295,1,0, 'The naga do nottt... have thissss... cipherrr...',12,0,100,1,0,0, 'Coilskar Commander'),
(21291,2,0, 'No... Of course not. What was I thinking? Why would you have a third of the Cipher of Damnation?',12,0,100,274,0,0, 'Grom''tor, Son of Oronok'),
(21291,3,0, 'I feel so stupid. Maybe I should unchain you and set you free?',12,0,100,11,0,0, 'Grom''tor, Son of Oronok'),
(21295,2,0, 'Yesss... Yesss... Ssset me freee...',12,0,100,1,0,0, 'Coilskar Commander'),
(21291,4,0, 'DO I HONESTLY LOOK THAT STUPID TO YOU, NAGA? NOW YOU FEEL PAIN!',12,0,100,5,0,0, 'Grom''tor, Son of Oronok'),
(21291,5,0, '%s spits on the Coilskar naga.',16,0,100,5,0,0, 'Grom''tor, Son of Oronok'),
(21291,6,0, 'GET UP YOU ROTTEN PIECE OF TRASH! GET UP BEFORE I END YOU!',12,0,100,5,0,0, 'Grom''tor, Son of Oronok'),
(21295,3,0, '%s regains consciousness.',16,0,100,0,0,0, 'Coilskar Commander'),
(21291,7,0, 'I''m listening...',12,0,100,273,0,0, 'Grom''tor, Son of Oronok'),
(21295,4,0, 'Do not beat the Coilsssskaarrr commander anymore, orc! I will tell you! The cipherrr... It is hidden in one of the chests at Coilssskarrr Point... The naga there hold the keysss...',12,0,100,1,0,0, 'Coilskar Commander'),
(21295,5,0, 'COILSSSKARRR!',12,0,100,15,0,0, 'Coilskar Commander');

-- Plagued Proto-Dragon SAI
SET @ENTRY  := 23680;
SET @SPELL  := 21862; -- Radiation
SET @SPELL1 := 9573;  -- Flame Breath
SET @SPELL2 := 3391;  -- Thrash
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,23,0,100,0,@SPELL,0,2000,2000,11,@SPELL,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Plagued Proto-Dragon - Aura Radiation not present - Add Aura Radiation'),
(@ENTRY,0,1,0,0,0,100,0,5000,7000,10000,15000,11,@SPELL1,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Plagued Proto-Dragon - Combat - Cast Flame Breath on victim'),
(@ENTRY,0,2,0,0,0,100,0,10000,15000,20000,25000,11,@SPELL2,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Plagued Proto-Dragon - Combat - Cast Thrash on victim');
-- Plagued Proto-Dragon fix InhabitType
UPDATE `creature_template` SET `InhabitType`=7 WHERE entry=@ENTRY;
-- Plagued Proto-Dragon fix model info
UPDATE `creature_model_info` SET `bounding_radius`=0.225,`combat_reach`=3.75,`gender`=0 WHERE `modelid`=24874; -- Plagued Proto-Dragon
-- Plagued Proto-Dragon fix bytes1 and bytes2
DELETE FROM `creature_template_addon` WHERE `entry`=@ENTRY;
INSERT INTO `creature_template_addon` (`entry`,`bytes1`,`bytes2`) VALUES
(@ENTRY,50331648,1); -- Plagued Proto-Dragon
-- Pathing for Plagued Proto-Dragon Entry: 23680
SET @NPC := 107626;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=847.8322,`position_y`=-4441.198,`position_z`=159.749 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,838.0903,-4421.268,159.749,0,0,0,100,0),
(@PATH,2,801.8729,-4407.143,179.2211,0,0,0,100,0),
(@PATH,3,782.8507,-4413.701,194.3322,0,0,0,100,0),
(@PATH,4,777.4731,-4419.182,198.0821,0,0,0,100,0),
(@PATH,5,774.1382,-4438.679,206.8877,0,0,0,100,0),
(@PATH,6,814.439,-4462.499,206.8877,0,0,0,100,0),
(@PATH,7,848.4948,-4489.605,206.8877,0,0,0,100,0),
(@PATH,8,876.2105,-4490.642,206.8877,0,0,0,100,0),
(@PATH,9,896.0039,-4450.317,192.8044,0,0,0,100,0),
(@PATH,10,897.2634,-4422.887,179.6656,0,0,0,100,0),
(@PATH,11,907.506,-4392.95,179.6656,0,0,0,100,0),
(@PATH,12,933.834,-4369.785,166.0267,0,0,0,100,0),
(@PATH,13,956.7077,-4379.646,166.0267,0,0,0,100,0),
(@PATH,14,967.011,-4400.757,158.8045,0,0,0,100,0),
(@PATH,15,966.2571,-4425.053,159.749,0,0,0,100,0),
(@PATH,16,932.5647,-4461.108,159.749,0,0,0,100,0),
(@PATH,17,891.5416,-4476.208,159.749,0,0,0,100,0),
(@PATH,18,861.6124,-4460.188,159.749,0,0,0,100,0),
(@PATH,19,847.8322,-4441.198,159.749,0,0,0,100,0);

-- Shadow Adept <Cult of the Damned> SAI
SET @ENTRY   := 31145; -- NPC entry
SET @CHANNEL := 58847; -- Spell to cast
SET @TARGET  := 31245; -- Target creature entry
SET @SPELL1  := 60646; -- Shadow Blast
SET @SPELL2  := 17238; -- Drain Life
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,1000,1000,1000,1000,11,@CHANNEL,2,0,0,0,0,11,@TARGET,30,0,0,0,0,0, 'Shadow Adept - On spawn & reset - Channel Green Cultist Beam on target'),
(@ENTRY,0,1,0,0,0,100,0,4000,7000,6000,9000,11,@SPELL1,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Shadow Adept - Combat - Cast Shadow Blast on victim'),
(@ENTRY,0,2,0,2,0,100,0,0,80,20000,30000,11,@SPELL2,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Shadow Adept - Combat - Cast Drain Life on victim');
-- Invisible Ooze Stalker Fixup and set as trigger
UPDATE `creature` SET `modelid`=0,`spawndist`=0,`MovementType`=0 WHERE `id`=31245;
UPDATE `creature_template` SET `InhabitType`=7,`flags_extra`=`flags_extra`|128 WHERE `entry`=31245;

-- Iron Rune-Weaver SAI
SET @ENTRY   := 26820; -- NPC entry
SET @CHANNEL := 47463; -- Rune-Weaver Channel
SET @TARGET  := 26785; -- Directional Rune
SET @SPELL1  := 52713; -- Rune Weaving
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,1000,1000,1000,1000,11,@CHANNEL,2,0,0,0,0,11,@TARGET,30,0,0,0,0,0, 'Iron Rune-Weaver - On spawn & reset - Channel Rune-Weaver Channel on Directional Rune'),
(@ENTRY,0,1,0,0,0,100,0,4000,7000,10000,16000,11,@SPELL1,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Iron Rune-Weaver - Combat - Cast Rune Weaving on victim');
-- Fix Spell condition for Spell 47463 to only target Directional Rune
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=47463;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,47463,0,18,1,26785,0,0,'','Spell 47463 targets only Directional Rune');

-- Priest of Rhunok SAI
SET @ENTRY   := 28417; -- NPC entry
SET @CHANNEL := 51616; -- Priest of Rhunok: Channel to Prophet
SET @TARGET  := 28442; -- Prophet of Rhunok
SET @SPELL1  := 9734;  -- Holy Smite
SET @SPELL2  := 54518; -- Penance
SET @SPELL3  := 37274; -- Power Infusion
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,1000,1000,1000,1000,11,@CHANNEL,0,0,0,0,0,11,@TARGET,90,0,0,0,0,0, 'Priest of Rhunok - On spawn & reset - Priest of Rhunok: Channel to Prophet'),
(@ENTRY,0,1,0,0,0,100,0,2000,5000,10000,18000,11,@SPELL1,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Priest of Rhunok - Combat - Cast Holy Smite on victim'),
(@ENTRY,0,2,0,0,0,100,0,17000,26000,17000,20000,11,@SPELL2,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Priest of Rhunok - Combat - Cast Penance on victim'),
(@ENTRY,0,3,0,0,0,100,0,12000,16000,60000,60000,11,@SPELL3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Priest of Rhunok - Combat - Cast Power Infusion on self');
-- Fix Spell condition for Spell 51616 to only target Prophet of Rhunok
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=51616;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,51616,0,18,1,28442,0,0,'','Spell 51616 targets only Prophet of Rhunok');

-- Gossip Menu insert from sniff
DELETE FROM `gossip_menu` WHERE `entry`=8118 AND `text_id`=10054;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8118,10054);
DELETE FROM `gossip_menu` WHERE `entry`=8119 AND `text_id`=10056;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8119,10056);
DELETE FROM `gossip_menu` WHERE `entry`=8083 AND `text_id`=9993;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8083,9993);
DELETE FROM `gossip_menu` WHERE `entry`=8576 AND `text_id`=10752;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8576,10752);
-- Creature Gossip_menu_id Update from sniff
UPDATE `creature_template` SET `gossip_menu_id`=8646 WHERE `entry`=19539;
UPDATE `creature_template` SET `gossip_menu_id`=8118 WHERE `entry`=20470;
UPDATE `creature_template` SET `gossip_menu_id`=8119 WHERE `entry`=20471;
UPDATE `creature_template` SET `gossip_menu_id`=8083 WHERE `entry`=20084;
UPDATE `creature_template` SET `gossip_menu_id`=8576 WHERE `entry`=22899;
-- Creature Gossip_menu_option Update from sniff
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (7982) AND `id` IN (0);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (7982,7818) AND `id` IN (1);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(7982,0,5, 'Make this inn your home.',8,65536,0,0,0,0,0, ''),
(7982,1,1, 'I want to browse your goods.',3,128,0,0,0,0,0, ''),
(7818,1,1, 'Let me browse your goods.',3,128,0,0,0,0,0, '');
-- SAI for Karaaz,Dealer Aljaan,Dealer Digriz (Netherstorm)
SET @ENTRY := 21878;
UPDATE creature_template SET AIName='SmartAI' WHERE entry IN (20242,19533,19534);
DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid IN (20242,19533,19534);
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
(20242,0,0,0,1,0,100,0,1000,30000,60000,120000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Karaaz - OOC - Say Text 0'),
(19533,0,0,0,1,0,100,0,1000,30000,60000,120000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dealer Aljaan - OOC - Say Text 0'),
(19534,0,0,0,1,0,100,0,1000,30000,60000,120000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dealer Digriz - OOC - Say Text 0');
-- NPC talk text insert from sniff
DELETE FROM `creature_text` WHERE `entry` IN (20242,19533,19534) AND `groupid` IN (0);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(20242,0,0, 'The best selection of smuggled goods is available right here, $N.  Great for the whole family!  Avoid goblin taxation and naaru prohibition - the Consortium is here to fill your every shopping need!',12,0,100,1,0,0, 'Karaaz'),
(19533,0,0, 'A tradesman, perhaps? You need look no further than I for supplies. My prices are quite fair, friend. These items were difficult to acquire, but what does the source matter, eh? You''ll have what you need.',12,0,100,1,0,0, 'Dealer Aljaan'),
(19534,0,0, 'The creatures of this place are strong, wayfarer. You''ll need ample ammunition if you hope to survive. You''re in luck - I am well-stocked with fine arrows, bullets, and throwing weapons. The price is reasonable, considering circumstances.',12,0,100,1,0,0, 'Dealer Digriz');

-- Convert Grimscale Murloc EAI script to SAI
SET @ENTRY   := 15668; -- NPC entry
SET @SPELL   := 26661; -- Fear
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,6000,10000,18000,23000,11,@SPELL,3,0,0,0,0,2,0,0,0,0,0,0,0,'Grimscale Murloc - IC - Cast Fear');

-- Fixed Omen of Clarity proc
UPDATE `spell_proc_event` SET `ppmRate`=0,`CustomChance`=6,`Cooldown`=10 WHERE `entry`=16864;

DELETE FROM `waypoint_data` WHERE `id`=0;
SET @NPC := 107626;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=847.8322,`position_y`=-4441.198,`position_z`=159.749 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,838.0903,-4421.268,159.749,0,0,0,100,0),
(@PATH,2,801.8729,-4407.143,179.2211,0,0,0,100,0),
(@PATH,3,782.8507,-4413.701,194.3322,0,0,0,100,0),
(@PATH,4,777.4731,-4419.182,198.0821,0,0,0,100,0),
(@PATH,5,774.1382,-4438.679,206.8877,0,0,0,100,0),
(@PATH,6,814.439,-4462.499,206.8877,0,0,0,100,0),
(@PATH,7,848.4948,-4489.605,206.8877,0,0,0,100,0),
(@PATH,8,876.2105,-4490.642,206.8877,0,0,0,100,0),
(@PATH,9,896.0039,-4450.317,192.8044,0,0,0,100,0),
(@PATH,10,897.2634,-4422.887,179.6656,0,0,0,100,0),
(@PATH,11,907.506,-4392.95,179.6656,0,0,0,100,0),
(@PATH,12,933.834,-4369.785,166.0267,0,0,0,100,0),
(@PATH,13,956.7077,-4379.646,166.0267,0,0,0,100,0),
(@PATH,14,967.011,-4400.757,158.8045,0,0,0,100,0),
(@PATH,15,966.2571,-4425.053,159.749,0,0,0,100,0),
(@PATH,16,932.5647,-4461.108,159.749,0,0,0,100,0),
(@PATH,17,891.5416,-4476.208,159.749,0,0,0,100,0),
(@PATH,18,861.6124,-4460.188,159.749,0,0,0,100,0),
(@PATH,19,847.8322,-4441.198,159.749,0,0,0,100,0);

DELETE FROM `script_waypoint` WHERE `entry`=27316;

-- Remove Script text for Inquisitor Hallard
DELETE FROM `script_texts` WHERE `npc_entry`=27316;

DELETE FROM `spell_proc_event` WHERE `entry` = 21084;

DELETE FROM `spell_script_names` WHERE `spell_id`=62519;

UPDATE `creature_template` SET `flags_extra`=`flags_extra`|1 WHERE `entry`=38752; -- Green Dragon Combat Trigger

DELETE FROM `spell_script_names` WHERE `spell_id` = -48721;
INSERT INTO `spell_script_names` VALUES (-48721,'spell_dk_blood_boil');

