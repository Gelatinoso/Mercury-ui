------------------------------------------------------------------------------
-- Mercury UI
-- Gelatinoso, Sledmine
-- Love2D GUI for the Mercury Package Manager
------------------------------------------------------------------------------
local nuklear = require "nuklear"
local inspect = require "inspect"
local mercury = require "mercury"

local ui

function love.load()
    love.keyboard.setKeyRepeat(true)
    ui = nuklear.newUI()
end

-- State used to reflect data on the rendering
local searchEdit = {value = ""}
local packages = mercury.fetchPackages() or {}
local title = "List of all packages available on the Mercury repository."

function love.update(dt)
    local windowWidth = love.graphics.getWidth()
    local windowHeight = love.graphics.getHeight()
    ui:frameBegin()
        if ui:windowBegin("mercury", 0, 0, windowWidth, windowHeight, "border") then
            local x, y, width, height = ui:windowGetContentRegion()
            -- Tabs bar
            ui:menubarBegin()
                ui:layoutRow("dynamic", 30, 3)
                    height = height - 30
                    if ui:button("Available") then
                        title = "List of all packages available on the Mercury repository."
                        searchEdit.value = ""
                        packages = mercury.fetchPackages()
                    elseif ui:button("Installed") then
                        title = "List of all the packages that already installed on the game."
                        searchEdit.value = ""
                        packages = mercury.getInstalled()
                    end
                    ui:edit("simple", searchEdit)
            ui:menubarEnd()
            -- Packages list
            ui:layoutRow("dynamic", height, 1)
                ui:groupBegin("packages", "scrollbar")
                    ui:layoutRow("dynamic", 30, 1)
                    ui:label(title)
                    -- Show packages loaded in memory
                    ui:layoutRow("dynamic", height / 3, 3)
                    local packagesInRow = 0
                    for packageIndex, package in pairs(packages) do
                        if (package.label:find(searchEdit.value)) then
                            packagesInRow = packagesInRow + 1
                            ui:button(package.label)
                            if packagesInRow == 3 then
                                ui:layoutRow("dynamic", height / 3, 3)
                            end
                        end
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
