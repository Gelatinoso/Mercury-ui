local rowSize = 60

local packages = mercury.getInstalled()

local function installedPackages(filter)
    ui:groupBegin("packages", "scrollbar")
        -- Page title
        ui:layoutRow("dynamic", 30, 1)
        ui:label("List of all the packages that already installed on the game.")
        -- Packages list
        -- Show packages loaded in memory
        for packageIndex, package in pairs(packages) do
            if (package.label:find(filter)) then
                ui:layoutRow("dynamic", 60, 2)
                ui:label(package.label)
                if ui:button("Install") and canInstall then
                    response = mercury.installPackage(package.label)
                    print(response)
                end
            end
        end
    ui:groupEnd()
end

return installedPackages