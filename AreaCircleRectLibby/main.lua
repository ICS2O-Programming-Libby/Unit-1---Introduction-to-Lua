-----------------------------------------------------------------------------------------
--libby V.
-- calculating the area of a circle and rectangle
--ICS2O programing
-----------------------------------------------------------------------------------------

-- create my local variables for rectangle
local areaText
local textSize
local myRectangle
local widthOfRectangle = 200
local heightOfRectangle = 100
local areaOfRectangle

-- set the background colour of my screen. 
display.setDefault("background", 205/255,220/255, 243/255)

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- draw the rectangle that is half the width and height of the screen size.
myRectangle = display.newRect(512, 100, widthOfRectangle, heightOfRectangle)


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
	areaOfRectangle .. " pixels².", 512, 200, Arial, 20)

------------------------------------------------------------------------------------------
--CREATE CIRCLE 
------------------------------------------------------------------------------------------


-- create the variables for circle 
local PI = 3.14
local radiusOfCircle = 90 


--display the circle
local myCircle = display.newCircle( 512, 400, 60 )
myCircle:setFillColor(245/255, 202/255, 242/255)
myCircle.strokeWidth = 5
myCircle:setStrokeColor(236/255, 165/255, 210/255)

--calculate the area of the cirlce 
local areaOfCircle = PI * (radiusOfCircle * radiusOfCircle)

-- display the text showing the area of the cirle 
local circleText
circleText = display.newText("The area of this circle with a radius of " ..
	radiusOfCircle .. " is " .. areaOfCircle .. "pixels².", 512, 500, Arial, 20)




