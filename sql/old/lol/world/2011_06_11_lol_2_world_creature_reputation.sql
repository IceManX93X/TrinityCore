-- Add Reputation gain/loss to High Admiral "Shelly" Jorrik
REPLACE INTO `creature_onkill_reputation` (`creature_id`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES
  (26081, 87, 21, 7, 0, 5, 7, 127, -125, 0);