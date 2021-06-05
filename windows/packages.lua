local mercury = require "mercury"
local popup = require "windows.popup"

-- State used to reflect data on the rendering
local searchFilter = {value = "", placeholder = "Search..."}
local packages = mercury.fetchPackages() or {}
local title = "List of all packages available on the Mercury repository."
local canInstall = true

local windowWidth = love.graphics.getWidth()
local windowHeight = love.graphics.getHeight()

return function(ui)
    if ui:windowBegin("mercury", 0, 0, windowWidth, windowHeight, "border") then
        local x, y, width, height = ui:windowGetContentRegion()
        -- Tabs bar
        ui:menubarBegin()
            ui:layoutRow("dynamic", 30, 4)
            if ui:button("Available") then
                canInstall = true
                title = "List of all packages available on the Mercury repository."
                searchFilter.value = ""
                    packages = mercury.fetchPackages()
                end
                if ui:button("Installed") then
                    title = "List of all the packages that already installed on the game."
                    searchFilter.value = ""
                    packages = mercury.getInstalled()
                    canInstall = false
                end
            ui:spacing(1)
            ui:edit("simple", searchFilter)
            height = height - 30
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
                    if (package.label:find(searchFilter.value)) then
                        packagesInRow = packagesInRow + 1
                        if ui:button(package.label) and canInstall then
                            --[[
                                TODO: make a popup appear when a package button is clicked
                                migrate the next 2 instructions to popup confirmation

                                response = mercury.installPackage(package.label)
                                print(response)
                            ]]
                            
                        end
                        if packagesInRow == 3 then
                            ui:layoutRow("dynamic", height / 3, 3)
                        end
                    end
                end
            ui:groupEnd()
    ui:windowEnd()  
    end
end