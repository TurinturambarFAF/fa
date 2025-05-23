﻿--****************************************************************************
--**
--**  File     :  /lua/armordefinition.lua
--**  Author(s):
--**
--**  Summary  :
--**
--**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
--****************************************************************************
--
-- Armor Type Definitions
--

---@alias DamageType
---| "CzarBeam"
---| "DeathExplosion"
---| "Deathnuke"
---| "EMP"
---| "ExperimentalFootfall"
---| "FireBeetleExplosion"
---| "Normal"
---| "Nuke"
---| "Overcharge"
---| "Reclaimed"
---| "Spell"
---| "Stun"
---| "TacticalMissile"
---| "TreeFire"
---| "TreeForce"
---| "Disintegrate" # Used by tree props
---| "Force"        # Used by tree props
---| "Fire"         # Used by tree props
---| "WallOverspill"
---| "TransportDamage" # Skips visual effects in OnKilled
---| "FAF_AntiShield" # Only deals damage to shields

---@alias ArmorType
---| "ASF"
---| "Commander"
---| "Default"
---| "Experimental"
---| "ExperimentalStructure"
---| "Light"
---| "Normal"
---| "Structure"
---| "TMD"

armordefinition = {

    {   -- Armor Type Name
        'Default',

        -- Armor Definition
        'Normal 1.0',
    },
    {   -- Armor Type Name
        'Normal',

        -- Armor Definition
        'Normal 1.0',
    },
    {   -- Armor Type Name
        'Light',

        -- Armor Definition
        'Normal 1.0',
    },
    {   -- Armor Type Name
        'Commander',

        -- Armor Definition
        'Normal 1.0',
        'Deathnuke 1.0',
    },
    {   -- Armor Type Name
        'Structure',

        -- Armor Definition
        'Normal 1.0',
        'Overcharge 0.25',
        'Deathnuke 0.032',
    },
    {
        -- Armor Type name
        'Experimental',

        -- Armor Definition
        'ExperimentalFootfall 0.0',
    },
    {
        -- Armor Type name
        'ExperimentalStructure',

        -- Armor Definition
        'Normal 1.0',
        'Overcharge 0.25',
        'Deathnuke 0.032',
        'ExperimentalFootfall 0.0',
    },
    {
        -- Armor Type name
        'ASF',

        -- Armor Definition
        'Normal 1.0',
        'CzarBeam 0.25',
    },
    {
        -- Armor Type name
        'TMD',

        -- Armor Definition
        'Normal 1.0',
        'Overcharge 0.25',
        'Deathnuke 0.032',
        'TacticalMissile 0.55',
    },
}
