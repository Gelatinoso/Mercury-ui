--- Special button with icons using fonts
---@param icon string Icon char to show on the buton
---@param callback function Function to call if the button is pressed
local function iconButton(icon, callback)
    ui:stylePush({font = love.graphics.newFont("fonts/fontello.ttf")})
    if ui:button(icon) then
        callback()
    end
    ui:stylePop()
end

return iconButton
