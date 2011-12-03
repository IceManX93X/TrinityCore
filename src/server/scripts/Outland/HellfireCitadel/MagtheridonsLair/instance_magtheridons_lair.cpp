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

#define MAX_ENCOUNTER                 1

class instance_magtheridons_lair : public InstanceMapScript
{
public:
    instance_magtheridons_lair() : InstanceMapScript("instance_magtheridons_lair", 544) { }

    struct instance_magtheridons_lair_InstanceMapScript : public InstanceScript
    {
        instance_magtheridons_lair_InstanceMapScript(Map* map) : InstanceScript(map)
        {
        }

        uint32 m_auiEncounter[MAX_ENCOUNTER];

        uint64 MagtheridonGUID;
        uint64 DoorGUID;
        std::set<uint64> ColumnGUID;

        void Initialize()
        {
            memset(&m_auiEncounter, 0, sizeof(m_auiEncounter));

            MagtheridonGUID = 0;
            DoorGUID = 0;
            ColumnGUID.clear();
        }

        bool IsEncounterInProgress() const
        {
            for (uint8 i = 0; i < MAX_ENCOUNTER; ++i)
                if (m_auiEncounter[i] == IN_PROGRESS) return true;
            return false;
        }

        void OnCreatureCreate(Creature* creature)
        {
            switch (creature->GetEntry())
            {
                case 17257:
                    MagtheridonGUID = creature->GetGUID();
                    break;
            }
        }

        void OnGameObjectCreate(GameObject* go)
        {
            switch (go->GetEntry())
            {
                case 181713:
                    go->SetUInt32Value(GAMEOBJECT_FLAGS, 0);
                    break;
                case 183847:
                    DoorGUID = go->GetGUID();
                    break;
                case 184653: // hall
                case 184634: // six columns
                case 184635:
                case 184636:
                case 184637:
                case 184638:
                case 184639:
                    ColumnGUID.insert(go->GetGUID());
                    break;
            }
        }

        uint64 GetData64(uint32 type)
        {
            switch (type)
            {
                case DATA_MAGTHERIDON:
                    return MagtheridonGUID;
            }
            return 0;
        }

        void SetData(uint32 type, uint32 data)
        {
            switch (type)
            {
                case DATA_MAGTHERIDON_EVENT:
                    if (m_auiEncounter[0] == data)
                        return;

                    m_auiEncounter[0] = data;
                    HandleGameObject(DoorGUID, m_auiEncounter[0] != IN_PROGRESS);
                    break;
                case DATA_COLLAPSE:
                    // true - collapse / false - reset
                    for (std::set<uint64>::const_iterator i = ColumnGUID.begin(); i != ColumnGUID.end(); ++i)
                        DoUseDoorOrButton(*i);
                    break;
                default:
                    break;
            }
        }

        uint32 GetData(uint32 type)
        {
            if (type == DATA_MAGTHERIDON_EVENT)
                return m_auiEncounter[0];
            return 0;
        }
    };

    InstanceScript* GetInstanceScript(InstanceMap* map) const
    {
        return new instance_magtheridons_lair_InstanceMapScript(map);
    }
};

void AddSC_instance_magtheridons_lair()
{
    new instance_magtheridons_lair();
}

