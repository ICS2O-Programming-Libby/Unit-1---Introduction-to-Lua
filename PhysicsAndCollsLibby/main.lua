-----------------------------------------------------------------------------------------
-- Title: PhysicsAndCollisions
-- Name: Libby V
-- Course: ICS2O/3C
-- This program ... 
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- load physics 
local physics  = require("physics")

-- start physics
physics.start()
------------------------------------------------------------------------------------------
-- OBJECTS
------------------------------------------------------------------------------------------
-- ground 
local ground = display.newImage("Images/ground.png", 0, 768)

      -- change the width to be the same as the screen 
      ground.width = display.contentWidth*2

      -- Add to physics 
      physics.addBody(ground, "static", {friction=0.5, bounce=0.3})

-------------------------------------------------------------------------------------------
local beam = display.newImage("Images/beam.png", 0, 0)

-- set the x and y pos
beam.x = display.contentCenterX/5
beam.y = display.contentCenterY*1.65
beam.width = display.contentWidth/2
beam.height = display.contentHeight/10

-- rotate the beam -60 degrees so it's on an angle 
beam:rotate(45)
-- send it to the back layer 
beam:toBack()

-- add to physics 
physics.addBody(beam, "static", {friction=0.5, bounce=0.3})

-- create background 
local background = display.newImage("Images/background.png", 0, 0)

background:scale(3.75, 3.75)

 -- set the x and y pos
 -- background.x = display.contentCentreX
 -- background.y = display.contentCenterY

 --send to back
 background:toBack()
-------------------------------------------------------------------------------------
--FUNCTIONS
-------------------------------------------------------------------------------------

-- create the frist ball
local function firstBall()
	-- creating first ball 
	local ball1 = display.newImage("Images/ball.png", 0, 0)
	-- add to physics 
	physics.addBody(ball1, {friction=1.0, bounce=0.3, radius=25})
end 
-------------------------------------------------------------------------------------

local function secondBall()
	-- creating second ball 
	local ball2 = display.newImage("Images/ball.png", 0, 0)
	-- add to physics 
	physics.addBody(ball2, {density=1.0, friction=0.5, bounce=0.3, radius=12.5})
	--ball2:scale(12.5, 12.5)
	ball2.width = 25
	ball2.height= 25
end
-------------------------------------------------------------------------------------

-- create the third ball
local function thirdBall()
	-- creating third ball 
	local ball3 = display.newImage("Images/ball.png", 0, 0)
	-- add to physics 
	physics.addBody(ball3, {density=0.1,friction=3.0, bounce=0.3, radius=50})
	ball3.width = 100
	ball3.height = 100
end
--------------------------------------------------------------------------------------
--create the fourth ball 
local function fourthBall()
	-- create fourth ball 
	local ball4 = display.newImage("Images/ball.png", 0, 0)
	-- add to physics 
	physics.addBody(ball4, {friction=3.0, bounce=0.3, radius=100})
	ball4.width = 200
	ball4.height = 200
end
--------------------------------------------------------------------------------------
timer.performWithDelay(0, firstBall)
timer.performWithDelay(500, secondBall)
timer.performWithDelay(1000, thirdBall)
timer.performWithDelay(1500, fourthBall)