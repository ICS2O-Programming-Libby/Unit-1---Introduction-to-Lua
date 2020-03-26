-- Title: Touch and Drag
-- Name: Libby Valentino
-- Course: ICS2O/3C
-- This program allows the user to touch and drag objects around the screenl.-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--create local variables 
local background = display.newImageRect("Images/background.png", 10000, 7000)
local planet = display.newImageRect ("Images/planet.png", 200, 200)
local planetWidth = planet.width
local planetHeight = planet.height

local StarGirl = display.newImageRect("Images/girl5.png", 200, 200)
local StarGirlWidth = StarGirl.width
local StarGirlHeight = StarGirl.height

--my boolean variables to keep trak of which object I touched first 
local alreadyTouchedPlanet = false
local alreadyTouchedStarGirl = false

--set the initial x and y position of my image
StarGirl.x  = 400
StarGirl.y  = 500

planet.x = 300
planet.y = 200

--Function:StarGirlListner
--Input: touch listner
--Output: none
--Descripition: when star girl is touched, move her
local function StarGirlListener(touch)
	if (touch.phase == "began") then
		if (alreadyTouchedPlanet == false) then 
			alreadyTouchedStarGirl = true
		end
	end

    if ( (touch.phase == "moved") and (alreadyTouchedStarGirl == true) )	then 
       StarGirl.x = touch.x
       StarGirl.y = touch.y
    end
    
    if (touch.phase == "ended") then 
       alreadyTouchedStarGirl = false 
       alreadyTouchedPlanet = false 
    end 
end
 
-- add the respective listeners to each objet 
StarGirl:addEventListener("touch", StarGirlListener)

--Function:PlanetListener
--Input: touch listner
-- Output: none 
--Descriptiom: when planetis touched, move it
local function PlanetListener(touch)
	if (touch.phase == "began") then 
		if (alreadyTouchedStarGirl == false) then 
			alreadyTouchedPlanet = true 
		end	
	end
	if ( (touch.phase == "moved") and (alreadyTouchedPlanet == true) ) then 
		planet.x = touch.x
		planet.y = touch.y
	end 
	if (touch.phase == "ended")	then 
		alreadyTouchedPlanet = false
		alreadyTouchedStarGirl = false
	end 	
end

--add the respective listners to each object
planet:addEventListener("touch", PlanetListener)

-------------------------------------------------------------------------------
--CREATE OBJECT THAT JUST MOVES 
-------------------------------------------------------------------------------

--set the scroll speed global variables
scrollSpeed = 3

--display new image 
local star = display.newImageRect("Images/star.png", 200, 200)

--set the initial position 
star.x = 1024
star.y = 700

--Function: Move
--Input: this function accepts an event listner
--Output:none
--description: This function adds the scroll speed to the x-value of the ship
local function MoveStar( event) 
	-- add the scroll speed to the x-value od the ship
	star.x = star.x - scrollSpeed
end

--MoveStar will be called over and over again
Runtime:addEventListener("enterFrame", MoveStar)