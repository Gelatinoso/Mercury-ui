-- Lua GUI for Mercury
-- Written by Gelatinoso
-- Modifications by Sled

local nuklear = require "nuklear"

local mercury = require "mercury"
local inspect = require "inspect"

local ui

local windowWidth
local windowHeight

function love.load()
    love.keyboard.setKeyRepeat(true)
    ui = nuklear.newUI()
    windowWidth = love.graphics.getWidth()
    windowHeight = love.graphics.getHeight()
end

local searchEdit = {value = ""}
local packages = mercury.getInstalled() or {}

function love.update(dt)
    ui:frameBegin()
    if ui:windowBegin("Template Layout", 0, 0, windowWidth, windowHeight, "border") then
        x, y, width, height = ui:windowGetContentRegion()
        -- top bar buttons
        ui:layoutRow("dynamic", 30, 3)
        height = height - 30
        if ui:button("Available packages") then
            -- TODO
            print("hola1")
        elseif ui:button("Installed packages") then
            print(inspect(packages))
        end

        ui:edit("simple", searchEdit)
        ui:layoutRow("dynamic", height, 1)
        ui:groupBegin("packages", "scrollbar")
        ui:layoutRow("dynamic", height / 3, 3)

        -- main view of the installed packages
        local packagesInRow = 0
        for packageIndex, package in pairs(packages) do
            packagesInRow = packagesInRow + 1
            if packagesInRow == 3 then
                ui:layoutRow("dynamic", height / 3, 3)
            end
            ui:button(package.label)
        end
        
        ui:groupEnd()

    end
    ui:windowEnd()
    ui:frameEnd()
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
