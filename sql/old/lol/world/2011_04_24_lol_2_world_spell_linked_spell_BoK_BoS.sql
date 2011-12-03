-- Fix Blessing of Kings and Blessing of Sanctuary Stacking each other
SET @BoS    = 20911; -- Blessing of Sanctuary
SET @BoK    = 20217; -- Blessing of Kings
SET @GBoK   = 25898; -- Greater Blessing of Kings
SET @GBoS   = 25899; -- Greater Blessing of Sanctuary
SET @BoFK   = 72586; -- Blessing of Forgotten Kings 
DELETE FROM `spell_group` WHERE `id` = 5000;
DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 5000;
DELETE FROM `spell_linked_spell` WHERE `spell_effect` IN (-@BoS,-@BoK,-@GBoK,-@GBoS,-@BoFK);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
-- Remove BoS
(@BoK,-@BoS,1,'Target - Remove: Blessing of Sanctuary on Spellhit: Blessing of Kings'),
(@GBoK,-@BoS,1,'Target - Remove: Blessing of Sanctuary on Spellhit: Greater Blessing of Kings'),
(@GBoS,-@BoS,1,'Target - Remove: Blessing of Sanctuary on Spellhit: Greater Blessing of Sanctuary'),
(@BoFK,-@BoS,1,'Target - Remove: Blessing of Sanctuary on Spellhit: Blessing of Forgotten Kings'),
-- Remove BoK
(@BoS,-@BoK,1,'Target - Remove: Blessing of Kings on Spellhit: Blessing of Sanctuary'),
(@GBoK,-@BoK,1,'Target - Remove: Blessing of Kings on Spellhit: Greater Blessing of Kings'),
(@GBoS,-@BoK,1,'Target - Remove: Blessing of Kings on Spellhit: Greater Blessing of Sanctuary'),
(@BoFK,-@BoK,1,'Target - Remove: Blessing of Kings on Spellhit: Blessing of Forgotten Kings'), 
-- Remove GBoK
(@BoS,-@GBoK,1,'Target - Remove: Greater Blessing of Kings on Spellhit: Blessing of Sanctuary'),
(@BoK,-@GBoK,1,'Target - Remove: Greater Blessing of Kings on Spellhit: Blessing of Kings'),
(@GBoS,-@GBoK,1,'Target - Remove: Greater Blessing of Kings on Spellhit: Greater Blessing of Sanctuary'),
(@BoFK,-@GBoK,1,'Target - Remove: Greater Blessing of Kings on Spellhit: Blessing of Forgotten Kings'), 
-- Remove GBoS
(@BoS,-@GBoS,1,'Target - Remove: Greater Blessing of Sanctuary on Spellhit: Blessing of Sanctuary'),
(@BoK,-@GBoS,1,'Target - Remove: Greater Blessing of Sanctuary on Spellhit: Blessing of Kings'),
(@GBoK,-@GBoS,1,'Target - Remove: Greater Blessing of Sanctuary on Spellhit: Greater Blessing of Kings'),
(@BoFK,-@GBoS,1,'Target - Remove: Greater Blessing of Sanctuary on Spellhit: Blessing of Forgotten Kings'), 
-- Remove BoFK
(@BoS,-@BoFK,1,'Target - Remove: Blessing of Forgotten Kings on Spellhit: Blessing of Sanctuary'),
(@BoK,-@BoFK,1,'Target - Remove: Blessing of Forgotten Kings on Spellhit: Blessing of Kings'),
(@GBoK,-@BoFK,1,'Target - Remove: Blessing of Forgotten Kings on Spellhit: Greater Blessing of Kings'),
(@GBoS,-@BoFK,1,'Target - Remove: Blessing of Forgotten Kings on Spellhit: Greater Blessing of Sanctuary');