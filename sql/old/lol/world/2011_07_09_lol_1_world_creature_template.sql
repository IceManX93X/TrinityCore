-- Add Stun-Immune to XT-002 Heart; 2048 = MECHANIC_STUN
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask` | 2048 WHERE `entry` IN (
33995, -- Heart of the Deconstructor (Heroic)
33329  -- Heart of the Deconstructor
)