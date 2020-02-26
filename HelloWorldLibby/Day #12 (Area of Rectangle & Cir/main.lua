--libby V.
-- calculating the area of a circle and rectangle
--ICS2O programing

-- create my local variables
local areaText
local textSize = 50
local myRectangle
local widthOfRectangle = 150
local heightOfRectangle = 75
local areaOfRectangle
local PI = 3.14
local radiusofCircle = 90 
-- set the background colour of my screen. Remember that colors are between 0 and 1.
display.setDefault("background", 205/255,220/255, 243/255)

-- remove the status bar
display.setStatusBar(display.HiddenStatusBar)

-- draw the rectangle that is half the width and height of the screen size.
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectangle)

-- anchor the rectangle in the top left corner of the screen and set its (x,y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 40
myRectangle.y = 40
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


