-- getgenv() is a function which allows u to add any datatype to the exploits enviroment. 

-- think of it as a dinner plate, you can add whatever food you'd like to your plate (Strings, Tables, Functions)

-- and they can be accessed BETWEEN scripts!


getgenv().Settings = { -- Table that can be accessed across scripts, as is in global exploit enviroment
  "AimbotColourRed" = true,
  "SizeOfFOV" = 9e9,
  "CustomText" = "hello"
}

getgenv().AccessableAnywhere = true -- Variable that can be accessed across scripts, as is in global exploit enviroment



-- OTHER SCRIPT -- 

function foo()
    if Settings["AimbotColourRed"] then -- AimbotColourRed was set to true inside the table "Settings" which is connected to getgenv() so that it can be accessed!
      return True
  else
      return False
  end
end


function pasta()
    if AccessableAnywhere then
      print("Wow this variable truly is accessable anywhere!")
    end
end

foo() -- returns True
pasta() -- prints "Wow this variable truly is accessable anywhere!"
