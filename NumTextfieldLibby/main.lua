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
local incorrectAnswer
local points = 0
local incorrectPoints = 0
local displayCorrectAnswer


-----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

local function AskQuestion()
	--generate 2 random numbers beetween a max. and a min. number
	randomNumber1 = math.random(0, 8)
	randomNumber2 = math.random(0, 8)

	--set the correct answer
	correctAnswer = randomNumber1 + randomNumber2
	print("Correct answer is : " .. randomNumber1 + randomNumber2)
	--displayCorrectAnswer = totext(randomNumber1 + randomNumber2)
	--correctAnswer.text = tostring(correctAnswer)
	--local displayCorrectAnswer = correctAnswer
	--create a question in the text object
	questionObject.text = randomNumber1.."+".. randomNumber2.."="

end

local function HideCorrect()
	-- hide the correct answer text
	correctObject.isVisible = false
	AskQuestion()
end


local function HideIncorrect()
	--hide the incorrect answer text
	incorrectObject.isVisible = false 
	AskQuestion()
end

local function HideWin()
	-- hide the win image 
	win.isVisible = false  
	AskQuestion()
end

local function HideGameOver()
	-- hide the game over image 
	win.isVisible = false  
	AskQuestion()
end


local function NumericFieldListener ( event )
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
			--give the user a point 
			points = points + 1 
			pointsText.text = "points = " .. points
			if (points == 5) then 
				win.isVisible = true 
			end

		else 
			print (correctAnswer)
			--displayCorrectAnswer.text = tostring(correctAnswer)
			incorrectObject.isVisible = true 
			timer.performWithDelay(2000, HideIncorrect)
			--displayCorrectAnswer = tostring(correctAnswer)
			print(displayCorrectAnswer)
			-- add a point to the incorrect points tally
            incorrectPoints = incorrectPoints + 1
            if (incorrectPoints == 3) then
            	gameOver.isVisible = true 
            end

		end
        --clear the text field
		event.target.text = ""
	end 
end 




---------------------------------------------------------------------------------------------
--OBJECT CREATION
---------------------------------------------------------------------------------------------

--displays a question and sets the colour 
questionObject = display.newText("",display.contentWidth/3, display.contentHeight/2, nil, 55)
questionObject:setTextColor(195/255, 147/255, 200/255)

--create the correct text object and make it invisible 
correctObject = display.newText("Correct!", 512, 500, nil, 50)
correctObject:setTextColor(195/255, 147/255, 200/255)
correctObject.isVisible = false

--create the Incorrect text object and ake it invisible
incorrectObject = display.newText("Incorrect!", 512, 500, nil, 30)
--incorrectObject = display.newText( tostring(displayCorrectAnswer), 512, 500, nil, 30)
incorrectObject:setTextColor(109/255, 86/255, 137/255)
incorrectObject.isVisible = false

--create numeric field
numericField = native.newTextField( 512, 385, 150, 70 )
numericField.inputType = "number"

--add the event listner for the numeric field 
numericField:addEventListener("userInput", NumericFieldListener)

--create the points text
pointsText = display.newText("Points = " .. points, 800, 100, nil, 50 ) 

-- display Correct image and make it invisible
win = display.newImageRect("Images/win.png", 300, 300)
win.x = display.contentWidth/2
win.y = display.contentHeight*1/8
win.isVisible = false 

--display incorrect image and make it invisible
gameOver = display.newImageRect("Images/gameover.png", 300, 300)
gameOver.x = display.contentWidth/2
gameOver.y = display.contentHeight*6/8
gameOver.isVisible = false 

--------------------------------------------------------------------
--FUNCTION CALLS
--------------------------------------------------------------------

--call the function to ask the question 
AskQuestion()