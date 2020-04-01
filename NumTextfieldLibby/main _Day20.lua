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

-- variables for the timer
local totalSeconds = 5
local secondsLeft = 5
local clockText
local countDownTimer

local lives = 3
local heart1
local heart2

-- *** ADD LOCAL VARIABLES FOR : INCORRECT OBJECT, POINTS OBJECT, POINTS

-----------------------------------------------------------------------------------------
--CEREATE SOUNDS
-----------------------------------------------------------------------------------------

--correct sound 
local correctSound = audio.loadSound("Sounds/correct.mp3")
local correctSoundChannel

--wrong sound
local wrongSound = audio.loadSound("Sounds/wrong.mp3")
local wrongSoundChannel

-- you lose sound 
local loseSound = audio.loadSound("Sounds/lose.mp3")
local loseSoundChannel



-----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Keep track of time in seconds
--local secondsLeft = 20 * 60   -- 20 minutes * 60 seconds
local secondsLeft = 16   -- 20 minutes * 60 seconds

--local clockText = display.newText("20:00", display.contentCenterX, 80, native.systemFontBold, 80)
--local clockText = display.newText("Start", 100, 80, native.systemFontBold, 80)
--clockText:setFillColor(195/255, 147/255, 200/255)

-------  ### INSTRUCTIOR CODE : TIMER ### ----------------

local function UpdateTime()
	-- decrement the number of seconds 
	secondsLeft = secondsLeft - 1
    print ("secondsLeft : " .. secondsLeft)
	-- display the number of seconds left in the clock object 
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0) then 
	   -- rest the number of seconds left 
	   secondsLeft = totalSeconds
	   lives = lives - 1 
	    if (lives == 0) then 
	    	print ("lives = " .. lives)
	        loseSoundChannel = audio.play(loseSound)
			timer.performWithDelay(500)
			lose.isVisible = true
			--cancel timer
			timer.cancel(countDownTimer)
			clockText.isVisible = false
			correctObject.isVisible = false
			questionObject.isVisible = false 
			numericField.isVisible = false 

		end 

	    if (lives == 2) then 
		    heart2.isVisible = false 
	    elseif (lives == 1) then 
			heart1.isVisible = false			
	    end 
	   --cancel timer
	   timer.cancel(countDownTimer)

	 -- *****CALLL THE FUNCTION TO ASK A NEW QUESTION*****
     --AskQuestion()
     secondsLeft = 16 
     countDownTimer = timer.performWithDelay(1000, UpdateTime, secondsLeft)
    end 

end 

-- function that calls the timer 
local function StartTimer()
	-- create a countdown timer that loops infinitely
	if (lives > 0) then
		secondsLeft = 16
		countDownTimer = timer.performWithDelay(1000, UpdateTime, secondsLeft)
		print ("Start timer.")
	else
		timer.cancel(countDownTimer)
	end

end



local function AskQuestion()

	--StartTimer()
	--local countDownTimer = timer.performWithDelay( 1000, updateTime, secondsLeft )
	--StartTimer()

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
	StartTimer()
end

local function HideIncorrect()
	print("**HideIncorrect CALLED")
	--hide the incorrect answer text
	incorrectObject.isVisible = false 
	AskQuestion()
	StartTimer()
end

local function HideWin()
	print("**HideWin CALLED")
	-- hide the win image 
	win.isVisible = false  
	--AskQuestion()
end

local function HideGameOver()
	print("**HideGameOver CALLED")
	-- hide the game over image 	
	win.isVisible = false  
	--AskQuestion()
end

local function HideQuestion()
	-- show until lives == 0 
	questionObject.isVisible = true 
end

local function HidenBox()
	-- hide the numeric text field when you lose the game.
	numericField.isVisible = true 
end


local function NumericFieldListener ( event )
	-- user begins editing "numericfield"
	if ( event.phase == "began") then 
		--clear text field 
		event.target.text = ""
		

	elseif event.phase == "submitted" then 

		--when the answer is submitted (enter key is pressed) set the user
		local userAnswer = tonumber(event.target.text)
		print ("---- userAnswer = " .. userAnswer .. " -----")
		-- cancel timer 
		timer.cancel(countDownTimer)

		--if the users answer and thhe correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			timer.performWithDelay(50, HideCorrect)
			--give the user a point 
			points = points + 1
			--pointsText.text = "points = " .. points
			correctSoundChannel = audio.play(correctSound)
			timer.performWithDelay(500, HideCorrect)
			if (points == 5) then 
				win.isVisible = true 
			    --cancel timer
				timer.cancel(countDownTimer)
				clockText.isVisible = false
				correctObject.isVisible = false
				questionObject.isVisible = false 
				numericField.isVisible = false 
				heart2.isVisible = false 
				heart1.isVisible = false 

			end

		else 
			print (correctAnswer)
			--displayCorrectAnswer.text = tostring(correctAnswer)
			incorrectObject.isVisible = true 
			timer.performWithDelay(50)
			--displayCorrectAnswer = tostring(correctAnswer)
			print(displayCorrectAnswer)
			-- add a point to the incorrect points tally
            incorrectPoints = incorrectPoints + 1
            wrongSoundChannel = audio.play(wrongSound)
            timer.performWithDelay(500, HideIncorrect)
           lives = lives - 1 
	    if (lives == 0) then 
	    	print ("lives = " .. lives)
	        loseSoundChannel = audio.play(loseSound)
			timer.performWithDelay(500)
			lose.isVisible = true
			--cancel timer
			timer.cancel(countDownTimer)
			clockText.isVisible = false
			correctObject.isVisible = false
			questionObject.isVisible = false 
			numericField.isVisible = false 

		end 
		    if (incorrectPoints == 1) then 
            	heart2.isVisible = false
            end 
            if (incorrectPoints == 2) then
            	heart1.isVisible = false  
            end 
            if (incorrectPoints == 3) then
            	lose.isVisible = true            	
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
questionObject:setTextColor(195/255, 147/255, 200)
questionObject.isVisible = true 

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
numericField.isVisible = true 

--add the event listner for the numeric field 
numericField:addEventListener("userInput", NumericFieldListener)

--create the points text
--pointsText = display.newText("Points = " .. points, 800, 100, nil, 50 ) 

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

-- display you lose image and make it invisible
lose = display.newImageRect("Images/lose.png",1024, 768)
lose.x = display.contentWidth/2
lose.y = display.contentHeight/2
lose.isVisible = false 

-- display the lives on screen 
heart1 = display.newImageRect("images/heart.png", 100, 100)
heart1.x = display.contentWidth*7/8
heart1.y = display.contentHeight*1/7

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth*6/8
heart2.y = display.contentHeight*1/7

-- display the clock text, showing the number countdown 
clockText = display.newText("Start", 100, 80, native.systemFontBold, 80)
clockText:setFillColor(195/255, 147/255, 200/255)
clockText.isVisible = true


--------------------------------------------------------------------
--FUNCTION CALLS
--------------------------------------------------------------------

--call the function to ask the question 
AskQuestion()
StartTimer()