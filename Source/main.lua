-- Imports
import "CoreLibs/ui"
import "CoreLibs/timer"

import "Globals"
--------------------------------------------------------------------------------

-- Initializes game and sets some parameters
local function LoadGame()
	playdate.display.setRefreshRate(50) -- sets framerate to 50 fps
	math.randomseed(pd.getSecondsSinceEpoch()) -- sets seed for math.random so that it's actually random
	gfx.setFont(defaultFont) -- sets default font to use if one isn't specified later
	gfx.setBackgroundColor(gfx.kColorBlack) -- default "clear flag" color

	curGameState = GameState.menu
end

-- Handles game logic, called once per frame
local function UpdateGame()

end

-- Handles all drawing, called once per frame
local function DrawGame()
	gfx.clear() -- clears the screen
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
	
	UpdateGame()
	DrawGame()

	if (DRAW_DEBUG) then
		DrawDebug()
	end

	if (shouldShowCrankIndicator) then
		pd.ui.crankIndicator:draw()
	end
end