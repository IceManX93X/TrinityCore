DELETE FROM `creature_loot_template` WHERE `entry` IN (33288,33955);
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES 
-- 10 Man --
(33288,45087,75,1,0,1,1),   -- Runed orb
(33288,1,10,1,1,-34154,1),  -- Recipes
-- 4 - 0 Keeper
(33288,40753,100,1,0,2,2),  -- Emblem of Valor
(33288,2,100,1,0,-34132,2), -- Normal Loot (10)
(33288,3,100,1,0,-70000,1), -- Tier-Token
-- 1 or 0 Keeper (HardMode)
(33288,4,100,2,0,-12021,1), -- Emblem of Conquest
(33288,46068,0,2,1,1,1),    -- Amice of Inconceivable Horror
(33288,46095,0,2,1,1,1),    -- Soul-Devouring Cinch
(33288,46096,0,2,1,1,1),    -- Signet of Soft Lament
(33288,46097,0,2,1,1,1),    -- Caress of Insanity
(33288,46067,0,2,1,1,1),    -- Hammer of Crushing Whispers
-- 0 Keeper
(33288,5,100,4,0,-12022,1), -- Emblem of Conquest
(33288,46312,100,4,0,1,1),  -- Vanquished Clutches of Yogg-Saron

-- 25 Man --
(33955,45087,75,1,0,1,1),   -- Runed Orb
(33955,45038,100,1,0,1,1),  -- Fragment of Val'anyr
(33955,1,10,1,0,-34154,1),  -- Recipes
-- 4 - 0 Keeper
(33955,45624,100,1,0,2,2),  -- Emblem of Conquest
(33955,2,100,1,0,-34165,2), -- Normal Loot (25)
(33955,3,100,1,0,-70001,2), -- Tier-Token
-- 1 or 0 Keeper (HardMode)
(33955,4,100,2,0,-12021,1), -- Emblem of Conquest
(33955,45537,0,2,1,1,1),    -- Treads of the False Oracle
(33955,45536,0,2,1,1,1),    -- Legguards of Cunning Deception
(33955,45534,0,2,1,1,1),    -- Seal of the Betrayed King
(33955,45535,0,2,1,1,1),    -- Show of Faith
(33955,45533,0,2,1,1,1),    -- Dark Edge of Depravity
-- 0 Keeper
(33955,5,100,4,0,-12022,1), -- Emblem of Conquest
(33955,45693,100,4,0,1,1);  -- Mimiron's Head

DELETE FROM `reference_loot_template` WHERE `entry` IN (34132,34165,70000,70001,12021,12022);
INSERT INTO `reference_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
-- Yogg-Saron (10) Normal Loot
(34132,46030,0,1,1,1,1),    -- Treads of the Dragon Council
(34132,46019,0,1,1,1,1),    -- Leggings of the Insatiable
(34132,46028,0,1,1,1,1),    -- Faceguard of the Eyeless Horror
(34132,46022,0,1,1,1,1),    -- Pendant of a Thousand Maws
(34132,46021,0,1,1,1,1),    -- Royal Seal of King Llane
(34132,46024,0,1,1,1,1),    -- Kingsbane
(34132,46016,0,1,1,1,1),    -- Abaddon
(34132,46031,0,1,1,1,1),    -- Touch of Madness
(34132,46025,0,1,1,1,1),    -- Devotion
(34132,46018,0,1,1,1,1),    -- Deliverance
-- Yogg-Saron (25) Normal Loot
(34165,45529,0,1,1,1,1),    -- Shawl of Haunted Memories
(34165,45532,0,1,1,1,1),    -- Cowl of Dark Whispers
(34165,45523,0,1,1,1,1),    -- Garona's Guise
(34165,45524,0,1,1,1,1),    -- Chestguard of Insidious Intent
(34165,45531,0,1,1,1,1),    -- Chestguard of the Fallen God
(34165,45525,0,1,1,1,1),    -- Godbane Signet
(34165,45530,0,1,1,1,1),    -- Sanity's Bond
(34165,45522,0,1,1,1,1),    -- Blood of the Old God
(34165,45527,0,1,1,1,1),    -- Soulscribe
(34165,45521,0,1,1,1,1),    -- Earthshaper
-- Yogg-Saron (10) Tier-Token
(70000,45635,0,1,1,1,1),    -- Chestguard of the Wayward Conqueror
(70000,45636,0,1,1,1,1),    -- Chestguard of the Wayward Protector
(70000,45637,0,1,1,1,1),    -- Chestguard of the Wayward Vanquisher
-- Yogg-Saron (25) Tier-Token
(70001,45656,0,1,1,1,1),    -- Mantle of the Wayward Conqueror
(70001,45657,0,1,1,1,1),    -- Mantle of the Wayward Protector
(70001,45658,0,1,1,1,1),    -- Mantle of the Wayward Vanquisher
-- Emblem of Conquest 
(12021,45624,0,2,1,1,1),
(12022,45624,0,4,1,1,1);
