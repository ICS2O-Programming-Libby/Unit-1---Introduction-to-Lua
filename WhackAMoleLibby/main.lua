-----------------------------------------------------------------------------------------
-- Title: WhackAMole
-- Name: Your Name
-- Course: ICS2O/3C
-- This program displays diffrent moles for the 
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- CReating Background 
-- local bkg = display.newRect( 0, 0, display.contentWidth, display.ocntentHeight )
-- set the background colour
display.setDefault("background", 234/255, 226/255, 226/255)  


  --- setting the position 
 -- bkg.anchorX = 0
 -- bkg.anchorY =ocntentHeight
 -- bkg.x = 0
 -- bkg.y = 0

-- creating the mole 
local mole = display.newImage( "Images/mole.png", 0, 0)
  -- setting Position 
  mole.x = display.contentCentreX
  mole.y = display.contentCentreY

mole:scale (.5, .5)
mole.isVisible = true 
-- add local variable to keep track of the score
local score = 0
-- add local text to display the score 
scoreObject = display.newText("score " .. score , 512, 100, nil, 40)
scoreObject:setTextColor(0, 0, 0)
---------------------------------------------------------------------------------------------------
-- make the background music
local music = audio.loadSound("Sounds/music.mp3")
local musicSoundChannel 
musicSoundChannel = audio.play(music)


-- create the bonk sound
local bonk = audio.loadSound("Sounds/bonk.mp3")
local bonkSoundChannel
------------------------------------------FUNTIONS-------------------------------------------------

-- this function makes the mole appear in a random (x, y) position on the screen 
-- before calling the hide function 
function PopUp()

	-- choosing random position on the screen beween 0 and the size of the screen 
	mole.x = math.random(0, display.contentWidth )
	mole.y = math.random(0, display.contentHeight )

    -- make the mole visible 
    mole.isVisible = true 
    timer.performWithDelay(1500, Hide)	
end 

-- this function calls the PopuP function after 3 seconds
function PopUpDelay()
	timer.performWithDelay(3000, PopUp)
end

-- this function makes the mole invisible and then calls the PopUPDelay function 
function Hide()
	-- change visibility 
	mole.isVisible = false 
	-- CALL THE POPUPDELAY FUNCTION.
	PopUpDelay()
end

-- this function starts the game 
function GameStart()
	PopUpDelay()
end

-- this funtion increments the score only if the mole is clicked. It then displays the new score 
function Whacked ( event )
	-- if touched  phase just started 
	if (event.phase == "began") then
		-- INCREASE SCORE BY 1.
		score = score + 1
		-- THEN DISPLAY THE SCORE IN THE TEXT OBJECT.
	    scoreObject.text = "score " .. score  
	    -- play the bonk sound 
	    bonkSoundChannel = audio.play(bonk)
	end 
end

-----------------------------------EVENT LISTENERS---------------------------------------------
-- I add the event listener to the moles so that if the mole is touched =, the Whacked funtion is called
mole:addEventListener("touch", Whacked )

----------------------------------START THE GAME-----------------------------------------------
-- CALL THE FUNCTION TO PLAY THE GAME 
GameStart()