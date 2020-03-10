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
	if ( even.phase == "began") then 
		--clear text field 
		event.target.text = ""

	elseif event.phase == "submitted" then 

		--when the answer is submitted (enter key is pressed) set the user
		userAnswer = tonumber(event.target.text)

		--if the users answer and thhe correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			timer.performWithdelay(2000, HideCorrect)
		end
	end 
end 

---------------------------------------------------------------------------------------------
--OBJECT CREATION
---------------------------------------------------------------------------------------------

--dis[lays a question and sets the colour 
questionObject = display.newText("", display.contentWidth/3, display.contentHeight/2, nil, 50)
questionObject:setTextColor(195/255, 147/255, 200/255)

--create the correct text object and make it invisible 






















--------------------------------------------------------------------
--FUNCTION CALLS
--------------------------------------------------------------------

--call the function to ask the question 
AskQuestion()