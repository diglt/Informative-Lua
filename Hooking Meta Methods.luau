-- To begin there's 2 ways to hook a metamethod
-- First is the traditonal way through the hookmetamethod function!

local old  -- variable to preserve the Self, Index values

old = hookmetamethod(game, "__index", newcclosure(function(Self, Index) --  We are hooking the datamodel "game" (the entire games metatable), with the metamethod "__index" (which is called when something is checked inside the table "game"), and it creates a "newcclosure" to disguise itself.
        if typeof(Self) == "Instance" and Self == game.Players.LocalPlayer.Character.Humanoid and Index == "WalkSpeed" then -- Checks if self is an instance, and if Self is the localplayer. If so it checks if the Index is WalkSpeed so that it can return 16 no matter what.
            return 16
        end 
    return old(Self, Index) -- See how we saved the variable old before to call it again here?
end))


-- or the more robust way of finding the meta table and changing the metamethod

local oldmt = getrawmetatable(game) -- first get the games meta table
setreadonly(oldmt, false) -- ensure we can edit the meta table

local indexmm = oldmt.__index -- same as the previous preserve variable

oldmt.__index = newcclosure(function(Self, Index) -- upon the __index metamethod being called, this function is ran with the arguments Self and Index
    if typeof(Self) == "Instance" and Self == game.Players.LocalPlayer.Character.Humanoid and Index == "WalkSpeed" then -- Checks if self is an instance, and if Self is the localplayer. If so it checks if the Index is WalkSpeed so that it can return 16 no matter what.
        return 16
    end
    return indexmm(Self, Index) -- See how we saved the variable old before to call it again here?
end)

setreadonly(oldmt, true) -- Disable our access to the metatable to avoid detection.
