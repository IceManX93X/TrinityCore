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

/* ScriptData
SDName: Boss Black Knight
SD%Complete: 95%
SDComment: not sure about timers.
SDCategory: Trial of the Champion
EndScriptData */

#include "ScriptPCH.h"
#include "ScriptedEscortAI.h"
#include "trial_of_the_champion.h"

enum Enums
{
    // Yell
    SAY_DEATH_3             = -1999935,
    SAY_AGGRO               = -1999929,
    SAY_AGGRO_2             = -1999930,
    SAY_SLAY                = -1999932,
    SAY_DEATH_1             = -1999933,
    SAY_DEATH               = -1999934,
    SAY_START5              = -1999936,
    SAY_START6              = -1999937,
    SAY_START7              = -1999928,
    SAY_START8              = -1999929,
    SAY_START9              = -1999952,
    SAY_START10             = -1999932,
    SAY_START11             = -1999953,
    SAY_KILL                = -1999969,
    SAY_KILL1               = -1999970
};

enum Spells
{
    // phase 1
    SPELL_PLAGUE_STRIKE_H   = 67884,
    SPELL_PLAGUE_STRIKE     = 67724,
    SPELL_ICY_TOUCH_H       = 67881,
    SPELL_ICY_TOUCH         = 67718,
    SPELL_DEATH_RESPITE     = 67745,
    SPELL_DEATH_RESPITE_H   = 68306,
    SPELL_DEATH_RESPITE_3   = 66798,
    SPELL_OBLITERATE_H      = 67883,
    SPELL_OBLITERATE        = 67725,
    // in this phase should rise herald (the spell is missing)

    // phase 2 - During this phase, the Black Knight will use the same abilities as in phase 1, except for Death's Respite
    SPELL_ARMY_DEAD         = 67761,
    SPELL_ARMY_DEAD_H       = 67874,
    SPELL_DESECRATION       = 67778,
    SPELL_DESECRATION_H     = 67877,
    SPELL_GHOUL_EXPLODE     = 67751,

    // phase 3
    SPELL_DEATH_BITE_H      = 67875,
    SPELL_DEATH_BITE        = 67808,
    SPELL_MARKED_DEATH_H    = 67882,
    SPELL_MARKED_DEATH      = 67823,

    SPELL_BLACK_KNIGHT_RES  = 67693,

    SPELL_LEAP              = 67749,
    SPELL_LEAP_H            = 67880
};

enum Models
{
    MODEL_SKELETON          = 29846,
    MODEL_GHOST             = 21300
};

enum Eqip
{
    EQUIP_SWORD             = 40343
};

enum IntroPhase
{
    IDLE,
    INTRO,
    FINISHED
};

enum Phases
{
    PHASE_UNDEAD    = 1,
    PHASE_SKELETON  = 2,
    PHASE_GHOST     = 3
};

enum Misc
{
    ACHIEV_WORSE                                  = 3804,
    ACHIEV_HEROIC_DONE_H                          = 4297,
    ACHIEV_HEROIC_DONE_A                          = 4298,
    ACHIEV_NORMAL_DONE_H                          = 4296,
    ACHIEV_NORMAL_DONE_A                          = 3778
};

class boss_black_knight : public CreatureScript
{
public:
    boss_black_knight() : CreatureScript("boss_black_knight") { }

    struct boss_black_knightAI : public ScriptedAI
    {
        boss_black_knightAI(Creature* creature) : ScriptedAI(creature)
        {
            instance = creature->GetInstanceScript();
        }

        InstanceScript* instance;

        std::list<uint64> SummonList;

        bool bEventInProgress;
        bool bEvent;
        bool bSummonArmy;
        bool bDeathArmyDone;
        bool bEventInBattle;
        bool bFight;

        uint8 uiPhase;
        uint8 uiIntroPhase;

        IntroPhase Phase;

        uint32 uiIntroTimer;
        uint32 uiPlagueStrikeTimer;
        uint32 uiIcyTouchTimer;
        uint32 uiDeathRespiteTimer;
        uint32 uiObliterateTimer;
        uint32 uiDesecration;
        uint32 uiResurrectTimer;
        uint32 uiDeathArmyCheckTimer;
        uint32 uiGhoulExplodeTimer;
        uint32 uiDeathBiteTimer;
        uint32 uiMarkedDeathTimer;

        void Reset()
        {
            RemoveSummons();
            me->SetDisplayId(me->GetNativeDisplayId());
            me->ClearUnitState(UNIT_STAT_ROOT | UNIT_STAT_STUNNED);

            bEventInProgress = false;
            bEvent = false;
            bSummonArmy = false;
            bDeathArmyDone = false;
            bFight = false;

            if (GameObject* go = GameObject::GetGameObject(*me, instance->GetData64(DATA_MAIN_GATE1)))
                instance->HandleGameObject(go->GetGUID(), true);
            if (GameObject* go = GameObject::GetGameObject(*me, instance->GetData64(DATA_MAIN_GATE1)))
                instance->HandleGameObject(go->GetGUID(), false);

            if (bEventInBattle)
                me->GetMotionMaster()->MovePoint(1, 743.396f, 635.411f, 411.575f);

            uiPhase = PHASE_UNDEAD;

            uiIcyTouchTimer = urand(5000, 9000);
            uiPlagueStrikeTimer = urand(10000, 13000);
            uiDeathRespiteTimer = urand(15000, 16000);
            uiObliterateTimer = urand(17000, 19000);
            uiDesecration = urand(15000, 16000);
            uiDeathArmyCheckTimer = 7000;
            uiResurrectTimer = 4000;
            uiGhoulExplodeTimer = 8000;
            uiDeathBiteTimer = urand (2000, 4000);
            uiMarkedDeathTimer = urand (5000, 7000);
            uiIntroTimer = 5000;
        }

        void RemoveSummons()
        {
            if (SummonList.empty())
                return;

            for (std::list<uint64>::const_iterator itr = SummonList.begin(); itr != SummonList.end(); ++itr)
            {
                if (Creature* temp = Unit::GetCreature(*me, *itr))
                    if (temp)
                        temp->DisappearAndDie();
            }
            SummonList.clear();
        }

        void JustSummoned(Creature* summon)
        {
            SummonList.push_back(summon->GetGUID());
            summon->AI()->AttackStart(me->getVictim());
        }

        void UpdateAI(uint32 const diff)
        {
            if (!UpdateVictim())
                return;

            if (bEventInProgress)
            {
                if (uiResurrectTimer <= diff)
                {
                    me->SetFullHealth();
                    switch (uiPhase)
                    {
                        case PHASE_UNDEAD:
                            DoScriptText(SAY_DEATH_1, me);
                            break;
                        case PHASE_SKELETON:
                            DoScriptText(SAY_DEATH, me);
                            break;
                    }
                    DoCast(me, SPELL_BLACK_KNIGHT_RES, true);
                    uiPhase++;
                    uiResurrectTimer = 4000;
                    bEventInProgress = false;
                    me->ClearUnitState(UNIT_STAT_ROOT | UNIT_STAT_STUNNED);
                }
                else
                    uiResurrectTimer -= diff;
            }

            switch (uiPhase)
            {
                case PHASE_UNDEAD:
                case PHASE_SKELETON:
                {
                    if (uiIcyTouchTimer <= diff)
                    {
                        DoCastVictim(RAID_MODE(SPELL_ICY_TOUCH, SPELL_ICY_TOUCH_H));
                        uiIcyTouchTimer = urand(5000, 7000);
                    }
                    else
                        uiIcyTouchTimer -= diff;

                    if (uiPlagueStrikeTimer <= diff)
                    {
                        DoCastVictim(RAID_MODE(SPELL_PLAGUE_STRIKE, SPELL_PLAGUE_STRIKE_H));
                        uiPlagueStrikeTimer = urand(12000, 15000);
                    }
                    else
                        uiPlagueStrikeTimer -= diff;

                    if (uiObliterateTimer <= diff)
                    {
                        DoCastVictim(RAID_MODE(SPELL_OBLITERATE, SPELL_OBLITERATE_H));
                        uiObliterateTimer = urand(17000, 19000);
                    }
                    else
                        uiObliterateTimer -= diff;

                    switch (uiPhase)
                    {
                        case PHASE_UNDEAD:
                        {
                            if (uiDeathRespiteTimer <= diff)
                            {
                                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                                    DoCast(target, RAID_MODE(SPELL_DEATH_RESPITE, SPELL_DEATH_RESPITE_H));
                                 uiDeathRespiteTimer = urand(15000, 16000);
                            }
                            else
                                uiDeathRespiteTimer -= diff;
                            break;
                        }
                        case PHASE_SKELETON:
                        {
                            if (!bSummonArmy)
                            {
                                bSummonArmy = true;
                                me->AddUnitState(UNIT_STAT_ROOT | UNIT_STAT_STUNNED);
                                DoCast(me, RAID_MODE(SPELL_ARMY_DEAD, SPELL_ARMY_DEAD_H));
                            }

                            if (!bDeathArmyDone)
                            {
                                if (uiDeathArmyCheckTimer <= diff)
                                {
                                    me->ClearUnitState(UNIT_STAT_ROOT | UNIT_STAT_STUNNED);
                                    uiDeathArmyCheckTimer = 0;
                                    bDeathArmyDone = true;
                                }
                                else
                                    uiDeathArmyCheckTimer -= diff;
                            }

                            if (uiDesecration <= diff)
                            {
                                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                                    DoCast(target, RAID_MODE(SPELL_DESECRATION, SPELL_DESECRATION_H));
                                uiDesecration = urand(15000, 16000);
                            }
                            else
                                uiDesecration -= diff;

                            if (uiGhoulExplodeTimer <= diff)
                            {
                                DoCast(me, SPELL_GHOUL_EXPLODE);
                                uiGhoulExplodeTimer = 8000;
                            }
                            else
                                uiGhoulExplodeTimer -= diff;
                            break;
                        }
                        break;
                    }
                    break;
                }
                case PHASE_GHOST:
                {
                    if (uiDeathBiteTimer <= diff)
                    {
                        DoCastAOE(RAID_MODE(SPELL_DEATH_BITE, SPELL_DEATH_BITE_H));
                        uiDeathBiteTimer = urand (2000, 4000);
                    }
                    else
                        uiDeathBiteTimer -= diff;

                    if (uiMarkedDeathTimer <= diff)
                    {
                        if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                            DoCast(target, RAID_MODE(SPELL_MARKED_DEATH, SPELL_MARKED_DEATH_H));
                        uiMarkedDeathTimer = urand (5000, 7000);
                    }
                    else
                        uiMarkedDeathTimer -= diff;
                    break;
                }
            }

            if (!me->HasUnitState(UNIT_STAT_ROOT) && !me->HealthBelowPct(1))
                DoMeleeAttackIfReady();
        }

        void EnterCombat(Unit* /*who*/)
        {
            bEventInBattle = true;
            DoScriptText(SAY_AGGRO_2, me);
            SetEquipmentSlots(false, EQUIP_SWORD, EQUIP_NO_CHANGE, EQUIP_NO_CHANGE);

            if (GameObject* go = GameObject::GetGameObject(*me, instance->GetData64(DATA_MAIN_GATE1)))
                instance->HandleGameObject(go->GetGUID(), false);
            if (GameObject* go = GameObject::GetGameObject(*me, instance->GetData64(DATA_MAIN_GATE)))
                instance->HandleGameObject(go->GetGUID(), false);
        }

        void DamageTaken(Unit* /*attacker*/, uint32& damage)
        {
            if (damage > me->GetHealth() && uiPhase <= PHASE_SKELETON)
            {
                damage = 0;
                me->SetHealth(0);
                me->AddUnitState(UNIT_STAT_ROOT | UNIT_STAT_STUNNED);
                RemoveSummons();
                switch (uiPhase)
                {
                    case PHASE_UNDEAD:
                        me->SetDisplayId(MODEL_SKELETON);
                        break;
                    case PHASE_SKELETON:
                        me->SetDisplayId(MODEL_GHOST);
                        break;
                }
                bEventInProgress = true;
            }
        }

        void KilledUnit(Unit* /*victim*/)
        {
            DoScriptText(urand(0, 1) ? SAY_KILL : SAY_KILL1, me);
            if (instance)
                instance->SetData(BOSS_BLACK_KNIGHT, IN_PROGRESS);
        }

        void JustDied(Unit* /*killer*/)
        {
            DoScriptText(SAY_DEATH_3, me);

            if (GameObject* go = GameObject::GetGameObject(*me, instance->GetData64(DATA_MAIN_GATE1)))
                instance->HandleGameObject(go->GetGUID(), true);

            if (instance)
            {
                instance->SetData(BOSS_BLACK_KNIGHT, DONE);

                if (IsHeroic())
                {
                    instance->DoCompleteAchievement(ACHIEV_WORSE);
                    if (instance->GetData(DATA_TEAM_IN_INSTANCE) == TEAM_ALLIANCE)
                    {
                        instance->DoCompleteAchievement(ACHIEV_HEROIC_DONE_A);
                    }
                    else
                    {
                        instance->DoCompleteAchievement(ACHIEV_HEROIC_DONE_H);
                    }
                }
                else
                {
                    if (instance->GetData(DATA_TEAM_IN_INSTANCE) == TEAM_ALLIANCE)
                    {
                        instance->DoCompleteAchievement(ACHIEV_NORMAL_DONE_A);
                    }
                    else
                    {
                        instance->DoCompleteAchievement(ACHIEV_NORMAL_DONE_H);
                    }
                }
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_black_knightAI (creature);
    }
};

class npc_risen_ghoul : public CreatureScript
{
public:
    npc_risen_ghoul() : CreatureScript("npc_risen_ghoul") { }

    struct npc_risen_ghoulAI : public ScriptedAI
    {
        npc_risen_ghoulAI(Creature* creature) : ScriptedAI(creature) {}

        uint32 _attackTimer;

        void Reset()
        {
            _attackTimer = 3500;
        }

        void UpdateAI(uint32 const diff)
        {
            if (!UpdateVictim())
                return;

            if (_attackTimer <= diff)
            {
                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 1, 100, true))
                    DoCast(target, (SPELL_LEAP));
                _attackTimer = 3500;
            }
            else
                _attackTimer -= diff;

            DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_risen_ghoulAI(creature);
    }
};

class npc_black_knight_skeletal_gryphon : public CreatureScript
{
public:
    npc_black_knight_skeletal_gryphon() : CreatureScript("npc_black_knight_skeletal_gryphon") { }

    struct npc_black_knight_skeletal_gryphonAI : public npc_escortAI
    {
        npc_black_knight_skeletal_gryphonAI(Creature* creature) : npc_escortAI(creature)
        {
            Start(false, true, 0, NULL);
        }

        void WaypointReached(uint32 /*i*/)
        {
        }

        void UpdateAI(uint32 const diff)
        {
            npc_escortAI::UpdateAI(diff);

            if (!UpdateVictim())
                return;
        }

    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_black_knight_skeletal_gryphonAI(creature);
    }
};

void AddSC_boss_black_knight()
{
    new boss_black_knight();
    new npc_risen_ghoul();
    new npc_black_knight_skeletal_gryphon();
}
