-- Fix Gold Loot of Ulduar
SET @Gold_10_Trash_min  :=100000;
SET @Gold_10_Trash_max  :=@Gold_10_Trash_min*1.5;
SET @Gold_25_Trash_min  :=250000;
SET @Gold_25_Trash_max  :=@Gold_25_Trash_min*1.5;

UPDATE creature_template SET creature_template.mingold = @Gold_10_Trash_min, creature_template.maxgold = @Gold_10_Trash_max 
WHERE
entry IN (SELECT `id` FROM `creature` WHERE `map`=603) AND    -- Ulduar Map
faction_A IN (14,16) AND
faction_H IN (14,16) AND
rank=1 AND
entry NOT IN (34234,33236,34164,34164,32872); 


UPDATE creature_template INNER JOIN creature_template creat ON creature_template.entry = creat.difficulty_entry_1
SET creature_template.mingold = @Gold_25_Trash_min, creature_template.maxgold = @Gold_25_Trash_max 
WHERE
creat.entry IN (SELECT `id` FROM `creature` WHERE `map`=603) AND    -- Ulduar Map
creat.faction_A IN (14,16) AND
creat.faction_H IN (14,16) AND
creat.rank=1 AND
creat.entry NOT IN (34234,33236,34164,34164,32872);
