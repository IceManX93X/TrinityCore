#include "ScriptPCH.h"

enum eEnums
{
    SAY_AGGRO               	= -1542008,

    SPELL_CLEAVE       			= 86745,
    SPELL_POISON_CLOUD      	= 30916,
  //  SPELL_SUICIDE       		= 7,
	SPELL_ASCEND_TO_THE_HEAVENS = 64487,		//Enrage
    SPELL_POISON           		= 30914
};

class boss_broggok : public CreatureScript
{
    public:

        boss_broggok()
            : CreatureScript("boss_kobborg")
        {
        }

        struct boss_kobborgkAI : public ScriptedAI
        {
            boss_kobborgAI(Creature* creature) : ScriptedAI(creature)
            {
                instance = creature->GetInstanceScript();
            }

            InstanceScript* instance;

            uint32 Cleave_Timer;
            uint32 PoisonSpawn_Timer;
        //    uint32 Suicide_Timer;
			uint32 AscendToTheHeavens_Timer;

            void Reset()
            {
                Cleave_Timer = 5000;
                PoisonSpawn_Timer = 8000;
                AscendToTheHeavens_Timer = 40000;
                if (instance)
                {
                    instance->SetData(TYPE_KOBBORG_EVENT, NOT_STARTED);
                  //  instance->HandleGameObject(instance->GetData64(DATA_DOOR4), true);
                }
            }

            void EnterCombat(Unit* /*who*/)
            {
                DoScriptText(SAY_AGGRO, me);
                if (instance)
                {
                    instance->SetData(TYPE_KOBBORG_EVENT, IN_PROGRESS);
                  //  instance->HandleGameObject(instance->GetData64(DATA_DOOR4), false);
                }
            }

            void JustSummoned(Creature* summoned)
            {
                summoned->setFaction(16);
              //  summoned->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
              //  summoned->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                summoned->CastSpell(summoned, SPELL_CLEAVE, false, 0, 0, me->GetGUID());
            }

            void UpdateAI(const uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                if (AcidSpray_Timer <= diff)
                {
                    DoCast(me->getVictim(), SPELL_SLIME_SPRAY);
                    AcidSpray_Timer = 4000+rand()%8000;
                }
                else
                    AcidSpray_Timer -=diff;

                if (PoisonBolt_Timer <= diff)
                {
                    DoCast(me->getVictim(), SPELL_POISON_BOLT);
                    PoisonBolt_Timer = 4000+rand()%8000;
                }
                else
                    PoisonBolt_Timer -=diff;

                if (PoisonSpawn_Timer <= diff)
                {
                    DoCast(me, SPELL_POISON_CLOUD);
                    PoisonSpawn_Timer = 20000;
                }
                else
                    PoisonSpawn_Timer -=diff;

                DoMeleeAttackIfReady();
            }

            void JustDied(Unit* /*who*/)
            {
                if (instance)
                {
                 //   instance->HandleGameObject(instance->GetData64(DATA_DOOR4), true);
                 //   instance->HandleGameObject(instance->GetData64(DATA_DOOR5), true);
                    instance->SetData(TYPE_KOBBORG_EVENT, DONE);
                }
            }

        };

        CreatureAI* GetAI(Creature* Creature) const
        {
            return new boss_kobborgAI (Creature);
        }
};

void AddSC_boss_kobborg()
{
    new boss_kobborg();
}
