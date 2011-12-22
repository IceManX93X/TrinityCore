#include "ScriptPCH.h"
#include "SpellAuraEffects.h"

static Position Valkyr[] =
{
	{16217.67f, 16273.25f, 21.74f, 1.57f}
};

enum Spells
{
    SPELL_CLEAVE       			= 33480,
	SPELL_DEVOTION_AURA       	= 58944,
	SPELL_COLDFLAME_JETS		= 70460,
	SPELL_BLISTERING_COLD		= 66013,
    SPELL_BERSERK				= 28498,
	SPELL_BERSERK_AURA			= 28902,
	SPELL_TIDAL_CHARM			= 835,
	SPELL_FROST_RESISTANCE		= 27352,
	SPELL_INCREASED_HEALTH  	= 23737,
	SPELL_LIGHTNING_STRIKE		= 31971,
	SPELL_EMPOWERED_SHADOWBOLT  = 69528,
	SPELL_SUMMON_ARCAN_BURST	= 38171,
	SPELL_FROSTFIRE_BOLT		= 71130
};

enum Yells
{
	YELL_AGGRO                   = -1800066,
	YELL_DEATH					 = -1649041,
	YELL_KILL_PLAYER			 = -1999911
};

enum Events
{

};

enum Entrys
{
	ENTRY_NPC_VALKYR			  = 700006
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
			
			//Phase 1
			uint32 DevotionAura_Timer;
			uint32 FrostResistance_Timer;
			uint32 EmpoweredShadowBolt_Timer;
			uint32 IncreasedHealth_Timer; //Not in use
			uint32 ArcaneBurst_Timer;
			uint32 Summon_Timer;
			
			//Phase 2
            uint32 Cleave_Timer;
			uint32 BlisteringCold_Timer;
            uint32 TidalCharm_Timer;
			
			//Phase 3
			uint32 BerserkAura_Timer;
			uint32 LightningStrike_Timer;
			
			//Phase 4
			uint32 ColdFlameJets_Timer;
					
			uint32 Berserk_Timer;	
			uint32 Phase;
			
			InstanceScript* pInstance;

            void Reset()
            {
				//Phase 1		
				DevotionAura_Timer = 0;
				FrostResistance_Timer = 0;
				EmpoweredShadowBolt_Timer = 2000;
				IncreasedHealth_Timer = 0;			//Not in use
				ArcaneBurst_Timer = 4000;
				Summon_Timer = 4000;
				
				//Phase 2
				BlisteringCold_Timer = 6000;
				Cleave_Timer = 5000;
				TidalCharm_Timer = 10000;
				
				//Phase 3
				BerserkAura_Timer = 0;
				LightningStrike_Timer = 4000;
				
				//Phase 4
				ColdFlameJets_Timer = 2000;
				               
                Berserk_Timer = 50000;

				Phase = 1;
	        }

            void EnterCombat(Unit* /*who*/)
            {
			//	DoCast(SPELL_FROST_RESISTANCE);
			//	DoCast(SPELL_INCREASED_HEALTH);
				DoScriptText(YELL_AGGRO, me);             
            }

            void UpdateAI(const uint32 diff)
            {
                if (!UpdateVictim())
                    return;
					
				
				if (((me->GetHealth()*100 / me->GetMaxHealth()) < 60) && (Phase == 1))
				{
					Phase = 2;
				}
				
				if (((me->GetHealth()*100 / me->GetMaxHealth()) < 20) && (Phase == 2))
				{
					Phase = 3;
				}
				
				if (((me->GetHealth()*100 / me->GetMaxHealth()) < 5) && (Phase == 3))
				{
					Phase = 4;
				}				
				
				if (Phase == 1)
				{
					
				/*	if (IncreasedHealth_Timer <= diff)
					{
						DoCast(me->getVictim(), SPELL_INCREASED_HEALTH);
						IncreasedHealth_Timer = 5555;
					} else IncreasedHealth_Timer -= diff;
				*/	
					if (DevotionAura_Timer <= diff)                                              
					{
						DoCast(me, SPELL_DEVOTION_AURA);
						DevotionAura_Timer = 600000;
					} else DevotionAura_Timer -= diff;
					
					if (FrostResistance_Timer <= diff)
					{
						DoCast(me->getVictim(), SPELL_FROST_RESISTANCE);
						FrostResistance_Timer = 50001;
					} else FrostResistance_Timer -= diff;
					
					if (EmpoweredShadowBolt_Timer <= diff)
					{
						if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
						DoCast(pTarget, SPELL_EMPOWERED_SHADOWBOLT);
						EmpoweredShadowBolt_Timer = 3000;
					} else EmpoweredShadowBolt_Timer -= diff;
					
				/*	if (ArcaneBurst_Timer <= diff)
					{
						DoCast(me, SPELL_SUMMON_ARCAN_BURST);
						ArcaneBurst_Timer = 5000;
					} else ArcaneBurst_Timer -= diff;
				*/ 		
				
					if (Summon_Timer <= diff)
					{
						for (uint8 i = 0; i < 4; i++)
						{
							if (i <= 4)
							{
								me->SummonCreature(ENTRY_NPC_VALKYR, Valkyr[i], TEMPSUMMON_CORPSE_DESPAWN , 0);                    
								Summon_Timer = urand(5, 7) *IN_MILLISECONDS;
							}
						}
					} else Summon_Timer -= diff;
				
				}
				
				if (Phase == 2)
				{
					if (BlisteringCold_Timer <= diff)
					{
						DoCast(me->getVictim(), SPELL_BLISTERING_COLD);
						BlisteringCold_Timer = 30000;
					} else BlisteringCold_Timer -= diff;
					
					if (Cleave_Timer <= diff)
					{
						DoCast(me->getVictim(), SPELL_CLEAVE);
						Cleave_Timer = 8000;
					} else Cleave_Timer -= diff;
					
					if (TidalCharm_Timer <= diff)
					{
						DoCast(me->getVictim(), SPELL_TIDAL_CHARM);
						TidalCharm_Timer = 10000;
					} else TidalCharm_Timer -= diff;
				}
				
				if (Phase == 3)
				{
					if (LightningStrike_Timer <= diff)
					{
						DoCast(me->getVictim(), SPELL_LIGHTNING_STRIKE);
						LightningStrike_Timer = 2000;
					} else LightningStrike_Timer -= diff;
					
					if (BerserkAura_Timer <= diff)
					{
						if (Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                			DoCast(pTarget, SPELL_BERSERK_AURA);
						BerserkAura_Timer = 1000;
						
					} else BerserkAura_Timer -= diff;
				}
				
				if (Phase == 4)
				{
					if (ColdFlameJets_Timer <= diff)
					{
						DoCast(me->getVictim(), SPELL_COLDFLAME_JETS);
						ColdFlameJets_Timer = 10000;
					} else ColdFlameJets_Timer -= diff;
				}
				
				if (Berserk_Timer <= diff)                                       
                {
					DoCast(me, SPELL_BERSERK);
                    Berserk_Timer = 300000;
                } else Berserk_Timer -= diff;
				
                DoMeleeAttackIfReady();
            }
			
			void JustDied(Unit* /*Victim*/)
			{
				DoScriptText(YELL_DEATH, me); 			
			}
			
			void KilledUnit(Unit* /*Victim*/)
			{
				DoScriptText(YELL_KILL_PLAYER, me);
			}
        };
};

class npc_valkyr : public CreatureScript
{
    public : 
			npc_valkyr() : CreatureScript("npc_valkyr") { }
			
		CreatureAI* GetAI(Creature* creature) const
		{
			return new npc_valkyrAI (creature);
		}
		
		struct npc_valkyrAI : public ScriptedAI
        {

			npc_valkyrAI(Creature* c) : ScriptedAI(c)
            {
				pInstance = c->GetInstanceScript();
            }
			
			uint32 FrostFireBolt_Timer;
			
			InstanceScript* pInstance;

            void Reset()
            {
				FrostFireBolt_Timer = 3000;
	        }

            void EnterCombat(Unit* /*who*/)
            {
           
            }

            void UpdateAI(const uint32 diff)
            {
                if (!UpdateVictim())
                    return;
				
				if (FrostFireBolt_Timer <= diff)
				{
					DoCast(me->getVictim(), SPELL_FROSTFIRE_BOLT);
					FrostFireBolt_Timer = 2000;
				} else FrostFireBolt_Timer -= diff;
				
                DoMeleeAttackIfReady();
            }
			
			void JustDied(Unit* /*Victim*/)
			{
			
			}
			
			void KilledUnit(Unit* /*Victim*/)
			{

			}
        };
};

void AddSC_boss_kobborg()
{
    new boss_kobborg();
	new npc_valkyr();
}
