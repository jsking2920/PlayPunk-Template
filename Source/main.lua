-- Imports
import "CoreLibs/ui"
import "CoreLibs/timer"

import "Globals"
import "Game"
--------------------------------------------------------------------------------

-- Initializes game and sets some parameters
local function LoadGame()
	playdate.display.setRefreshRate(50) -- sets framerate to 50 fps
	math.randomseed(pd.getSecondsSinceEpoch()) -- sets seed for math.random so that it's actually random
	
	curGame = Game()
end

-- Handles game logic, called once per frame
local function updateGame()
	curGame:update()
end

-- Handles all drawing, called once per frame
local function drawGame()
	gfx.clear() -- clears the screen
	curGame:draw()
end

local function DrawDebug()
	pd.drawFPS(0, 0)
end

--------------------------------------------------------------------------------

LoadGame()

function pd.update()
	deltaTime = pd.getElapsedTime()
	pd.resetElapsedTime()

	pd.timer.updateTimers()
	
	updateGame()
	drawGame()

	if (DRAW_DEBUG) then
		DrawDebug()
	end

	if (shouldShowCrankIndicator) then
		pd.ui.crankIndicator:draw()
	end
end