-----------------------------------------------------------------------------------------
-- Title: TouchAndReact
-- Name: Libby Valentino
-- Course: ICS2O/3C
-- This program reacts when the first image is clicked
-----------------------------------------------------------------------------------------

-- hide status bar
display.setStatusBar(display.HiddenStatusBar)

-- Change the colour of the background\
display.setDefault("background", 172/255, 172/255, 213/255)

-- crewat blue button, set its postion and make it visible 
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png", 198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true

-- creat red button, set its postion and make it invisible
local redButton = display.newImageRect("Image/Fast Button Active@2x.png", 198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

--creat text object, set its postion and mamke it invisible
local textObject = display.newText ("Clicked!", 0, 0, nil, 50)
textObject.x = display.conetntWidth/2
textObject.y = display.contentHeight/2
textObject.isVisible = false

-- Function: BlueButtonListner
-- Input: touch listner
-- Output: none
-- Description: when blue button is clicked, it will make the text apear with the red button, and mak ethe blue button disapear
local function BlueButtonListner(touch)
	if (touch.phase == "began") then 
		blueButton.isVisible = false
		redButton.isVisible = true 
		textObject.isVisible = true 
    end

    if (touch.phase == "ended") then 
    	bluButton.isVisible = true
    	textObject.isVisible = false
    	redButton.isVisible = false
    end
end     