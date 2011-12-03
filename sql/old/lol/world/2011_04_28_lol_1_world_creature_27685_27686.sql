-- Quest 'Heated Battle' #12416 #12448 - Reduce Spawntimesecs
-- 27685 -- Frigid Ghoul Attacker
-- 27686 -- Frigid Geist Attacker
UPDATE `creature` SET `spawntimesecs` = 30 WHERE `id` IN (27685,27686);