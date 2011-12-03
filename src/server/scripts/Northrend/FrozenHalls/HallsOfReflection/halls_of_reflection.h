/*
 * Copyright (C) 2008-2011 TrinityCore <http://www.trinitycore.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef DEF_HALLS_OF_REFLECTION_H
#define DEF_HALLS_OF_REFLECTION_H

enum Data
{
    DATA_FALRIC_EVENT,
    DATA_MARWYN_EVENT,
    DATA_LICHKING_EVENT,
    DATA_WAVE_COUNT,
    DATA_TEAM_IN_INSTANCE,
    
    DATA_ESCAPE_LIDER       = 101,
    DATA_LIDER              = 102,
    DATA_SUMMONS            = 103,

    TYPE_PHASE              = 0,
    TYPE_EVENT              = 1,
    TYPE_FALRIC             = 2,
    TYPE_MARWYN             = 3,
    TYPE_FROST_GENERAL      = 4,
    TYPE_LICH_KING          = 5,
    TYPE_ICE_WALL_01        = 6,
    TYPE_ICE_WALL_02        = 7,
    TYPE_ICE_WALL_03        = 8,
    TYPE_ICE_WALL_04        = 9,
    TYPE_HALLS              = 10,
    MAX_ENCOUNTERS,

    /*UNITS*/
    NPC_DARK_1                   = 38177, //Shadowy Mercenary
    NPC_DARK_2                   = 38176, //Tortured Rifleman
    NPC_DARK_3                   = 38173, //Spectral Footman
    NPC_DARK_4                   = 38172, //Phantom Mage
    NPC_DARK_5                   = 38567, //Phantom Hallucination
    NPC_DARK_6                   = 38175, //Ghostly Priest
    NPC_JAINA                    = 37221,
    NPC_SYLVANA                  = 37223,
    NPC_JAINA_OUTRO              = 36955,
    NPC_SYLVANA_OUTRO            = 37554,
    NPC_ALTAR_TARGET             = 37704,
    NPC_LICH_KING                = 36954,
    BOSS_LICH_KING               = 37226,
    NPC_ICE_WALL                 = 37014,
    NPC_GHOSTLY_ROGUE            = 38177,
    NPC_GHOSTLY_PRIEST           = 38175,
    NPC_GHOSTLY_MAGE             = 38172,
    NPC_GHOSTLY_FOOTMAN          = 38173,
    NPC_GHOSTLY_RIFLEMAN         = 38176,
    NPC_GLUK                     = 38567,

    NPC_RAGING_GNOUL             = 36940,
    NPC_RISEN_WITCH_DOCTOR       = 36941,
    NPC_ABON                     = 37069,

    NPC_FROST_GENERAL            = 36723,

    GO_ICECROWN_DOOR             = 201976, //72802
    GO_ICECROWN_DOOR_2           = 197342,
    GO_ICECROWN_DOOR_3           = 197343,
    GO_IMPENETRABLE_DOOR         = 197341, //72801

    GO_ICE_WALL_1                = 201385,
    GO_ICE_WALL_2                = 201885,
    GO_ICE_WALL_3                = 202396,
    GO_ICE_WALL_4                = 500001,
    GO_CAVE                      = 201596,
    GO_PORTAL                    = 202079,

    GO_CAPTAIN_CHEST_1           = 202212, //3145
    GO_CAPTAIN_CHEST_2           = 201710, //30357
    GO_CAPTAIN_CHEST_3           = 202337, //3246
    GO_CAPTAIN_CHEST_4           = 202336, //3333
};

enum Data64
{
    DATA_FALRIC,
    DATA_MARWYN,
    DATA_LICHKING,
    DATA_FROSTMOURNE,
};

enum Creatures
{
    NPC_FALRIC                                    = 38112,
    NPC_MARWYN                                    = 38113,
    NPC_LICH_KING_EVENT                           = 37226,
    NPC_LICH_KING_BOSS                            = 36954,

    NPC_UTHER                                     = 37225,
    NPC_JAINA_PART1                               = 37221,
    NPC_JAINA_PART2                               = 36955,
    NPC_SYLVANAS_PART1                            = 37223,
    NPC_SYLVANAS_PART2                            = 37554,

    NPC_WAVE_MERCENARY                            = 38177,
    NPC_WAVE_FOOTMAN                              = 38173,
    NPC_WAVE_RIFLEMAN                             = 38176,
    NPC_WAVE_PRIEST                               = 38175,
    NPC_WAVE_MAGE                                 = 38172,
};

enum GameObjects
{
    GO_FROSTMOURNE                                = 202302,
    GO_FROSTMOURNE_ALTAR                          = 202236,
    GO_FRONT_DOOR                                 = 201976,
    GO_ARTHAS_DOOR                                = 197341,
};

enum HorWorldStates
{
    WORLD_STATE_HOR                               = 4884,
    WORLD_STATE_HOR_WAVE_COUNT                    = 4882,
};

// Common actions from Instance Script to Boss Script
enum Actions
{
    ACTION_ENTER_COMBAT,
};

// Base class for FALRIC and MARWYN
// handled the summonList and the notification events to/from the InstanceScript
struct boss_horAI : ScriptedAI
{
    boss_horAI(Creature* creature) : ScriptedAI(creature), summons(creature)
    {
        instance = me->GetInstanceScript();
    }

    InstanceScript* instance;
    EventMap events;
    SummonList summons;

    void Reset()
    {
        events.Reset();
        me->SetVisible(false);
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE|UNIT_FLAG_NOT_SELECTABLE);
        me->SetReactState(REACT_PASSIVE);
    }

    void DamageTaken(Unit* /*who*/, uint32 &uiDamage)
    {
        if (me->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE))
            uiDamage = 0;
    }

    void DoAction(const int32 actionID)
    {
        switch (actionID)
        {
            case ACTION_ENTER_COMBAT:  // called by InstanceScript when boss shall enter in combat.
                // Just in case. Should have been done by InstanceScript
                me->SetVisible(true);

                // Reset flags
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE|UNIT_FLAG_NOT_SELECTABLE);
                me->SetReactState(REACT_AGGRESSIVE);

                if (Unit* unit = me->SelectNearestTarget())
                    AttackStart(unit);

                DoZoneInCombat();
                break;
        }
    }

    void JustSummoned(Creature* summoned)
    {
        summons.Summon(summoned);

        if (Unit* target = summoned->SelectNearestTarget())
        {
            if (summoned->AI())
                summoned->AI()->AttackStart(target);
            else
            {
                summoned->GetMotionMaster()->MoveChase(target);
                summoned->Attack(target, true);
            }
        }

        if (summoned->AI())
            summoned->AI()->DoZoneInCombat();
    }

    void SummonedCreatureDespawn(Creature* summoned)
    {
        summons.Despawn(summoned);
        if (summons.empty())
        {
            if (summoned->isAlive())
                instance->SetData(DATA_WAVE_COUNT, NOT_STARTED);
            else
                instance->SetData(DATA_WAVE_COUNT, SPECIAL);
        }
    }
};

#endif
