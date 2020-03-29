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
local randomOperator

-----------------------------------------------------------------------------------------
--CEREATE SOUNDS
-----------------------------------------------------------------------------------------

--correct sound 
local correctSound = audio.loadSound("Sounds/correct.mp3")
local correctSoundChannel

--wrong sound
local wrongSound = audio.loadSound("Sounds/wrong.mp3")
local wrongSoundChannel


-----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

local function AskQuestion()
	--generate a random number between 1 and 2 
	randomOperator = math.random(4)
	print("randomOperator = " .. randomOperator)

	--generate 2 random numbers
	randomNumber1 = math.random(0, 4)
	randomNumber2 = math.random(0, 4)
	print("Initalize randomNumber1 = " .. randomNumber1)
	print("Initalize randomNumber2 = " .. randomNumber2)

	--if the random operator is 1, then ask an addintion question.
		if (randomOperator == 1) then 

			--calculate the correct answer
			correctAnswer = randomNumber1 + randomNumber2
			print("correctAnswer (+) = " .. correctAnswer)
			--create question in the text object 
			questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "


		-- otherwise, if the random operator is 2, then ask a subtraction question
		elseif (randomOperator == 2) then 

            --calculate the correct answer 
			correctAnswer = randomNumber1 - randomNumber2
			--print the correct answer on the console 
			print("correctAnswer (-) = " .. correctAnswer)

            -- if the ocrrect answer is negative then keep recaulculating until correctAnswer is a positive answer
			while( correctAnswer <= -1 )
			do
				    -- regenerate two new numbers for the new equation
					randomNumber1 = math.random(0, 4)
					randomNumber2 = math.random(0, 4)
					-- tell the consoe the new numbers
					print("randomNumber1 NEW = " .. randomNumber1)
					print("randomNumber2 NEW = " .. randomNumber2)
					-- the new numbers in the new equation
					correctAnswer = randomNumber1 - randomNumber2
					-- check if the correctAnswer has a positive value 
					print("correctAnswer NEW (-) = " .. correctAnswer)
			end
               -- create question in the text object 
			questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "

		elseif (randomOperator == 3) then 
			--calcu;ate the correct answer
			correctAnswer = randomNumber1 * randomNumber2
			print("correctAnswer (*) = " .. correctAnswer)
			--create the question in the text object
			questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "

	    elseif (randomOperator == 4) then 
	    	--calculate the correct answer 
	    	correctAnswer = math.round(randomNumber1 / randomNumber2)
	    	print("correctAnswer (/) = " .. correctAnswer)
	    	--create the question in a text object 
	    	questionObject.text = randomNumber1 .. " / " .. randomNumber2 .. " = "
	    end 
end

local function HideCorrect()
	print("**HideCorrect CALLED")
	-- hide the correct answer text
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	print("**HideIncorrect CALLED")
	--hide the incorrect answer text
	incorrectObject.isVisible = false 
	AskQuestion()
end

local function HideWin()
	print("**HideWin CALLED")
	-- hide the win image 
	win.isVisible = false  
	AskQuestion()
end

local function HideGameOver()
	print("**HideGameOver CALLED")
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
		print ("---- userAnswer = " .. userAnswer .. " -----")

		--if the users answer and thhe correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			timer.performWithDelay(2000, HideCorrect)
			--give the user a point 
			points = points + 1
			pointsText.text = "points = " .. points
			correctSoundChannel = audio.play(correctSound)
			timer.performWithDelay(500, HideCorrect)
			if (points == 5) then 
				win.isVisible = true 
			end

		else 
			print (correctAnswer)
			--displayCorrectAnswer.text = tostring(correctAnswer)
			incorrectObject.isVisible = true 
			timer.performWithDelay(2000)
			--displayCorrectAnswer = tostring(correctAnswer)
			print(displayCorrectAnswer)
			-- add a point to the incorrect points tally
            incorrectPoints = incorrectPoints + 1
            wrongSoundChannel = audio.play(wrongSound)
            timer.performWithDelay(500, HideIncorrect)
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
win = display.newImageRect("Images/win.png", 300, 150)
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