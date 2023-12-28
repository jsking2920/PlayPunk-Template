-- A Collection of useful helpers
import "Globals"

--------------------------------------------------------------------------------
--Text and Fonts
-- Glyphs in SDK fonts: Ⓐ Ⓑ 🟨 ⊙ 🔒 🎣 ✛ ⬆️ ➡️ ⬇️ ⬅️
-- A button, B button, playdate, pause button, lock button, crank, d-pad, d-pad up, d-pad right...

function u_drawText(text, x, y, font, alignment, drawMode)
    gfx.setFont(font)
    gfx.setImageDrawMode(drawMode)
    gfx.drawTextAligned(text, x, y, alignment)
end

function u_drawTextScaled(text, x, y, font, alignment, drawMode, scale)
    gfx.setFont(font)

    local w <const> = font:getTextWidth(text)
    local h <const> = font:getHeight()

    -- Create image and draw text to it, image is exactly the dimensions of the text
    local img <const> = gfx.image.new(w, h, gfx.getBackgroundColor())
    gfx.lockFocus(img)
    gfx.setImageDrawMode(drawMode)
    gfx.drawTextAligned(text, w / 2, 0, kTextAlignment.center)
    gfx.unlockFocus()

    -- Draw image using given coords and alignment
    gfx.setImageDrawMode(gfx.kDrawModeCopy)
    if (alignment == kTextAlignment.left) then
        img:drawScaled(x, y - (scale * h) / 2, scale)
    elseif (alignment == kTextAlignment.center) then
        img:drawScaled(x - (scale * w) / 2, y - (scale * h) / 2, scale)
    elseif (alignment == kTextAlignment.right) then
        img:drawScaled(x - (scale * w), y - (scale * h) / 2, scale)
    else
        print("Improper alignment provided!")
    end
end