------------------------------------------------------------------------------
-- Mercury UI
-- Gelatinoso, Sledmine
-- Love2D GUI for the Mercury Package Manager
------------------------------------------------------------------------------
local nuklear = require "nuklear"
local inspect = require "inspect"
mercury = require "mercury"

function love.load()
    love.keyboard.setKeyRepeat(true)
    ui = nuklear.newUI()
end

-- State used to reflect data on the rendering
currentPage = "availablePackages"

local colors = require "components.styles.colors"
local navBar = require "components.navBar.navBar"
local availablePackages = require "components.pages.availablePackages"
local installedPackages = require "components.pages.installedPackages"

function love.update(dt)
    local windowWidth = love.graphics.getWidth()
    local windowHeight = love.graphics.getHeight()
    -- LuaFormatter off
    ui:styleLoadColors(colors)
    ui:frameBegin()
        if ui:windowBegin("mercury", 0, 0, windowWidth, windowHeight, "border") then
            x, y, width, height = ui:windowGetContentRegion()
            -- Tabs bar
            navBar()
            -- App content
            ui:layoutRow("dynamic", height, 1)
                if (currentPage == "availablePackages") then
                    availablePackages(searchFilter.value)
                else
                    installedPackages(searchFilter.value)
                end
        end
        ui:windowEnd()
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
