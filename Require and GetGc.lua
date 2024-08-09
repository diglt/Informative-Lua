warn("---------------")
for i,v in getgc(true) do -- GetGc looks throughout entire game for whatever u choose below in if statement. settings to true includes tables
    if typeof(v) == "Instance" and v:IsA("ModuleScript") then -- Using dex we know that we are lookin for a ModuleScript named "GunStates" which we check below.
        if v.Name == "GunStates" then -- We check if the found module script IS GunStates
            local Env = require(v) -- Allows us to loop through the whole module script WITHOUT A DECOMPILER.

            for a, b in Env do -- Loop through ModuleScript, u can add print(a,b) on first call to view information
                if a == "MaxAmmo" then -- Check if the Index if "MaxAmmo" so that we can change it
                    Env[a] = math.huge -- Set MaxAmmo to inf
                    warn'success' -- Alert the user the value was successfully changed
                end
            end
            warn(Env.MaxAmmo) -- Check to ensure the edit was successful, prints "inf"
        end
    end
end

-- This was tested on prison life!
