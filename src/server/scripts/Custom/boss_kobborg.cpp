#include "ScriptPCH.h"

enum Spells
{
    SPELL_CLEAVE       			= 86745,
	SPELL_DEVOTION_AURA       	= 58944,
	SPELL_EARTH_SHIELD			= 379,		
    SPELL_BERSERK				= 28498
};

enum Yells
{
	SAY_AGGRO                   = -1542008
};

enum Events
{

};

class boss_kobborg : public CreatureScript
{
    public : 
			boss_kobborg() : CreatureScript("boss_kobborg") { }
			
		CreatureAI* GetAI(Creature* creature) const
		{
			return new boss_kobborgAI (creature);
		}
		
		struct boss_kobborgAI : public ScriptedAI
        {

			boss_kobborgAI(Creature* c) : ScriptedAI(c)
            {
				pInstance = c->GetInstanceScript();
            }

            uint32 Cleave_Timer;
            uint32 DevotionAura_Timer;
            uint32 EarthShield_Timer;
			uint32 Berserk_Timer;
			
			InstanceScript* pInstance;

            void Reset()
            {
				Cleave_Timer = 5000;
                DevotionAura_Timer = 1;
				EarthShield_Timer = 1;
                Berserk_Timer = 1;
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
                    Cleave_Timer = 5000;
                } else Cleave_Timer -= diff;

				if (DevotionAura_Timer <= diff)                                              
                {
					DoCast(me, SPELL_DEVOTION_AURA);
					DevotionAura_Timer = 1;
                } else DevotionAura_Timer -= diff;
				
                if (EarthShield_Timer)
                {
					DoCast(me, SPELL_EARTH_SHIELD);
					EarthShield_Timer = 1;
                } else EarthShield_Timer -= diff;

				if (Berserk_Timer <= diff)                                       
                {
					DoCast(me, SPELL_BERSERK);
                    Berserk_Timer = 1;
                } else Berserk_Timer -= diff;

                DoMeleeAttackIfReady();
            }
			
			void JustDied(Unit* /*Victim*/)
			{
			
			}
        };
};

void AddSC_boss_kobborg()
{
    new boss_kobborg();
}
