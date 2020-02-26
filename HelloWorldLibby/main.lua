-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
--print a greetihng to the console
print ("****Hello Libby")
 
--Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--set the coulor of the backgrund
display.setDefault("background", 176/255, 174/255, 230/255)

--create a local variable
local textObject

--displays text on the screen at position x = 500 and y = 500 with
--a default font style and font style and text size of 50
textObject = display.newText("Hello, Libby!", 500, 500, nil, 50 )

--sets the color o fthe text 
textObject:setTextColor(255/255, 255/255, 255/255)