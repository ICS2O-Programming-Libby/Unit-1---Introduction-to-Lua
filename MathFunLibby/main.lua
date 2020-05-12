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

local music = audio.loadSound("Sounds/music_.mp3")
local musicSoundChannel
musicSoundChannel = audio.play(music)

--creae a global variable
scrollSpeed = 5

--background image with width and height
local backgroundImage = display.newImageRect("Images/background.png", 10000, 7000)

--Charecter image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

--set the image to be transparent 
beetleship.alpha = 0

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

------------------------------------------------------------------------------
--CREATE SECOND OBJECT
------------------------------------------------------------------------------

--display new image 
local girl = display.newImageRect("Images/girl5.png", 200, 200)

--Function: MoveGirl
--Input: this function accepts an event listner
--Output:none
--description: This function adds the scroll speed to the x-value of the ship
local function MoveGirl( event) 
	-- add the scroll speed to the x-value od the ship
	girl.x = girl.x - scrollSpeed
	--change the transparency of the ship every time it moves so that it fades out
	girl.alpha = girl.alpha - 0.01 
end

--MoveGirl will be called over and over again
Runtime:addEventListener("enterFrame", MoveGirl)


