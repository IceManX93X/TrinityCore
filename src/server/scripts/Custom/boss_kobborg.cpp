#include "ScriptPCH.h"

enum eEnums
{
    SAY_AGGRO               	= -1542008,

    SPELL_CLEAVE       			= 86745,
    SPELL_POISON_CLOUD      	= 30916,
  //SPELL_SUICIDE       		= 7,
	SPELL_ASCEND_TO_THE_HEAVENS = 64487,		//Enrage
    SPELL_POISON           		= 30914
};

class boss_broggok : public CreatureScript
{
    public : boss_kobborg() : CreatureScript("boss_kobborg") { }
		
		creatureAI*getAI(Creature* creature) const
		{
			return new boss_kobborgAI (creature);
		}
		
		struct boss_kobborgAI : public ScriptedAI
        {
            uint32 Cleave_Timer;
            uint32 PoisonSpawn_Timer;
        //  uint32 Suicide_Timer;
			uint32 AscendToTheHeavens_Timer;

            void Reset()
            {
                Cleave_Timer = 5000;
                PoisonSpawn_Timer = 8000;
                AscendToTheHeavens_Timer = 40000;
            }

            void EnterCombat(Unit* /*who*/)
            {
                
            }

            void UpdateAI(const uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                if (Cleave_Timer <= diff)
                {
                    DoCast(me->getVictim(), SPELL_CLEAVE);
                    Cleave_Timer = 4000+rand()%8000;
                }
                else
                    Cleave_Timer -=diff;

                if (PoisonSpawn_Timer <= diff)
                {
                    DoCast(me, SPELL_POISON_CLOUD);
                    PoisonSpawn_Timer = 20000;
                }
                else
                    PoisonSpawn_Timer -=diff;
				
				if (AscendToTheHeavens_Timer <= diff)
				{
					DoCast(me, SPELL_ASCEND_TO_THE_HEAVENS);
					AscendToTheHeavens_Timer = 0;
				}
				else AscendToTheHeavens_Timer -=diff;

                DoMeleeAttackIfReady();
            }

            void JustDied(Unit* /*who*/)
            {
				
            }

        };
};

void AddSC_boss_kobborg()
{
    new boss_kobborg();
}
