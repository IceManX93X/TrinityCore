-- Fix Creature Loot of Rar Elite Mobs in Nordend
-- source: www.old.wowhead.de
UPDATE `creature_template` SET `lootid` = 32357 WHERE `entry` = 32357;  -- Old Crystalbark
UPDATE `creature_template` SET `lootid` = 32358 WHERE `entry` = 32358;  -- Fumblub Gearwind
UPDATE `creature_template` SET `lootid` = 32361 WHERE `entry` = 32361;  -- Icehorn
UPDATE `creature_template` SET `lootid` = 32400 WHERE `entry` = 32400;  -- Tukemuth
UPDATE `creature_template` SET `lootid` = 32409 WHERE `entry` = 32409;  -- Crazed Indu'le Survivor
UPDATE `creature_template` SET `lootid` = 32417 WHERE `entry` = 32417;  -- Scarlet Highlord Daion
UPDATE `creature_template` SET `lootid` = 32517 WHERE `entry` = 32517;  -- Loque'nahak
UPDATE `creature_template` SET `lootid` = 32485 WHERE `entry` = 32485;  -- King Krush
UPDATE `creature_template` SET `lootid` = 32481 WHERE `entry` = 32481;  -- Aotona
UPDATE `creature_template` SET `lootid` = 32377 WHERE `entry` = 32377;  -- Perobas the Bloodthirster
UPDATE `creature_template` SET `lootid` = 32386 WHERE `entry` = 32386;  -- Vigdis die Kriegsmaid
UPDATE `creature_template` SET `lootid` = 32398 WHERE `entry` = 32398;  -- King Ping
UPDATE `creature_template` SET `lootid` = 32422 WHERE `entry` = 32422;  -- Grocklar
UPDATE `creature_template` SET `lootid` = 32429 WHERE `entry` = 32429;  -- Seething Hate
UPDATE `creature_template` SET `lootid` = 32438 WHERE `entry` = 32438;  -- Syreian the Bonecarver
UPDATE `creature_template` SET `lootid` = 38453 WHERE `entry` = 38453;  -- Arcturis
UPDATE `creature_template` SET `lootid` = 32447 WHERE `entry` = 32447;  -- Zul'drak Sentinel
UPDATE `creature_template` SET `lootid` = 32471 WHERE `entry` = 32471;  -- Griegen
UPDATE `creature_template` SET `lootid` = 32475 WHERE `entry` = 32475;  -- Terror Spinner
UPDATE `creature_template` SET `lootid` = 33776 WHERE `entry` = 33776;  -- Gondria
UPDATE `creature_template` SET `lootid` = 32630 WHERE `entry` = 32630;  -- Vyragosa
UPDATE `creature_template` SET `lootid` = 32500 WHERE `entry` = 32500;  -- Dirkee
UPDATE `creature_template` SET `lootid` = 32491 WHERE `entry` = 32491;  -- Time-Lost Proto Drake
UPDATE `creature_template` SET `lootid` = 35189 WHERE `entry` = 35189;  -- Skoll
UPDATE `creature_template` SET `lootid` = 32501 WHERE `entry` = 32501;  -- High Thane Jorfus
UPDATE `creature_template` SET `lootid` = 32495 WHERE `entry` = 32495;  -- Hildana Deathstealer
UPDATE `creature_template` SET `lootid` = 32487 WHERE `entry` = 32487;  -- Putridus the Ancient
-- Loot
DELETE FROM `creature_loot_template` WHERE `entry` IN 
(32357,32358,32361,32400,32409,32417,32517,32485,32481,32377,32386,32398,32422,32429,32438,38453,32447,32471,32475,33776,32630,32500,32491,35189,32501,32495,32487);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
-- Old Crystalbark
(32357,44649,99,1,0,1,1),
(32357,44663,97,1,0,1,1),
-- Fumblub Gearwind
(32358,44666,99,1,0,1,1),
(32358,44663,98,1,0,1,1),
-- Icehorn
(32361,44667,100,1,0,1,1),
(32361,44663,98,1,0,1,1),
-- Tukemuth
(32400,44673,99,1,0,1,1),
(32400,44663,92,1,0,1,1),
(32400,42104,-33,1,0,1,1),
-- Crazed Indu'le Survivor
(32409,44672,99,1,0,1,1),
(32409,44663,96,1,0,1,1),
-- Scarlet Highlord Daion
(32417,44671,99,1,0,1,1),
(32417,44663,97,1,0,1,1),
-- Loque'nahak
(32517,44688,73,1,0,1,1),
(32517,44687,26,1,0,1,1),
(32517,44663,98,1,0,1,1),
-- King Krush
(32485,44683,99,1,0,1,1),
(32485,44663,96,1,0,1,1),
-- Aotona
(32481,44691,99,1,0,1,1),
(32481,44663,97,1,0,1,1),
-- Perobas the Bloodthirster
(32377,44669,100,1,0,1,1),
(32377,44663,97,1,0,1,1),
-- Vigdis die Kriegsmaid
(32386,44670,99,1,0,1,1),
(32386,44663,98,1,0,1,1),
-- King Ping
(32398,44668,100,1,0,1,1),
(32398,44663,97,1,0,1,1),
-- Grocklar
(32422,44675,98,1,0,1,1),
(32422,44663,94,1,0,1,1),
-- Seething Hate
(32429,44674,99,1,0,1,1),
(32429,44663,96,1,0,1,1),
-- Syreian the Bonecarver
(32438,44676,98,1,0,1,1),
(32438,44663,97,1,0,1,1),
-- Arcturis
(38453,51958,99,1,0,1,1),
(38453,44663,98,1,0,1,1),
-- Zul'drak Sentinel
(32447,44677,98,1,0,1,1),
(32447,44663,95,1,0,1,1),                                 
-- Griegen
(32471,44686,98,1,0,1,1),
(32471,44663,96,1,0,1,1),
-- Terror Spinner
(32475,44685,100,1,0,1,1),
(32475,44663,97,1,0,1,1),
-- Gondria
(33776,46324,99,1,0,1,1),
(33776,44663,98,1,0,1,1),
-- Vyragosa
(32630,44732,99,1,0,1,1),
(32630,44663,96,1,0,1,1),
-- Dirkee
(32500,44681,89,1,0,1,1),
(32500,44708,10,1,0,1,1),
(32500,44663,94,1,0,1,1),
-- Time-Lost Proto Drake
(32491,44682,99,1,0,1,1),
(32491,44663,99,1,0,1,1),
(32491,44168,99,1,0,1,1),
-- Skoll
(35189,49227,98,1,0,1,1),
(35189,44663,99,1,0,1,1),
-- High Thane Jorfus
(32501,44695,99,1,0,1,1),
(32501,44663,96,1,0,1,1),
(32501,41989,-33,1,0,1,1),
-- Hildana Deathstealer
(32495,44697,99,1,0,1,1),
(32495,44663,96,1,0,1,1),
-- Putridus the Ancient
(32487,44696,98,1,0,1,1),
(32487,44663,93,1,0,1,1);