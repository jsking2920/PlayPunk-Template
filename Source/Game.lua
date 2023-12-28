import "Globals"

-- Import all your gameplay classes here
--------------------------------------------------------------------------------
class("Game").extends()

-- Game State and Objects
local  GameState <const> = {menu = 0, playing = 1}
local curGameState = nil

--------------------------------------------------------------------------------

local function startNewGame()
    
end

--------------------------------------------------------------------------------

function Game:init()
	gfx.setBackgroundColor(gfx.kColorBlack) -- default "clear flag" color
    curGameState = GameState.menu
end

function Game:update()
    if (curGameState == GameState.menu) then
        if (pd.buttonJustPressed(pd.kButtonA)) then
            startNewGame()
            curGameState = GameState.playing
        end
    elseif (curGameState == GameState.playing) then

    end
end

function Game:draw()
    if (curGameState == GameState.menu) then
        u_drawTextScaled("GAME", 200, 100, halvedFont, kTextAlignment.center, gfx.kDrawModeInverted, 3)
        u_drawText("Press Ⓐ to Start", 200, 160, defaultFont, kTextAlignment.center, gfx.kDrawModeInverted)
    elseif (curGameState == GameState.playing) then
        
    end
end