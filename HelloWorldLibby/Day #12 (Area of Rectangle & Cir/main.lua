-----------------------------------------------------------------------------------------
--libby V.
-- calculating the area of a circle and rectangle
--ICS2O programing
-----------------------------------------------------------------------------------------

-- create my local variables for rectangle
local areaText
local textSize = 40
local myRectangle
local widthOfRectangle = 100
local heightOfRectangle = 50
local areaOfRectangle

-- create the variables for circle 
local PI = 3.14
local radiusofCircle = 90 
local myCircle 
-- set the background colour of my screen. 
display.setDefault("background", 205/255,220/255, 243/255)

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- draw the rectangle that is half the width and height of the screen size.
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectangle)


-- set the width of the border
myRectangle.strokeWidth = 5

-- set the colour of the rectangle 
myRectangle:setFillColor(245/255, 202/255, 242/255)

-- set the color of the border
myRectangle:setStrokeColor(236/255, 165/255, 210/255)

-- calculate the area
areaOfRectangle = widthOfRectangle * heightOfRectangle

-- wrtie the area on the screen. 
areaText = display.newText("The area of this rectangle with a width of " ..
	widthOfRectangle .. " and a height of " .. heightOfRectangle .. " is " ..
	areaOfRectangle .. " pixels².", 0, 0, OpenSansCondensed, 12)

------------------------------------------------------------------------------------------
--CREATE CIRCLE 
------------------------------------------------------------------------------------------

--display the circle
local myCircle = display.newCircle( 100, 100, 30 )
myCircle:setFillColor( 0.5 )
myCircle.strokeWidth = 5
myCircle:setStrokeColor( 1, 0, 0 )


