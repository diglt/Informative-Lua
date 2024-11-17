local DontTouchMeNya = {"You Indexed Me!"} -- First we create a table, this is where we'll keep our private values we wish to attempt to hide

setmetatable(DontTouchMeNya, { -- setmetatable(OurTable, ReturningTable) setmetatable CREATES a new metatable which will be accessed when attempting to access the main table "DontTouchMeNya"
    __index = function () -- If the "__index" metamethod is invoked (DontTouchMeNya["Our String Value Here"]) then we will return a certain function!
        return "You Failed Lil Bro!" -- In this case, we simply return the string "You Failed Lil Bro!", meaning that if they try to access "You Indexed Me!" in "DontTouchMeNya" they will instead recieve "You Failed Lil Bro!"
    end -- close our function
}) -- close our metatable, and the setmetatable function itself

print(DontTouchMeNya["You Indexed Me!"]) -- Returns with: "You Failed Lil Bro!""
