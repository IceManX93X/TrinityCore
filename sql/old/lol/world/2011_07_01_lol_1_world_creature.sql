UPDATE `creature_template` SET `minlevel`=60, `maxlevel`=60, `unit_flags`=33587968, `InhabitType`=7, `flags_extra`=130, `ScriptName`='npc_generic_oracle_treasure_trigger' WHERE `entry`=28088;
UPDATE `creature_template` SET `ScriptName`='' WHERE `entry`=19656;

UPDATE `creature` SET `id`=28088 WHERE `id`=19656 AND `map`=571;
