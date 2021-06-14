-----------------------------------------------------------------
-- File     :  /cdimage/units/URL0301/URL0301_script.lua
-- Author(s):  David Tomandl, Jessica St. Croix
-- Summary  :  Cybran Sub Commander Script
-- Copyright Š 2005 Gas Powered Games, Inc.  All rights reserved.
-----------------------------------------------------------------

local CCommandUnit = import('/lua/cybranunits.lua').CCommandUnit
local CWeapons = import('/lua/cybranweapons.lua')
local EffectUtil = import('/lua/EffectUtilities.lua')
local Buff = import('/lua/sim/Buff.lua')
local CAAMissileNaniteWeapon = CWeapons.CAAMissileNaniteWeapon
local CDFLaserDisintegratorWeapon = CWeapons.CDFLaserDisintegratorWeapon02
local SCUDeathWeapon = import('/lua/sim/defaultweapons.lua').SCUDeathWeapon

URL0312 = Class(CCommandUnit) {
    LeftFoot = 'Left_Foot02',
    RightFoot = 'Right_Foot02',

    Weapons = {
        DeathWeapon = Class(SCUDeathWeapon) {},
        RightDisintegrator = Class(CDFLaserDisintegratorWeapon) {
            OnCreate = function(self)
                CDFLaserDisintegratorWeapon.OnCreate(self)
                -- Disable buff
                self:DisableBuff('STUN')
            end,
        },
        NMissile = Class(CAAMissileNaniteWeapon) {},
    },

    -- Creation
    OnCreate = function(self)
        CCommandUnit.OnCreate(self)
        self:SetCapturable(false)
        self:HideBone('AA_Gun', true)
        self:HideBone('Power_Pack', true)
        self:HideBone('Rez_Protocol', true)
        self:HideBone('Torpedo', true)
        self:HideBone('Turbine', true)
        self:SetWeaponEnabledByLabel('NMissile', false)
        if self:GetBlueprint().General.BuildBones then
            self:SetupBuildBones()
        end
        self.IntelButtonSet = true
    end,

    __init = function(self)
        CCommandUnit.__init(self, 'RightDisintegrator')
    end,

    -- Engineering effects
    CreateBuildEffects = function(self, unitBeingBuilt, order)
       EffectUtil.SpawnBuildBots(self, unitBeingBuilt, self.BuildEffectsBag)
       EffectUtil.CreateCybranBuildBeams(self, unitBeingBuilt, self.BuildEffectBones, self.BuildEffectsBag)
    end,

    OnStopBeingBuilt = function(self, builder, layer)
        CCommandUnit.OnStopBeingBuilt(self, builder, layer)
        self:BuildManipulatorSetEnabled(false)
        self:SetMaintenanceConsumptionInactive()
        -- Disable enhancement-based Intels until enhancements are built
        self:DisableUnitIntel('Enhancement', 'RadarStealth')
        self:DisableUnitIntel('Enhancement', 'SonarStealth')
        self:DisableUnitIntel('Enhancement', 'Cloak')
        self.LeftArmUpgrade = 'EngineeringArm'
        self.RightArmUpgrade = 'Disintegrator'
    end,

    -- Death
    OnKilled = function(self, instigator, type, overkillRatio)
        local bp
        for k, v in self:GetBlueprint().Buffs do
            if v.Add.OnDeath then
                bp = v
            end
        end
        -- If we could find a blueprint with v.Add.OnDeath, then add the buff
        if bp ~= nil then
            -- Apply Buff
            self:AddBuff(bp)
        end
        -- Otherwise, we should finish killing the unit
        CCommandUnit.OnKilled(self, instigator, type, overkillRatio)
    end,
}
TypeClass = URL0312
