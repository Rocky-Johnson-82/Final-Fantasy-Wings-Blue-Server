-----------------------------------
--
--     tpz.effect.WARDING_CIRCLE
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
   target:addMod(tpz.mod.DEMON_KILLER, effect:getPower())
   target:addMod(tpz.mod.DEMON_KILLER + 1000, 15)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
   target:delMod(tpz.mod.DEMON_KILLER, effect:getPower())
   target:delMod(tpz.mod.DEMON_KILLER + 1000, 15)
end
