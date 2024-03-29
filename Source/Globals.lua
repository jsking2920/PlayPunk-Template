-- Collection of all global variables and imports, import this in every other script

-- Global Imports
import "CoreLibs/graphics"
import "CoreLibs/object"
import "Utilities" 

-- Aliases for common playdate SDK features; should be constants
pd = playdate
gfx = playdate.graphics
snd = playdate.sound

DRAW_DEBUG = false -- Set to true to draw debug elements

deltaTime = 0.0 -- Time since last frame; see here for why this is neccesary: https://devforum.play.date/t/difference-in-gameplay-on-actual-device-same-fps/8576/3
shouldShowCrankIndicator = false -- update this in other scripts to show indicator

-- Game Object
curGame = nil

-- Global Sounds (keep scene specific sounds out of here to save memory)
clickSound = snd.sampleplayer.new("Audio/SFX/click.wav")

-- Global Fonts (keep scene specific fonts out of here to save memory)
largeFont = gfx.font.new("Fonts/Roobert-24-Medium")
halvedFont = gfx.font.new("Fonts/Roobert-24-Medium-Halved")
defaultFont = gfx.font.new("Fonts/Roobert-11-Medium")