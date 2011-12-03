-- Hauptmenü Gossips
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) 
VALUES(55554, 1, 0, "Allgemeine Informationen zum Server", 1, 1, 55555, 0, 0, 0, ""),
(55554, 2, 0, "Questfragen", 1, 1, 55556, 0, 0, 0, ""),
(55554, 3, 0, "Channelfragen", 1, 1, 55557, 0, 0, 0, ""),
(55554, 4, 0, "InGame Befehle", 1, 1, 55558, 0, 0, 0, ""),
(55554, 5, 0, "Sonstiges", 1, 1, 55559, 0, 0, 0, "");

-- Hauptmenü
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) 
VALUES(700000, 0, 0, 0, 62, 0, 100, 0, 55554, 1, 0, 0, 45, 55557, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'on gossip select - set data 0 1'),
(700000, 0, 1, 0, 62, 0, 100, 0, 55554, 0, 0, 0, 45, 55555, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'on gossip select - set data 0 1'),
(700000, 0, 2, 0, 62, 0, 100, 0, 55554, 0, 0, 0, 45, 55556, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'on gossip select - set data 0 1'),
(700000, 0, 3 0, 62, 0, 100, 0, 55554, 0, 0, 0, 45, 55557 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'on gossip select - set data 0 1');



-- NPC
INSERT INTO creature_template (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) 
VALUES(700000, 0, 0, 0, 0, 0, 22669, 0, 0, 0, "Fragomat", "Ich beantworte (fast) jede Frage", "Directions", 55554, 111, 111, 0, 5, 5, 1, 1, 1, 0.9, 0, 111, 111, 0, 666, 1, 2000, 2000, 8, 2, 8, 0, 0, 0, 0, 0, 222, 222, 111, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "", 1, 4, 11111, 11111, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, "", 12340);


INSERT INTO npc_text (`entryorguid`, `source_type`, `id`, `link`,	`event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`,	`target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES(55557, "a", "", 0, 0, 0, 0, 0, 0, 0, 0, "b", "c", 0, 0, 0, 0, 0, 0, 0, 0, "d", "e", 0, 0, 0, 0, 0, 0, 0, 0, "f", "g", 0, 0, 0, 0, 0, 0, 0, 0, "h", "i", 0, 0, 0, 0, 0, 0, 0, 0, "j", "k", 0, 0, 0, 0, 0, 0, 0, 0, "l", "m", 0, 0, 0, 0, 0, 0, 0, 0, "m", "n", 0, 0, 0, 0, 0, 0, 0, 0, 12340);


entryorguid  source_type  id  link  event_type  event_phase_mask  event_chance  event_flags  event_param1  event_param2  event_param3  event_param4  action_type  action_param1  action_param2  action_param3  action_param4  action_param5  action_param6  target_type  target_param1  target_param2  target_param3  target_x  target_y  target_z  target_o  comment                                                                      
700000       0            1   0     62          0                 100           0            55554         0             0             0             45           55555          1              0              0              0              0              1            0              0              0              0         0         0         0         on gossip select - set data 0 1                                              
700000       0            0   0     62          0                 100           0            55554         0             0             0             45           0              1              0              0              0              0              1            0              0              0              0         0         0         0         on gossip select - set data 0 1      

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) 
VALUES(700000, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 98, 55554, 55557, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'on gossip select - set data 0 1');                                     