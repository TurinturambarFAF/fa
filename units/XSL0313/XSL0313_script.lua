-----------------------------------------------------------------
-- File     :  /cdimage/units/XSL0301/XSL0301_script.lua
-- Author(s):  Jessica St. Croix, Gordon Duclos
-- Summary  :  Seraphim Sub Commander Script
-- Copyright © 2007 Gas Powered Games, Inc.  All rights reserved.
-----------------------------------------------------------------

local CommandUnit = import('/lua/defaultunits.lua').CommandUnit
local SWeapons = import('/lua/seraphimweapons.lua')
local Buff = import('/lua/sim/Buff.lua')
local SCUDeathWeapon = import('/lua/sim/defaultweapons.lua').SCUDeathWeapon
local EffectUtil = import('/lua/EffectUtilities.lua')
local SDFLightChronotronCannonWeapon = SWeapons.SDFLightChronotronCannonWeapon
local SDFOverChargeWeapon = SWeapons.SDFLightChronotronCannonOverchargeWeapon
local SIFLaanseTacticalMissileLauncher = SWeapons.SIFLaanseTacticalMissileLauncher

XSL0313 = Class(CommandUnit) {
    Weapons = {
        LightChronatronCannon = Class(SDFLightChronotronCannonWeapon) {},
        DeathWeapon = Class(SCUDeathWeapon) {},
        OverCharge = Class(SDFOverChargeWeapon) {},
        AutoOverCharge = Class(SDFOverChargeWeapon) {},
        Missile = Class(SIFLaanseTacticalMissileLauncher) {
            OnCreate = function(self)
                SIFLaanseTacticalMissileLauncher.OnCreate(self)
                self:SetWeaponEnabled(false)
            end,
        },
    },

    __init = function(self)
        CommandUnit.__init(self, 'LightChronatronCannon')
    end,

    OnCreate = function(self)
        CommandUnit.OnCreate(self)
        self:SetCapturable(false)
        self:HideBone('Back_Upgrade', true)
        self:SetupBuildBones()
        self:GetWeaponByLabel('OverCharge').NeedsUpgrade = true
        self:GetWeaponByLabel('AutoOverCharge').NeedsUpgrade = true
    end,

    CreateBuildEffects = function(self, unitBeingBuilt, order)
        EffectUtil.CreateSeraphimUnitEngineerBuildingEffects(self, unitBeingBuilt, self.BuildEffectBones, self.BuildEffectsBag)
    end,
}

TypeClass = XSL0313
