------------------------------------------------------------------------------
-- Mercury UI
-- Gelatinoso, Sledmine
-- Love2D GUI for the Mercury Package Manager
------------------------------------------------------------------------------
local nuklear = require "nuklear"
local inspect = require "inspect"
local mercury = require "mercury"
local packages = require "windows.packages"
local popup = require "windows.popup"


local ui

function love.load()
    love.keyboard.setKeyRepeat(true)
    ui = nuklear.newUI()
end


function love.update(dt)
    -- LuaFormatter off
    ui:frameBegin()
        packages(ui)
        -- TODO: make the popup show correctly
        --popup(ui)
    ui:frameEnd()
    -- LuaFormatter on
end

function love.draw()
    ui:draw()
end

function love.keypressed(key, scancode, isrepeat)
    if ui:keypressed(key, scancode, isrepeat) then
        return -- event consumed
    end
end

function love.keyreleased(key, scancode)
    if ui:keyreleased(key, scancode) then
        return -- event consumed
    end
end

function love.mousepressed(x, y, button, istouch, presses)
    if ui:mousepressed(x, y, button, istouch, presses) then
        return -- event consumed
    end
end

function love.mousereleased(x, y, button, istouch, presses)
    if ui:mousereleased(x, y, button, istouch, presses) then
        return -- event consumed
    end
end

function love.mousemoved(x, y, dx, dy, istouch)
    if ui:mousemoved(x, y, dx, dy, istouch) then
        return -- event consumed
    end
end

function love.textinput(text)
    if ui:textinput(text) then
        return -- event consumed
    end
end

function love.wheelmoved(x, y)
    if ui:wheelmoved(x, y) then
        return -- event consumed
    end
end
