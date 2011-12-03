-- reference_loot entries of Epic Items
SET @R10        :=90003;    -- use old reference entry (10)
SET @R25        :=90004;    -- use old reference entry (25)
-- reference_loot entries of some Item Pools
SET @Green1     :=26016;    -- Green Items 1
SET @Green2     :=35080;    -- Green Items 2
SET @DesignMisc1:=10009;    -- Designs + Blue Items + Misc 1    
SET @DesignMisc2:=34110;    -- Designs + Blue Items + Misc 2
SET @DesignMisc3:=35067;    -- Designs + Blue Items + Misc 3
SET @DesignMisc4:=35081;    -- Designs + Blue Items + Misc 4
SET @GreyMisc   :=35063;    -- Grey Items + Misc
SET @Consumable :=35064;    -- Consumables (Eat-Drink/Mana-Heal Pot)
-- single Items
SET @Frost      :=33470;    -- Frostweave Cloth (only Humanoids)
SET @Necklace   :=43297;    -- Damaged Necklace
SET @Book       :=45912;    -- Book of Glyph Mastery
-- Dropchances in %
SET @Epic       :=  3;
SET @Rare       :=  3;
SET @Green      :=  8;
SET @Grey       :=100;
SET @Consume    := 25;
SET @Frostweave := 80;
SET @NeckBook   :=0.1;
-- Gold Loot
SET @Min_Gold_10:=100000;
SET @Max_Gold_10:=@Min_Gold_10*1.5;
SET @Min_Gold_25:=250000;
SET @Max_Gold_25:=@Min_Gold_25*1.5;
-- Reference Ulduar (10)
DELETE FROM `reference_loot_template` WHERE `entry`=@R10;
INSERT INTO `reference_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@R10,46341,0,1,1,1,1), -- Drape of the Spellweaver
(@R10,46351,0,1,1,1,1), -- Bloodcrush Cudgel
(@R10,46347,0,1,1,1,1), -- Cloak of the Dormant Blaze
(@R10,46344,0,1,1,1,1), -- Iceshear Mantle
(@R10,46346,0,1,1,1,1), -- Boots of Unsettled Prey
(@R10,46345,0,1,1,1,1), -- Bracers of Righteous Reformation
(@R10,46340,0,1,1,1,1), -- Adamant Handguards
(@R10,46343,0,1,1,1,1), -- Fervor of the Protectorate
(@R10,46339,0,1,1,1,1), -- Mimiron's Repeater
(@R10,46350,0,1,1,1,1), -- Pillar of Fortitude
(@R10,46342,0,1,1,1,1); -- Golemheart Longbow
-- Reference Ulduar (25)
DELETE FROM `reference_loot_template` WHERE `entry`=@R25;
INSERT INTO `reference_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@R25,45541,0,1,1,1,1), -- Shroud of Alteration
(@R25,45549,0,1,1,1,1), -- Grips of Chaos
(@R25,45547,0,1,1,1,1), -- Relic Hunter's Cord
(@R25,45548,0,1,1,1,1), -- Belt of the Sleeper
(@R25,45543,0,1,1,1,1), -- Shoulders of Misfortune
(@R25,45544,0,1,1,1,1), -- Leggings of the Tortured Earth
(@R25,45542,0,1,1,1,1), -- Greaves of the Stonewarder
(@R25,45540,0,1,1,1,1), -- Bladebearer's Signet
(@R25,45539,0,1,1,1,1), -- Pendant of Focused Energies
(@R25,45538,0,1,1,1,1), -- Titanstone Pendant
(@R25,46138,0,1,1,1,1), -- Idol of the Flourishing Life
(@R25,45605,0,1,1,1,1); -- Daschal's Bite
-- Ulduar Trash (10)
UPDATE `creature_template` SET `lootid`=`entry`,`mingold`=@Min_Gold_10,`maxgold`=@Max_Gold_10 WHERE `entry` IN (33354,33355,33430,33431,33525,33526,33527,33528,33699,33722,33754,33755,33772,33818,33819,33820,33822,33823,33824,34069,34085,34086,34133,34134,34135,34137,34183,34184,34190,34193,34196,34197,34198,34199,34267,34269,34271,34273);
DELETE FROM `creature_loot_template` WHERE `entry` IN (33354,33355,33430,33431,33525,33526,33527,33528,33699,33722,33754,33755,33772,33818,33819,33820,33822,33823,33824,34069,34085,34086,34133,34134,34135,34137,34183,34184,34190,34193,34196,34197,34198,34199,34267,34269,34271,34273);
-- Corrupted Servitor (10)
SET @ENTRY  :=33354;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Misguided Nymph (10)
SET @ENTRY  :=33355;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Guardian Lasher (10)
SET @ENTRY  :=33430;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Forest Swarmer (10) 
SET @ENTRY  :=33431;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Mangrove Ent (10) 
SET @ENTRY  :=33525;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Ironroot Lasher (10)
SET @ENTRY  :=33526;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Nature's Blade (10)
SET @ENTRY  :=33527;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Guardian of Life (10)
SET @ENTRY  :=33528;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Storm Tempered Keeper (10)
SET @ENTRY  :=33699;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Storm Tempered Keeper(10)
SET @ENTRY  :=33722;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Dark Rune Thunderer (10)
SET @ENTRY  :=33754;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,1,1);
-- Dark Rune Ravager (10)
SET @ENTRY  :=33755;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,1,1);
-- Faceless Horror (10)
SET @ENTRY  :=33772;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Twilight Adherent (10)
SET @ENTRY  :=33818;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,1,1);
-- Twilight Frost Mage (10)
SET @ENTRY  :=33819;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,1,1);
-- Twilight Pyromancer (10)
SET @ENTRY  :=33820;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,1,1);
-- Twilight Guardian (10)
SET @ENTRY  :=33822;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,1,1);
-- Twilight Slayer (10)
SET @ENTRY  :=33823;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,1,1);
-- Twilight Shadowblade (10)
SET @ENTRY  :=33824;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,1,1);
-- Molten Colossus (10)
SET @ENTRY  :=34069;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Forge Construct (10)
SET @ENTRY  :=34085;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Magma Rager (10)
SET @ENTRY  :=34086;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Champion of Hodir (10)
SET @ENTRY  :=34133;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,1,1);
-- Winter Revenant (10)
SET @ENTRY  :=34134;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Winter Rumbler (10)
SET @ENTRY  :=34135;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Winter Jormungar (10)
SET @ENTRY  :=34137;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Arachnopod Destroyer (10)
SET @ENTRY  :=34183;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Clockwork Mechanic (10)
SET @ENTRY  :=34184;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,1,1);
-- Hardened Iron Golem (10)
SET @ENTRY  :=34190;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Clockwork Sapper (10)
SET @ENTRY  :=34193;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,1,1);
-- Rune Etched Sentry (10)
SET @ENTRY  :=34196;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Chamber Overseer (10)
SET @ENTRY  :=34197;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Iron Mender (10)
SET @ENTRY  :=34198;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,1,1);
-- Lightning Charged Iron Dwarf (10)
SET @ENTRY  :=34199;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,1,1);
-- Parts Recovery Technician (10)
SET @ENTRY  :=34267;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,1,1);
-- XR-949 Salvagebot (10)
SET @ENTRY  :=34269;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- XD-175 Compactobot (10) 
SET @ENTRY  :=34271;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- XB-488 Disposalbot (10)
SET @ENTRY  :=34273;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R10,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Ulduar Trash (25)
UPDATE `creature_template` SET `lootid`=`entry`,`mingold`=@Min_Gold_25,`maxgold`=@Max_Gold_25 WHERE `entry` IN (33729,33737,33732,33731,33735,33734,33741,33733,33700,33723,33757,33758,33773,33827,33829,33830,33828,33832,33831,34185,34186,34201,34139,34141,34142,34140,34214,34219,34229,34220,34245,34226,34236,34237,34268,34270,34272,34274);
DELETE FROM `creature_loot_template` WHERE `entry` IN (33729,33737,33732,33731,33735,33734,33741,33733,33700,33723,33757,33758,33773,33827,33829,33830,33828,33832,33831,34185,34186,34201,34139,34141,34142,34140,34214,34219,34229,34220,34245,34226,34236,34237,34268,34270,34272,34274);
-- Corrupted Servitor (25)
SET @ENTRY  :=33729;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Misguided Nymph (25)
SET @ENTRY  :=33737;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Guardian Lasher (25)
SET @ENTRY  :=33732;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Forest Swarmer (25)
SET @ENTRY  :=33731;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Mangrove Ent (25)
SET @ENTRY  :=33735;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Ironroot Lasher (25)
SET @ENTRY  :=33734;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Nature's Blade (25)
SET @ENTRY  :=33741;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Guardian of Life (25)
SET @ENTRY  :=33733;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Storm Tempered Keeper (25)
SET @ENTRY  :=33700;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Storm Tempered Keeper (25)
SET @ENTRY  :=33723;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Dark Rune Thunderer (25)
SET @ENTRY  :=33757;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Dark Rune Ravager (25)
SET @ENTRY  :=33758;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Faceless Horror (25)
SET @ENTRY  :=33773;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Twilight Adherent (25)
SET @ENTRY  :=33827;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Twilight Frost Mage (25)
SET @ENTRY  :=33829;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Twilight Pyromancer (25)
SET @ENTRY  :=33830;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Twilight Guardian (25)
SET @ENTRY  :=33828;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Twilight Slayer (25)
SET @ENTRY  :=33832;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Twilight Shadowblade (25)
SET @ENTRY  :=33831;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Molten Colossus (25)
SET @ENTRY  :=34185;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Forge Construct (25)
SET @ENTRY  :=34186;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Magma Rager (25)
SET @ENTRY  :=34201;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Champion of Hodir (25)
SET @ENTRY  :=34139;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Winter Revenant (25)
SET @ENTRY  :=34141;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Winter Rumbler (25)
SET @ENTRY  :=34142;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Winter Jormungar (25)
SET @ENTRY  :=34140;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Arachnopod Destroyer (25)
SET @ENTRY  :=34214;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Clockwork Mechanic (25)
SET @ENTRY  :=34219;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Hardened Iron Golem (25)
SET @ENTRY  :=34229;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Clockwork Sapper (25)
SET @ENTRY  :=34220;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Rune Etched Sentry (25)
SET @ENTRY  :=34245;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Chamber Overseer (25)
SET @ENTRY  :=34226;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- Iron Mender (25)
SET @ENTRY  :=34236;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Lightning Charged Iron Dwarf (25)
SET @ENTRY  :=34237;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- Parts Recovery Technician (25)
SET @ENTRY  :=34268;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1),
(@ENTRY,@Frost,@Frostweave,1,0,2,7);
-- XR-949 Salvagebot (25)
SET @ENTRY  :=34270;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- XD-175 Compactobot (25)
SET @ENTRY  :=34272;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);
-- XB-488 Disposalbot (25)
SET @ENTRY  :=34274;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,1,@Epic,1,0,-@R25,1),
(@ENTRY,2,@Green,1,0,-@Green1,1),
(@ENTRY,3,@Green,1,0,-@Green2,1),
(@ENTRY,4,@Rare,1,0,-@DesignMisc1,1),
(@ENTRY,5,@Rare,1,0,-@DesignMisc2,1),
(@ENTRY,6,@Rare,1,0,-@DesignMisc3,1),
(@ENTRY,7,@Rare,1,0,-@DesignMisc4,1),
(@ENTRY,8,@Grey,1,0,-@GreyMisc,1),
(@ENTRY,9,@Consume,1,0,-@Consumable,1),
(@ENTRY,@Necklace,0.1,1,0,1,1),
(@ENTRY,@Book,@NeckBook,1,0,1,1);