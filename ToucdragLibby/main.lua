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
local background = display.newImageRect("Images/background.png")
local planet = display.newImageRect ("Images/planet.png")
local planetWidth = planet.width
local planetHeight = planet.height

local StarGirl = display.newImageRect("Image/girl5.png")
local StarGirlWidth = stargirl.width
local StarGirlHeight = stargirl.height

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

    if ( (touch.phase == "moved ") and (alreadyTouchedStarGirl == true) )	then 
       StarGirl.x = StarGirl.x
       StarGirl.y = StarGirl.y
    end
    
    if (touch.phase == 'ended') then 
       alreadyTouchedStarGirl = false 
       alreadyTouchedPlanet = false 
    end 
end
 
-- add the respective listeners to each objet 
StarGirl:addEventLisntener("touch", StarGirlListener)

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
		planet.x = planet.x
		planet.y = planet.y
	end 
	if (touc.phase == "ended")	then 
		alreadyTouchedPlanet = false
		alreadyTouchedStarGirl = false
	end 	
end

--add the respective listners to each object
planet:addEventLisntener("touch", PlanetListener)