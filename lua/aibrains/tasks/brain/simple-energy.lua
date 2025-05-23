--******************************************************************************************************
--** Copyright (c) 2022  Willem 'Jip' Wijnia
--**
--** Permission is hereby granted, free of charge, to any person obtaining a copy
--** of this software and associated documentation files (the "Software"), to deal
--** in the Software without restriction, including without limitation the rights
--** to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
--** copies of the Software, and to permit persons to whom the Software is
--** furnished to do so, subject to the following conditions:
--**
--** The above copyright notice and this permission notice shall be included in all
--** copies or substantial portions of the Software.
--**
--** THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
--** IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
--** FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
--** AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
--** LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
--** OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
--** SOFTWARE.
--******************************************************************************************************

local ValidateAITaskTemplate = import("/lua/aibrains/tasks/task.lua").ValidateAITaskTemplate

EnergyTech1 = ValidateAITaskTemplate({
    BaseConditions = {},
    BrainConditions = {},
    BuildCategory = categories.ENERGYPRODUCTION * categories.TECH1,
    Identifier = "(Tech 1) Energy production",
    DefaultDistance = 25,
    DefaultPriority = 100,
    PreferredChunk = "todo",
})

EnergyTech2 = ValidateAITaskTemplate({
    BaseConditions = {},
    BrainConditions = {},
    BuildCategory = categories.ENERGYPRODUCTION * categories.TECH2,
    Identifier = "(Tech 2) Energy production",
    DefaultDistance = 25,
    DefaultPriority = 100,
    PreferredChunk = "todo",
})

EnergyTech3 = ValidateAITaskTemplate({
    BaseConditions = {},
    BrainConditions = {},
    BuildCategory = categories.ENERGYPRODUCTION * categories.TECH3,
    Identifier = "(Tech 3) Energy production",
    DefaultDistance = 25,
    DefaultPriority = 100,
    PreferredChunk = "todo",
})