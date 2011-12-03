-- Dreadscale, Icehowl, Anub'arak, Gormok the Impaler, Shocuul
UPDATE `creature_template` SET `minlevel`=83, `maxlevel`=83, `mindmg`=509, `maxdmg`=683, `attackpower`=805, `dmg_multiplier`=70,
       `dynamicflags`=8, `minrangedmg`=371, `maxrangedmg`=535, `rangedattackpower`=135
       WHERE `entry` IN (35514,35447,34566,35438,35737);

-- Fjola Lightbane, Lord Jaraxxus, Eydis Darkbane, Tyrius Duskblade, Kavina Grovesong, Melador Valestrider, Alyssia Moonstalker,
-- Velanaa, Baelnor Lightbearer, Shaabad, Saamul, Thrakgar, Broln Stouthorn, Malithas Brightblade, Liandra Suncaller, Ruj'kah,
-- Erin Misthoof, Birana Stormhoof, Gorgrim Shadowcleave
UPDATE `creature_template` SET `minlevel`=83, `maxlevel`=83, `mindmg`=496, `maxdmg`=674, `attackpower`=783, `dmg_multiplier`=70,
       `dynamicflags`=8, `minrangedmg`=365, `maxrangedmg`=529, `rangedattackpower`=98
       WHERE `entry` IN (35350,35216,35347,35743,35702,35714,35662,35663,35664,35746,35668,35734,35728,35740,35680,35708,35705,
                         35724,35686,35671,35692);

-- Cat
UPDATE `creature_template` SET `minlevel`=80, `maxlevel`=80, `mindmg`=422, `maxdmg`=586, `attackpower`=642, `dmg_multiplier`=10,
       `dynamicflags`=8, `minrangedmg`=345, `maxrangedmg`=509, `rangedattackpower`=103
       WHERE `entry`=35774;
       
-- Noozle Whizzlestick, Anthar Forgemender, Brienna Nightfell, Serissa Grimdabbler, Harkzog, Vivienne Blackwhisper,
-- Caiphus the Stern, Ginselle Blightslinger
UPDATE `creature_template` SET `minlevel`=83, `maxlevel`=83, `mindmg`=370, `maxdmg`=531, `attackpower`=343, `dmg_multiplier`=70,
       `dynamicflags`=8, `minrangedmg`=365, `maxrangedmg`=542, `rangedattackpower`=84
       WHERE `entry` IN (35721,35665,35666,35667,35674,35731,35695,34442,35683,35689);

-- Maz'dinah, Irieth Shadowstep
UPDATE `creature_template` SET `minlevel`=83, `maxlevel`=83, `mindmg`=388, `maxdmg`=583,
       `attackpower`=146, `dmg_multiplier`=24, `dynamicflags`=8, `minrangedmg`=365, `maxrangedmg`=529,
       `rangedattackpower`=98 WHERE `entry` IN (34454,35711,35712,35713,34472,35699,35700,35701);

-- Gormok the Impaler
UPDATE `creature_template` SET `equipment_id`=1762 WHERE `entry`=35438;

-- Lord Jaraxxus
UPDATE `creature_template` SET `equipment_id`=1979 WHERE `entry`=35216;

-- Alyssia Moonstalker, Anthar Forgemender
UPDATE `creature_template` SET `dmg_multiplier`=35 WHERE `entry` IN (35663,35664,35666,35667);

-- Maz'dinah, Irieth Shadowstep
UPDATE `creature_template` SET `dmg_multiplier`=12 WHERE `entry` IN (34454,35712,34472,35700);

-- Zhaagrym
UPDATE `creature_template` SET `minlevel`=80, `maxlevel`=80, `exp`=2, `faction_A`=16, `faction_H`=16, `mindmg`=417, `maxdmg`=582,
       `attackpower`=608, `dmg_multiplier`=10, `unit_class`=2, `dynamicflags`=8, `minrangedmg`=341, `maxrangedmg`=506,
       `rangedattackpower`=80 WHERE `entry` IN (35465,36301,36302,36303);
       
UPDATE `creature_template` SET `difficulty_entry_1`=36301, `difficulty_entry_2`=36302, `difficulty_entry_3`=36303 WHERE `entry`=35465;
UPDATE `creature_template` SET `name`='Zhaagrym (1)' WHERE `entry`=36301;
