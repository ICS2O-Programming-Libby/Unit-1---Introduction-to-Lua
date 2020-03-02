-----------------------------------------------------------------------------------------
-- Title: MovingObjects
-- Name: Libby Valentino 
-- Course: ICS2O/3C
-- This program moves a beetleship across the screen and then makes it fade out. 
--I added a second object that moves in a diffrent direction, 
--fades out and changes size.
-----------------------------------------------------------------------------------------

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--creae a global variable
scrollSpeed = 5

--background image with width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

--Charecter image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

--set the image to be transparent 
beetleship.alpha = 1

--set the initial x and y position of beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/3

--Function: Moveship
--Input: this function accepts an event listner
--Output:none
--description: This function adds the scroll speed to the x-value of the ship
local function MoveShip( event)
	-- add the scroll speed to the x-value od the ship
	beetleship.x = beetleship.x + scrollSpeed
	--change the transparency of the ship every time it moves so that it fades out
	beetleship.alpha = beetleship.alpha + 0.01 
end

--MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)