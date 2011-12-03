-- Broggok Poison Cloud
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|0x4|0x20000, `flags_extra`=`flags_extra`|128, `ScriptName`='' WHERE `entry` IN (17662,18602);

-- Cosmetic Drakkari Bat [PH]
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|0x2, `flags_extra`=`flags_extra`|0x2 WHERE `entry`=27490;

-- Harbinger Skyriss (heroic)
UPDATE `creature_template` SET `Health_mod`=33 WHERE `entry`=21601;
