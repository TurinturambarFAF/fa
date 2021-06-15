-----------------------------------------------------------------
-- File     :  /cdimage/units/UEL0301/UEL0301_script.lua
-- Author(s):  Jessica St. Croix, Gordon Duclos
-- Summary  :  UEF Sub Commander Script
-- Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
-----------------------------------------------------------------

local Shield = import('/lua/shield.lua').Shield
local EffectUtil = import('/lua/EffectUtilities.lua')
local CommandUnit = import('/lua/defaultunits.lua').CommandUnit
local TWeapons = import('/lua/terranweapons.lua')
local TDFHeavyPlasmaCannonWeapon = TWeapons.TDFHeavyPlasmaCannonWeapon
local SCUDeathWeapon = import('/lua/sim/defaultweapons.lua').SCUDeathWeapon

UEL0313 = Class(CommandUnit) {
    IntelEffects = {
        {
            Bones = {
                'Jetpack',
            },
            Scale = 0.5,
            Type = 'Jammer01',
        },
    },

    Weapons = {
        RightHeavyPlasmaCannon = Class(TDFHeavyPlasmaCannonWeapon) {},
        DeathWeapon = Class(SCUDeathWeapon) {},
    },

    OnCreate = function(self)
        CommandUnit.OnCreate(self)
        self:SetCapturable(false)
        self:HideBone('Jetpack', true)
        self:HideBone('SAM', true)
        self:SetupBuildBones()
    end,

    __init = function(self)
        CommandUnit.__init(self, 'RightHeavyPlasmaCannon')
    end,

    OnStopBeingBuilt = function(self, builder, layer)
        CommandUnit.OnStopBeingBuilt(self, builder, layer)
        -- Block Jammer until Enhancement is built
        self:DisableUnitIntel('Enhancement', 'Jammer')
    end,

    CreateBuildEffects = function(self, unitBeingBuilt, order)
        local UpgradesFrom = unitBeingBuilt:GetBlueprint().General.UpgradesFrom
        -- If we are assisting an upgrading unit, or repairing a unit, play separate effects
        if (order == 'Repair' and not unitBeingBuilt:IsBeingBuilt()) or (UpgradesFrom and UpgradesFrom ~= 'none' and self:IsUnitState('Guarding'))then
            EffectUtil.CreateDefaultBuildBeams(self, unitBeingBuilt, self.BuildEffectBones, self.BuildEffectsBag)
        else
            EffectUtil.CreateUEFCommanderBuildSliceBeams(self, unitBeingBuilt, self.BuildEffectBones, self.BuildEffectsBag)
        end
    end,
}

TypeClass = UEL0313
