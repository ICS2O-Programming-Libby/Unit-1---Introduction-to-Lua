-----------------------------------------------------------------------------------------
-- Title: NumericTextFields
-- Name: Libby Valentino
-- Course: ICS2O/3C
-- This program 
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--set the background colour
display.setDefault("background", 242/255, 212/255, 245/255)

-----------------------------------------------------------------------------------------
--LOCAL VARIABLES
-----------------------------------------------------------------------------------------

--creat local variables
local Incorrect 
local questionObject
local correctObject
local NumericTextFields
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer

-----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

local function AskQuestion()
	--generate 2 random numbers beetween a max. and a min. number
	randomNumber1 = math.random(0, 8)
	randomNumber2 = math.random(0, 8)

	--set the correct answer
	correctAnswer = randomNumber1 + randomNumber2

	--create a quesrion in the text object
	questionObject.text = randomNumber1.."+".. randomNumber2.."="

end

local function HideCorrect()
	-- hide the correct answer
	correctObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event )
	-- user begins editing "numericfield"
	if ( event.phase == "began") then 
		--clear text field 
		
		event.target.text = ""

	elseif event.phase == "submitted" then 

		--when the answer is submitted (enter key is pressed) set the user
		userAnswer = tonumber(event.target.text)

		--if the users answer and thhe correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			timer.performWithDelay(2000, HideCorrect)
		end
		--clear the text field
		event.target.text = ""
	end 
end 



---------------------------------------------------------------------------------------------
--OBJECT CREATION
---------------------------------------------------------------------------------------------

--displays a question and sets the colour 
questionObject = display.newText("", display.contentWidth/3, display.contentHeight/2, nil, 50)
questionObject:setTextColor(195/255, 147/255, 200/255)

--create the correct text object and make it invisible 
correctObject = display.newText("",  display.contentWidth/3, display.contentHeight*2/3, nil, 50)
correctObject:setTextColor(195/255, 147/255, 200/255)
correctObject.isVisible = false

--create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80 )
numericField.inputType = "number"

--add the event listner for the numeric field 
numericField:addEventListener( "userInput", NumericFieldListener )

--------------------------------------------------------------------
--FUNCTION CALLS
--------------------------------------------------------------------

--call the function to ask the question 
AskQuestion()