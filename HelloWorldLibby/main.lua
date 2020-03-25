-----------------------------------------------------------------------------------------
-- Title: HelloWorld
-- Name: Libby Valentino
-- Course: ICS2O/3C
-- This program displays Hello to the simulator and to the command terminal.
-----------------------------------------------------------------------------------------

-- Your code here
--print a greetihng to the console
print ("****Hello World!")
 
--Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--set the coulor of the backgrund
display.setDefault("background", 176/255, 174/255, 230/255)

--create a local variable
local textObject

--displays text on the screen at position x = 500 and y = 500 with
--a default font style and font style and text size of 50
textObject = display.newText("Hello, User!", 500, 100, nil, 100)

--sets the color o fthe text 
textObject:setTextColor(1, 1, 1)

-----------------------------------------------------------------------------------------
--DISPLAY NEW TEXT IN NEW COLOUR
-----------------------------------------------------------------------------------------
--create local variable for the new text
local text

--display new text 
text = display.newText("By : Libby V.", 500, 600, nil, 50)

--set the colour of the text 
text:setTextColor(0, 0, 0)

-----------------------------------------------------------------------------------------
-- PRINT TO THE COMAND TERMINAL 
-----------------------------------------------------------------------------------------

--print the code to the terminal
print ("this is awesome")



