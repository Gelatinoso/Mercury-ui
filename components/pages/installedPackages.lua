local rowSize = 60

local packages = mercury.getInstalled()

local fontIcons = require "components.fontIcons"
local iconButton = require "components.iconButton"

local function installedPackages(filter)
    ui:groupBegin("packages", "scrollbar")
    -- Page title
    ui:layoutRow("dynamic", 30, 1)
    ui:label("List of all the packages that already installed on the game.")
    -- Packages list
    -- Show packages loaded in memory
    for packageIndex, package in pairs(packages) do
        if (package.label:find(filter)) then
            ui:layoutRow("dynamic", 60, {0.9, 0.1})
            ui:label(package.label)
            iconButton(fontIcons.cancel, function()
                print(mercury.removePackage(package.label))
                packages = mercury.getInstalled()
            end)
        end
    end
    ui:groupEnd()
end

return installedPackages
