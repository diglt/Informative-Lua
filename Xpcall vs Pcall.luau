-- ok so what the heck is pcall and xpcall and why should i use either one of these???
-- shush ur mouth let me explain... ;)

local function riskyFunction()
    error("AtTeMpT to index nil with 200") -- here we create a function that is going to PURPOSELY ERROR, this is so we can replicate an error at the fault of the user / script (for example if something in the loadstring breaks) 
end

local success = xpcall(riskyFunction, function (error) -- First we create the variable "success" to access this xpcall we're going to create. 
    if string.match(string.lower(error), "attempt") then -- we are aware of what error we are looking for "attempt to index" error, which occurs when the script is executed wrongly
        print("sandbox caught error: " .. error .. " do  better bucko!") -- if the error is found, we'll print to the console the following line
    end -- end the if statement
end) -- end the function

if success then -- returns FALSE since error had occured (in the riskyFunction we created purposely throwing an error)
    print("no error caught :(") -- doesn't happen since we purposely error'd
else
    print("wuh oh! we gotcha :)") -- prints this message since we got an error! (the print inside the xpcall will also appear since the error was found)
end

task.wait(3) -- wait so we can let the pcall run seperately

local PCALL_SUCESS, errInfo = pcall(riskyFunction) -- first we can establish our own pcall (protected call) to the function we know is going to error.

if PCALL_SUCESS then -- returns FALSE also, since as previously we intentionally errored
    print("PCALL yay no erro! :D") -- doesn't happen since we purposely error'd
else
    print("PCALL nuuu here's ur error info i guess T_T : " .. errInfo ) -- prints this message since we error'd! However, this time we're given "errInfo" aswell which is what the error would actually be inside a string value!
end -- end the if statement

-- ok so what's the purpose of each one? why use xpcall or pcall? 
-- for debugging, it's recommeneded to use pcall since it doesn't impact the other functions inside of your script as it independantly handles the error and error information.
-- xpcall is only really useful for purposely spiking errors, it can be used as a detection method or whatever else you please as you can "sandbox" the function u attempt to call.
