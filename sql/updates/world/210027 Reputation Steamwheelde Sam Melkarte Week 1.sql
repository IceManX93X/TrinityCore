-- New Quest for Sam Melkarte Improve Reputation for Steamwheedle Cartel ID 210027 Week 1

INSERT INTO `quest_template` (`entry`, `Method`, `ZoneOrSort`, `SkillOrClassMask`, `MinLevel`, `MaxLevel`, `QuestLevel`, `Type`, `RequiredRaces`, `RequiredSkillValue`, 
`RepObjectiveFaction`, `RepObjectiveValue`, `RepObjectiveFaction2`, `RepObjectiveValue2`, `RequiredMinRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepFaction`,
 `RequiredMaxRepValue`, `SuggestedPlayers`, `LimitTime`, `QuestFlags`, `SpecialFlags`, `CharTitleId`, `PlayersSlain`, `BonusTalents`, `RewardArenaPoints`, `PrevQuestId`,
 `NextQuestId`, `ExclusiveGroup`, `NextQuestInChain`, `RewXPId`, `SrcItemId`, `SrcItemCount`, `SrcSpell`, `Title`, `Details`, `Objectives`, `OfferRewardText`,
 `RequestItemsText`, `EndText`, `CompletedText`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `ReqItemId1`, `ReqItemId2`, `ReqItemId3`,
 `ReqItemId4`, `ReqItemId5`, `ReqItemId6`, `ReqItemCount1`, `ReqItemCount2`, `ReqItemCount3`, `ReqItemCount4`, `ReqItemCount5`, `ReqItemCount6`, `ReqSourceId1`,
 `ReqSourceId2`, `ReqSourceId3`, `ReqSourceId4`, `ReqSourceCount1`, `ReqSourceCount2`, `ReqSourceCount3`, `ReqSourceCount4`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOId2`,
 `ReqCreatureOrGOId3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount1`, `ReqCreatureOrGOCount2`, `ReqCreatureOrGOCount3`, `ReqCreatureOrGOCount4`, `ReqSpellCast1`,
 `ReqSpellCast2`, `ReqSpellCast3`, `ReqSpellCast4`, `RewChoiceItemId1`, `RewChoiceItemId2`, `RewChoiceItemId3`, `RewChoiceItemId4`, `RewChoiceItemId5`,
 `RewChoiceItemId6`, `RewChoiceItemCount1`, `RewChoiceItemCount2`, `RewChoiceItemCount3`, `RewChoiceItemCount4`, `RewChoiceItemCount5`, `RewChoiceItemCount6`,
 `RewItemId1`, `RewItemId2`, `RewItemId3`, `RewItemId4`, `RewItemCount1`, `RewItemCount2`, `RewItemCount3`, `RewItemCount4`, `RewRepFaction1`, `RewRepFaction2`,
 `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValueId1`, `RewRepValueId2`, `RewRepValueId3`, `RewRepValueId4`, `RewRepValueId5`, `RewRepValue1`,
 `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `RewHonorAddition`, `RewHonorMultiplier`, `unk0`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`,
 `RewSpellCast`, `RewMailTemplateId`, `RewMailDelaySecs`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`,
 `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `IncompleteEmote`, `CompleteEmote`, `OfferRewardEmote1`,
 `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`,
 `StartScript`, `CompleteScript`, `WDBVerified`)
 VALUES
 (210027, 2, 3703, 0, 60, 0, 70, 0, 0, 0, 0, 0, 0, 0, 169, 0, 0, 0, 0, 0, 4096, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Freundschaft mit den Goblins',
 'Hallo, $GEdler:Edle $N. Meine alten Freunde, die Goblins des Dampfdruckkartells geben dir eine Chance, in Ihrer Achtung zu steigen. Wenn ihr mir Sammelkarten bringt. Viele Sammelkarten. 500 verbreitete, 50 weniger verbreitete, um genau zu sein. Was meint ihr, wollt ihr das tun ?',
 'Bringe 500 weit verbreitete und 50 weniger verbreitete Sammelkarten zu Sam Melkarte', '$GEdler:Edle $N, ich und das Dampfdruckkartell stehen in Eurer Schuld. Ihr habt dort Ansehen gewonnen',
 'Verzeiht $GBursche:Maid, Ihr habt noch nicht genug Karten gesammelt.', NULL, NULL, NULL, NULL, NULL, NULL, 210001, 210002, 0, 0, 0, 0, 500, 50, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 369, 470, 577, 0, 6, 6, 6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);

-- Bind Quest to Sam Melkarte ID 1000104

INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (1000104, 210027);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (100104, 210027);

-- Deactivate Sam Melkarte

DELETE FROM `creature` WHERE `guid`=410052;
 