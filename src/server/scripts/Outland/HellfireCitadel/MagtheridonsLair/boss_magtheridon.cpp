/*
 * Copyright (C) 2008-2011 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2006-2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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

#include "ScriptPCH.h"
#include "magtheridons_lair.h"

struct Yell
{
    int32 id;
};

static Yell RandomTaunt[]=
{
    {-1544000},
    {-1544001},
    {-1544002},
    {-1544003},
    {-1544004},
    {-1544005},
};

const Position Pos[5] =
{
    {-55.6891f,  2.17024f, 0.714280f, 0.05236f},
    {-31.9479f,  40.2201f, 0.714251f, 4.93928f},
    { 10.4777f,  23.9914f, 0.714224f, 3.66519f},
    { 10.3369f, -19.7942f, 0.714241f, 2.53073f},
    {-31.7645f, -35.8374f, 0.714268f, 1.37881f}
};

#define SAY_FREED                   -1544006
#define SAY_AGGRO                   -1544007
#define SAY_BANISH                  -1544008
#define SAY_CHAMBER_DESTROY         -1544009
#define SAY_PLAYER_KILLED           -1544010
#define SAY_DEATH                   -1544011

#define EMOTE_BERSERK               -1544012
#define EMOTE_BLASTNOVA             -1544013
#define EMOTE_BEGIN                 -1544014
#define EMOTE_BONDS_WEAKEN          "Magtheridon's bonds begin to weaken!"

#define MOB_MAGTHERIDON     17257
#define MOB_ROOM            17516
#define MOB_CHANNELLER      17256
#define MOB_ABYSSAL         17454

#define SPELL_BLASTNOVA             30616
#define SPELL_CLEAVE                30619
#define SPELL_QUAKE_TRIGGER         30657
#define SPELL_QUAKE_KNOCKBACK       30571
#define SPELL_BLAZE_TARGET          30541
#define SPELL_BLAZE_TRAP            30542
#define SPELL_DEBRIS_KNOCKDOWN      36449
#define SPELL_DEBRIS_VISUAL         30632
#define SPELL_DEBRIS_DAMAGE         30631
#define SPELL_CAMERA_SHAKE          36455
#define SPELL_BERSERK               27680

#define SPELL_SHADOW_CAGE           30168
#define SPELL_SHADOW_GRASP          30410
#define SPELL_SHADOW_GRASP_VISUAL   30166
#define SPELL_MIND_EXHAUSTION       44032   //Casted by the cubes when channeling ends

#define SPELL_SHADOW_CAGE_C         30205
#define SPELL_SHADOW_GRASP_C        30207

#define SPELL_SHADOW_BOLT_VOLLEY    30510
#define SPELL_DARK_MENDING          30528
#define SPELL_FEAR                  30530 //39176
#define SPELL_BURNING_ABYSSAL       30511
#define SPELL_SOUL_TRANSFER         30531

#define SPELL_FIRE_BLAST            37110

// count of clickers needed to interrupt blast nova
#define CLICKERS_COUNT              5

typedef std::map<uint64, uint64> CubeMap;

class mob_abyssal : public CreatureScript
{
public:
    mob_abyssal() : CreatureScript("mob_abyssal") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_abyssalAI(creature);
    }

    struct mob_abyssalAI : public ScriptedAI
    {
        mob_abyssalAI(Creature* c) : ScriptedAI(c)
        {
            trigger = 0;
            Despawn_Timer = 60000;
        }

        uint32 FireBlast_Timer;
        uint32 Despawn_Timer;
        uint32 trigger;

        void Reset()
        {
            FireBlast_Timer = 6000;
        }

            void SpellHit(Unit*, const SpellInfo* spell)
        {
            if (trigger == 2 && spell->Id == SPELL_BLAZE_TARGET)
            {
                DoCast(me, SPELL_BLAZE_TRAP, true);
                me->SetVisible(false);
                Despawn_Timer = 130000;
            }
        }

        void SetTrigger(uint32 _trigger)
        {
            trigger = _trigger;
            me->SetDisplayId(11686);
            if (trigger == 1) //debris
            {
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                DoCast(me, SPELL_DEBRIS_VISUAL, true);
                FireBlast_Timer = 5000;
                Despawn_Timer = 10000;
            }
        }

        void EnterCombat(Unit * /*who*/)
        {
            DoZoneInCombat();
        }

        void AttackStart(Unit* who)
        {
            if (!trigger)
                ScriptedAI::AttackStart(who);
        }

        void MoveInLineOfSight(Unit* who)
        {
            if (!trigger)
                ScriptedAI::MoveInLineOfSight(who);
        }

        void UpdateAI(const uint32 diff)
        {
            if (trigger)
            {
                if (trigger == 1)
                {
                    if (FireBlast_Timer <= diff)
                    {
                        DoCast(me, SPELL_DEBRIS_DAMAGE, true);
                        trigger = 3;
                    } else FireBlast_Timer -= diff;
                }
                else if (trigger >= 2)
                {
                    if (Despawn_Timer <= diff)
                    {
                        me->DealDamage(me, me->GetHealth());
                        me->RemoveCorpse();
                    } else Despawn_Timer -= diff;
                }
                return;
            }

            if (!UpdateVictim())
                return;

            if (FireBlast_Timer <= diff)
            {
                DoCastVictim(SPELL_FIRE_BLAST);
                FireBlast_Timer = urand(5000, 15000);
            } else FireBlast_Timer -= diff;

            DoMeleeAttackIfReady();
        }
    };
};

class boss_magtheridon : public CreatureScript
{
public:
    boss_magtheridon() : CreatureScript("boss_magtheridon") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_magtheridonAI(creature);
    }

    struct boss_magtheridonAI : public ScriptedAI
    {
        boss_magtheridonAI(Creature* c) : ScriptedAI(c), Summons(me)
        {
            pInstance = c->GetInstanceScript();
            me->SetFloatValue(UNIT_FIELD_BOUNDINGRADIUS, 10);
            me->SetFloatValue(UNIT_FIELD_COMBATREACH, 10);
            me->SetReactState(REACT_PASSIVE);
            me->AddUnitState(UNIT_STAT_STUNNED);
            DoCast(me, SPELL_SHADOW_CAGE_C, true);
        }

        CubeMap Cube;
        SummonList Summons;
        InstanceScript* pInstance;

        uint32 Berserk_Timer;
        uint32 Quake_Timer;
        uint32 Cleave_Timer;
        uint32 BlastNova_Timer;
        uint32 Blaze_Timer;
        uint32 Debris_Timer;
        uint32 RandChat_Timer;
        uint32 Release_Timer;

        uint8 Phase;
        bool NeedCheckCube;

        void Reset()
        {
            if (pInstance)
            {
                if (Phase == 3)
                    pInstance->SetData(DATA_COLLAPSE, false);

                pInstance->SetData(DATA_MAGTHERIDON_EVENT, NOT_STARTED);
            }

            Berserk_Timer = 1320000;
            Quake_Timer = 40000;
            Debris_Timer = 10000;
            Blaze_Timer = 10000+rand()%20000;
            BlastNova_Timer = 60000;
            Cleave_Timer = 15000;
            RandChat_Timer = 90000;
            Release_Timer = 120000;

            Phase = 1;
            NeedCheckCube = false;

            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_OOC_NOT_ATTACKABLE);
            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_UNK_6);

            for (uint8 i = 0; i < 5; i++)
                me->SummonCreature(MOB_CHANNELLER, Pos[i]);
        }

        void EnterEvadeMode()
        {
            me->ClearUnitState(UNIT_STAT_STUNNED);
            me->RemoveAurasDueToSpell(SPELL_SHADOW_CAGE_C);
            Summons.DespawnAll();
            _EnterEvadeMode();
            me->GetMotionMaster()->MoveTargetedHome();
            Reset();
        }

        void JustReachedHome()
        {
            me->SetReactState(REACT_PASSIVE);
            me->AddUnitState(UNIT_STAT_STUNNED);
            DoCast(me, SPELL_SHADOW_CAGE_C, true);
        }

        void JustSummoned(Creature* summon)
        {
            Summons.Summon(summon);
        }

        void SetClicker(uint64 cubeGUID, uint64 clickerGUID)
        {
            // to avoid multiclicks from 1 cube
            if (uint64 guid = Cube[cubeGUID])
                DebuffClicker(Unit::GetUnit(*me, guid));
            Cube[cubeGUID] = clickerGUID;
            NeedCheckCube = true;
        }

        //function to interrupt channeling and debuff clicker with mind exh(used if second person clicks with same cube or after dispeling/ending shadow grasp DoT)
        void DebuffClicker(Unit* clicker)
        {
            if (!clicker || !clicker->isAlive())
                return;

            clicker->RemoveAurasDueToSpell(SPELL_SHADOW_GRASP); // cannot interrupt triggered spells
            clicker->InterruptNonMeleeSpells(false);
            clicker->CastSpell(clicker, SPELL_MIND_EXHAUSTION, true);
        }

        void NeedCheckCubeStatus()
        {
            uint32 ClickerNum = 0;
            // now checking if every clicker has debuff from manticron(it is dispelable atm rev 6110 : S)
            // if not - apply mind exhaustion and delete from clicker's list
            for (CubeMap::iterator i = Cube.begin(); i != Cube.end(); ++i)
            {
                Unit* clicker = Unit::GetUnit(*me, i->second);
                if (!clicker || !clicker->FindCurrentSpellBySpellId(SPELL_SHADOW_GRASP_VISUAL))
                {
                    DebuffClicker(clicker);
                    i->second = 0;
                } else ++ClickerNum;
            }

            // if 5 clickers from other cubes apply shadow cage
            if (ClickerNum >= CLICKERS_COUNT && !me->HasAura(SPELL_SHADOW_CAGE))
            {
                DoScriptText(SAY_BANISH, me);
                DoCast(me, SPELL_SHADOW_CAGE, true);
            }
            else if (ClickerNum < CLICKERS_COUNT && me->HasAura(SPELL_SHADOW_CAGE))
                me->RemoveAurasDueToSpell(SPELL_SHADOW_CAGE);

            if (!ClickerNum)
                NeedCheckCube = false;
        }

        void KilledUnit(Unit * /*victim*/)
        {
            DoScriptText(SAY_PLAYER_KILLED, me);
        }

        void JustDied(Unit * /*killer*/)
        {
            Summons.DespawnAll();

            if (pInstance)
                pInstance->SetData(DATA_MAGTHERIDON_EVENT, DONE);

            DoScriptText(SAY_DEATH, me);
        }

        void StartEvent()
        {
            if (pInstance)
            {
                if (pInstance->GetData(DATA_MAGTHERIDON_EVENT) != NOT_STARTED)
                    return;

                pInstance->SetData(DATA_MAGTHERIDON_EVENT, IN_PROGRESS);
            }

            me->MonsterTextEmote(EMOTE_BONDS_WEAKEN, 0);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            me->SetInCombatWithZone();
            Summons.DoZoneInCombat();
        }

        void UpdateAI(const uint32 diff)
        {
            if (Phase == 1)
            {
                if (RandChat_Timer <= diff)
                {
                    DoScriptText(RandomTaunt[rand()%6].id, me);
                    RandChat_Timer = 90000;
                } else RandChat_Timer -= diff;

                if (!me->isInCombat())
                    return;

                if (Release_Timer <= diff)
                {
                    me->ClearUnitState(UNIT_STAT_STUNNED);
                    me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                    me->RemoveAurasDueToSpell(SPELL_SHADOW_CAGE_C);
                    me->SetReactState(REACT_AGGRESSIVE);
                    DoResetThreat();
                    DoZoneInCombat();
                    if (Unit* target = me->getVictim())
                        me->GetMotionMaster()->MoveChase(target);
                    DoScriptText(SAY_FREED, me);
                    Phase = 2;
                } else Release_Timer -= diff;

                return;
            }

            if (!UpdateVictim())
                return;

            if (NeedCheckCube)
                NeedCheckCubeStatus();

            if (Berserk_Timer <= diff)
            {
                DoCast(me, SPELL_BERSERK, true);
                DoScriptText(EMOTE_BERSERK, me);
                Berserk_Timer = 60000;
            } else Berserk_Timer -= diff;

            if (Cleave_Timer <= diff)
            {
                DoCastVictim(SPELL_CLEAVE);
                Cleave_Timer = 10000;
            } else Cleave_Timer -= diff;

            if (BlastNova_Timer <= diff)
            {
                // to avoid earthquake interruption
                if (!me->HasUnitState(UNIT_STAT_STUNNED))
                {
                    DoScriptText(EMOTE_BLASTNOVA, me);
                    DoCast(me, SPELL_BLASTNOVA);
                    BlastNova_Timer = 60000;
                }
            } else BlastNova_Timer -= diff;

            if (Quake_Timer <= diff)
            {
                // to avoid blastnova interruption
                if (!me->IsNonMeleeSpellCasted(false))
                {
                    DoCast(me, SPELL_QUAKE_TRIGGER);
                    Quake_Timer = 50000;
                }
            } else Quake_Timer -= diff;

            if (Blaze_Timer <= diff)
            {
                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                {
                    float x, y, z;
                    target->GetPosition(x, y, z);
                    if (Creature* summon = me->SummonCreature(MOB_ABYSSAL, x, y, z, 0, TEMPSUMMON_CORPSE_DESPAWN, 0))
                    {
                        CAST_AI(mob_abyssal::mob_abyssalAI, summon->AI())->SetTrigger(2);
                        DoCast(me, SPELL_BLAZE_TARGET, true);
                        summon->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                    }
                }
                Blaze_Timer = 20000 + rand()%20000;
            } else Blaze_Timer -= diff;

                                                        // blast nova                   // shadow cage and earthquake
            if (Phase != 3 && HealthBelowPct(30) && !me->IsNonMeleeSpellCasted(false) && !me->HasUnitState(UNIT_STAT_STUNNED)) 
            {
                Phase = 3;
                DoScriptText(SAY_CHAMBER_DESTROY, me);
                DoCast(me, SPELL_CAMERA_SHAKE, true);
                DoCast(me, SPELL_DEBRIS_KNOCKDOWN, true);

                if (pInstance)
                    pInstance->SetData(DATA_COLLAPSE, true);
            }

            if (Phase == 3)
            {
                if (Debris_Timer <= diff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    {
                        float x, y, z;
                        target->GetPosition(x, y, z);
                        if (Creature* summon = me->SummonCreature(MOB_ABYSSAL, x, y, z, 0, TEMPSUMMON_CORPSE_DESPAWN, 0))
                            CAST_AI(mob_abyssal::mob_abyssalAI, summon->AI())->SetTrigger(1);
                    }
                    Debris_Timer = 10000;
                } else Debris_Timer -= diff;
            }

            DoMeleeAttackIfReady();
        }
    };
};

class mob_hellfire_channeler : public CreatureScript
{
public:
    mob_hellfire_channeler() : CreatureScript("mob_hellfire_channeler") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_hellfire_channelerAI(creature);
    }

    struct mob_hellfire_channelerAI : public ScriptedAI
    {
        mob_hellfire_channelerAI(Creature* c) : ScriptedAI(c)
        {
            pInstance = me->GetInstanceScript();
        }

        InstanceScript* pInstance;

        uint32 ShadowBoltVolley_Timer;
        uint32 DarkMending_Timer;
        uint32 Fear_Timer;
        uint32 Infernal_Timer;
        uint32 Check_Timer;

        void Reset()
        {
            ShadowBoltVolley_Timer = 8000 + rand()%2000;
            DarkMending_Timer = 10000;
            Fear_Timer = 15000 + rand()%5000;
            Infernal_Timer = 10000 + rand()%40000;
            Check_Timer = 5000;
            DoCast(me, SPELL_SHADOW_GRASP_C, false);
        }

        void MoveInLineOfSight(Unit * /*who*/) { }
        void EnterCombat(Unit * /*who*/)
        {
            Creature* Magtheridon = Unit::GetCreature(*me, pInstance->GetData64(DATA_MAGTHERIDON));
            if (Magtheridon && Magtheridon->isAlive())
                CAST_AI(boss_magtheridon::boss_magtheridonAI, Magtheridon->AI())->StartEvent();

            me->InterruptNonMeleeSpells(false);
            me->SetInCombatWithZone();
            if (Unit* target = SelectTarget(SELECT_TARGET_NEAREST))
                AttackStart(target);
        }

        void EnterEvadeMode()
        {
            Creature* Magtheridon = Unit::GetCreature(*me, pInstance->GetData64(DATA_MAGTHERIDON));
            if (Magtheridon && Magtheridon->isAlive())
                Magtheridon->AI()->EnterEvadeMode();

            _EnterEvadeMode();
            me->GetMotionMaster()->MoveTargetedHome();
            Reset();
        }

        void JustSummoned(Creature* summon)
        {
            summon->AI()->AttackStart(me->getVictim());
        }

        void DamageTaken(Unit * /*attacker*/, uint32 &damage)
        {
            if (damage >= me->GetHealth())
                DoCast(me, SPELL_SOUL_TRANSFER, true);
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            if (ShadowBoltVolley_Timer <= diff)
            {
                DoCast(me, SPELL_SHADOW_BOLT_VOLLEY);
                ShadowBoltVolley_Timer = 10000 + rand()%10000;
            } else ShadowBoltVolley_Timer -= diff;

            if (DarkMending_Timer <= diff)
            {
                    if (HealthBelowPct(50))
                    DoCast(me, SPELL_DARK_MENDING);
                DarkMending_Timer = 10000 +(rand() % 10000);
            } else DarkMending_Timer -= diff;

            if (Fear_Timer <= diff)
            {
                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 1))
                    DoCast(target, SPELL_FEAR);
                Fear_Timer = 25000 + rand()%15000;
            } else Fear_Timer -= diff;

            if (Infernal_Timer <= diff)
            {
                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    DoCast(target, SPELL_BURNING_ABYSSAL, true);
                Infernal_Timer = 30000 + rand()%10000;
            } else Infernal_Timer -= diff;

            DoMeleeAttackIfReady();
        }
    };
};

//Manticron Cube
class go_manticron_cube : public GameObjectScript
{
public:
    go_manticron_cube() : GameObjectScript("go_manticron_cube") { }

    bool OnGossipHello (Player* player, GameObject* go)
    {
        InstanceScript* _instance = go->GetInstanceScript();
        if (!_instance)
            return true;

        Creature* Magtheridon = Unit::GetCreature(*go, _instance->GetData64(DATA_MAGTHERIDON));
        if (!Magtheridon || !Magtheridon->isAlive() || !Magtheridon->isInCombat())
            return true;

        // if exhausted or already channeling return
        if (player->HasAura(SPELL_MIND_EXHAUSTION) || player->FindCurrentSpellBySpellId(SPELL_SHADOW_GRASP_VISUAL))
            return true;

        player->InterruptNonMeleeSpells(false);
        player->AddAura(SPELL_SHADOW_GRASP, player);
        player->CastSpell(player, SPELL_SHADOW_GRASP_VISUAL, false);
        CAST_AI(boss_magtheridon::boss_magtheridonAI, Magtheridon->AI())->SetClicker(go->GetGUID(), player->GetGUID());
        return true;
    }
};

void AddSC_boss_magtheridon()
{
    new boss_magtheridon();
    new mob_hellfire_channeler();
    new go_manticron_cube();
    new mob_abyssal();
}

