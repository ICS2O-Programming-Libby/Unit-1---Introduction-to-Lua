-----------------------------------------------------------------------------------------
-- Title: TouchAndReact
-- Name: Libby Valentino
-- Course: ICS2O/3C
-- This program reacts when the button is clicked
-----------------------------------------------------------------------------------------


-- Change the colour of the background\
display.setDefault("background", 172/255, 172/255, 213/255)

-- hide status bar
display.setStatusBar(display.HiddenStatusBar)

-- crewat blue button, set its postion and make it visible 
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png", 198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true

-- creat red button, set its postion and make it invisible
local redButton = display.newImageRect("Images/Fast Button Active@2x.png", 198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

--creat text object, set its postion and mamke it invisible
local textObject = display.newText("Click Me!", 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (109/255, 86/255, 137/255)
textObject.isVisible = true

--create the image to show up when the button is clicked 
local point = display.newImageRect("Images/point.png", 200, 200)
point.x = display.contentWidth/2
point.y = display.contentHeight/4
point.isVisible = false 

--create the sound 
local sound = audio.loadSound("Sounds/sound.mp3")


-- Function: BlueButtonListner
-- Input: touch listner
-- Output: none
-- Description: when blue button is clicked, it will make the text apear with the red button, and mak ethe blue button disapear
local function BlueButtonListner(touch)
	if (touch.phase == "began") then 
		blueButton.isVisible = false
		redButton.isVisible = true 
		textObject.isVisible = false  
        point.isVisible = true
        --make the sound play
        audio.play( sound, {duration=1000} ) 
    end

    if (touch.phase == "ended") then 
    	blueButton.isVisible = true
        redButton.isVisible = true 
    	textObject.isVisible = false
        point.isVisible = false 
    end
end     

--call BlueButtonListner when the red button is touched
blueButton:addEventListener("touch", BlueButtonListner)